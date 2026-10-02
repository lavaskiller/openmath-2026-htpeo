# CERT_STATUS — Lean certificate for the CHSH witness, hill `grothendieck-constant-witnesses` (helper-groth-cert)

Status: **all statements kernel-checked; build complete** (record build 2026-10-03 03:58 KST =
2026-10-02T18:58:13Z–18:58:19Z, server `htpeobigdata`, project `~/groth/lean`). Nothing was
submitted; `autolab` was not run.

Input: `solution.json` (sha256 `8060d8bb…f4f12ff`, see `SHA256SUMS`), the signed `report.json`
(experiment 2552e287; it carries the hill tool's own `submission_hash` `sha256:2ca6124f…b739c7`,
which was not recomputed here — the link solution ↔ report is that Lean recomputes every metric and
detail of the report). Official metrics: `gap_ppm` 1414213, `matrix_area` 4, `certificate_bits` 80.

## What the hill scores (read from `hill/README.md` and `hill/eval.py`)

A ±1 matrix A (2..8 by 2..8) with **rational** unit vectors u_i, v_j (canonical fractions, entries
≤ 10^6, dimension 2..16, squared norm exactly 1). The evaluator computes
`sign(A) = max_{x,y ∈ {±1}} Σ A_ij x_i y_j` by enumeration, `vector = Σ A_ij <u_i, v_j>` exactly,
and reports `gap_ppm = floor(10^6 · vector / sign)`, `matrix_area = m·n`, `certificate_bits`.
The submission is therefore a witness for K_G ≥ 1393/985, **not** for K_G ≥ √2: irrational vectors
are not admissible, and the submitted ratio is the rational number 1393/985 = 1.4142131979... < √2.

## Result (Lean 4.33.1, Mathlib v4.33.1, namespace `Groth`, verbatim from the sources)

```lean
/-- T1 (GrothCert/Defs.lean) -/
theorem certificate :
    validB matrix leftV rightV = true ∧ signOpt matrix = 2 ∧
    vectorObj matrix leftV rightV = 2786 / 985 ∧ 0 < vectorObj matrix leftV rightV ∧
    ratio matrix leftV rightV = 1393 / 985 ∧
    gapPpm matrix leftV rightV = 1414213 ∧ area matrix = 4 ∧ certBits leftV rightV = 80

/-- T2 (GrothCert/Main.lean) -/
theorem witness_lower_bound :
    (∀ x y : Fin 2 → ℝ, IsSign x → IsSign y → signVal solA x y ≤ 2) ∧
    (∃ x y : Fin 2 → ℝ, IsSign x ∧ IsSign y ∧ signVal solA x y = 2) ∧
    (∀ i, dot (solU i) (solU i) = 1) ∧ (∀ j, dot (solV j) (solV j) = 1) ∧
    vecVal solA solU solV = 2786 / 985 ∧
    ∀ K : ℝ, IsGrothBound K → 1393 / 985 ≤ K

/-- T3 (GrothCert/Bound.lean) -/
theorem exact_value : vecVal chsh exU exV = 2 * √2
theorem groth_bound_ge_sqrt2 {K : ℝ} (hK : IsGrothBound K) : √2 ≤ K

/-- T4 (GrothCert/Bound.lean), Tsirelson's bound -/
theorem chsh_vec_le {d : ℕ} (u v : Fin 2 → Fin d → ℝ) (hu : ∀ i, dot (u i) (u i) = 1)
    (hv : ∀ j, dot (v j) (v j) = 1) : vecVal chsh u v ≤ 2 * √2

theorem ratio_lt_sqrt2 : (1393 / 985 : ℝ) < √2 ∧ √2 - 1393 / 985 < 1 / 1000000
theorem sqrt2_ppm : (1414213 : ℝ) ≤ 1000000 * √2 ∧ 1000000 * √2 < 1414214

/-- GrothCert/Main.lean: the submitted matrix is CHSH; no witness on it beats the submitted ratio
by 10⁻⁶ -/
theorem solA_eq : solA = chsh
theorem sol_value_le_opt {d : ℕ} (u v : Fin 2 → Fin d → ℝ) (hu : ∀ i, dot (u i) (u i) = 1)
    (hv : ∀ j, dot (v j) (v j) = 1) :
    vecVal solA u v ≤ 2 * √2 ∧ vecVal solA u v / 2 < vecVal solA solU solV / 2 + 1 / 1000000
```

Supporting: `chsh_sign_le`, `chsh_sign_attained`, `bound_of_chsh_witness`, `exU_unit`, `exV_unit`,
`dot_sq_le` (Cauchy–Schwarz), `matZ_eq`, `leftQ_eq`, `rightQ_eq`, `solU_unit`, `solV_unit`,
`sol_value`, `sol_sign_optimum`; sanity: `readme_example`, `bitLen_values`, `signOpt_values`,
`rejected`.

In words. T1: the Lean transcription of the evaluator accepts the submission and returns the
report's numbers. T2: over the reals, the submitted matrix has sign optimum exactly 2, the submitted
vectors are unit vectors with objective 2786/985, and any K for which Grothendieck's inequality
holds is at least 1393/985. T3: K ≥ √2, by exact irrational vectors. T4: on the CHSH matrix the
vector value never exceeds 2√2, so the best `gap_ppm` on this matrix is floor(10⁶·√2) = 1414213,
which the submission attains.

Consequence of T4 + `sqrt2_ppm` not stated as one Lean theorem: "every hill-valid witness on the
CHSH matrix has `gap_ppm ≤ 1414213`" (immediate: ratio ≤ √2 < 1.414214).

## Axioms (`logs/GrothCert.Main.log`, `logs/GrothCert.Sanity.log`)

```
'Groth.certificate' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.matZ_eq' depends on axioms: [propext]
'Groth.leftQ_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.rightQ_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.witness_lower_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.sol_value_le_opt' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.groth_bound_ge_sqrt2' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.chsh_vec_le' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.chsh_sign_le' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.chsh_sign_attained' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.exact_value' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.ratio_lt_sqrt2' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.sqrt2_ppm' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.readme_example' depends on axioms: [propext, Classical.choice, Quot.sound]
'Groth.rejected' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Standard axioms only. No `sorry`, no `axiom` declaration, no `native_decide` in the sources
(`grep` clean). The kernel computations use `decide +kernel` (kernel evaluation, no compiler trust).

## What is DEFINITION and what is THEOREM

| item | kind | where | to be checked by a human against |
| --- | --- | --- | --- |
| `matrix`, `leftV`, `rightV` | definition (data) | Defs | `solution.json` (also `tools/check_data.py`, `logs/check_data.txt`) |
| `canonB`, `toQ`, `dotQ`, `unitB`, `validB` | definition | Defs | `_rational`, `_parse_witness` in `eval.py` |
| `sgn`, `colSum`, `signOpt` | definition | Defs | `_sign_optimum` |
| `vectorObj`, `ratio`, `gapPpm`, `area`, `bitLen`, `certBits` | definition | Defs | `_vector_objective`, `eval`, `_certificate_bits` |
| `matZ`, `leftQ`, `rightQ`; `solA`, `solU`, `solV` | definition | Defs; Main | read the same lists as functions on `Fin 2`, cast to ℝ |
| `IsSign`, `signVal`, `dot`, `vecVal` | definition | Bound | sign vector, Σ A_ij x_i y_j, Euclidean inner product on ℝ^d, Σ A_ij <u_i,v_j> |
| `IsGrothBound K` | definition | Bound | "for all m, n, d, real m×n A, unit u_i, v_j ∈ ℝ^d and every B bounding all sign values of A: vecVal ≤ K·B"; K_G is the least such K |
| `chsh`, `exU`, `exV` | definition | Bound | the matrix and the exact vectors |
| `certificate` (T1) | proved, kernel computation | Defs | |
| `matZ_eq`, `leftQ_eq`, `rightQ_eq` | proved, kernel computation | Defs | list data = explicit 2×2 tables |
| `solA_eq`, `solU_unit`, `solV_unit`, `sol_value`, `sol_sign_optimum`, `witness_lower_bound` (T2) | proved | Main | |
| `chsh_sign_le`, `chsh_sign_attained`, `bound_of_chsh_witness` | proved | Bound | |
| `exact_value`, `groth_bound_ge_sqrt2` (T3) | proved | Bound | |
| `dot_sq_le`, `chsh_vec_le` (T4), `sol_value_le_opt` | proved | Bound; Main | |
| `ratio_lt_sqrt2`, `sqrt2_ppm` | proved | Bound | |
| `readme_example`, `bitLen_values`, `signOpt_values`, `rejected` | proved, kernel computation | Sanity | |

The link between the two layers: T2 is about `solA/solU/solV`, which are the list literals of
`Defs.lean` read through `List.getD` and cast to ℝ; `sol_value` re-proves the objective 2786/985
over ℝ independently of `vectorObj`, and `sol_sign_optimum` proves the true maximum over all sign
vectors independently of the transcribed enumeration `signOpt`. Both agree with T1.

## What is NOT proved

- **The Python evaluator is not formalised.** `validB`, `signOpt`, `vectorObj`, `certBits`, `gapPpm`
  are a hand transcription of `eval.py`; their faithfulness is by reading (and the sanity module).
  JSON parsing, the file-level checks (single regular file, size limit, duplicate keys, integer
  types) and the private fixture check `_load_fixture` are not modelled.
- **No general correctness theorem for `signOpt`** (that the one-sided enumeration equals the
  two-sided maximum for every matrix). For the submitted matrix the true maximum 2 is proved
  directly (`sol_sign_optimum`).
- **Grothendieck's inequality itself** (existence of a finite K with `IsGrothBound K`) is not proved,
  and no upper bound on K_G. T2/T3 are lower bounds for any such K. `IsGrothBound` uses
  finite-dimensional real vectors `Fin d → ℝ` with the standard inner product, the form the hill
  uses; equivalence with the Hilbert-space or operator-norm formulations is not formalised.
- **No optimality over other matrices**: whether a ±1 matrix up to 8×8 gives `gap_ppm ≥ 1414214` is
  not addressed.
- **The minimality of 80 bits** claimed in `NOTES.md` (search script) is not formalised.
- **The report's HMAC signature and `submission_hash`** are not checked.
- **No novelty**: CHSH matrix, Tsirelson's bound and K_G ≥ √2 are classical; the 80-bit rational
  witness has the same metrics as other public solutions on the board.

## Build record (server htpeobigdata, 14 GB RAM, shared)

`build_status.txt` (clean build from an empty `build/`, memory-capped job
`mh-job-grothcert-185810-r0`, `MemoryMax=5G`, one `lean -M 2800` process at a time):

```
GrothCert.Defs rc=0 TIME 1.63s MAXRSS 1471464KB 2026-10-02T18:58:13Z
GrothCert.Bound rc=0 TIME 2.53s MAXRSS 2107116KB 2026-10-02T18:58:15Z
GrothCert.Main rc=0 TIME 2.07s MAXRSS 2088196KB 2026-10-02T18:58:17Z
GrothCert.Sanity rc=0 TIME 1.24s MAXRSS 1478172KB 2026-10-02T18:58:19Z
done 2026-10-02T18:58:19Z
```

No errors, no warnings (logs contain only the `#print axioms` lines and the time line). Narrow
imports only (`Mathlib.Data.Rat.Defs`, `Mathlib.Data.Fin.VecNotation`, `Mathlib.Analysis.Real.Sqrt`,
`Mathlib.Algebra.BigOperators.Fin`, `Mathlib.Algebra.Order.Chebyshev`, four tactic modules); never
`import Mathlib`. Mathlib came from the existing project `/home/lead/ramsey/lean/final`
(read only, not modified). Development runs: `logs/dev/` (first run failed before any proof was
checked: no `lean-toolchain` file yet, wrong default toolchain), `logs/dev1/` (first full pass, with
deprecation warnings for `push_neg` and the old `Real.Sqrt` import path, since removed).

## Reproduce (≈ 10 seconds)

```sh
# in a directory with Lean 4.33.1 (elan) and a built Mathlib v4.33.1 (lake exe cache get), or reuse one:
python3 tools/check_data.py solution.json GrothCert/Defs.lean report.json
# memory-capped job (server convention):
cd ~/m_harness/harness && ~/.venvs/mh/bin/python -m danus.ops.jobs star6 grothcert 5G -- \
  env MATHLIB_PROJECT=/home/lead/ramsey/lean/final bash /home/lead/groth/lean/tools/build.sh /home/lead/groth/lean
# result: build_status.txt (every line rc=0, then "done"), logs/GrothCert.Main.log (#print axioms)
sha256sum -c SHA256SUMS
```

## Where things are

- server: `~/groth/lean/` (sources, logs, `build/` with the .olean files)
- laptop: `climbs/hills/grothendieck-constant-witnesses/lean/` (same without `build/`)
