import LeanProject.DeepMindStatementBridge
import LeanProject.CompleteCoverage
import LeanProject.DLowerM

/-!
# Completed statements for Erdős 1038

The infimum and upper-bound statement heads use the polynomial subtype and
`ENNReal` volume of the Formal Conjectures reference. The unknown answer in
part (i) is filled by the independently defined one-parameter constant `Dval`.
The supremum and classical lower-bound statements are imported from
`DeepMindStatementBridge`. No FormalConjecturesUtil metadata is required here.
-/

open MeasureTheory
open scoped Real NNReal ENNReal
set_option linter.style.header false

namespace Erdos1038

set_option linter.unusedVariables false in
/-- The reference infimum statement, with its unknown answer filled by D. -/
theorem erdos_1038.parts.i (n : ℕ) : ENNReal.ofReal EP1038.Stage9.Dval =
    ⨅ f : {f : Polynomial ℝ // f.Monic ∧ f ≠ 1 ∧
      (f.roots.filter fun x => x ∈ Set.Icc (-1 : ℝ) 1).card = f.natDegree},
      volume {x | |f.1.eval x| < 1} := by
  simpa only [EP1038.DeepMind.officialInf, EP1038.DeepMind.InfAdmissible]
    using EP1038.ReferenceCert.exact_infimum_and_nonattainment.1.symm

/-- A convenient real comparison; the decimal is an upper bound, not the answer. -/
theorem erdos_1038.D_lt_1835 : EP1038.Stage9.Dval < (1.835 : ℝ) := by
  have h := EP1038.DLowerCert.actual_numerical_D_enclosure.2
  exact lt_trans h (by norm_num [EP1038.DLowerCert.dUpperTarget])

set_option linter.unusedVariables false in
/-- The exact reference upper-bound variant, now proved unconditionally. -/
theorem erdos_1038.variants.inf_upperBound (n : ℕ) :
    ⨅ f : {f : Polynomial ℝ // f.Monic ∧ f ≠ 1 ∧
      (f.roots.filter fun x => x ∈ Set.Icc (-1 : ℝ) 1).card = f.natDegree},
      volume {x | |f.1.eval x| < 1} < 1.835 := by
  change EP1038.DeepMind.officialInf < (1.835 : ℝ≥0∞)
  rw [EP1038.ReferenceCert.exact_infimum_and_nonattainment.1]
  have h : ENNReal.ofReal EP1038.Stage9.Dval < ENNReal.ofReal (1.835 : ℝ) :=
    (ENNReal.ofReal_lt_ofReal_iff (by norm_num)).mpr erdos_1038.D_lt_1835
  have hd : (1.835 : ℝ≥0∞) = ENNReal.ofReal (1.835 : ℝ) := by
    change (↑(1.835 : ℝ≥0) : ℝ≥0∞) = ENNReal.ofReal (1.835 : ℝ)
    rw [← ENNReal.ofReal_coe_nnreal, NNReal.coe_ofScientific]
  rw [hd]
  exact h

/-- Additional result: the official infimum is attained by no admissible polynomial. -/
theorem erdos_1038.inf_nonattainment (f : Polynomial ℝ)
    (hf : f.Monic ∧ f ≠ 1 ∧
      (f.roots.filter fun x => x ∈ Set.Icc (-1 : ℝ) 1).card = f.natDegree) :
    volume {x : ℝ | |f.eval x| < 1} ≠
      ⨅ p : {p : Polynomial ℝ // p.Monic ∧ p ≠ 1 ∧
        (p.roots.filter fun x => x ∈ Set.Icc (-1 : ℝ) 1).card = p.natDegree},
        volume {x | |p.1.eval x| < 1} :=
  EP1038.ReferenceCert.exact_infimum_and_nonattainment.2 f hf

/-- Exact rational enclosure of D, with a strict upper endpoint. -/
theorem erdos_1038.D_enclosure :
    (18344304757 / 10000000000 : ℝ) ≤ EP1038.Stage9.Dval ∧
      EP1038.Stage9.Dval < (18344304757628 / 10000000000000 : ℝ) := by
  simpa only [EP1038.DLowerCert.NumericalDEnclosure,
    EP1038.DLowerCert.dLowerTarget, EP1038.DLowerCert.dUpperTarget]
    using EP1038.DLowerCert.actual_numerical_D_enclosure

end Erdos1038
