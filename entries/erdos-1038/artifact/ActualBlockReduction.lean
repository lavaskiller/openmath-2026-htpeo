import LeanProject.ActualBlockMaterial

/-!
# Actual block reduction and the remaining certificate interface

Target blocks, masses, energies, material bounds and radii are constructed.
Only reference selection and the scalar positivity certificates remain inputs.
-/

open Real Set MeasureTheory Finset Filter Topology Polynomial
open scoped ENNReal

namespace EP1038.Stage12
open EP1038.Arc EP1038.Stage11 EP1038.NormalForm NormalData AngleReference

noncomputable def referenceWidth (R : SeparatedReference) : ℝ :=
  (volume (Stage10.correctedNegSet R.angles.k R.quantile ∩ Iio R.separator)).toReal

noncomputable def calibratedCeff (R : SeparatedReference) (L : ℝ) : ℝ :=
  refConstant R + (L - referenceWidth R) / totalXi R

noncomputable def scalarC0 (R : SeparatedReference) : ℝ :=
  Real.log (2 * (R.r / 2) / (api R.angles * bpi R))

def ScalarPositive (R : SeparatedReference) (Ceff : ℝ) : Prop :=
  ∀ Q V : ℝ, Q ∈ Ioc (0 : ℝ) (π / api R.angles) →
    V ∈ Ioc (0 : ℝ) (π * totalXi R / bpi R) →
      0 < rhs (scalarC0 R) Ceff (api R.angles) Q V

theorem scalarPositive_small (R : SeparatedReference) {Ceff : ℝ} (hC : Ceff ≤ 0)
    (hmargin : 0 < scalarC0 R + hfun (π / api R.angles) + hfun (π * totalXi R / bpi R) +
      -(π * Ceff / api R.angles) / (π / api R.angles)) : ScalarPositive R Ceff := by
  intro Q V hQ hV
  exact scalar_pos_small (api_pos R.angles) hC (rectangle_upper_bounds R).1
    (rectangle_upper_bounds R).2 hmargin hQ.1 hQ.2 hV.1 hV.2

theorem scalarPositive_partition (R : SeparatedReference) {Ceff : ℝ} (hC : Ceff ≤ 0)
    (hRQ : π * totalXi R / bpi R ≤ π / api R.angles) {M : ℕ} {pt : ℕ → ℝ}
    (hmono : Monotone pt) (hpt0 : pt 0 = π * totalXi R / bpi R) (hptM : pt M = π / api R.angles)
    (hmargin : 0 < scalarC0 R + hfun (π / api R.angles) + hfun (π * totalXi R / bpi R) +
      -(π * Ceff / api R.angles) / (π * totalXi R / bpi R))
    (hpart : ∀ m, 1 ≤ m → m ≤ M → 0 < scalarC0 R + hfun (π / api R.angles) +
      hfun (π * totalXi R / bpi R) + -(π * Ceff / api R.angles) / pt m +
        (EP1038.Arc.sinc (π * totalXi R / bpi R) - EP1038.Arc.sinc (pt (m - 1))) ^ 2) :
    ScalarPositive R Ceff := by
  intro Q V hQ hV
  exact scalar_pos (api_pos R.angles) hC (rectangle_upper_bounds R).1 hRQ hmono hpt0 hptM
    hmargin hpart hQ.1 hQ.2 hV.1 hV.2

theorem normal_form_strict_lower_of_scalarPositive {n : ℕ} (R : SeparatedReference)
    (a : NormalData n) (hres : 0 < a.residualCount) (hk : R.angles.k = a.k)
    (hzero : (0 : ℝ) = R.c - R.r / 2 * (R.angles.ρ + 1 / R.angles.ρ)) {L Ceff : ℝ}
    (hcal : Ceff = calibratedCeff R L) (hscalar : ScalarPositive R Ceff) : L < a.J := by
  classical
  let q := blockMass R.angles a hres
  let r := blockXi R a hres
  let rad := Stage7.Rv a.roots
  let E := blockEnergy R a hres
  let Ig := blockMaterialIntegral R a hres
  let Mk := Resid.rhoR a.roots (a.roots a.main) - Resid.ellL a.roots (a.roots a.main)
  have h84 : ∀ v ∈ a.residualValues, q v * r v * Real.log (q v * r v / 2) + Ceff * r v < E v := by
    intro v hv
    obtain ⟨hQ, hV⟩ := actual_block_rectangle R a hres hv
    exact blockEnergy_strict_of_rhs_pos R a hres hv hzero (hscalar _ _ hQ hV)
  obtain ⟨v, hv, _⟩ := residualQuantile_original a hres 0
  have hM : referenceWidth R + ∑ v ∈ a.residualValues, Ig v ≤ Mk := by
    have h := normal_form_block_supporting R a hres hk hzero
    simpa only [referenceWidth, hk] using h
  have h := block_reduction_strict a.residualValues q r rad E Ig
    (fun v hv => blockMass_pos R.angles a hres hv) (fun v hv => blockXi_pos R a hres hv)
    (fun v _ => blockRadius_pos a v)
    (fun v hv => blockMaterial_lower_bound R a hres hv hk hzero) hM
    (fun v hv => (h84 v hv).le) hv (h84 v hv)
    (sum_blockXi R a hres) (totalXi_pos R) hcal
  exact h

/-- Every arbitrary polynomial has the actual target required by the strict block theorem.
The separated reference and its scalar certificate are the only remaining mathematical inputs. -/
theorem polynomial_strict_lower_reduction {p : ℝ[X]} (hp : EP1038.Admissible p) :
    ENNReal.ofReal 2 ≤ EP1038.sublevelMeasure p ∨
      ∃ n : ℕ, ∃ a : NormalData n, ∃ hres : 0 < a.residualCount,
        1 ≤ a.k ∧ a.J ≤ (EP1038.sublevelMeasure p).toReal ∧
          ∀ R : SeparatedReference, R.angles.k = a.k →
            (0 : ℝ) = R.c - R.r / 2 * (R.angles.ρ + 1 / R.angles.ρ) →
              ∀ L : ℝ, ScalarPositive R (calibratedCeff R L) →
                L < (EP1038.sublevelMeasure p).toReal := by
  rcases polynomial_adjoint_reduction hp with hbig | ⟨n, a, hres, hk, hJ, _⟩
  · exact Or.inl hbig
  refine Or.inr ⟨n, a, hres, hk, hJ, ?_⟩
  intro R hR hzero L hscalar
  exact (normal_form_strict_lower_of_scalarPositive R a hres hR hzero rfl hscalar).trans_le hJ

theorem normal_form_small_ratio {n : ℕ} (a : NormalData n) (hres : 0 < a.residualCount)
    (hk : a.k ≤ 29 / 20) : 2 < a.J := by
  have hb : (0 : ℝ) < a.residualCount := by exact_mod_cast hres
  have hcount : 20 * a.mainCount ≤ 29 * a.residualCount := by
    have h := (div_le_iff₀ hb).mp hk
    have h' : (20 : ℝ) * a.mainCount ≤ 29 * a.residualCount := by
      linarith
    exact_mod_cast h'
  have h := Stage8.prop81 a.positive_degree a.roots a.roots_mem a.sum_nonpos a.clustered
    ⟨a.main, rfl⟩ a.least hres hcount
  have hsq := Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num)
  have hrt := Real.sqrt_nonneg (2 : ℝ)
  have hgt : (4 : ℝ) / 3 < √2 := by nlinarith
  exact lt_trans (by linarith) h.2.2.1

/-- The low-ratio branch is discharged; only the parameter range covered by the
paper's reference certificates remains in the second branch. -/
theorem polynomial_certificate_reduction {p : ℝ[X]} (hp : EP1038.Admissible p) :
    2 ≤ (EP1038.sublevelMeasure p).toReal ∨
      ∃ n : ℕ, ∃ a : NormalData n, ∃ hres : 0 < a.residualCount,
        29 / 20 < a.k ∧ 36 / 25 ≤ a.k ∧ a.J ≤ (EP1038.sublevelMeasure p).toReal ∧
          ∀ R : SeparatedReference, R.angles.k = a.k →
            (0 : ℝ) = R.c - R.r / 2 * (R.angles.ρ + 1 / R.angles.ρ) →
              ∀ L : ℝ, ScalarPositive R (calibratedCeff R L) →
                L < (EP1038.sublevelMeasure p).toReal := by
  rcases polynomial_strict_lower_reduction hp with hbig | ⟨n, a, hres, hk, hJ, hs⟩
  · have h := ENNReal.toReal_mono (EP1038.admissible_measure_finite hp) hbig
    exact Or.inl (by simpa using h)
  · rcases le_or_gt a.k (29 / 20) with hsmall | hlarge
    · exact Or.inl ((normal_form_small_ratio a hres hsmall).le.trans hJ)
    · exact Or.inr ⟨n, a, hres, hlarge, by linarith, hJ, hs⟩

end EP1038.Stage12
