# pack4 — star edge colourings of infinite families (Lean 4.33.1 + Mathlib v4.33.1)

Unconditional, kernel-checked special cases of the Dvořák–Mohar–Šámal conjecture (every subcubic loopless
multigraph has star chromatic index ≤ 6): for several **infinite families** of cubic graphs an explicit star edge
colouring with **5** colours (one family: 6 colours with a prescribed colour class) is proved correct **for every
member of the family**. DMS itself is **not** proved here.

Everything is built on the project library (`pack3`: `StarCore.MGraph`, `MGraph.Star`, `MGraph.Subcubic`,
`MGraph.Loopless`, `MGraph.Colourable`, `RH2F.DMS`). No `sorry`, no `axiom`, no `native_decide`; every theorem
below depends on `[propext, Classical.choice, Quot.sound]` only (`axioms.log` = output of `src/All.lean`).

## 1. Theorems

`G.Star k c` is the library's "c is a star edge colouring of G with k colours" (§2). `StarFamily G k` /
`GPk.StarFam G k` (same body) is
`G.Subcubic ∧ G.Loopless ∧ (∀ P, MGraph.Colourable P k) ∧ (∀ P, MGraph.Colourable P 6)`.

| | Family | Lean theorem (module) | Range | Result |
|---|---|---|---|---|
| A | flower snarks J_n | `FlowerSnark.flower_star`, `flower_family` (FlowerSnark, Families) | every odd n ≥ 5 | `(flowerSnark n).Star 5 (flowerCol n)`; `StarFamily (flowerSnark n) 5` |
| B | Goldberg snarks G_k | `GoldbergSnark.goldberg_star`, `goldberg_family` | every odd k ≥ 5 | `(goldbergSnark k).Star 5 (goldbergCol k)`; `StarFamily (goldbergSnark k) 5` |
| C | GP(k,2), spokes = a colour class | `GPetersen2.gp2_star`, `gp2_spokes`, `gp2_spoke_family` | every k ≥ 5 | `(gp2 k).Star 6 (gpCol k)` and `(gpCol k e).val = 5 ↔ e.val % 3 = 1` (colour 5, the sixth colour, is used exactly on the spokes) |
| D1 | GP(n,2) | `GP2Five.star5`, `gp2_family` (GPFive) | every n ≥ 5 | `(gp2 n).Star 5 (GP2Five.col n)` |
| D2 | GP(n,3) | `GP3Five.star5`, `gp3_family` (GPFive) | every n ≥ 7 | `(gp3 n).Star 5 (GP3Five.col n)` |
| D3 | GP(10m,4), GP(14m,6), GP(17m,8), GP(22m,10), GP(26m,12), GP(30m,14) | `GPk.star4/6/8/10/12/14`, `GPk.family4/…/14` (GPPeriodic) | every m ≥ 1 (the `star` theorems: every m) | `(gp (10 * m) 4).Star 5 (pcol tab4)` etc. |
| E | GP(n,k), 1 ≤ k ≤ 15 | `gp_star5`, `gp_family` (GPAll); per k: `GPn<k>.star5`, `GPn<k>.family` | every n ≥ 2k+1, except GP(3,1) | `∃ c, (GPk.gp n k).Star 5 c`; `GPk.StarFam (GPk.gp n k) 5` |
| F | Petersen-type vertex inflation | `Inflation.inflate_star5` (Inflation; definitions in InflationDefs) | every loopless multigraph `H` and every injective port assignment `slot` | `∃ c, (inflate H slot).Star 5 c` |
| G | Möbius ladders M_n | `Mobius.star5`, `mobius_family` (Mobius) | every n ≥ 4 | `(mobius n).Star 5 (Mobius.col n)`; `StarFamily (mobius n) 5` |

Exact statements (output of `#check`, see `axioms.log`):

    FlowerSnark.flower_star      : ∀ (n : ℕ), n % 2 = 1 → 5 ≤ n → MGraph.Star 5 (FlowerSnark.flowerCol n)
    FlowerSnark.flower_family    : ∀ (n : ℕ), n % 2 = 1 → 5 ≤ n → StarFamily (FlowerSnark.flowerSnark n) 5
    GoldbergSnark.goldberg_star  : ∀ (k : ℕ), k % 2 = 1 → 5 ≤ k → MGraph.Star 5 (GoldbergSnark.goldbergCol k)
    GoldbergSnark.goldberg_family: ∀ (k : ℕ), k % 2 = 1 → 5 ≤ k → StarFamily (GoldbergSnark.goldbergSnark k) 5
    GPetersen2.gp2_star          : ∀ (k : ℕ), 5 ≤ k → MGraph.Star 6 (GPetersen2.gpCol k)
    GPetersen2.gp2_spokes        : ∀ (k : ℕ) (e : Fin (GPetersen2.gp2 k).m), ↑(GPetersen2.gpCol k e) = 5 ↔ ↑e % 3 = 1
    GP2Five.star5                : ∀ (n : ℕ), 5 ≤ n → MGraph.Star 5 (GP2Five.col n)
    GP3Five.star5                : ∀ (n : ℕ), 7 ≤ n → MGraph.Star 5 (GP3Five.col n)
    GPk.star4                    : ∀ (m : ℕ), MGraph.Star 5 (GPk.pcol GPk.tab4)          -- on gp (10 * m) 4
    GPk.family4                  : ∀ (m : ℕ), 1 ≤ m → GPk.StarFam (GPk.gp (10 * m) 4) 5  -- likewise 6, 8, 10, 12, 14
    gp_star5 : ∀ (k n : ℕ), 1 ≤ k → k ≤ 15 → 2 * k + 1 ≤ n → ¬(n = 3 ∧ k = 1) →
                 ∃ c : Fin (GPk.gp n k).m → Fin 5, MGraph.Star 5 c
    gp_family: ∀ (k n : ℕ), 1 ≤ k → k ≤ 15 → 2 * k + 1 ≤ n → ¬(n = 3 ∧ k = 1) → GPk.StarFam (GPk.gp n k) 5
    Inflation.inflate_star5 : ∀ (H : MGraph), H.Loopless → ∀ (slot : Fin H.m → Bool → Fin 3),
                 Inflation.PortsInj H slot → ∃ c : Fin (Inflation.inflate H slot).m → Fin 5, MGraph.Star 5 c
    Mobius.star5                 : ∀ (n : ℕ), 4 ≤ n → MGraph.Star 5 (Mobius.col n)
    Mobius.mobius_family         : ∀ (n : ℕ), 4 ≤ n → StarFamily (Mobius.mobius n) 5

`MGraph.Star` takes the graph as an implicit argument that `#check` does not print; it is determined by the type of
the colouring (`flowerCol n : Fin (flowerSnark n).m → Fin 5`). `src/Check.lean` restates the theorems with the graph
written explicitly (`@MGraph.Star (FlowerSnark.flowerSnark n) 5 (FlowerSnark.flowerCol n)`, …).

**Relation to the conjecture.** `RH2F.DMS` is `∀ G : MGraph, G.Subcubic → G.Loopless → ∀ P : Fin G.m → Prop,
MGraph.Colourable P 6`. `BlockStar.dms_iff : RH2F.DMS ↔ ∀ G, DMSfor G` (by `Iff.rfl`), where
`DMSfor G := G.Subcubic → G.Loopless → ∀ P, MGraph.Colourable P 6`. Each `…_family` theorem proves, for the graphs
`G` of its family, the two hypotheses `G.Subcubic`, `G.Loopless` and the conclusion `∀ P, MGraph.Colourable P 6`
(in fact with 5 colours); `starFamily_dms : StarFamily G k → DMSfor G`. So these are literally special cases of the
statement of the conjecture used by the DMS chain.

## 2. Definitions

From the library (`pack3/src/StarCore.lean`, `StarReduce.lean`, `MhFact_5c1eb3f583cf643f.lean`), unchanged:

    structure MGraph where  n : Nat;  m : Nat;  ends : Fin m → Fin n × Fin n      -- vertices Fin n, edges Fin m
    Inc f x   := (G.ends f).1 = x ∨ (G.ends f).2 = x
    Joins f x y := G.ends f = (x, y) ∨ G.ends f = (y, x)
    Adj a b   := a ≠ b ∧ ∃ x, G.Inc a x ∧ G.Inc b x
    Walk4     : vertices v0..v4, edges e1..e4, e_i joins v_{i-1} v_i; v0..v3 pairwise distinct, v1..v4 pairwise
                distinct (v4 = v0 allowed): the paths with 4 edges and the 4-cycles
    Bicol c w := c w.e1 = c w.e3 ∧ c w.e2 = c w.e4
    Star k c  := (∀ a b, Adj a b → c a ≠ c b) ∧ (∀ w : Walk4, ¬ Bicol c w)        -- (`MGraph.star_iff`)
    Colourable P k := ∃ c : Fin G.m → Fin k, StarOn P k c                         -- star colouring of the edge set P
    Subcubic G := no vertex has four distinct incident edges;   Loopless G := ∀ f, (G.ends f).1 ≠ (G.ends f).2

New here (`src/BlockStar.lean`): the **cyclic block graph** `BG Wr n ω`. There are `n` blocks `0..n-1`, each with
`r` vertices and `q` edges; vertex `(J, t)` is the number `J * r + t`, edge `(J, s)` the number `J * q + s`, and

    edge (J, s) joins  (J, Wr.src w s)  and  ((J + Wr.jmp w s) mod n, Wr.dst w s),     w = ω J (wiring kind of block J).

`BlockStar.BG_ends` is this sentence as a theorem (read-back of the edge list). The block-wise colouring
`bcol q ct hct χ` gives edge `(J, s)` the colour `ct (χ J) s` (`χ J` = pattern of block `J`).

How the families match the textbook graphs (the tables are in the named files, a few lines each):

* **Flower snark J_n** (`FlowerSnark.flowerSnark n`; fact c97931f9caaa7c8b, Isaacs' J_n): vertices a_j, b_j, c_j, d_j
  = 4j, 4j+1, 4j+2, 4j+3; edges of block j: 6j: a_j b_j, 6j+1: a_j c_j, 6j+2: a_j d_j, 6j+3: b_j b_{j+1 mod n},
  6j+4: c_j c_{j+1}, 6j+5: d_j d_{j+1} for j ≤ n−2, and for the last block j = n−1 (wiring kind 1, `tw n J`):
  6j+4: c_{n−1} d_0, 6j+5: d_{n−1} c_0. So b_0…b_{n−1} is an n-cycle and the c's and d's form one 2n-cycle.
* **Goldberg snark G_k** (`GoldbergSnark.goldbergSnark k`; fact 32a017c12a0c87eb, the block description used in
  arXiv:2511.08664): vertex v_a^t (a = 1..8) = 8t + (a−1); edges of block t in the order v1v2, v1v7, v2v8, v3v4,
  v3v8, v4v7, v5v6, v6v7, v6v8, v2^t v1^{t+1}, v4^t v3^{t+1}, v5^t v5^{t+1} = 12t + 0..11 (indices mod k).
* **GP(n,k)** (`GPk.gp n k`; `GPetersen2.gp2 n` for k = 2, `GP3Five.gp3 n` for k = 3 — the same wiring with the
  jump 2 resp. 3 written as a literal): u_i = 2i, v_i = 2i+1; edges 3i: u_i u_{i+1}, 3i+1: u_i v_i (spoke),
  3i+2: v_i v_{i+k} (indices mod n).

* **Möbius ladder M_n** (`Mobius.mobius n`): the cycle c_0 … c_{2n−1} with the chords c_i c_{i+n}; t_i = c_i = 2i,
  b_i = c_{i+n} = 2i+1; edges of block i: 3i: t_i t_{i+1}, 3i+1: t_i b_i, 3i+2: b_i b_{i+1} for i ≤ n−2 and
  3i: t_{n−1} b_0, 3i+2: b_{n−1} t_0 for the last block. (M_3 = K_{3,3} needs 6 colours; the theorem is for n ≥ 4.)
* **Petersen-type inflation** (`Inflation.inflate H slot`, `src/InflationDefs.lean`; fact aa607ed0bc83ecf0, last
  sentence of the statement): the *piece* is the Petersen graph GP(5,2) minus the vertex u0 (9 vertices u1..u4,
  v0..v4 = 0..8, 12 edges, table `pe1`/`pe2`); its *ports* are the three neighbours u1, u4, v0 of u0. Every vertex
  `X` of `H` is replaced by a copy of the piece (vertex `(X, a)` = 9X + a, piece edge `(X, s)` = 12X + s) and every
  edge `e` of `H` becomes one edge (number 12·H.n + e) joining the port `slot e false` of the piece of the first end
  of `e` to the port `slot e true` of the piece of the second end. `PortsInj H slot` says that no two edge-ends at
  the same vertex of `H` use the same port (so `H` is subcubic; if `H` is cubic, every port is used once and the
  inflated graph is cubic). The theorem covers every loopless multigraph `H` (parallel edges allowed) with such a
  port assignment — a family indexed by all cubic (indeed all subcubic) loopless multigraphs. The general form of
  the fact (arbitrary "all-good" pieces Q_X instead of the Petersen graph) is **not** formalized.

**Independent sanity check** (`sanity_check.py`, `sanity.out`; plain Python, no Lean): the edge lists that Lean
prints for J_5, J_7, G_5, M_5 (`src/Sanity.lean`) equal the textbook edge lists; J_5, J_7, G_5 are cubic simple graphs
of girth ≥ 5 without a proper 3-edge-colouring (snarks); `GPk.gp 5 2` is the Petersen graph; the inflation of the
theta graph is a cubic simple graph on 18 vertices; and the printed colourings of J_5 and G_5 are star colourings
by brute force over all paths/cycles with four edges.

Limits of the fidelity claim: the graphs are given by these explicit edge lists; `Subcubic` and `Loopless` are
proved; "simple" and "cubic" (exactly three edges at each vertex), and an isomorphism with a Mathlib `SimpleGraph`,
are **not** formalized. The Goldberg edge list was taken from the fact (which cites arXiv:2511.08664 for it); it was
not compared with Goldberg's 1981 paper.

## 3. Method (how "for all n" is reduced to a finite check)

1. `BlockStar.star_of_windows` (generic, about 250 lines): let `D` bound the jumps. If for every `j < n` the window
   of the `3D+1` cyclically consecutive blocks `j, …, j+3D` passes the Boolean check `winOK`, then the block-wise
   colouring is a star colouring of `BG Wr n ω`. `winOK` reads the window as a piece of the *line* of blocks and
   checks every vertex `v` of the block at position `2D`: any two edges `e2 ≠ e3` at `v` have different colours, and
   there are no edges `e1` at the other end of `e2` and `e4` at the other end of `e3` with `c e1 = c e3`,
   `c e4 = c e2`. Soundness: a bicoloured `Walk4` of the cyclic graph gives such a configuration at its middle
   vertex `v2` (`liftJ`, `liftI`: every edge at a vertex of the window is an edge of the window). The criterion is
   sufficient for every `n ≥ 1`; no distinctness of the blocks of a window is needed.
2. The block sequences are "periodic part + seam" (flower/Goldberg: `P0 P1 P2 P3 … Q` for n ≡ 1 (4),
   `… T0 T1 T2` for n ≡ 3 (4); GP: period p, seam depending on n mod p; family C: `A^a B^b`). A lemma proved by
   `omega` (`SeamSeq.rep1/rep3`, `…rep`) shows that every window of the sequence of length `n` occurs as a window
   of the sequence of one fixed small length `n'` (13 or 15 for the snarks; `c + n mod p` for GP).
3. For the finitely many small lengths, all windows are checked by `decide +kernel` (evaluation of the `Decidable`
   instance by the Lean kernel — not `native_decide`; no extra axiom). The window checks of the GP families are
   split over several modules (`…W1`, `…W2`, …) only to bound the memory of each compiler process.
4. `BlockProps`: `BG_loopless`, `BG_subcubic` (a Boolean degree check on windows of `D+1` blocks + pigeonhole),
   `colourable_of_star` (via the library's `MGraph.starOn_map`).

The informal proofs of the facts verify the same colourings by tables (colour sets, good edges, "Table L"); the
Lean proofs do not transcribe these tables but check the colourings by the window criterion above. No error was
found: the colourings of the facts c97931f9, 32a017c1, 1262231d, 2f8113cb, cab27123, f8e1edfe, 6309f733, a491fe56
pass for every n in the stated ranges, so the statements of these facts are confirmed as stated (for the graphs as
defined in §2).

## 4. Reproduce

Prerequisite: `../pack3` built (its `build/*.olean` and its `.lake/packages` with Mathlib v4.33.1; see
`pack3/README.md`), Lean 4.33.1.

    bash build_all.sh        # compiles the modules of order.txt in order (c.sh: one `lean -o` process at a time),
                             # writes build/<Module>.out, build/summary.txt and axioms.log (= build/All.out)
    bash c.sh Module ...     # single modules; env PACK3 (default ../pack3), LEAN433, DLIM, TMO

On the project server every build must be a memory-capped job:
`cd ~/m_harness/harness && ~/.venvs/mh/bin/python -m danus.ops.jobs star6 snarklean 6G -- /bin/bash <abs>/pack4/build_all.sh`
(`jc.sh Module` does this for one module and waits for the output). `c.sh` kills the compiler if its private
memory exceeds 3.5 GB; the largest module needs about 1.9 GB (`build/summary.txt`: `peak_anon_kb`).
Regenerating the generated sources: `python3 gen_gp.py`, `python3 gen_gpper.py` (need the fact files, see the
scripts), `python3 search/gen_gpk.py 1 … 15` (from `search/gp<k>.json`), `python3 gen_all.py 15 inflation`.
`search/gpsearch.py k` re-runs the SAT search (pysat) that produced `search/gp<k>.json`; the proofs do not depend
on it.

Final build (2026-10-02 13:57–14:13 UTC, project server, `build_all.sh` as a 6 GB job): 125/125 modules rc=0, 0 errors,
930 s of compiler time in total, largest process 2.05 GB private memory; `axioms.log` has 33 `#print axioms` lines,
all `[propext, Classical.choice, Quot.sound]` (`BlockStar.dms_iff`: no axioms), no `sorryAx`.

## 5. Provenance

* Library (`pack3`): the star6 run, see `pack3/README.md`.
* Informal proofs / colourings (star6 run, fact graph `~/danus-projects/star6/fact_graph/facts/`):
  worker `core` (Claude): c97931f9caaa7c8b flower snarks (2026-09-27), 32a017c12a0c87eb Goldberg snarks
  (2026-09-27), aa607ed0bc83ecf0 Petersen-type inflation (2026-09-27), 1262231d03310f70 GP(k,2) spokes
  (2026-09-29, with the Lean 4.20 module `MhFact_1262231d03310f70` = `GPSpokesMC.gp2_tables`, which proves only the
  finite tables, not the statement about graphs), 2f8113cb26f31818 GP(n,2) and cab2712392b5deec GP(n,3)
  (2026-09-30; corrected versions of f4aa886cd2a49795, 7f9ca7ccb17d0b12 of 2026-09-27);
  worker `compute`: f8e1edfe45707104 GP(10m,4), 6309f733d6da8cd6 GP(14m,6), a491fe56b9f2d831 GP(17m,8), GP(22m,10),
  GP(26m,12), GP(30m,14) (2026-09-28).
* Rows E and G (GP(n,k) for all n, k ≤ 15 — with new colourings also for k = 2, 3 — and the Möbius ladders):
  colourings found on 2026-10-02 by SAT searches written for this pack (`search/gpsearch.py`, `search/mlsearch.py`,
  pysat/CaDiCaL); there is no informal proof — the Lean proof is the proof.
* Lean proofs: 2026-10-02, by Claude (helper `helper-snark-lean`: all modules except `InflationA`–`InflationE` and `Inflation`) and GPT (gpt-6-sol, one codex session on the project server, 13:28–13:56 UTC: `InflationA`–`InflationE`, `Inflation`, following the informal proof of fact aa607ed0bc83ecf0; the statement and `InflationDefs.lean` were fixed beforehand by Claude and checked to be unchanged; prompt, status and compiler log in `gpt_inflate/`).

## 6. Novelty (from the literature check `NOVELTY.md` of 2026-10-01; not re-done here)

* A, B (flower and Goldberg snarks, χ′ₛ ≤ 5): **appear new** — no paper on the star edge chromatic index of these
  snarks was found (#11, #12). The "good edge" notion of the informal proof is the *rich edge* of normal
  5-edge-colourings (Jaeger; Sedlar–Škrekovski).
* C (GP(k,2), spokes as one colour class of a star 6-edge-colouring): **appears new** as a perfect-matching-class
  statement; as a plain bound it is weaker than known results for some k (#10).
* D1, D2 (GP(n,2), n ≥ 5; GP(n,3), n ≥ 7; 5 colours): **partly known** (#17): GP(n,2) is covered in the literature
  for n ≡ 0 (mod 6), some other even n and n = 5, 10 (Zhu–Shao 2021; Omoomi–Vahid Dastjerdi 2024); GP(n,3) for
  3 | n and for even n. The cases **n odd ≥ 7** (k = 2) and **n odd, 3 ∤ n** (k = 3) were not found in print; they
  are part of the Zhu–Shao conjecture (χ′ₛ(GP(n,k)) ≤ 5 except GP(3,1)).
* D3: **partly known** (#15); GP(30m,14) is fully covered by the literature, the other five families partly.
* E (GP(n,k), k ≤ 15, all n): not in the fact graph and not covered by `NOVELTY.md`. By its coverage summary
  (Zhu–Shao: n even with k odd and gcd(n,k) = 1, k = 1, and χ′ₛ = 4 iff 4 | n and k odd; Omoomi–Vahid Dastjerdi:
  gcd(n,k) ≥ 3 and partial gcd = 2 results) the cases with n odd and gcd(n,k) = 1 are expected to be new, the rest
  largely known; this was **not** checked paper by paper (Omoomi–Vahid Dastjerdi, arXiv:2410.15024, prove the
  conjecture for gcd(n,k) ≥ 3 and state it as open otherwise). It proves the Zhu–Shao conjecture for k ≤ 15.
* F (Petersen-type inflation): **appears new (elementary)** (#16).
* G (Möbius ladders, n ≥ 4): found and proved on 2026-10-02; one web search found nothing on star edge colourings
  of Möbius ladders; **no proper literature check was made**.

## 7. Files

| Path | Content |
|---|---|
| `src/BlockStar.lean` | cyclic block graphs, `winOK`, `star_of_windows` |
| `src/BlockProps.lean` | `BG_ends`, `BG_loopless`, `BG_subcubic`, `colourable_of_star`, `DMSfor`, `dms_iff` |
| `src/SeamSeq.lean`, `src/SeamStar.lean` | the sequences "period 4 + seam", `seam_star` |
| `src/FlowerSnark.lean`, `src/GoldbergSnark.lean` | A, B |
| `src/GPetersen2Defs.lean`, `GPetersen2W1..3.lean`, `GPetersen2.lean` | C |
| `src/GPFive.lean` | D1, D2 (generated by `gen_gp.py` from the facts' tables, `gp_data.json`) |
| `src/GPPeriodic.lean` | `GPk.gp n k`, `periodic_star`, D3 (generated by `gen_gpper.py`) |
| `src/GPn<k>T.lean`, `GPn<k>W<i>.lean`, `GPn<k>.lean`, `src/GPAll.lean` | E (generated by `search/gen_gpk.py`, `gen_all.py`) |
| `src/Families.lean`, `src/Check.lean`, `src/All.lean` | DMS vocabulary, explicit statements, axiom listing |
| `src/InflationDefs.lean`, `InflationA..E.lean`, `Inflation.lean`, `gpt_inflate/` | F (definitions; proof by GPT; prompt/status of that session) |
| `src/Mobius.lean` | G (generated by `search/gen_ml.py` from `search/ml.json`, search: `search/mlsearch.py`) |
| `src/Sanity.lean`, `sanity_check.py`, `sanity.out` | independent sanity check of the graph definitions |
| `order.txt`, `c.sh`, `jc.sh`, `build_all.sh` | build |
| `build/*.out`, `build/summary.txt`, `axioms.log` | build and axiom logs |
| `search/` | SAT search (`gpsearch.py`), its results `gp<k>.json`, logs, generator |
| `STATUS.md`, `SHA256SUMS` | milestone log, checksums |
