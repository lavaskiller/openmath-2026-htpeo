# Formal Conjectures statement correspondence

The checked reference is the bundled `reference_statements/DeepMind_1038.lean`.
The current public source was also read on 2026-10-01 at
https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/1038.lean
and has the same four mathematical statement heads. The bundled file's SHA-256 is
recorded in the payload manifest; no upstream commit pin is asserted for that copy.

## Preserve the target and prove the bridge

| Apparent difference | Reference | Project | Proved connection |
| --- | --- | --- | --- |
| Nonconstant monic polynomial | `f.Monic ∧ f ≠ 1` | monic with `1 ≤ f.natDegree` | `EP1038.DeepMind.inf_admissible_iff` |
| All roots real and in [-1,1], counted with multiplicity | filtered roots have cardinality `f.natDegree` | roots have full degree cardinality and each root is in the interval | `EP1038.DeepMind.filtered_roots_iff` |
| Supremum permits the constant 1 | reference supremum subtype | local positive-degree subtype | `sup_admissible_iff`, `sublevelMeasure_one`, `officialSup_eq_localSup` |
| Measure type | Lebesgue `volume`, in `ℝ≥0∞` | same measure; some intermediate theorems use `.toReal` | `admissible_measure_finite`; final reference theorems stay in `ℝ≥0∞` |
| Upper constant | `2 * 2 ^ (1 / 2 : ℝ)` in `ENNReal` | `ENNReal.ofReal (2 * Real.sqrt 2)` | `official_upper_constant_eq` |
| Exact infimum answer | `answer(sorry)` | `ENNReal.ofReal EP1038.Stage9.Dval` | completed `Erdos1038.erdos_1038.parts.i` |

The infimum polynomial class is therefore equivalent, not a stronger hypothesis
that would reduce the scope of the problem. The supremum's one additional constant
has empty strict sublevel set and contributes zero, leaving the supremum unchanged.
`n : ℕ` in the reference is unused: it does **not** impose `f.natDegree = n`.
The completed wrappers preserve it and do not introduce a fixed-degree restriction.
The completed upper-bound wrapper also uses the original `ENNReal` decimal `1.835`.

## What the exact answer means

D is defined independently of the original infimum over polynomials:

```lean
-- EP1038.Stage9, Stage9A/Stage9C
D0q q := 2 / (1 + q)^2
Aq q  := Real.log (D0q q * q) / Real.log q
fq q  := (1 + q) * Real.log (2 / (1 + q)^2) + 2 * (q * Real.log q)
Qadm  := {q : ℝ | 0 < q ∧ q < 1 ∧ 0 < fq q}
Lam q := (volume {y | VA (Aq q) q y < 0}).toReal
Dval  := sInf (Lam '' Qadm)
```

`VA` is the explicitly defined one-parameter reference logarithmic potential in
`Stage9A.lean`; it is not defined using the original polynomial infimum.
`Stage9C.exists_qs` identifies the admissible interval `0 < q < q_s`.
`Stage9C.Lam_eq` gives the width in terms of its two explicitly characterized roots.
Thus the result reduces the infimum over all admissible polynomials to a specified
one-parameter reference family. It does not define D to be the original polynomial
infimum and then prove a tautology.

`CompleteCoverage.exact_infimum_and_nonattainment` proves the nontrivial equality
between this D and the reference's polynomial infimum, with no certificate inputs
left as hypotheses. The exported part (i) puts that exact D in the unknown-answer
slot. A decimal approximation must not replace this exact definition.
`DLowerM.actual_numerical_D_enclosure` proves the rational lower/upper enclosure,
and `Submission.erdos_1038.D_enclosure` exposes it directly.

## Integration and attribution

The four final declarations have the reference's mathematical statement shapes
with only the unknown answer in part (i) filled. The independent source package
omits the upstream metadata macros and imports. Upstream integration should use
these proofs to replace the reference proofs, retain the reference metadata and
fill its `answer(...)` with the exact D definition. The old declarations must be
replaced in that file, rather than imported alongside duplicate theorem names.
A build in this independent pinned environment does not establish upstream CI
compatibility; the upstream toolchain and imports require their own check.

The reference marks the supremum and both coarse infimum-bound variants as solved,
and attributes the supremum to Tao25. Report those as formalizations of known
results. The exact infimum, nonattainment and sharper numeric enclosure should be
identified separately. This archive does not certify present-day novelty or
OpenMath eligibility; those require the organizers' review of the exact target.
