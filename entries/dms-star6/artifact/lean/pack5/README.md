# pack5 — unconditional corollaries of the star6 chain in plain graph-theoretic vocabulary

Lean 4.33.1 + Mathlib v4.33.1, on top of `../pack3` (the 98-module chain of `RH2F.layer37`; read-only, not modified).
Server path `~/danus-projects/star6/lean433/pack5/`; laptop copy `openmath/star6_corollaries/`.

**DMS (every loopless subcubic multigraph is star 6-edge-colourable) is NOT proved.** This pack extracts what the
chain proves *unconditionally*, in the vocabulary of the statement `RH2F.DMS` itself, in the `Sym2`/`Fintype`
vocabulary of the fidelity module, and (pack5 module `Star6Simple`) for Mathlib's `SimpleGraph`.
No `sorry`, no `axiom`, no `native_decide`; every theorem depends only on `[propext, Classical.choice, Quot.sound]`
(`logs/*.out`). The baseline `StarCert.k4subdiv_star6` (`native_decide`) is not used.

## Files
| File | Content |
|---|---|
| `gen5.py` | generates `src/Star6Bounded.lean` from the pack3 sources (copies six library proofs, 21 listed replacements) |
| `src/Star6Bounded.lean` | the chain's reductions with the hypotheses restricted to order ≤ N (generated) |
| `src/Star6Corollaries.lean` | the theorems of sections A–E below (hand-written, 400 lines) |
| `src/Star6Equiv.lean` | section F: DMS ⇔ its restriction to cubic graphs on ≥ 16 vertices and their leaf graphs |
| `src/Star6Simple.lean` | section G: the theorems for Mathlib `SimpleGraph` (Schönberger, Petersen, small order) |
| `build5.sh` | compiles the modules with `lean -o` against `pack3/build` and the Mathlib cache of pack3 |
| `logs/<Module>.out` | compiler output of each module, including all `#print axioms` lines; last line `rc=0` |
| `STATUS.md` | milestone log |

## Vocabulary (all definitions are in the library; nothing is redefined)
`MGraph` = finite multigraph (`n` vertices, `m` edges, `ends : Fin m → Fin n × Fin n`); `Loopless G`; `Subcubic G`
(no vertex in 4 distinct edges); an edge set `P : Fin G.m → Prop` is a sub-multigraph (`fun _ => True` = all of `G`);
`ConnectedOn P`, `BridgelessOn P`, `CubicOn P`; `InG X P := Loopless X ∧ ConnectedOn P ∧ BridgelessOn P ∧ CubicOn P`;
`vcount P` = number of vertices of `P`; `StarOn P k c` = `c` is a star edge colouring of `P` (proper, no bicoloured
path or cycle with 4 edges); `Colourable P k := ∃ c, StarOn P k c`; `PMOn P N` = perfect matching; `ClassOn P N c` =
`N` is a colour class of `c`; `leafSet P g` = the leaf graph T(P, g) (delete `g = st`, add a vertex `x` adjacent to `s`,
`t` and a pendant edge `xℓ`); `TwoCutReducedOn P` = every 2-edge-cut has a side with exactly 2 vertices (cuts off a
digon); `EX1On P` ("EX1-good") = for every edge `g` and status `t` realised by a perfect matching, some perfect
matching with that status is a colour class of a star 6-colouring; `Eligible P g` = `g` in no digon and no 2-edge-cut.
`RH2F.DMS := ∀ G, Subcubic G → Loopless G → ∀ P : Fin G.m → Prop, Colourable P 6`.

## A. Small-order theorems (NEW; `Star6Corollaries.lean`)

```lean
theorem Star6.star6_cubic_bridgeless_le14 (X : MGraph) (P : Fin X.m → Prop) (hL : Loopless X) (hB : BridgelessOn P)
    (hK : CubicOn P) (h14 : vcount P ≤ 14) : Colourable P 6
theorem Star6.star6_cubic_bridgeless_graph_le14 (G : MGraph) (hL : Loopless G)
    (hB : BridgelessOn (fun _ : Fin G.m => True)) (hK : CubicOn (fun _ : Fin G.m => True)) (h14 : G.n ≤ 14) :
    Colourable (fun _ : Fin G.m => True) 6
```
**A1.** Every bridgeless cubic loopless multigraph (connected or not) with at most **14** vertices is star
6-edge-colourable.

```lean
theorem Star6.matching_colour_class_10_14 (X : MGraph) (P : Fin X.m → Prop) (hG : InG X P) (h10 : 10 ≤ vcount P)
    (h14 : vcount P ≤ 14) (g : Fin X.m) (hg : P g) :
    (∃ N c, PMOn P N ∧ N g ∧ StarOn P 6 c ∧ ClassOn P N c) ∧ (∃ N c, PMOn P N ∧ ¬ N g ∧ StarOn P 6 c ∧ ClassOn P N c)
```
**A2.** In a connected bridgeless cubic loopless multigraph with 10, 12 or 14 vertices every edge `g` lies in a perfect
matching that is a colour class of a star 6-edge-colouring, and `g` is avoided by such a perfect matching.
(Not only for the 2-cut-reduced graphs of BASE12/SIMPLE14/B14D: all of them, by the 2-cut induction.)

```lean
theorem Star6.star6_leaf_le14 (X : MGraph) (P : Fin X.m → Prop) (hG : InG X P) (h14 : vcount P ≤ 14) (g : Fin X.m)
    (hg : P g) : Colourable (leafSet P g) 6
```
**A3.** For every connected bridgeless cubic loopless multigraph `P` with at most 14 vertices and every edge `g`, the
leaf graph T(P, g) (≤ 16 vertices; its only vertex of degree < 3 is the leaf; it contains `P` with `g` subdivided) is
star 6-edge-colourable.

```lean
theorem Star6.star6_subcubic_le7 (G : MGraph) (hsub : Subcubic G) (hloop : Loopless G) (h7 : G.n ≤ 7)
    (P : Fin G.m → Prop) : Colourable P 6
```
**A4.** DMS for order ≤ **7**: every loopless multigraph of maximum degree ≤ 3 with at most 7 vertices (and every
sub-multigraph) is star 6-edge-colourable. (7 = 14/2: see "Not derivable".)

```lean
theorem Star6.bounded_reduction (N : Nat) (hH : HypLE N) (hD : IIDLE N) :
    (∀ X P, Loopless X → BridgelessOn P → CubicOn P → vcount P ≤ N → Colourable P 6) ∧
    (∀ X P, InG X P → 10 ≤ vcount P → vcount P ≤ N → EX1On P) ∧
    (∀ X P, InG X P → vcount P ≤ N → ∀ g, P g → Colourable (leafSet P g) 6) ∧
    (∀ G, Subcubic G → Loopless G → 2 * G.n ≤ N → ∀ P : Fin G.m → Prop, Colourable P 6)
```
**A5 (bounded reduction, every N).** `HypLE N` / `IIDLE N` are the hypotheses (H) / (II_D) of the chain restricted to
graphs with at most `N` vertices. They imply the four conclusions for order ≤ N (≤ N/2 for general subcubic graphs);
*no hypothesis about larger graphs is used*. With `N = 14` both hypotheses are theorems (`hypLE14`, `iidLE14`, from
`d1012`, `d14`, `iid14` = the certificates behind BASE12, SIMPLE14, B14D); this gives A1–A4. Any future
verification of (H), (II_D) at 16 vertices immediately upgrades A1–A4 to 16 (resp. 8).

Why A is more than the finite facts of `layer37`: BASE12/SIMPLE14/B14D speak about *2-cut-reduced* graphs and the
project-internal property EX1; A1–A4 hold for *all* (bridgeless cubic / subcubic) multigraphs of the stated order
and conclude plain star 6-edge-colourability. The step from one to the other is the chain's induction (2-edge-cuts,
digons, leaf graphs, components, degree-2 suppression, doubling), run here with bounded hypotheses.

## B. Structure of a counterexample (NEW; `Star6Corollaries.lean`)

```lean
def Star6.Hyp16 : Prop := ∀ X P, InG X P → 16 ≤ vcount P → TwoCutReducedOn P → EX1On P
theorem Star6.dms_of_hyp16_iid16 (hH : Hyp16) (hD : IID16) : DMS
theorem Star6.counterexample_reduced16 (h : ¬ DMS) :
    (∃ X P, InG X P ∧ 16 ≤ vcount P ∧ TwoCutReducedOn P ∧ ¬ EX1On P) ∨
    (∃ X P g, InG X P ∧ 16 ≤ vcount P ∧ TwoCutReducedOn P ∧ Eligible P g ∧ ¬ Colourable (leafSet P g) 6)
theorem Star6.counterexample_cubic16 (h : ¬ DMS) :
    (∃ X P, InG X P ∧ 16 ≤ vcount P ∧ ¬ Colourable P 6) ∨
    (∃ X P g, InG X P ∧ 16 ≤ vcount P ∧ P g ∧ ¬ Colourable (leafSet P g) 6)
theorem Star6.smallest_not_ex1 (X : MGraph) (P : Fin X.m → Prop) (hG : InG X P) (h10 : 10 ≤ vcount P)
    (hbad : ¬ EX1On P) (hmin : ∀ Y Q, InG Y Q → 10 ≤ vcount Q → vcount Q < vcount P → EX1On Q) :
    TwoCutReducedOn P ∧ 16 ≤ vcount P
theorem Star6.minimal_counterexample (G : MGraph) (hsub : Subcubic G) (hloop : Loopless G) (Q : Fin G.m → Prop)
    (hmin : MinimalCounterexample Q 6) :
    ConnectedOn Q ∧ 8 ≤ G.n ∧ (CubicOn Q → BridgelessOn Q ∧ 16 ≤ vcount Q)
```
- **B1.** DMS follows from two statements about 2-cut-reduced connected bridgeless cubic multigraphs **on at least 16
  vertices**: they are EX1-good, and their leaf graphs at eligible edges are star 6-colourable.
- **B2.** If DMS fails, there is a 2-cut-reduced connected bridgeless cubic loopless multigraph on ≥ 16 vertices that
  is not EX1-good or has a non-6-colourable leaf graph at an edge in no digon and no 2-edge-cut.
- **B3.** If DMS fails, there is a connected bridgeless cubic loopless multigraph on ≥ 16 vertices such that it, or
  one of its leaf graphs, is not star 6-edge-colourable. (Converse: section F.)
- **B4.** A smallest connected bridgeless cubic multigraph (≥ 10 vertices) that is not EX1-good is 2-cut-reduced
  (every 2-edge-cut cuts off a digon) and has ≥ 16 vertices. Uses `RH2F.ex1red_step` (below).
- **B5.** An edge-minimal non-6-colourable edge set `Q` of a subcubic loopless multigraph `G` is connected, `G` has
  ≥ 8 vertices, and if `Q` is cubic it is bridgeless with ≥ 16 vertices.

`Star6Bounded.lean` (namespace `RH2F`), the supporting statements:
```lean
theorem ex1red_step (hPS : PStat) (hSF : SmallFacts) (hG : InG X P) (n : Nat) (hn : vcount P = n) (h10 : 10 ≤ n)
    (IH : ∀ Y Q, InG Y Q → 10 ≤ vcount Q → vcount Q < n → EX1On Q) (hred : ¬ TwoCutReducedOn P) : EX1On P
theorem ex1red_le (N : Nat) (hPS : PStat) (hSF : SmallFacts) (hH : HypLE N) :
    ∀ X P, InG X P → 10 ≤ vcount P → vcount P ≤ N → EX1On P
theorem iic_le (N : Nat) (hH : HypLE N) (hD : IIDLE N) : IIcLE N
theorem dmsI_all_le (N : Nat) (hH : HypLE N) : ∀ X P, Loopless X → BridgelessOn P → CubicOn P → vcount P ≤ N → Colourable P 6
theorem dms_le (N : Nat) (hI : CubicLE N) (hII : IIcLE N) :
    ∀ G, Subcubic G → Loopless G → 2 * G.n ≤ N → ∀ P : Fin G.m → Prop, Colourable P 6
```
`ex1red_step` is the induction step of Theorem EX1-RED made explicit and **unconditional**: a non-2-cut-reduced
member of 𝒢 on ≥ 10 vertices is EX1-good as soon as all smaller ones are (the library theorem `ex1red` hides this
inside an induction under the global hypothesis (H)).

## C. Reductions already in the library (RE-EXPORTED under readable names; no new proof)
| pack5 name | Statement | Library name |
|---|---|---|
| `Star6.dms_of_H_II` | `Hyp → II → DMS` (Theorem RH2) | `RH2F.rh2_final` |
| `Star6.dms_of_H_IID'` | `Hyp → IID → DMS` (II-RED2) | `RH2F.dms_of_H_IID` |
| `Star6.dms_of_I_II'` | `DMS_I → DMS_II → DMS` ((I) ∧ (II) ⇒ DMS) | `DmsIILean.dms_of_I_II` |
| `Star6.ex1_of_H` | `Hyp → ∀ X P, InG X P → 10 ≤ vcount P → EX1On P` (EX1-RED) | `RH2F.ex1red RH2P.pstat smallFacts` |
| `Star6.dms_of_HOLE` | `HOLE → DMS` | `MGraph.dms_of_hole` |
| `Star6.dms_iff_plain` | `DMS ↔ RH2Fid.DMSP` (statement fidelity) | `RH2Fid.fidelity_bundle.1.2.2` |
| `Star6.chain_top` | the 10-part conjunction of `RH2F.layer37`, verbatim | `RH2F.layer37` |

Not in the pack3 closure (Lean 4.33.1 core, `../pack2/lean433/StarDMS2.lean`, see `../pack2/STATEMENTS.md`):
`P05Lean.cubicSharp5_dms` (CubicSharp5 ⇒ DMS, l. 9565), `DmsIIsLean.cs5s_dms` (CubicSharp5_s ⇒ DMS, l. 12048),
`P06Lean.cover_main` (l. 12168), `MGraph.dms_of_hole` (l. 7759).

## D. Known theorems formalised in the library (RE-EXPORTED; see `star6_m2_candidates.md`)
```lean
theorem Star6.schoenberger_in  (X : MGraph) (P : Fin X.m → Prop) (hG : InG X P) (g : Fin X.m) (hg : P g) : ∃ N, PMOn P N ∧ N g
theorem Star6.schoenberger_out (X : MGraph) (P : Fin X.m → Prop) (hG : InG X P) (g : Fin X.m) (hg : P g) : ∃ N, PMOn P N ∧ ¬ N g
theorem Star6.petersen         (X : MGraph) (P : Fin X.m → Prop) (hG : InG X P) : ∃ N, PMOn P N
theorem Star6.cubic_even       (X : MGraph) (P : Fin X.m → Prop) (hG : InG X P) : vcount P % 2 = 0
```
Schönberger's theorem (every edge of a connected bridgeless cubic multigraph lies in a perfect matching; and is
avoided by one) and Petersen's theorem (connected case). Library: `RH2P.schoenberger`, `RH2P.pstat`
(module `MhFact_046773df0a672922`, from Mathlib's `SimpleGraph.tutte`). Not in Mathlib v4.33.1.

## E. Plain (`Sym2` / `Fintype`) forms (NEW statements; proofs = transfer through the fidelity module `RH2Fid`)
For `(V E : Type) [Fintype V] [Fintype E] (en : E → Sym2 V)`:
```lean
theorem Star6.plain_star6_cubic_bridgeless_le14 : LooplessP en → BridgelessP en → CubicP en → Fintype.card V ≤ 14 → Star6P en
theorem Star6.plain_star6_subcubic_le7          : LooplessP en → MaxDeg3 en → Fintype.card V ≤ 7 → Star6P en
theorem Star6.plain_ex1_10_14 : LooplessP en → ConnectedP en → BridgelessP en → CubicP en →
    10 ≤ Fintype.card V → Fintype.card V ≤ 14 → EX1GoodP en
theorem Star6.plain_star6_leaf_le14 : LooplessP en → ConnectedP en → BridgelessP en → CubicP en →
    Fintype.card V ≤ 14 → ∀ (g : E) (s t : V), en g = s(s, t) → Star6P (enT en g s t)
theorem Star6.plain_schoenberger : LooplessP en → ConnectedP en → BridgelessP en → CubicP en → ∀ g : E,
    (∃ N, IsPM en N ∧ N g) ∧ (∃ N, IsPM en N ∧ ¬ N g)
```
(`RH2Fid` definitions: `deg en x` = number of edges containing `x`; `BridgelessP` = deleting an edge does not increase
the number of components; `Star6P en := ∃ c : E → ℕ, (∀ e, 1 ≤ c e ∧ c e ≤ 6) ∧ StarP en c`.)

## F. Equivalence (`Star6Equiv.lean`)
```lean
theorem Star6.colourable_of_dms_cubic (h : DMS) (X : MGraph) (P : Fin X.m → Prop) (hL : Loopless X) (hK : CubicOn P) :
    Colourable P 6
theorem Star6.leaf_of_dms (h : DMS) (X : MGraph) (P : Fin X.m → Prop) (hL : Loopless X) (hK : CubicOn P) (g : Fin X.m)
    (hg : P g) : Colourable (leafSet P g) 6
theorem Star6.dms_iff_cubic16 :
    DMS ↔ ∀ (X : MGraph) (P : Fin X.m → Prop), InG X P → 16 ≤ vcount P →
      Colourable P 6 ∧ ∀ g, P g → Colourable (leafSet P g) 6
```
**F (equivalence).** The Dvořák–Mohar–Šámal conjecture holds **if and only if** every connected bridgeless cubic
loopless multigraph on at least 16 vertices is star 6-edge-colourable and so is each of its leaf graphs T(P, g).
"⇐" is B3 (the chain's reductions plus the finite theorems up to 14 vertices); "⇒" is new glue (the ambient multigraph
of `InG X P` need not be subcubic, so DMS is applied to the sub-multigraph of `P`, resp. of `leafSet P g`, through
`RH2Fid.subRep`; 7 private lemmas, 150 lines, written by GPT-6-sol, statements fixed beforehand and re-checked).

## G. Mathlib `SimpleGraph` forms (`Star6Simple.lean`)
For `{V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]`:
```lean
def Star6.edgeEn (G : SimpleGraph V) : G.edgeSet → Sym2 V := fun e => e.1
def Star6.IsStarEdgeColouring (G : SimpleGraph V) {K : Type} (c : G.edgeSet → K) : Prop := StarP (edgeEn G) c
def Star6.Bridgeless (G : SimpleGraph V) : Prop := ∀ e ∈ G.edgeSet, ¬ G.IsBridge e
theorem Star6.simple_schoenberger (hconn : G.Connected) (hreg : G.IsRegularOfDegree 3) (hbr : Bridgeless G)
    {e : Sym2 V} (he : e ∈ G.edgeSet) :
    (∃ M : G.Subgraph, M.IsPerfectMatching ∧ e ∈ M.edgeSet) ∧ (∃ M : G.Subgraph, M.IsPerfectMatching ∧ e ∉ M.edgeSet)
theorem Star6.simple_petersen_connected (hconn : G.Connected) (hreg : G.IsRegularOfDegree 3) (hbr : Bridgeless G) :
    ∃ M : G.Subgraph, M.IsPerfectMatching
theorem Star6.simple_star6_cubic_bridgeless_le14 (hreg : G.IsRegularOfDegree 3) (hbr : Bridgeless G)
    (hn : Fintype.card V ≤ 14) : ∃ c : G.edgeSet → Fin 6, IsStarEdgeColouring G c
theorem Star6.simple_star6_subcubic_le7 (hdeg : ∀ v, G.degree v ≤ 3) (hn : Fintype.card V ≤ 7) :
    ∃ c : G.edgeSet → Fin 6, IsStarEdgeColouring G c
```
- **G1 (Schönberger, Mathlib vocabulary).** In a connected bridgeless 3-regular simple graph every edge lies in a
  perfect matching and is avoided by a perfect matching. **G2 (Petersen, connected case).** Such a graph has a
  perfect matching. Neither is in Mathlib v4.33.1 (see `star6_m2_candidates.md`).
- **G3.** Every bridgeless 3-regular simple graph on at most 14 vertices has a star edge colouring with 6 colours.
  **G4.** Every simple graph of maximum degree ≤ 3 on at most 7 vertices has one.
- Proofs: translation of the hypotheses to the plain vocabulary (`edgeEn_loopless`, `edgeEn_deg`, `edgeEn_cubic`,
  `edgeEn_maxDeg3`, `edgeEn_connected`, `edgeEn_bridgeless`) and of a plain perfect matching to a `Subgraph`
  (`pmSubgraph`, `pmSubgraph_isPerfectMatching`), then E1, E2, E5 (10 private lemmas, 115 lines, written by
  GPT-6-sol, statements fixed beforehand and re-checked). `IsStarEdgeColouring` unfolds to `RH2Fid.StarP`
  (proper + no bicoloured 4-edge path + no bicoloured 4-cycle, in terms of `Sym2` incidences).
- Not done: Petersen's theorem without the connectedness hypothesis.

## What is new and what is not
- **No new mathematics.** Sections A, B, E, F, G are new *statements* derived from the existing library; the proofs
  are (i) the library's own inductions copied with bounded hypotheses (`Star6Bounded.lean`, generated by `gen5.py`,
  which lists every textual replacement: 1 in `ex1red`, 2 in `Cut2.twoSided_all`, 7 in `iic_of`, 2 in `iiToDMSII_c`,
  5 in `dmsI_all`, 4 in `minimal_impossible'`), (ii) three counting lemmas (`cntF_le_n`, `vcount_le_n`,
  `vcount_mono`), (iii) short glue in `Star6Corollaries.lean`, (iv) vocabulary translations (E: via `RH2Fid.Rep`;
  F, G: new translation lemmas).
- Sections C, D are re-exports.

## Not derivable from the library (and why)
1. **N > 14 for cubic graphs.** At 16 vertices the library has only `FEEXIST16` (existence of perfect matchings with
   far-exchange sets) and the classification `cls16c`; turning them into colourings is the open hypothesis `FEEXTD10`.
   The open hypotheses are needed exactly from 16 vertices on (B1 makes this precise: DMS ⇐ `Hyp16` ∧ `IID16`).
2. **N > 7 for general subcubic graphs.** The chain's reduction of an (edge-minimal) graph with two or more vertices
   of degree < 3 is the *doubling* construction (`MGraph.dbl`: two copies joined by rungs), which turns order `n` into
   order `2n`; with cubic graphs available up to 14 vertices this gives 7. The configurations with exactly one vertex
   of degree < 3 that the chain reduces to (leaf graphs, one subdivided edge) are covered up to 16 vertices (A3).
   A bound 14 for all subcubic graphs would need a different reduction.
3. **"A vertex-minimum counterexample to DMS is cubic."** Not provable from the library: the reductions do not produce
   a smaller counterexample. A minimal non-colourable `Q` with one vertex of degree < 3 reduces to the *leaf-graph
   statement* (II) for its suppression, and with two such vertices to a *larger* cubic graph. What holds is B2/B3/B5.
4. **"A minimum cubic counterexample is 2-cut-reduced"** holds for the stronger property EX1 (B4), not for plain
   colourability: gluing along a 2-edge-cut needs the matching/colour-class information of EX1 on both sides.
5. **CubicSharp5 ⇒ DMS, CubicSharp5_s ⇒ DMS, covers** are not in the pack3 closure (Lean core file of pack2); cited in C.

## Axioms
Every `#print axioms` line in `logs/Star6Bounded.out`, `logs/Star6Corollaries.out`, `logs/Star6Equiv.out`,
`logs/Star6Simple.out` is `[propext, Classical.choice, Quot.sound]`.
`grep -w -E "sorry|axiom|native_decide" src/*.lean` returns nothing.

## Reproduce
Prerequisite: `../pack3` built (`pack3/build/*.olean`, Mathlib cache in `pack3/.lake/packages`; see `../pack3/README.md`).

    cd pack5
    python3 gen5.py                 # regenerates src/Star6Bounded.lean from ../pack3/src (aborts if a replacement does not match)
    bash build5.sh                  # Star6Bounded, Star6Corollaries, Star6Equiv, Star6Simple -> build/, logs/
    tail -n 1 logs/*.out            # rc=0
    grep -h "depends on axioms" logs/*.out | grep -v "\[propext, Classical.choice, Quot.sound\]"   # empty

On the project server the build must run memory-capped:
`cd ~/m_harness/harness && ~/.venvs/mh/bin/python -m danus.ops.jobs star6 dmscor 7G -- /bin/bash <abs>/pack5/build5.sh`.
Measured: about 20 s per module (import of the chain), < 3 GB.
With lake instead: add the four files to `pack3/src` and their names to `roots` in `pack3/lakefile.toml` (after
`"MhFact_ba4d9c5abd0afd83"`), then `lake build` (not run here; pack3 was left untouched).
