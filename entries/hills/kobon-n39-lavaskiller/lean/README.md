# KobonCert — Lean 4 certificate: 39 lines with 471 non-overlapping triangles (K(39) ≥ 471)

Lean 4.33.1 + Mathlib v4.33.1. Standard axioms only (`propext`, `Classical.choice`, `Quot.sound`);
no `sorry`, no extra `axiom`, no `native_decide`. See `CERT_STATUS.md` for the exact statements, the
build record, the trust boundary and the draft packet section.

## What is certified

For the arrangement of `solution.json` (39 integer triples `[a, b, c]` = lines a·x + b·y + c = 0,
competition hill `alejandrozu/kobon-triangles`, n = 39):

1. **`Kobon.certificate`** (kernel computation, core Lean only): the submission is valid for the hill
   (39 proper, pairwise distinct lines, coefficient bound); the determinant checker `faces` and the
   Lean transcription `evalFaces` of the hill's `eval.py` algorithm both return exactly the 471
   triples listed in the official signed report; `kobonCount sol = 471`, `evalCount sol = 471`.
2. **`Kobon.sol_simple`**: the arrangement is simple (no two lines parallel, no three concurrent).
3. **`Kobon.triCheck_iff`** (general, any integer lines): the determinant checker is equivalent to the
   geometric definition `IsTriFace` in ℝ² — three lines whose pairwise intersections are the vertices
   of a nondegenerate triangle whose open interior meets no line of the arrangement.
4. **`Kobon.triFaces_disjoint`** (general): two different triples with `IsTriFace` have disjoint open
   triangles (lines proper and pairwise distinct).
5. **`Kobon.kobon_nonoverlapping`** (the statement in plain words): there are 39 pairwise distinct
   lines in the real plane and 471 triples of them, each bounding a nondegenerate triangle whose
   open interior meets none of the 39 lines, the 471 open triangles being pairwise disjoint.
   Also `Kobon.sol_triFaces`: the number of such triples is exactly 471.

## Layout

| file | content | generated? |
| --- | --- | --- |
| `KobonCert/Defs.lean` | integer definitions: `Line`, `w/px/py/det3`, `triCheck`, `faces`, `kobonCount`, `validB`, `simpleB`, transcription of `eval.py` (`evalTriB`, `evalFaces`, `evalCount`), `incB` | hand-written, core Lean |
| `KobonCert/Data.lean` | `sol` (the 39 lines), `R_i`, `reportFaces` (the 471 claimed triples) | `tools/gen.py` |
| `KobonCert/Chunk/F*.lean`, `E*.lean` | per-row kernel computations `(rowTriples 39 i).filter (faceB sol) = R_i` (resp. `evalFaceB`) | `tools/gen.py` |
| `KobonCert/Simple.lean` | `simpleB sol = true` | `tools/gen.py` |
| `KobonCert/Cert.lean` | validity, gluing of the rows, counts | `tools/gen.py` |
| `KobonCert/Geom.lean` | real-plane definitions (`OnLine`, `openTri`, `IsTriFace`), `triCheck_iff`, `ncard_triFaces`, distinct lines | hand-written, Mathlib |
| `KobonCert/Faces.lean` | `TriWitness`, barycentric characterisation of the open triangle, `triFaces_disjoint`, `exists_family` | hand-written, Mathlib |
| `KobonCert/Main.lean` | final statements with the literal numbers, `#print axioms` | `tools/gen.py` |
| `KobonCert/Sanity*.lean` | README example, hill baseline (n = 18, 16 triangles), degenerate examples | hand-written |
| `tools/gen.py` | JSON → Lean data and literal statements | |
| `tools/check_data.py` | independent check that `Data.lean` equals `solution.json` / `report.json` | |
| `tools/build.sh` | per-module `lean -o` build (no `lake build`; memory limit per process) | |
| `logs/` | per-module logs (last line: time, max RSS), `KobonCert.Main.log` = `#print axioms`, `check_data.txt`, development logs | |
| `build_status.txt` | one line per module of the record build | |
| `solution.json`, `report.json` | the inputs the certificate was generated from | |

## How the kernel computation works

All arithmetic is exact integer arithmetic by cross-multiplication. For lines p, q the intersection
point has homogeneous coordinates `(px p q : py p q : w p q)` (2×2 minors). The value of the affine
form of a line l at p ∩ q is `det3 l p q / w p q`, so its sign is the sign of `sv l p q = det3 l p q * w p q`.
A triple p, q, r is a triangular face iff `w ≠ 0` for the three pairs, `det3 p q r ≠ 0`, and for every
line l of the arrangement the three numbers `sv l p q, sv l p r, sv l q r` are all ≥ 0 or all ≤ 0
(l does not cut the triangle). The transcription of the hill evaluator instead tests, for each side,
that no vertex of the arrangement on that line lies strictly between the two end points.
Both are evaluated by the kernel (`decide +kernel`) row by row (row i = triples with smallest index i),
22 + 22 modules of at most 2.3 GB each; coefficients ≤ 10^12 give integers ≤ ~10^48 (GMP).

## Reproduce / re-run on another solution

See `CERT_STATUS.md`, section "Reproduce". In short:

```sh
python3 tools/gen.py solution.json . report.json
python3 tools/check_data.py solution.json KobonCert/Data.lean report.json
MATHLIB_PROJECT=<lake project with Mathlib v4.33.1 built> bash tools/build.sh . 2   # inside a memory-capped job
cat build_status.txt logs/KobonCert.Main.log
```

About 3 minutes with two `lean` processes. `gen.py` reads n and the count from the files.
