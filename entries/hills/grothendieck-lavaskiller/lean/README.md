# GrothCert — Lean 4 certificate for the CHSH witness on `grothendieck-constant-witnesses`

Lean 4.33.1 + Mathlib v4.33.1. Standard axioms only (`propext`, `Classical.choice`, `Quot.sound`);
no `sorry`, no extra `axiom`, no `native_decide`. See `CERT_STATUS.md` for the exact statements, the
definition-versus-proved table, the not-proved list and the build record.

## What is certified

For `solution.json` (matrix `[[1,1],[1,-1]]`, rational unit vectors u1 = (4/5, 3/5),
u2 = (-3/5, 4/5), v1 = (28/197, 195/197), v2 = (195/197, -28/197)):

1. **`Groth.certificate`** (kernel computation in exact rational arithmetic): the submission is
   valid for the hill and a Lean transcription of `eval.py` returns sign optimum 2, vector objective
   2786/985, lower bound 1393/985, `gap_ppm` 1414213, `matrix_area` 4, `certificate_bits` 80 —
   the values of the signed report.
2. **`Groth.witness_lower_bound`** (real numbers): the sign optimum of the matrix is exactly 2
   (bound over all sign vectors, and attained); the four vectors are unit vectors; the vector
   objective is 2786/985; hence every constant `K` satisfying Grothendieck's inequality
   (`IsGrothBound K`) satisfies `K ≥ 1393/985` (= 1.4142131979...).
3. **`Groth.groth_bound_ge_sqrt2`**: with the exact vectors (1,0), (0,1), (√2/2, √2/2),
   (√2/2, -√2/2) the value is `2√2`, so every such `K` satisfies `K ≥ √2`. These vectors are
   irrational and cannot be submitted to the hill; the submitted witness is a rational
   approximation, `1393/985 < √2 < 1393/985 + 10⁻⁶` (`Groth.ratio_lt_sqrt2`).
4. **`Groth.chsh_vec_le`** (Tsirelson's bound): for this matrix no unit vectors in any dimension
   give more than `2√2`; with `Groth.sqrt2_ppm` (`floor(10⁶·√2) = 1414213`) the submitted
   `gap_ppm` is the largest value any witness on this matrix can score.

All of this is classical (CHSH / Tsirelson 1980, K_G ≥ √2). No novelty is claimed.

## Layout

| file | content |
| --- | --- |
| `GrothCert/Defs.lean` | the submission as list literals; transcription of `eval.py` (`validB`, `signOpt`, `vectorObj`, `ratio`, `gapPpm`, `area`, `certBits`); `certificate`; the data as functions on `Fin 2` |
| `GrothCert/Bound.lean` | real definitions `IsSign`, `signVal`, `dot`, `vecVal`, `IsGrothBound`, `chsh`; sign optimum of CHSH; exact `√2` witness; Tsirelson bound; numeric comparisons |
| `GrothCert/Main.lean` | the submitted data cast to ℝ, `witness_lower_bound`, `sol_value_le_opt`, `#print axioms` |
| `GrothCert/Sanity.lean` | the transcribed evaluator on the README example (14/5, 7/5) and on inputs it must reject |
| `tools/build.sh` | per-module `lean -o` build against an existing Mathlib build (no `lake build`) |
| `tools/check_data.py` | independent check: Lean literals = `solution.json`, statement numbers = `report.json` |
| `logs/` | per-module logs (last line: time, max RSS); `GrothCert.Main.log` = `#print axioms`; `check_data.txt`; `dev*/` = earlier development runs |
| `build_status.txt` | one line per module of the record build |
| `solution.json`, `report.json` | the inputs |

## Reproduce

```sh
python3 tools/check_data.py solution.json GrothCert/Defs.lean report.json
MATHLIB_PROJECT=<lake project with Mathlib v4.33.1 built> bash tools/build.sh .   # inside a memory-capped job
cat build_status.txt logs/GrothCert.Main.log
```

About 10 seconds, one `lean` process at a time, at most 2.2 GB.
