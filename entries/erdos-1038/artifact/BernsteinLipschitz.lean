import LeanProject.Stage11C
import Mathlib.Analysis.SpecialFunctions.Bernstein
import Mathlib.Analysis.Calculus.Deriv.Polynomial

/-!
# Bernstein approximation with a preserved Lipschitz bound

The derivative is a positive average of adjacent divided differences. This supplies
the uniform difference-quotient bound needed by the adjoint limit theorem, rather
than assuming that uniform polynomial approximation controls derivatives.
-/

open Real Set Filter Topology MeasureTheory intervalIntegral Finset Polynomial
open scoped unitInterval

namespace EP1038.Stage11

noncomputable def bernPoly (n : ℕ) (a : ℕ → ℝ) : ℝ[X] :=
  ∑ j ∈ Finset.range (n + 1), C (a j) * bernsteinPolynomial ℝ n j

theorem bernPoly_derivative (n : ℕ) (a : ℕ → ℝ) :
    (bernPoly (n + 1) a).derivative =
      C (n + 1 : ℝ) * ∑ j ∈ Finset.range (n + 1),
        C (a (j + 1) - a j) * bernsteinPolynomial ℝ n j := by
  let b := fun j => bernsteinPolynomial ℝ n j
  have hshift : (∑ j ∈ Finset.range (n + 1), C (a (j + 1)) * b (j + 1)) +
      C (a 0) * b 0 = ∑ j ∈ Finset.range (n + 1), C (a j) * b j := by
    rw [Finset.sum_range_succ, Finset.sum_range_succ']
    simp [b, bernsteinPolynomial.eq_zero_of_lt ℝ (by omega : n < n + 1)]
  unfold bernPoly
  rw [Finset.sum_range_succ', Polynomial.derivative_add, Polynomial.derivative_sum]
  simp only [Polynomial.derivative_C_mul, bernsteinPolynomial.derivative_succ_aux,
    bernsteinPolynomial.derivative_zero, Nat.add_sub_cancel, Nat.cast_add, Nat.cast_one]
  conv_lhs => rw [add_comm]
  rw [show C (n + 1 : ℝ) = (n + 1 : ℝ[X]) by simp]
  change C (a 0) * (-(n + 1) * b 0) +
      (∑ j ∈ Finset.range (n + 1), C (a (j + 1)) * ((n + 1) * (b j - b (j + 1)))) = _
  simp only [C_sub, mul_sub, Finset.sum_sub_distrib, Finset.mul_sum]
  have h1 : (∑ j ∈ Finset.range (n + 1), C (a (j + 1)) * ((n + 1) * b j)) =
      (n + 1) * ∑ j ∈ Finset.range (n + 1), C (a (j + 1)) * b j := by
    rw [Finset.mul_sum]; exact Finset.sum_congr rfl (fun _ _ => by ring)
  have h2 : (∑ j ∈ Finset.range (n + 1), C (a (j + 1)) * ((n + 1) * b (j + 1))) =
      (n + 1) * ∑ j ∈ Finset.range (n + 1), C (a (j + 1)) * b (j + 1) := by
    rw [Finset.mul_sum]; exact Finset.sum_congr rfl (fun _ _ => by ring)
  rw [h1, h2]
  simp only [sub_mul, Finset.sum_sub_distrib, mul_sub]
  rw [← Finset.mul_sum, ← Finset.mul_sum]
  change _ = (n + 1) * (∑ j ∈ Finset.range (n + 1), C (a (j + 1)) * b j) -
    (n + 1) * (∑ j ∈ Finset.range (n + 1), C (a j) * b j)
  rw [← hshift]
  ring

theorem bernPoly_derivative_bound {L : ℝ} (hL : 0 ≤ L) (n : ℕ) (a : ℕ → ℝ)
    (ha : ∀ j < n + 1, |a (j + 1) - a j| ≤ L / (n + 1)) {x : ℝ}
    (hx : x ∈ Set.Icc (0 : ℝ) 1) : |(bernPoly (n + 1) a).derivative.eval x| ≤ L := by
  have hn : (0 : ℝ) < n + 1 := by positivity
  have hweights : ∑ j ∈ Finset.range (n + 1), (bernsteinPolynomial ℝ n j).eval x = 1 := by
    have h := congrArg (fun p : ℝ[X] => p.eval x) (bernsteinPolynomial.sum ℝ n)
    simpa only [Polynomial.eval_finsetSum, Polynomial.eval_one] using h
  have hnonneg : ∀ j, 0 ≤ (bernsteinPolynomial ℝ n j).eval x := by
    intro j
    exact bernstein_nonneg (x := ⟨x, hx⟩)
  rw [bernPoly_derivative, Polynomial.eval_mul, Polynomial.eval_C, Polynomial.eval_finsetSum,
    Finset.mul_sum]
  simp only [Polynomial.eval_mul, Polynomial.eval_C]
  calc
    _ ≤ ∑ j ∈ Finset.range (n + 1), |(n + 1) * ((a (j + 1) - a j) *
        (bernsteinPolynomial ℝ n j).eval x)| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ j ∈ Finset.range (n + 1), L * (bernsteinPolynomial ℝ n j).eval x := by
      apply Finset.sum_le_sum
      intro j hj
      rw [abs_mul, abs_mul, abs_of_pos hn, abs_of_nonneg (hnonneg j)]
      have hdiff := (le_div_iff₀ hn).mp (ha j (Finset.mem_range.mp hj))
      nlinarith [mul_nonneg (sub_nonneg.mpr hdiff) (hnonneg j)]
    _ = L := by rw [← Finset.mul_sum, hweights, mul_one]

theorem bernPoly_lipschitz {L : ℝ} (hL : 0 ≤ L) (n : ℕ) (a : ℕ → ℝ)
    (ha : ∀ j < n + 1, |a (j + 1) - a j| ≤ L / (n + 1))
    {x y : ℝ} (hx : x ∈ Set.Icc (0 : ℝ) 1) (hy : y ∈ Set.Icc (0 : ℝ) 1) :
    |(bernPoly (n + 1) a).eval x - (bernPoly (n + 1) a).eval y| ≤ L * |x - y| := by
  wlog hxy : y ≤ x generalizing x y
  · rw [abs_sub_comm, abs_sub_comm x y]
    exact this hy hx (le_of_not_ge hxy)
  have h := norm_image_sub_le_of_norm_deriv_le_segment'
    (f := fun t : ℝ => (bernPoly (n + 1) a).eval t)
    (f' := fun t => (bernPoly (n + 1) a).derivative.eval t)
    (fun t _ => ((bernPoly (n + 1) a).hasDerivAt t).hasDerivWithinAt)
    (fun t ht => by
      rw [Real.norm_eq_abs]
      exact bernPoly_derivative_bound hL n a ha ⟨hy.1.trans ht.1, ht.2.le.trans hx.2⟩)
    x ⟨hxy, le_rfl⟩
  simpa only [Real.norm_eq_abs, abs_of_nonneg (sub_nonneg.mpr hxy)] using h

noncomputable def unitModel {M : ℝ} {f : ℝ → ℝ} (hf : XLip M f) : C(I, ℝ) :=
  ⟨fun x => f (Real.arccos (2 * (x : ℝ) - 1)),
    hf.continuous.comp (Real.continuous_arccos.comp
      ((continuous_const.mul continuous_subtype_val).sub continuous_const))⟩

theorem unitModel_lipschitz {M : ℝ} {f : ℝ → ℝ} (hf : XLip M f) (x y : I) :
    |unitModel hf x - unitModel hf y| ≤ (2 * M) * |(x : ℝ) - y| := by
  have h := hf (Real.arccos (2 * (x : ℝ) - 1)) (Real.arccos (2 * (y : ℝ) - 1))
  rw [Real.cos_arccos (by linarith [x.2.1]) (by linarith [x.2.2]),
    Real.cos_arccos (by linarith [y.2.1]) (by linarith [y.2.2]),
    show 2 * (x : ℝ) - 1 - (2 * (y : ℝ) - 1) = 2 * ((x : ℝ) - y) by ring,
    abs_mul, abs_of_pos (by norm_num : (0 : ℝ) < 2)] at h
  exact h.trans_eq (by ring)

noncomputable def lipApprox {M : ℝ} {f : ℝ → ℝ} (hf : XLip M f) (n : ℕ) : ℝ[X] :=
  bernPoly (n + 1) (fun j => f (Real.arccos (2 * ((j : ℝ) / (n + 1)) - 1)))

theorem lipApprox_eval {M : ℝ} {f : ℝ → ℝ} (hf : XLip M f) (n : ℕ) (x : I) :
    (lipApprox hf n).eval (x : ℝ) = bernsteinApproximation (n + 1) (unitModel hf) x := by
  simp only [lipApprox, bernPoly, Polynomial.eval_finsetSum, Polynomial.eval_mul,
    Polynomial.eval_C, bernsteinApproximation, ContinuousMap.sum_apply,
    ContinuousMap.mul_apply, ContinuousMap.const_apply, smul_eq_mul]
  rw [← Fin.sum_univ_eq_sum_range]
  apply Finset.sum_congr rfl
  intro j _
  simp [bernstein, unitModel, bernstein.z, Polynomial.toContinuousMapOn,
    Polynomial.toContinuousMap, mul_comm]

theorem lipApprox_XLip {M : ℝ} (hM : 0 ≤ M) {f : ℝ → ℝ} (hf : XLip M f) (n : ℕ) :
    XLip M (fun θ => (lipApprox hf n).eval ((Real.cos θ + 1) / 2)) := by
  have hcoeff : ∀ j < n + 1,
      |f (Real.arccos (2 * (((j + 1 : ℕ) : ℝ) / (n + 1)) - 1)) -
       f (Real.arccos (2 * ((j : ℝ) / (n + 1)) - 1))| ≤ (2 * M) / (n + 1) := by
    intro j hj
    have hnode : ∀ k ≤ n + 1, (k : ℝ) / (n + 1) ∈ Set.Icc (0 : ℝ) 1 := by
      intro k hk
      exact ⟨by positivity, (div_le_one (by positivity)).mpr (by exact_mod_cast hk)⟩
    have h := unitModel_lipschitz hf ⟨(j + 1 : ℝ) / (n + 1), by
      convert hnode (j + 1) (by omega) using 1 <;> push_cast <;> rfl⟩
      ⟨(j : ℝ) / (n + 1), hnode j (by omega)⟩
    have heq : ((j + 1 : ℝ) / (n + 1) - (j : ℝ) / (n + 1)) = 1 / (n + 1) := by ring
    change |f (Real.arccos (2 * ((j + 1 : ℝ) / (n + 1)) - 1)) -
      f (Real.arccos (2 * ((j : ℝ) / (n + 1)) - 1))| ≤
        (2 * M) * |(j + 1 : ℝ) / (n + 1) - (j : ℝ) / (n + 1)| at h
    rw [heq, abs_of_pos (by positivity : (0 : ℝ) < 1 / (n + 1))] at h
    convert h using 1 <;> push_cast <;> ring
  intro φ θ
  have h := bernPoly_lipschitz (L := 2 * M) (by positivity) n
    (fun j => f (Real.arccos (2 * ((j : ℝ) / (n + 1)) - 1))) hcoeff
    (x := (Real.cos φ + 1) / 2) (y := (Real.cos θ + 1) / 2)
    ⟨by linarith [Real.neg_one_le_cos φ], by linarith [Real.cos_le_one φ]⟩
    ⟨by linarith [Real.neg_one_le_cos θ], by linarith [Real.cos_le_one θ]⟩
  have heq : (Real.cos φ + 1) / 2 - (Real.cos θ + 1) / 2 =
      (Real.cos φ - Real.cos θ) / 2 := by ring
  simpa only [lipApprox, heq, abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 2),
    show 2 * M * (|Real.cos φ - Real.cos θ| / 2) = M * |Real.cos φ - Real.cos θ| by ring] using h

/-- The adjoint identity for every function Lipschitz in the cosine coordinate.
The approximating polynomials and their common Lipschitz constant are constructed. -/
theorem L_XLip {r ρ1 ρ2 σ1 σ2 M : ℝ} (hr : 0 < r) (h10 : 0 < ρ1) (h11 : ρ1 < 1)
    (h20 : 0 < ρ2) (h21 : ρ2 < 1) (hM : 0 ≤ M) {f : ℝ → ℝ} (hf : XLip M f) :
    Lfun r ρ1 ρ2 σ1 σ2 f = 0 := by
  let ε := fun n => ‖bernsteinApproximation (n + 1) (unitModel hf) - unitModel hf‖
  have hε : Tendsto ε atTop (𝓝 0) := by
    have h := (bernsteinApproximation_uniform (unitModel hf)).comp (tendsto_add_atTop_nat 1)
    simpa only [ε, Function.comp_apply, sub_self, norm_zero] using
      (h.sub (tendsto_const_nhds (x := unitModel hf))).norm
  have hpe : ∀ n θ, |(lipApprox hf n).eval ((Real.cos θ + 1) / 2) - f θ| ≤ ε n := by
    intro n θ
    let x : I := ⟨(Real.cos θ + 1) / 2,
      ⟨by linarith [Real.neg_one_le_cos θ], by linarith [Real.cos_le_one θ]⟩⟩
    have heq : unitModel hf x = f θ := by
      apply eq_of_abs_sub_nonpos
      have h := hf (Real.arccos (2 * (x : ℝ) - 1)) θ
      rw [Real.cos_arccos (by linarith [x.2.1]) (by linarith [x.2.2])] at h
      have hcos : 2 * (x : ℝ) - 1 = Real.cos θ := by dsimp [x]; ring
      change |f (Real.arccos (2 * (x : ℝ) - 1)) - f θ| ≤ 0
      rw [hcos]
      rw [hcos, sub_self, abs_zero, mul_zero] at h
      exact h
    have h := (bernsteinApproximation (n + 1) (unitModel hf) - unitModel hf).norm_coe_le_norm x
    rw [ContinuousMap.sub_apply, Real.norm_eq_abs, ← lipApprox_eval hf n x, heq] at h
    exact h
  apply L_limit h10.le h11 h20.le h21 hM
    (p := fun n θ => (lipApprox hf n).eval ((Real.cos θ + 1) / 2))
    (fun n => lipApprox_XLip hM hf n) hf hε hpe
  intro n
  have h := L_poly (σ1 := σ1) (σ2 := σ2) hr h10 h11 h20 h21
    ((lipApprox hf n).comp ((X + 1) * C (1 / 2)))
  simpa only [Polynomial.eval_comp, Polynomial.eval_mul, Polynomial.eval_add,
    Polynomial.eval_X, Polynomial.eval_one, Polynomial.eval_C, div_eq_mul_inv, one_mul] using h

end EP1038.Stage11
