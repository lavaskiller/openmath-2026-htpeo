# Formal contribution candidates and comparison with prior work

Status: candidate M2 material for review, not accepted credit. The Erdős #1038 extrema are already formalized. We request consideration of the exact reusable statements below as one provisional related formalization target; eight declarations or four implementation differences do not imply eight or four accepted families. The organisers decide admission, novelty and family grouping.

## Prior mathematics and formalizations

The mathematical architecture follows Shouqiao Wang: reference measures, a convex supporting inequality, endpoint-corrected adjoint, block energy reduction and scalar certificates. The earlier supremum/reduction ideas discussed in the paper are attributed to Terence Tao. This is an implementation and exposition contribution built on acknowledged sources.

- [Wang's checked source](https://github.com/ShouqiaoW/erdos/tree/d28713ac8245ca86a686b8c67370a8d19d81b242/1038): locally reproduced on 2026-10-01, 3,194 original Lean files; standard-axiom final audit passed. `wang-verification-summary.txt` records the scope. A July 19 source commit predates the competition's status freeze.
- [plby/lean-proofs provenance](https://github.com/plby/lean-proofs/blob/main/ErdosProblems/Erdos1038.md): accessed 2026-10-03. It describes an import/port of Wang's proof, original commit `dc20752268ede5a3548e3d63ae74e45c3cfcf78c`, and a Lean/Mathlib 4.33.0 port. The current team baseline already records this prior formalization. We have not independently rebuilt that port or compared every declaration in it during this packaging pass.
- Pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: the 2026-10-02 local search for the named circle rearrangement and Bernstein/Lipschitz patterns found no matching development. A textual search is limited; it does not establish global priority. Other public libraries and private work have not been exhaustively surveyed.

## Concrete differences from Wang's compiled implementation

| Candidate | This compiled implementation | Checked Wang path | Reuse and limits |
|---|---|---|---|
| Cyclic/circle rearrangement | `Riesz.discrete_riesz` uses two-point polarization and a finite minimum potential. `Circ.circle_rearrangement` passes from cell averages through explicit L1 errors and Lebesgue differentiation; `CircLog` separately handles the singular log kernel. | `PlatformCircleBlock` compresses the platform reference and adjoint densities using terminal shells/layer cake. | A generic interface for bounded kernels and arbitrary measurable periodic [0,1] densities, rather than just the platform density. Classical mathematics, not a new rearrangement inequality or established first formalization. |
| Scalar certificates | `Arc.scalar_pos` assembles sinc monotonicity and explicit lower bounds over a finite partition; `Stage12.scalarPositive_partition` transfers this to physical references. | `HighKPlatformAffineSemanticCalibration` certifies negativity of the entire affine scalar derivative. | A different certificate strategy without that whole-function derivative-sign premise. The partition margins and other explicit hypotheses still have to be proved. No speed/accuracy advantage has been benchmarked. |
| Adjoint identity | `Stage11.L_XLip` uses Bernstein polynomial approximations with a common Lipschitz bound. `finite_jump_adjoint_eq` uses ramp limits for finite jumps. `PrincipalValue` identifies the raw principal value with the difference-quotient transform. | `PlatformAdjointAbelBoundary` uses interior Abel regularization and boundary limits. | Reusable approximation/limit statements and an alternate proof route. This does not repair a hole in Wang's successfully compiled theorem. |
| Supporting inequalities | `Stage10.convex_supporting_sep/contact` works directly with bounded positive measurable functions and explicit geometric hypotheses. | `ResidualWidthConvex` and `NormalizedResidualPlatformSupportLimit` use finite coordinates and platform refinement. | A general measurable-function interface; the #1038 consequence is proved in both implementations. |

## Exact statements and evidence

See `EXACT_STATEMENTS.md`, `VerifyContributions.lean` and `contribution-axioms.log` for the complete elaborated types, including all section variables and hypotheses. `informal_audit.md` sections 35–36 gives the source comparison. The local Lean/configuration bytes are identical to the previously rebuilt 315-module archive.

The overlap screening compared 326 local Lean sources with 3,194 Wang sources and also the numerical Python sources. It found no identical complete files or substantial distinctive proof-body/function clone among the inspected candidates. The short `log_q_neg` wrapper is identical; hypotheses and quadratic formulas overlap. These results do not certify independent authorship or exclude transformed copying. Dependence on the mathematical architecture is expressly acknowledged.

## Excluded claims

No credit is requested for newly solving #1038, a first formalization of its final theorem, or a stronger extremal theorem. Both determine the same infimum and supremum. Wang additionally proves uniqueness/location of the one-cut minimizer and a tighter enclosure. Removing Pringsheim, standard axioms, module counts and local verification are not exclusive advantages. Admission, a broad prior-library novelty review, event-window provenance and qualified mathematical reviews remain unresolved.
