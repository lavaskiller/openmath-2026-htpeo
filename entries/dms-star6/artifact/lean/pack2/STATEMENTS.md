# STATEMENTS — star6 Lean deliverables (pack2, built 2026-10-01 UTC)

Target: is every subcubic graph star 6-edge-colourable (Dvořák–Mohar–Šámal)? **DMS is not proved.**
Everything below is either an unconditional finite/auxiliary theorem or a theorem of the form
"named hypotheses ⇒ DMS". The hypotheses are ordinary Lean `def`s (`Prop`s); no `axiom` is declared anywhere.

Two artifacts:

| | A. `lean420/` (complete chain) | B. `lean433/StarDMS2.lean` (prefix) |
|---|---|---|
| Toolchain | Lean 4.20.0 (commit 77cfc4d1a4f6) + Mathlib v4.20.0 (c211948581bd) | Lean 4.33.1 (commit 819816b2e0a3), core only, no imports |
| Content | 98 modules: import closure of `RH2F.layer37` | 31 modules in one file (20 180 lines): the 26 modules of the 09-28 bundle + RH2 layers 1–5 |
| Build | 98/98 modules, 0 errors; `lean420/build/build.log` | 0 errors, 73 s, 2.8 GB; `lean433/StarDMS2.log` |
| Axioms | `lean420/build/axioms.log`, full audit `audit_all.tsv` (4 903 theorems) | printed at the end of `StarDMS2.log` |

Standard axioms below means exactly `[propext, Classical.choice, Quot.sound]`.

## Common objects (namespace `MGraph` / `RH2F`)
- `MGraph`: finite multigraph, vertices `Fin n`, edges `Fin m`, `ends : Fin m → Fin n × Fin n` (parallel edges allowed).
  `Loopless G`: no edge has equal ends. `Subcubic G`: no vertex has 4 distinct incident edges.
- `StarOn P k c`: `c` is proper on the edge set `P` and no path or 4-cycle with four edges of `P` is bicoloured.
  `Colourable P k`: some `c : Fin m → Fin k` has `StarOn P k c`.
- **`RH2F.DMS`** := `∀ G, Subcubic G → Loopless G → ∀ P : Fin G.m → Prop, Colourable P 6`
  (every loopless multigraph with Δ ≤ 3, and every sub-multigraph of it, is star 6-edge-colourable; with
  `P = fun _ => True` and `G` simple this is the Open Problem Garden statement).
- `InG X P` (𝒢): `P` is a connected bridgeless cubic edge set of the loopless multigraph `X`. `InS X P` (𝒮): in 𝒢,
  simple, no 2-edge-cut. `C4C X P`: cyclically 4-edge-connected. `vcount P`: number of vertices of `P`.
  `TwoCutReducedOn P`: every 2-edge-cut has a side with exactly two vertices.
- `PMOn P N`: `N` is a perfect matching of `P`. `EX1On P` (EX1-good): for every edge `g` and status `t` realised by
  some perfect matching, some perfect matching with that status is a colour class of a star 6-colouring of `P`.
- `leafSet P g`: the leaf graph T(P, g) (delete `g`, add a vertex `x` joined to both ends of `g`, and a pendant edge at `x`).
- `digSet Q D`: `Q^D`, the multigraph obtained from `Q` by inserting a digon on every edge of `D`.
  `Host10 Y Q D`: `Q` c4c, simple, ≥ 10 vertices, and `Q^D` has ≥ 16 vertices.
- `FarEx P M C`: `C` is a far-exchange set for the perfect matching `M`. `NoEnc P M C`: no enclosed exchange.
  `Eligible P g`: `g` is in no digon and in no 2-edge-cut.

## A. Lean 4.20.0 + Mathlib v4.20.0: `RH2F.layer37` (module `MhFact_ba4d9c5abd0afd83`)

```lean
theorem RH2F.layer37 :
    BASE12 ∧ SIMPLE14 ∧ B14D ∧ FEEXIST16 ∧ (IID16 → IID) ∧ (FEEXISTD18 → FEEXISTD10) ∧
    (FEEXTTNE16 → FEEXIST0NE16 → IID16) ∧
    (FEEXTD10 → FEEXISTD18 → POLE → TDTRI → IID16 → DMS) ∧
    (FEEXTD10 → FEEXISTD18 → WEXT → TDLTRI → IID16 → DMS) ∧
    (FEEXTD10 → FEEXISTD18 → POLE → TDTRI → FEEXTTNE16 → FEEXIST0NE16 → DMS)
```

`lean420/src/Main.lean` re-checks this statement verbatim (`example : … := layer37`) and restates the parts:

| Name | Statement | Informal meaning | Axioms |
|---|---|---|---|
| `RH2F.layer37` | above | finite parts proved, DMS conditional | standard |
| `star6_finite` (Main.lean) | `BASE12 ∧ SIMPLE14 ∧ B14D ∧ FEEXIST16` | **Unconditional finite theorems** (below) | standard |
| `star6_dms_conditional_A` (Main.lean) | `FEEXTD10 → FEEXISTD18 → POLE → TDTRI → FEEXTTNE16 → FEEXIST0NE16 → DMS` | **DMS conditional on six open hypotheses** (route A) | standard |
| `star6_dms_conditional_B` (Main.lean) | `FEEXTD10 → FEEXISTD18 → WEXT → TDLTRI → IID16 → DMS` | DMS conditional, route B (five open hypotheses) | standard |
| `RH2F.base12` | `BASE12` | every 2-cut-reduced member of 𝒢 with 10 or 12 vertices is EX1-good | standard |
| `RH2F.simple14` | `SIMPLE14` | every member of 𝒮 with 14 vertices is EX1-good | standard |
| `RH2F.b14d` | `B14D` | every non-simple 2-cut-reduced member of 𝒢 with 14 vertices is EX1-good | standard |
| `RH2F.feexist16` | `FEEXIST16` | (FE-EXIST-D) for all digon insertions `Q^D` with exactly 16 vertices: every edge and status is attained by a perfect matching that has a far-exchange set | standard |
| `RH2F.iid_of_iid16` (layer37 part 5) | `IID16 → IID` | the leaf case (II_D) holds for hosts with ≤ 14 vertices, so only ≥ 16 vertices remain | standard |
| `RH2F.feexistD10_of_18` | `FEEXISTD18 → FEEXISTD10` | (FE-EXIST-D) reduces to ≥ 18 vertices | standard |
| `RH2F.iid16_of_ne` | `FEEXTTNE16 → FEEXIST0NE16 → IID16` | the leaf case from the two leaf-engine statements | standard |
| `RH2F.cls16c` | classification | every c4c simple cubic graph on 16 vertices is isomorphic to one of 607 listed graphs | standard |
| `RH2F.rh2_final` | `Hyp → II → DMS` | Theorem RH2 with PStat, SmallFacts, B8 discharged | standard |
| `RH2P.layerP` | `PStat ∧ (SmallFacts → B8S → Hyp → II → DMS)` | Schönberger's theorem (every edge of a connected bridgeless cubic multigraph lies in a perfect matching and outside one), via Mathlib's Tutte theorem | standard |
| `RH2Fid.fidelity_bundle` | `(Hyp ↔ HP) ∧ (II ↔ IIP) ∧ (DMS ↔ DMSP) ∧ …` | statement fidelity: the `MGraph` statements are equivalent to independently written Mathlib-style statements (`Sym2`, `Fintype`), plus sanity instances (K₄, K₃,₃, prism, Petersen) | standard |
| `RH2F.layer37a`, `layer35`, `layer32d`, `layer28` | see sources | intermediate layers | standard |

### Open hypotheses (NOT proved; each is a `def … : Prop`)
| Name | Meaning |
|---|---|
| `FEEXTD10` (contract P18) | for every `Host10 Y Q D`, every perfect matching `M` of `Q^D` with a far-exchange set `C` extends to a star 6-colouring with colour classes `M` and `C` |
| `FEEXISTD18` (contract P16, ≥ 18 vertices) | for every `Host10 Y Q D` with `Q^D` on ≥ 18 vertices: every edge and status is attained by a perfect matching with a far-exchange set (the 16-vertex case is `feexist16`, proved) |
| `POLE` (contract P14) | every pole of a 2-cut-reduced member of 𝒢 on ≥ 10 vertices is dominant |
| `TDTRI` (contract P23) | the restricted EX1 property (TD) at a triangle side of a non-c4c member of 𝒮 carrying exactly one digon edge |
| `FEEXTTNE16` (contract P31) | leaf engine, extension: for 2-cut-reduced `P ∈ 𝒢` with ≥ 16 vertices, eligible `g`, perfect matching `M ∌ g`, far-exchange set `C ∌ g` with no enclosed exchange: T(P, g) has a star 6-colouring with classes `M ∪ {xℓ}` and `C` |
| `FEEXIST0NE16` (contract P30) | leaf engine, existence: such `M`, `C` exist for every eligible `g` |
| `IID16` | the leaf case (II_D) for hosts with ≥ 16 vertices: T(P, g) is star 6-colourable for eligible `g` (implied by the previous two) |
| `WEXT`, `TDLTRI` | route B replacements of `POLE`, `TDTRI` (W-colourings of poles; (TD-L) at triangle sides) |

Axiom audit of the whole closure (`audit_all.tsv`): 4 903 theorems, 4 902 with standard axioms only (or fewer). The one
exception is `MGraph.k4subdiv_star6` (baseline module `StarCert`, `native_decide`: `[propext, Quot.sound, Lean.ofReduceBool]`);
no main theorem depends on it (see the axiom lists above), and in artifact B it is re-proved without `native_decide`.

## B. Lean 4.33.1 core: `StarDMS2.lean`

| Name | Statement / meaning | Axioms |
|---|---|---|
| `MGraph.dms_of_hole` | **HOLE ⇒ DMS** (unchanged from the 09-28 bundle) | standard |
| `P05Lean.cubicSharp5_dms` | **CubicSharp5 ⇒ DMS** (unchanged) | standard |
| `DmsIIsLean.cs5s_dms` | **CubicSharp5_s ⇒ DMS** (unchanged) | standard |
| `P06Lean.cover_main` | star colourings pull back along covers; covers of K₃,₃ are star 6-, covers of Petersen star 5-edge-colourable (unchanged) | `[propext, Quot.sound]` |
| `MGraph.k4subdiv_star6` | a star 6-colouring certificate (kernel `decide`, no `native_decide`) | `[propext, Quot.sound]` |
| `RH2F.layer4` / `star6_rh2_conditional` | **Theorem RH2, conditional:** `PStat → SmallFacts → B8S → Hyp → II → DMS` (l. 17911, 20156) | standard |
| `star6_ex1red_conditional` | **Theorem EX1-RED, conditional:** `PStat → SmallFacts → Hyp → ∀ X P, InG X P → 10 ≤ vcount P → EX1On P` | standard |
| `RH2F.layer1`, `layer2`, `layer3`, `layer5` | Lemma R; 2-poles and gluing; gluing for Lemma SR; digon/triangle reductions with isomorphism tables | standard |

Hypotheses of B (all `def`s in the file): `PStat` (l. 14535; Schönberger's theorem, proved in artifact A as `RH2P.layerP.1`),
`SmallFacts` (l. 17458) and `B8S` (l. 17881) (finite statements on ≤ 8 vertices; proved in artifact A, used in `rh2_final`),
`Hyp` (l. 17454: every 2-cut-reduced member of 𝒢 on ≥ 10 vertices is EX1-good; open), `II` (l. 17656: every leaf graph
T(P, g) is star 6-colourable; open). `DMS` is at l. 17661.

Port fidelity: `check_headers.py` compares all 1 231 declaration headers of the 31 modules with the Lean 4.20 originals:
no statement changed (the only differences are the 09-28 split of `tG_check` into `tG_check_0…8` and the instance
`decK4s`); proof edits are listed in `lean433/patches/*.json` (35 patch entries in layers 2, 4, 5) and `../patches/` (09-28).
The file contains no `sorry`, no `native_decide`, no `axiom`.

## What is NOT in 4.33.1
Layers P–37 (79 modules, 8.0 MB: everything from `MhFact_046773df0a672922` on) import Mathlib
(`Mathlib.Combinatorics.SimpleGraph.Tutte` etc.). There is no Mathlib for Lean 4.33.1 on the server, so they were
not ported; they are delivered as artifact A with the toolchain stated.
