import LeanProject.ArcEnergyC

/-!
# EP-1038, Stage 12, Corollary 12.9: the scalar reduction for `C_eff ≤ 0`

The right-hand side of (12.5) is, with `c₀ = log(2H/(a_π b_π))`,
`rhs(Q, R) = c₀ + h(Q) + h(R) + Σ(Q, R) - π C_eff/(a_π Q)`, `Σ(Q, R) = ∑_{n ≥ 1} (x_n(Q) - x_n(R))²/n`.

* `sinc_anti`: `sin b / b ≤ sin a / a` for `0 < a ≤ b ≤ π`.
* `rhs_ge_Lam` (first claim of Corollary 12.9): on `(0, Q_max] × (0, R_max]` (`Q_max, R_max ≤ π`),
  `rhs(Q, R) ≥ Λ(Q, R) = 𝓑 + P/Q + (sinc Q - sinc R)²` with
  `𝓑 = c₀ + h(Q_max) + h(R_max)` and `P = -π C_eff/a_π ≥ 0`.
* `Lam_case1`, `Lam_case2`: the two cases of the partition bound.
* `scalar_pos_small`, `scalar_pos` (Corollary 12.9, in the form used by the certificates): if the
  finitely many partition values are positive, then `rhs > 0` on the whole rectangle.
-/

open Real MeasureTheory Set Filter Topology

namespace EP1038.Arc

/-- `sinc X = sin X / X`. -/
noncomputable def sinc (X : ℝ) : ℝ := Real.sin X / X

theorem xs_zero (X : ℝ) : xs 0 X = sinc X := by
  simp [xs, sinc]

/-- `sinc` is nonincreasing on `(0, π]` (concavity of `sin` on `[0, π]`). -/
theorem sinc_anti {a b : ℝ} (ha : 0 < a) (hab : a ≤ b) (hb : b ≤ π) : sinc b ≤ sinc a := by
  have hb0 : 0 < b := ha.trans_le hab
  have hconc : a / b * Real.sin b ≤ Real.sin a := by
    have := strictConcaveOn_sin_Icc.concaveOn.2 (⟨hb0.le, hb⟩ : b ∈ Icc 0 π)
      (⟨le_refl 0, Real.pi_pos.le⟩ : (0 : ℝ) ∈ Icc 0 π) (div_nonneg ha.le hb0.le)
      (by rw [sub_nonneg, div_le_one hb0]; exact hab) (by ring : a / b + (1 - a / b) = 1)
    simp only [smul_eq_mul, Real.sin_zero, mul_zero, add_zero] at this
    have hb00 := hb0.ne'
    have e : a / b * b = a := by field_simp
    rwa [e] at this
  unfold sinc
  rw [div_le_div_iff₀ hb0 ha]
  rw [div_mul_eq_mul_div, div_le_iff₀ hb0] at hconc
  linarith

theorem summable_sq {Q R : ℝ} (hQ : 0 < Q) (hR : 0 < R) :
    Summable (fun n : ℕ => (xs n Q - xs n R) ^ 2 / ((n : ℝ) + 1)) := by
  have s := ((summable_xx hQ hQ).add (summable_xx hR hR)).sub ((summable_xx hQ hR).mul_left 2)
  refine s.congr (fun n => ?_)
  ring

/-- `Σ(Q, R) ≥ (sinc Q - sinc R)²` (keep only the first term). -/
theorem sigma_ge {Q R : ℝ} (hQ : 0 < Q) (hR : 0 < R) :
    (sinc Q - sinc R) ^ 2 ≤ ∑' n : ℕ, (xs n Q - xs n R) ^ 2 / ((n : ℝ) + 1) := by
  have h := (summable_sq hQ hR).le_tsum 0 (fun j _ => div_nonneg (sq_nonneg _) (by positivity))
  simpa [xs_zero] using h

/-- The right-hand side of (12.5). -/
noncomputable def rhs (c0 Ceff api Q R : ℝ) : ℝ :=
  c0 + hfun Q + hfun R + ∑' n : ℕ, (xs n Q - xs n R) ^ 2 / ((n : ℝ) + 1) - π * Ceff / (api * Q)

/-- `Λ(Q, R) = 𝓑 + P/Q + (sinc Q - sinc R)²`. -/
noncomputable def Lam (B P Q R : ℝ) : ℝ := B + P / Q + (sinc Q - sinc R) ^ 2

/-- **Corollary 12.9**, first claim: `rhs(Q, R) ≥ Λ(Q, R)` on the rectangle. -/
theorem rhs_ge_Lam {c0 Ceff api Qm Rm Q R : ℝ} (hapi : 0 < api) (hQm : Qm ≤ π) (hRm : Rm ≤ π)
    (hQ : 0 < Q) (hQQ : Q ≤ Qm) (hR : 0 < R) (hRR : R ≤ Rm) :
    Lam (c0 + hfun Qm + hfun Rm) (-(π * Ceff / api)) Q R ≤ rhs c0 Ceff api Q R := by
  have h1 := hfun_anti hQ hQQ hQm
  have h2 := hfun_anti hR hRR hRm
  have h3 := sigma_ge hQ hR
  have e : -(π * Ceff / api) / Q = -(π * Ceff / (api * Q)) := by
    have := hapi.ne'
    have := hQ.ne'
    field_simp
  unfold Lam rhs
  rw [e]
  linarith

/-- Case `Q ≤ min(Q_max, R_max)`. -/
theorem Lam_case1 {B P Q R m : ℝ} (hP : 0 ≤ P) (hQ : 0 < Q) (hQm : Q ≤ m) :
    B + P / m ≤ Lam B P Q R := by
  unfold Lam
  have := div_le_div_of_nonneg_left hP hQ hQm
  nlinarith [sq_nonneg (sinc Q - sinc R)]

/-- Case `Q ∈ [q₁, q₂] ⊂ [R_max, π]`. -/
theorem Lam_case2 {B P Q R Rm q1 q2 : ℝ} (hP : 0 ≤ P) (hR : 0 < R) (hRR : R ≤ Rm)
    (hRq : Rm ≤ q1) (hq1 : q1 ≤ Q) (hq2 : Q ≤ q2) (hq2π : Q ≤ π) :
    B + P / q2 + (sinc Rm - sinc q1) ^ 2 ≤ Lam B P Q R := by
  unfold Lam
  have hRm0 : 0 < Rm := hR.trans_le hRR
  have hq10 : 0 < q1 := hRm0.trans_le hRq
  have hQ0 : 0 < Q := hq10.trans_le hq1
  have s1 : sinc Rm ≤ sinc R := sinc_anti hR hRR (hRq.trans (hq1.trans hq2π))
  have s2 : sinc q1 ≤ sinc Rm := sinc_anti hRm0 hRq (hq1.trans hq2π)
  have s3 : sinc Q ≤ sinc q1 := sinc_anti hq10 hq1 hq2π
  have hsq : (sinc Rm - sinc q1) ^ 2 ≤ (sinc Q - sinc R) ^ 2 := by
    rw [← sq_abs (sinc Q - sinc R), abs_of_nonpos (by linarith)]
    exact pow_le_pow_left₀ (by linarith) (by linarith) 2
  have := div_le_div_of_nonneg_left hP hQ0 hq2
  linarith

/-- **Corollary 12.9**, case `Q_max ≤ R_max` (where `min(Q_max, R_max) = Q_max`): one value suffices.
(The statement holds for either order, since only `Q ≤ Q_max` is used.) -/
theorem scalar_pos_small {c0 Ceff api Qm Rm : ℝ} (hapi : 0 < api) (hC : Ceff ≤ 0)
    (hQm : Qm ≤ π) (hRm : Rm ≤ π)
    (h1 : 0 < c0 + hfun Qm + hfun Rm + -(π * Ceff / api) / Qm)
    {Q R : ℝ} (hQ : 0 < Q) (hQQ : Q ≤ Qm) (hR : 0 < R) (hRR : R ≤ Rm) :
    0 < rhs c0 Ceff api Q R := by
  have hP : 0 ≤ -(π * Ceff / api) := by
    rw [neg_nonneg]
    exact div_nonpos_of_nonpos_of_nonneg (mul_nonpos_of_nonneg_of_nonpos Real.pi_pos.le hC)
      hapi.le
  have := Lam_case1 (R := R) (B := c0 + hfun Qm + hfun Rm) hP hQ hQQ
  have := rhs_ge_Lam (c0 := c0) (Ceff := Ceff) hapi hQm hRm hQ hQQ hR hRR
  linarith

/-- **Corollary 12.9** (the partition bound), for `R_max ≤ Q_max`: given a monotone partition
`R_max = pt 0 ≤ pt 1 ≤ … ≤ pt M = Q_max`, if `𝓑 + P/R_max > 0` and
`𝓑 + P/pt m + (sinc R_max - sinc (pt (m-1)))² > 0` for `1 ≤ m ≤ M`, then `rhs > 0` on the
rectangle `(0, Q_max] × (0, R_max]`. -/
theorem scalar_pos {c0 Ceff api Qm Rm : ℝ} (hapi : 0 < api) (hC : Ceff ≤ 0)
    (hQm : Qm ≤ π) (hRQ : Rm ≤ Qm) {M : ℕ} {pt : ℕ → ℝ} (hmono : Monotone pt)
    (hpt0 : pt 0 = Rm) (hptM : pt M = Qm)
    (h1 : 0 < c0 + hfun Qm + hfun Rm + -(π * Ceff / api) / Rm)
    (hpart : ∀ m, 1 ≤ m → m ≤ M →
      0 < c0 + hfun Qm + hfun Rm + -(π * Ceff / api) / pt m + (sinc Rm - sinc (pt (m - 1))) ^ 2)
    {Q R : ℝ} (hQ : 0 < Q) (hQQ : Q ≤ Qm) (hR : 0 < R) (hRR : R ≤ Rm) :
    0 < rhs c0 Ceff api Q R := by
  have hRm : Rm ≤ π := hRQ.trans hQm
  have hP : 0 ≤ -(π * Ceff / api) := by
    rw [neg_nonneg]
    exact div_nonpos_of_nonpos_of_nonneg (mul_nonpos_of_nonneg_of_nonpos Real.pi_pos.le hC)
      hapi.le
  have hL := rhs_ge_Lam (c0 := c0) (Ceff := Ceff) hapi hQm hRm hQ hQQ hR hRR
  rcases le_or_gt Q Rm with hQR | hQR
  · have := Lam_case1 (R := R) (B := c0 + hfun Qm + hfun Rm) hP hQ hQR
    linarith
  · -- find the first partition point `≥ Q`
    have hex : ∃ m, Q ≤ pt m := ⟨M, hptM ▸ hQQ⟩
    classical
    set m := Nat.find hex with hm
    have hmQ : Q ≤ pt m := Nat.find_spec hex
    have hm1 : 1 ≤ m := by
      rcases Nat.eq_zero_or_pos m with h0 | h0
      · rw [h0, hpt0] at hmQ
        linarith
      · exact h0
    have hmM : m ≤ M := Nat.find_min' hex (hptM ▸ hQQ)
    have hprev : pt (m - 1) < Q := by
      have := Nat.find_min hex (show m - 1 < m by omega)
      exact not_le.mp this
    have hRq : Rm ≤ pt (m - 1) := hpt0 ▸ hmono (Nat.zero_le _)
    have := Lam_case2 (B := c0 + hfun Qm + hfun Rm) hP hR hRR hRq hprev.le hmQ (hQQ.trans hQm)
    have := hpart m hm1 hmM
    linarith

end EP1038.Arc
