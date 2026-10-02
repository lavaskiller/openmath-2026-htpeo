# CERT_STATUS — Lean certificate for the Kobon arrangement n = 39, 471 triangles (helper-kobon-cert)

Status: **T1 and T2 kernel-checked (including pairwise disjointness of the 471 triangles); build
complete** (record build 2026-10-03 03:48–03:51 KST, server `htpeobigdata`, project `~/kobon/lean`). Nothing was submitted; `autolab` was not run.

Input: `solution.json` (39 integer lines, sha256 `780720e1d78dea0f…8cf6f9ce`; the signed `report.json`
carries the hill tool's own `submission_hash` `sha256:6d14def7…b027` of the submission, which was not
recomputed here — the link solution ↔ report is that Lean recomputes the report's triangle list), hill `alejandrozu/kobon-triangles`, parameter n = 39, official metric `triangles = 471`.

## Result (Lean 4.33.1, Mathlib v4.33.1, namespace `Kobon`, verbatim from `KobonCert/Main.lean`)

```lean
/-- T1 -/
theorem certificate :
    validB 39 sol = true ∧ kobonCount sol = 471 ∧ evalCount sol = 471 ∧
    faces sol = reportFaces ∧ evalFaces sol = reportFaces

theorem sol_simple : simpleB sol = true            -- KobonCert/Simple.lean

/-- T2, general (KobonCert/Geom.lean) -/
theorem triCheck_iff (L : List Line) (p q r : Line)
    (hL : ∀ l ∈ L, l.a ≠ 0 ∨ l.b ≠ 0) (hp : p.a ≠ 0 ∨ p.b ≠ 0) (hq : q.a ≠ 0 ∨ q.b ≠ 0)
    (hr : r.a ≠ 0 ∨ r.b ≠ 0) :
    triCheck L p q r = true ↔ IsTriFace L p q r

/-- T2, concrete -/
theorem sol_triFaces :
    {t : ℕ × ℕ × ℕ | t.1 < t.2.1 ∧ t.2.1 < t.2.2 ∧ t.2.2 < 39 ∧
        IsTriFace sol (nth sol t.1) (nth sol t.2.1) (nth sol t.2.2)}.ncard = 471

theorem kobon_lower_bound :
    ∃ L : List Line, L.length = 39 ∧ (∀ l ∈ L, l.a ≠ 0 ∨ l.b ≠ 0) ∧
      L.Pairwise (fun p q => ¬ ∀ P : ℝ × ℝ, OnLine p P ↔ OnLine q P) ∧
      {t : ℕ × ℕ × ℕ | t.1 < t.2.1 ∧ t.2.1 < t.2.2 ∧ t.2.2 < 39 ∧
        IsTriFace L (nth L t.1) (nth L t.2.1) (nth L t.2.2)}.ncard = 471

/-- T2, general (KobonCert/Faces.lean): different triples give disjoint open triangles -/
theorem triFaces_disjoint (L : List Line) (hL : ∀ l ∈ L, l.a ≠ 0 ∨ l.b ≠ 0)
    (hd : L.Pairwise (fun p q => ¬ ∀ P : ℝ × ℝ, OnLine p P ↔ OnLine q P))
    {i j k i' j' k' : ℕ} (hij : i < j) (hjk : j < k) (hk : k < L.length)
    (hij' : i' < j') (hjk' : j' < k') (hk' : k' < L.length)
    {A B C A' B' C' : ℝ × ℝ}
    (h : TriWitness L (nth L i) (nth L j) (nth L k) A B C)
    (h' : TriWitness L (nth L i') (nth L j') (nth L k') A' B' C')
    (hne : (i, j, k) ≠ (i', j', k')) :
    Disjoint (openTri A B C) (openTri A' B' C')

/-- T2, final statement: 471 pairwise non-overlapping triangles determined by 39 lines -/
theorem kobon_nonoverlapping :
    ∃ (L : List Line) (T : Finset (ℕ × ℕ × ℕ)) (tri : ℕ × ℕ × ℕ → (ℝ × ℝ) × (ℝ × ℝ) × (ℝ × ℝ)),
      L.length = 39 ∧ (∀ l ∈ L, l.a ≠ 0 ∨ l.b ≠ 0) ∧
      L.Pairwise (fun p q => ¬ ∀ P : ℝ × ℝ, OnLine p P ↔ OnLine q P) ∧
      T.card = 471 ∧
      (∀ t ∈ T, t.1 < t.2.1 ∧ t.2.1 < t.2.2 ∧ t.2.2 < 39 ∧
        TriWitness L (nth L t.1) (nth L t.2.1) (nth L t.2.2) (tri t).1 (tri t).2.1 (tri t).2.2) ∧
      (∀ t ∈ T, ∀ t' ∈ T, t ≠ t' →
        Disjoint (openTri (tri t).1 (tri t).2.1 (tri t).2.2)
          (openTri (tri t').1 (tri t').2.1 (tri t').2.2))
```

Axioms (`logs/KobonCert.Main.log`, output of `#print axioms`):

```
'Kobon.kobon_nonoverlapping' depends on axioms: [propext, Classical.choice, Quot.sound]
'Kobon.triFaces_disjoint' depends on axioms: [propext, Classical.choice, Quot.sound]
'Kobon.certificate' depends on axioms: [propext]
'Kobon.sol_simple' does not depend on any axioms
'Kobon.triCheck_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'Kobon.sol_triFaces' depends on axioms: [propext, Classical.choice, Quot.sound]
'Kobon.kobon_lower_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
```

No `sorry`, no `axiom`, no `native_decide`, no `unsafe`/`implemented_by` in any source file
(`grep` over `KobonCert/`: no hit). All concrete computations are `decide +kernel`, i.e. evaluated by
the Lean kernel itself (exact integers, GMP); no compiler/`Lean.ofReduceBool` trust.

## What is DEFINITION and what is THEOREM

Definitions (must be read and accepted by a human; all in `KobonCert/Defs.lean`, 150 lines, and the
first 40 lines of `KobonCert/Geom.lean`):

| name | meaning |
| --- | --- |
| `Line` = `(a b c : Int)` | the line a·x + b·y + c = 0 (hill convention, README "Submission") |
| `sol` (`Data.lean`) | the 39 triples of `solution.json`, in file order (transcription checked by `tools/check_data.py`) |
| `reportFaces` (`Data.lean`) | the 471 index triples `details.triangle_line_indices` of the signed `report.json` (checked by `tools/check_data.py`) |
| `w, px, py` | homogeneous coordinates of p ∩ q (same formulas as `_intersection` in `eval.py`) |
| `det3 l p q`, `sv` | 3×3 determinant; `sv l p q = det3 l p q * w p q` has the sign of the affine form of `l` at p ∩ q |
| `triCheck L p q r` | p, q, r pairwise non-parallel, not concurrent, and for every l ∈ L the three numbers `sv l p q, sv l p r, sv l q r` are all ≥ 0 or all ≤ 0 (l does not separate the vertices) |
| `faces L`, `kobonCount L` | index triples i < j < k with `triCheck`, and their number |
| `validB n L` | acceptance test of `_load` in `eval.py`: n lines, a, b not both 0, \|coef\| ≤ 10^30, no two proportional triples |
| `simpleB L` | no two lines parallel, no three concurrent |
| `evalTriB`, `evalFaces`, `evalCount` | **transcription of the algorithm of `eval.py` `count_triangles`**: on each of the three lines the two vertices are distinct and no arrangement vertex of that line lies strictly between them in the order of the x-coordinate (y for vertical lines) — i.e. "ranks differ by exactly 1" after deduplication |
| `OnLine l P`, `openTri A B C`, `cross` (`Geom.lean`) | real plane ℝ × ℝ; open triangle = strictly positive barycentric combinations; `cross` = twice the signed area |
| `IsTriFace L p q r` | ∃ A ∈ p∩q, B ∈ p∩r, C ∈ q∩r, not collinear, and no line of L meets `openTri A B C` (README: "nonzero-area triangles whose interiors are not crossed by any line in the arrangement") |
| `TriWitness L p q r A B C` (`Faces.lean`) | the body of `IsTriFace` with the three vertices named (`IsTriFace ↔ ∃ A B C, TriWitness`, by `Iff.rfl`) |

Theorems (kernel-checked):

1. `certificate`: for the concrete `sol`, validity for n = 39; `faces sol` (determinant test) and
   `evalFaces sol` (transcription of the hill algorithm) are both **equal to the list of the official
   report**, of length 471. Computation: 9139 triples × 39 lines, exact integers up to ~10^48.
2. `sol_simple`: the arrangement is simple (741 pairs non-parallel, 9139 triples non-concurrent).
3. `triCheck_iff`: for arbitrary integer lines (no general-position hypothesis, only a, b not both 0)
   the determinant test is equivalent to the geometric definition `IsTriFace` over ℝ.
4. `sol_triFaces`, `kobon_lower_bound`: the set of index triples i < j < k < 39 with `IsTriFace` has
   exactly 471 elements; the 39 lines are pairwise distinct as subsets of ℝ².
5. `triFaces_disjoint` (general: proper, pairwise distinct lines; no general-position hypothesis):
   two different increasing index triples that both satisfy `TriWitness` have disjoint open triangles.
   `kobon_nonoverlapping`: 39 pairwise distinct lines and 471 triples, each with a nondegenerate
   triangle (vertices = pairwise intersections of its three lines) whose open interior meets none of
   the 39 lines; the 471 open triangles are pairwise disjoint. This is K(39) ≥ 471 in the usual
   sense "471 non-overlapping triangles determined by 39 lines".
6. `Sanity*.lean`: README example (1 triangle), hill baseline n = 18 (16 triangles, both counters),
   two degenerate arrangements with parallel lines and triple points (both counters give the list
   printed by `eval.py`), a duplicated line is rejected.

NOT proved (trust boundary / honest limits):

- **The Python evaluator itself is not formalised.** `evalFaces` is a hand transcription of its
  algorithm into Lean; the link to the real `eval.py` is (a) reading `Defs.lean` against `eval.py`,
  (b) equality of the Lean output with the official report list on `sol`, (c) the sanity examples.
  `eval.py`'s gcd normalisation and Python-`Fraction` sort are replaced by cross-multiplied sign tests.
- **No general theorem `evalTriB ↔ triCheck`** (consecutive-vertices criterion ⇔ empty triangle). It is
  verified by computation on `sol` and on the sanity examples only.
- **"Face" in the topological sense is not formalised**: `IsTriFace`/`TriWitness` say "nondegenerate
  triangle formed by three of the lines whose open interior (`openTri`: strictly positive barycentric
  combinations of the vertices) meets no line". Not proved in Lean: that `openTri A B C` is the
  topological interior of the convex hull (`Kobon.mem_openTri_iff` does prove that it is the
  intersection of the three open half-planes), and that such a triangle is a connected component of
  the complement of the union of the lines. Pairwise disjointness of the 471 triangles IS proved.
- The function K(n) itself (a maximum over all arrangements) is not formalised; the certificate is
  the existence statement `kobon_nonoverlapping`, which gives the lower bound.
- Transcription JSON → Lean is by `tools/gen.py`; checked by the independent `tools/check_data.py`
  (regex parse of `Data.lean`, compared with `solution.json` and `report.json`): `logs/check_data.txt`.
- Lean kernel 4.33.1 and Mathlib v4.33.1 (Mathlib only for `Geom.lean` / `Main.lean`; the T1 modules
  import core Lean only). No external checker (lean4checker / nanoda) was run.
- Literature status (is 471 new?) is **not** part of the certificate — see the packet draft below.

## Build record (server htpeobigdata, 16 cores shared, 14 GB RAM)

- Record build 2026-10-02T18:47:53Z – 18:50:40Z (03:47:53 – 03:50:40 KST): clean build of all
  54 modules, **2 min 47 s wall** with 2 parallel `lean` processes (machine load ≈ 15 from other
  jobs), sum of per-module times 303 s, **max RSS 2.24 GB** per process (`lean -M 2800`), inside one
  5 GB-capped job. All 54 lines `rc=0` (`build_status.txt`; per-module logs in `logs/`, last line =
  time and max RSS). Mathlib modules (`Geom`, `Faces`, `Main`): 3 s, 1.9 GB each (mostly mapped oleans).
- Earlier complete build (without `Faces.lean`): `logs/build_status_run1.txt`, `logs/run1/`.
- Development history kept in `logs/build_status_dev.txt` and `logs/dev/`: a first monolithic
  `decide +kernel` (one module) reached the 5 GB cap and was stopped → split by rows (smallest line
  index) into 22 + 22 chunk modules; a `nodup` test by pairwise comparison exceeded 2.8 GB → replaced
  by a strictly-increasing test (`incB`).

## Reproduce / re-run on a new solution.json (≈ 4 minutes)

```sh
# in a directory with Lean 4.33.1 (elan) and a built Mathlib v4.33.1 (lake exe cache get), or reuse one:
export MATHLIB_PROJECT=/home/lead/ramsey/lean/final        # any lake project whose .lake has Mathlib built
cd ~/kobon/lean
cp /path/to/new/solution.json . ; cp /path/to/new/report.json .   # report optional
python3 tools/gen.py solution.json . report.json           # prints n, triangles, simple; rewrites Data/Chunk/Cert/Main
python3 tools/check_data.py solution.json KobonCert/Data.lean report.json
# memory-capped job (server convention), 2 lean processes, each `lean -M 2800`:
cd ~/m_harness/harness && ~/.venvs/mh/bin/python -m danus.ops.jobs star6 koboncert 5G -- \
  /usr/bin/env MATHLIB_PROJECT=$MATHLIB_PROJECT TMO=1500 /bin/bash /home/lead/kobon/lean/tools/build.sh /home/lead/kobon/lean 2
# result: build_status.txt (every line rc=0, then "done"), logs/KobonCert.Main.log (#print axioms)
```

`gen.py` takes n and the count from the files (nothing is hard-wired to 39 / 471); without
`report.json` it uses its own recount as the claimed list. If the new arrangement is not simple,
`Simple.lean` is not generated and everything else still holds (`triCheck_iff` needs no general
position). Off the server: `lake exe cache get && lake build` also works (lakefile provided) but is
not memory-capped.

## Where things are

- Server: `~/kobon/lean/` (sources, `build/` oleans, `logs/`, `build_status.txt`).
- Laptop: `m_harness/climbs/hills/kobon-triangles/lean/` (sources, tools, docs, logs, `SHA256SUMS`;
  no build products).

## Open items

- Human reading of `Defs.lean` against `eval.py` (30 minutes).
- Literature check by a human (below).
- Optional: formalise "open triangle = connected component of the complement" and a general
  `evalTriB ↔ triCheck`; run an external kernel (lean4checker).

---

# Draft packet section (for the operator; nothing was submitted)

**Target.** Kobon triangle problem (Kobon Fujimura; OEIS A006066): K(n) = maximum number of
non-overlapping triangles determined by n straight lines in the plane. Claim: a new lower bound
for n = 39, **K(39) ≥ 471**, by an explicit arrangement with integer coefficients. Not optimal as far
as known: upper bound ⌊39·37/3⌋ = 481 (Tamura). This is a construction (lower bound) only.

**Exact claim (machine-checked).** The 39 lines a·x + b·y + c = 0 of `solution.json` (integers,
|coef| ≤ 10^12) are pairwise distinct, form a simple arrangement (no two parallel, no three
concurrent), and exactly 471 of the C(39,3) triples of lines bound a nondegenerate triangle whose open
interior meets none of the 39 lines (Lean: `Kobon.kobon_lower_bound`, `Kobon.sol_triFaces`,
`Kobon.sol_simple`, `Kobon.certificate`; standard axioms only), and the 471 open triangles are
pairwise disjoint (`Kobon.kobon_nonoverlapping`). The same 471 triples are returned by the
competition hill's own evaluator (signed official report, `triangles = 471`, n = 39) and by a Lean
transcription of its algorithm. Not formalised: the identification of these triangles with the
topological faces (connected components of the complement) of the arrangement, and the function K(n)
itself.

**Status on the hill** `alejandrozu/kobon-triangles`, board n = 39 (as of 2026-10-02T16:23Z, from
NOTES.md): previous best 470, classical construction 468; this arrangement 471.

**Literature status — checked by an AI helper only, NEEDS HUMAN VERIFICATION before any novelty
claim.** As recorded in `NOTES.md`: Füredi–Palásti (1984) general construction gives n(n−3)/3 = 468
for n = 39; Tamura's upper bound ⌊n(n−2)/3⌋ = 481; the OEIS A006066 comment table and the
Parpalak–Utkin gallery of perfect arrangements (ud1/kobon-solutions; perfect arrangements for
n = 33, 35, 37, 41, 43, 45, none for 39) list no value above 468 for n = 39; sub-arrangements of the
public n = 41, 42, 43 arrangements give at most 459. The AI helper found no published arrangement
with more than 468 triangles for n = 39 but did **not** do an exhaustive literature search; another
participant reached 470 on the same board by similar local search. A human should check OEIS A006066
(current comments and links), the Füredi–Palásti paper, Tamura's bound (and, from the certificate
helper's memory rather than from NOTES.md, the Clément–Bader refinement of the upper bound for some
residue classes of n — to be checked whether it concerns n = 39), the Parpalak–Utkin gallery, and
recent arXiv listings.

**Provenance.** Found on 2026-10-03 (KST) during the event window: Füredi–Palásti arrangement for
n = 39 (468) → simulated annealing on the 78 real line parameters with a degeneracy guard
(468 → 471 in about three minutes on one core) → rationalisation to integers (×10^12) → exact recount
with the hill evaluator → Lean certificate (this directory) the same night.

**Tools and AI disclosure.** Search code (`kobon_sa.c`, `fp.py`) and the Lean certificate
(definitions, proofs, generator, documentation) were written by AI agents (Claude, Anthropic) under
the team's harness; the Lean kernel (4.33.1) and Mathlib (v4.33.1) check the proofs. No human has yet
reviewed the Lean definitions or the literature status. Compute: one shared 16-core server; the
certificate builds in about 3 minutes (2 processes, ≤ 2.3 GB each).
