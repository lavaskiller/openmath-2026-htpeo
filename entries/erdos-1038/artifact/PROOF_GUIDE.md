# Proof entrypoints and dependencies

Start with `Lean/LeanProject/Submission.lean` and `Lean/Verify.lean`.
The exact local import graph is in `verification/source_inventory.json`.
Every packaged proof module is reached by `LeanProject.lean`.

| Conclusion | Primary theorem/source |
| --- | --- |
| Universal upper bound and equality cases | `EP1038.sup_theorem`, `Supremum.lean`; official equality bridge in `DeepMindBoundsBridge.lean` |
| Official supremum | `Erdos1038.erdos_1038.parts.ii`, `DeepMindStatementBridge.lean` |
| Exact correspondence of polynomial classes | `DeepMindModelBridge.lean` |
| Independent reference family and D | `Stage9A.lean`, `Stage9C.lean` |
| Approximation by admissible polynomials | `EP1038.Stage9.sharpness`, `Stage9D4.lean`; transfer in `DeepMindInfimumBridge.lean` |
| Reduction of arbitrary polynomials to reference certificates | `NormalFormBridge.lean`, `NormalFormComponent.lean`, `MaterialFirstVariation.lean`, `ActualBlockReduction.lean` |
| Exhaustive parameter cover | `ParameterCoverage.lean`, `CompleteCoverage.lean` |
| Actual certificates in all four COV regions | `COVFiniteCertificates.lean`, `COVTerminalTail.lean`; assembly `CompleteCoverage.COV` |
| Strict lower bound for all admissible polynomials | `EP1038.ReferenceCert.universal_strict_lower`, `CompleteCoverage.lean` |
| Exact infimum and nonattainment | `EP1038.ReferenceCert.exact_infimum_and_nonattainment`, `CompleteCoverage.lean` |
| Numerical enclosure of D | `DLowerCoverage.lean` + `DLowerTS.lean` + `DWidthDerivatives.lean` + `DLowerM.lean` → `actual_numerical_D_enclosure` |
| Final statements in the reference form | `Submission.lean`, together with the imported `DeepMindStatementBridge.lean` |

The strict lower bound uses the reduction, actual physical/analytic identifications,
scalar positivity and the exhaustive COV certificates jointly. The approximation
argument supplies the opposite infimum inequality; joining the two gives equality
with D. Strictness supplies nonattainment. The numerical enclosure is an additional
result about the independently defined D, assembled from its actual T/M/S cover.

The `.lean` files containing finite arithmetic/log certificates are required proof
sources and are included. No Python numerical answer is assumed in these final
statements. The Python scripts in this archive only inspect source integrity and
Lean's axiom report; they do not certify a mathematical inequality.
