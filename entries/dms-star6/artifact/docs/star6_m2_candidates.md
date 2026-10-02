# star6 — candidates for mode M2 ("formalization of a known theorem")

Source: the star6 Lean library (pack3: Lean 4.33.1 + Mathlib v4.33.1, kernel-checked, standard axioms only) and the
corollary modules of pack5 (`~/danus-projects/star6/lean433/pack5/`, copy in `openmath/star6_corollaries/`).
Duplicate check: Mathlib tag `v4.33.1` (commit 0df444a360ea), sources in `pack3/.lake/packages/mathlib`,
`grep -rI` over `Mathlib/`, `Archive/`, `Counterexamples/` on 2026-10-02.

## Summary

| # | Known theorem | Where it is proved | In Mathlib v4.33.1? | Assessment |
|---|---|---|---|---|
| 1 | **Schönberger's theorem** (T. Schönberger 1934): every edge of a connected bridgeless cubic (multi)graph lies in a perfect matching | `RH2P.schoenberger` (module `MhFact_046773df0a672922`, l. 464); re-exported as `Star6.schoenberger_in`, plain form `Star6.plain_schoenberger`, Mathlib `SimpleGraph` form `Star6.simple_schoenberger` | **No.** `grep -i "schönberger\|schonberger\|schoenberger"`: 0 hits; `grep -i bridgeless`: 0 hits | Best candidate. Proved from `SimpleGraph.tutte`; multigraph version (parallel edges allowed) |
| 2 | "Avoiding" companion (special case of Plesník 1972 with one deleted edge): every edge of a connected bridgeless cubic multigraph is avoided by some perfect matching | `RH2P.pstat` (same module, l. 524; statement `PStat` = both statuses) → `Star6.schoenberger_out` | **No** (same greps) | Goes with 1 |
| 3 | **Petersen's theorem** (J. Petersen 1891): every bridgeless cubic graph has a perfect matching (here: connected, multigraphs allowed) | corollary of 1: `Star6.petersen`, `Star6.simple_petersen_connected` | **No.** `grep -i petersen` over Mathlib/Archive/Counterexamples: 0 hits (neither the theorem nor the Petersen graph) | Classical textbook theorem; one line from 1. The connectedness hypothesis is extra (see note) |
| 4 | A cubic graph with a perfect matching has an even number of vertices | `RH2F.vcount_even'` → `Star6.cubic_even` | **Yes** in substance: `SimpleGraph.Subgraph.IsPerfectMatching.even_card` (`Matching.lean` l. 265) | Do not claim |
| 5 | Tutte's 1-factor theorem | not ours: used as `SimpleGraph.tutte` (`Mathlib/Combinatorics/SimpleGraph/Tutte.lean` l. 319) | **Yes** | Do not claim; it is the input of 1 |

Mathlib v4.33.1 does contain: `SimpleGraph.tutte`, `SimpleGraph.IsTutteViolator`, `Subgraph.IsPerfectMatching`
(+ `isPerfectMatching_iff`, `even_card`), `SimpleGraph.IsBridge` (`Connectivity/Connected.lean` l. 759), Hall's theorem
(`Hall.lean`), `IsRegularOfDegree`. It contains no theorem deriving a perfect matching from regularity/bridgelessness,
no notion "bridgeless", nothing on star (edge) colourings or chromatic index of cubic graphs.

## Exact statements

Library (multigraph type `MGraph`, edge set `P`; `InG X P` = loopless ambient, `P` connected, bridgeless, cubic;
`PMOn P N` = `N ⊆ P` and every vertex of `P` is in exactly one edge of `N`):

```lean
theorem RH2P.schoenberger (hG : InG X P) {h : Fin X.m} (hh : P h) : ∃ N, PMOn P N ∧ N h
theorem RH2P.pstat : PStat
-- PStat := ∀ X P, InG X P → ∀ h, P h → ∀ t : Bool, ∃ N, PMOn P N ∧ (N h ↔ t = true)
```

pack5, `Star6Corollaries.lean` (re-exports, no new mathematics):

```lean
theorem Star6.schoenberger_in  (X : MGraph) (P : Fin X.m → Prop) (hG : InG X P) (g : Fin X.m) (hg : P g) : ∃ N, PMOn P N ∧ N g
theorem Star6.schoenberger_out (X : MGraph) (P : Fin X.m → Prop) (hG : InG X P) (g : Fin X.m) (hg : P g) : ∃ N, PMOn P N ∧ ¬ N g
theorem Star6.petersen         (X : MGraph) (P : Fin X.m → Prop) (hG : InG X P) : ∃ N, PMOn P N
-- multigraph given by `en : E → Sym2 V`, `[Fintype V] [Fintype E]` (vocabulary of the fidelity module RH2Fid):
theorem Star6.plain_schoenberger (V E : Type) [Fintype V] [Fintype E] (en : E → Sym2 V)
    (hl : LooplessP en) (hconn : ConnectedP en) (hb : BridgelessP en) (hc : CubicP en) (g : E) :
    (∃ N, IsPM en N ∧ N g) ∧ (∃ N, IsPM en N ∧ ¬ N g)
```

pack5, `Star6Simple.lean` (Mathlib vocabulary; compiled, see the status line at the end of this file):

```lean
def Star6.Bridgeless (G : SimpleGraph V) : Prop := ∀ e ∈ G.edgeSet, ¬ G.IsBridge e
theorem Star6.simple_schoenberger (G : SimpleGraph V) [DecidableRel G.Adj]   -- [Fintype V] [DecidableEq V]
    (hconn : G.Connected) (hreg : G.IsRegularOfDegree 3) (hbr : Bridgeless G) {e : Sym2 V} (he : e ∈ G.edgeSet) :
    (∃ M : G.Subgraph, M.IsPerfectMatching ∧ e ∈ M.edgeSet) ∧ (∃ M : G.Subgraph, M.IsPerfectMatching ∧ e ∉ M.edgeSet)
theorem Star6.simple_petersen_connected (G : SimpleGraph V) [DecidableRel G.Adj]
    (hconn : G.Connected) (hreg : G.IsRegularOfDegree 3) (hbr : Bridgeless G) : ∃ M : G.Subgraph, M.IsPerfectMatching
```

## How the library proves it (for the packet text)
`MhFact_046773df0a672922.lean` (550 lines, imports `Mathlib.Combinatorics.SimpleGraph.Tutte`): for an edge `h = uw`
of `P`, form the simple graph `GT P u w` on the vertices of `P` other than `u`, `w` (adjacent = joined by an edge of
`P`). A perfect matching of `GT` plus `h` is a perfect matching of `P` through `h`. If `GT` had a Tutte violator `U`,
then with `S = U ∪ {u, w}` every odd component `K` of `GT − U` sends an odd number of edges to `S` (`cross_odd`, by the
degree sum `deg_sum`), not 1 (bridgeless: `cross_ne_one`), hence at least 3 (`three_le_cross`); comparing with the
number of edges leaving `S` (`cross_sp`, `sp_card`; the edge `h` lies inside `S`) shows that the number of odd
components is at most `|U|`, so `U` is not a violator (`not_violator`). `SimpleGraph.tutte` then gives a perfect
matching of `GT`, and `h` together with one `P`-edge for each matched pair is the matching `N` (`schoenberger`).
`pstat` gets the avoiding matching by applying `schoenberger` to another edge `h'` at an end of `h`.

## Notes / caveats
- All statements are for *connected* graphs. Petersen's theorem is usually stated without connectedness (apply the
  connected case to each component); the library has the component machinery for edge sets (`compK`, `compR` in
  layer 12) but the perfect-matching union over components is not formalised. Say "connected" in any claim.
- "Bridgeless" in the library is `BridgelessOn P` (no vertex 2-colouring separates the ends of an edge `e` while
  every other edge is monochromatic); the fidelity module proves it equivalent to "deleting `e` does not increase the
  number of components" (`RH2Fid.Rep.bridgeless_iff`), and `Star6Simple.lean` connects it to `SimpleGraph.IsBridge`.
- Axioms of every theorem above: `[propext, Classical.choice, Quot.sound]` (`pack5/logs/*.out`).
- These are by-products of the DMS chain, small compared with the chain; as an M2 entry on their own they are a
  short formalisation (≈ 550 lines + translation) of a classical theorem that is absent from Mathlib.

STATUS of `Star6Simple.lean`: DONE and verified 2026-10-02 13:20 UTC — compiles in pack5 (`logs/Star6Simple.out`, rc=0); `simple_schoenberger`, `simple_petersen_connected`: `[propext, Classical.choice, Quot.sound]`. Not done: Petersen without the connectedness hypothesis.
