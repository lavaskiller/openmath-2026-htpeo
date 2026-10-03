import LeanProject.CellKernel
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Inverse
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.MeasureTheory.Covering.DensityTheorem
import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar

/-!
# EP-1038, Stage 12b §§2–3: the circle rearrangement inequality (Theorem 12.6R)

* `SymDecC.measurable`, `SymDecC.bdd`: a symmetric decreasing function on the circle is
  automatically measurable and bounded (it factors through `arccos ∘ cos`).
* `VK K Q R = ∫_{-R}^{R} ∫_{-Q}^{Q} K(φ - θ) dθ dφ`, and `bathtub_bound` (**Lemma 2.3**):
  if `q` is symmetric decreasing, `0 ≤ p, q ≤ 1`, `∫ p = 2Q`, `∫ q = 2R`, then
  `I_K(p, q) ≤ V_K(Q, R)` (only `q` needs to be symmetric decreasing).
* Sandwich replacing Lemma 2.2: `idx_close` (canonical position vs. half-cell index, distance
  `≤ 2`), `fstar` (symmetric decreasing comparison function) and `L1_st_fstar` (`L¹` error `≤ 4h`).
* Lemma 3.1 via Lebesgue differentiation: `ae_tendsto_st_avg`, `tendsto_L1_avg`.
* `circle_rearrangement` (**Theorem 12.6R**): for a symmetric decreasing kernel `K` and measurable
  `2π`-periodic `f, g` with values in `[0, 1]` and masses `2Q`, `2R`, `IK K f g ≤ VK K Q R`.
-/

open Real MeasureTheory Set Interval

namespace EP1038.Circ

variable {F K : ℝ → ℝ}

/-- A symmetric decreasing function only depends on `arccos (cos x) ∈ [0, π]`. -/
theorem SymDecC.eq_arccos (hF : SymDecC F) (x : ℝ) : F x = F (arccos (cos x)) := by
  have h2π : (0 : ℝ) < 2 * π := by positivity
  set y := toIocMod h2π (-π) x with hy
  have hmem := toIocMod_mem_Ioc h2π (-π) x
  rw [← hy, show -π + 2 * π = π by ring] at hmem
  have hxy : x - toIocDiv h2π (-π) x • (2 * π) = y := self_sub_toIocDiv_zsmul h2π (-π) x
  have hFy : F x = F y := by rw [← hxy, hF.per.sub_zsmul_eq]
  have hcos : cos x = cos y := by rw [← hxy, Real.cos_periodic.sub_zsmul_eq]
  rw [hFy, hcos, ← Real.cos_abs y, Real.arccos_cos (abs_nonneg y)
    (abs_le.mpr ⟨hmem.1.le, hmem.2⟩), ← hF.eq_abs]

theorem SymDecC.measurable (hF : SymDecC F) : Measurable F := by
  set G : ℝ → ℝ := fun t => F (max 0 (min t π)) with hG
  have hGa : Antitone G := by
    intro s t hst
    have hπ := Real.pi_pos
    exact hF.anti ⟨le_max_left _ _, max_le hπ.le (min_le_right _ _)⟩
      ⟨le_max_left _ _, max_le hπ.le (min_le_right _ _)⟩
      (max_le_max le_rfl (min_le_min_right _ hst))
  have e : F = fun x => G (arccos (cos x)) := by
    funext x
    rw [hF.eq_arccos x]
    simp only [hG]
    rw [min_eq_left (Real.arccos_le_pi _), max_eq_right (Real.arccos_nonneg _)]
  rw [e]
  exact hGa.measurable.comp (Real.continuous_arccos.comp Real.continuous_cos).measurable

theorem SymDecC.bdd (hF : SymDecC F) : Bdd F := by
  refine ⟨hF.measurable, max |F 0| |F π|, fun x => ?_⟩
  have hπ := Real.pi_pos
  rw [hF.eq_arccos x]
  have h0 := Real.arccos_nonneg (cos x)
  have h1 := Real.arccos_le_pi (cos x)
  rw [max_comm]
  exact abs_le_max_abs_abs (hF.anti ⟨h0, h1⟩ ⟨hπ.le, le_rfl⟩ h1)
    (hF.anti ⟨le_rfl, hπ.le⟩ ⟨h0, h1⟩ h0)

/-- `V_K(Q, R) = ∫_{-R}^{R} (K * 1_{[-Q,Q]})`. -/
noncomputable def VK (K : ℝ → ℝ) (Q R : ℝ) : ℝ := ∫ φ in (-R)..R, win K Q φ

theorem integrableOn_rect {f : ℝ × ℝ → ℝ} (hf : Measurable f) {M : ℝ} (hM : ∀ z, |f z| ≤ M)
    (a b c d : ℝ) : IntegrableOn f (Set.uIoc a b ×ˢ Set.uIoc c d) := by
  refine Measure.integrableOn_of_bounded ?_ hf.aestronglyMeasurable (M := M)
    (Filter.Eventually.of_forall fun z => by rw [Real.norm_eq_abs]; exact hM z)
  rw [Measure.volume_eq_prod, Measure.prod_prod]
  exact ENNReal.mul_ne_top (by simp [Set.uIoc]) (by simp [Set.uIoc])

/-- **Lemma 2.3 (bathtub bound)**. -/
theorem bathtub_bound (hK : SymDecC K) {p q : ℝ → ℝ} (hpm : Measurable p) (hp0 : ∀ x, 0 ≤ p x)
    (hp1 : ∀ x, p x ≤ 1) (hq : SymDecC q) (hq0 : ∀ x, 0 ≤ q x) (hq1 : ∀ x, q x ≤ 1)
    {Q R : ℝ} (hQ0 : 0 ≤ Q) (hQ : Q ≤ π) (hR0 : 0 ≤ R) (hR : R ≤ π)
    (hpmass : ∫ θ in (-π)..π, p θ = 2 * Q) (hqmass : ∫ θ in (-π)..π, q θ = 2 * R) :
    IK K p q ≤ VK K Q R := by
  have hKb := hK.bdd
  have hqb := hq.bdd
  have hΨ := conv_symDec hK hq hKb hqb
  have h1 : IK K p q ≤ ∫ θ in (-Q)..Q, conv K q θ :=
    bathtub hΨ hΨ.bdd hpm hp0 hp1 hQ0 hQ hpmass
  have h2 : ∫ θ in (-Q)..Q, conv K q θ = ∫ u in (-π)..π, q u * win K Q u := by
    unfold conv
    obtain ⟨M, hM⟩ := hKb.bdd
    obtain ⟨N, hN⟩ := hqb.bdd
    have hint : IntegrableOn (Function.uncurry fun θ u => K (θ - u) * q u)
        (Set.uIoc (-Q) Q ×ˢ Set.uIoc (-π) π) := by
      refine integrableOn_rect (M := M * N) ?_ (fun z => ?_) _ _ _ _
      · show Measurable (fun z : ℝ × ℝ => K (z.1 - z.2) * q z.2)
        exact (hKb.meas.comp (measurable_fst.sub measurable_snd)).mul (hqb.meas.comp measurable_snd)
      · show |K (z.1 - z.2) * q z.2| ≤ M * N
        rw [abs_mul]
        exact mul_le_mul (hM _) (hN _) (abs_nonneg _) ((abs_nonneg _).trans (hM 0))
    rw [intervalIntegral_intervalIntegral_swap hint]
    refine intervalIntegral.integral_congr (fun u _ => ?_)
    show (∫ θ in (-Q)..Q, K (θ - u) * q u) = q u * win K Q u
    rw [intervalIntegral.integral_mul_const, win_def, mul_comm]
    congr 1
    refine intervalIntegral.integral_congr (fun θ _ => ?_)
    show K (θ - u) = K (u - θ)
    rw [← neg_sub, hK.even]
  have h3 : ∫ u in (-π)..π, q u * win K Q u ≤ VK K Q R :=
    bathtub (win_symDec hK hKb hQ0 hQ) (win_bdd hKb Q) hqb.meas hq0 hq1 hR0 hR hqmass
  linarith

/-! ### Bilinear bounds for `I_K` -/

/-- `‖u‖₁ = ∫_𝕋 |u|`. -/
noncomputable def L1 (u : ℝ → ℝ) : ℝ := ∫ θ in (-π)..π, |u θ|

theorem L1_nonneg (u : ℝ → ℝ) : 0 ≤ L1 u :=
  intervalIntegral.integral_nonneg (by linarith [Real.pi_pos]) (fun _ _ => abs_nonneg _)

theorem conv_abs_le {M : ℝ} (hM : ∀ x, |K x| ≤ M) (hKm : Measurable K) {v : ℝ → ℝ} (hv : Bdd v)
    (θ : ℝ) : |conv K v θ| ≤ M * L1 v := by
  have hπ := Real.pi_pos
  have hKb : Bdd K := ⟨hKm, M, hM⟩
  unfold conv L1
  calc |∫ u in (-π)..π, K (θ - u) * v u| ≤ ∫ u in (-π)..π, |K (θ - u) * v u| :=
        intervalIntegral.abs_integral_le_integral_abs (by linarith)
    _ ≤ ∫ u in (-π)..π, M * |v u| := by
        refine intervalIntegral.integral_mono_on (by linarith)
          (((hKb.comp_sub θ).mul hv).ii _ _).abs ((hv.ii _ _).abs.const_mul M) (fun u _ => ?_)
        rw [abs_mul]
        exact mul_le_mul_of_nonneg_right (hM _) (abs_nonneg _)
    _ = M * ∫ u in (-π)..π, |v u| := intervalIntegral.integral_const_mul _ _

/-- The convolution of measurable functions is measurable (Fubini–Tonelli measurability). -/
theorem conv_measurable (hKm : Measurable K) {v : ℝ → ℝ} (hvm : Measurable v) :
    Measurable (conv K v) := by
  have e : conv K v = fun x => ∫ y in Ioc (-π) π, K (x - y) * v y := by
    funext x
    unfold conv
    rw [intervalIntegral.integral_of_le (by linarith [Real.pi_pos])]
  rw [e]
  refine (StronglyMeasurable.integral_prod_right (f := fun x y => K (x - y) * v y) ?_).measurable
  exact ((hKm.comp (measurable_fst.sub measurable_snd)).mul
    (hvm.comp measurable_snd)).stronglyMeasurable

theorem conv_bdd {M : ℝ} (hM : ∀ x, |K x| ≤ M) (hKm : Measurable K) {v : ℝ → ℝ} (hv : Bdd v)
    (hcm : Measurable (conv K v)) : Bdd (conv K v) :=
  ⟨hcm, M * L1 v, conv_abs_le hM hKm hv⟩

/-- `|I_K(u, v)| ≤ M ‖u‖₁ ‖v‖₁`. -/
theorem IK_abs_le {M : ℝ} (hM : ∀ x, |K x| ≤ M) (hKm : Measurable K) {u v : ℝ → ℝ} (hu : Bdd u)
    (hv : Bdd v) (hcm : Measurable (conv K v)) : |IK K u v| ≤ M * L1 u * L1 v := by
  have hπ := Real.pi_pos
  have hM0 : 0 ≤ M := (abs_nonneg _).trans (hM 0)
  have hc := conv_bdd hM hKm hv hcm
  unfold IK
  calc |∫ θ in (-π)..π, u θ * conv K v θ| ≤ ∫ θ in (-π)..π, |u θ * conv K v θ| :=
        intervalIntegral.abs_integral_le_integral_abs (by linarith)
    _ ≤ ∫ θ in (-π)..π, |u θ| * (M * L1 v) := by
        refine intervalIntegral.integral_mono_on (by linarith) ((hu.mul hc).ii _ _).abs
          ((hu.ii _ _).abs.mul_const _) (fun θ _ => ?_)
        rw [abs_mul]
        exact mul_le_mul_of_nonneg_left (conv_abs_le hM hKm hv θ) (abs_nonneg _)
    _ = M * L1 u * L1 v := by
        rw [intervalIntegral.integral_mul_const]; unfold L1; ring

/-- Linearity of `I_K` in the second argument. -/
theorem IK_sub_right {u v v' : ℝ → ℝ} (hK : Bdd K) (hu : Bdd u) (hv : Bdd v) (hv' : Bdd v')
    (hcm : Measurable (conv K v)) (hcm' : Measurable (conv K v')) :
    IK K u v - IK K u v' = IK K u (fun x => v x - v' x) := by
  obtain ⟨M, hM⟩ := hK.bdd
  have hc := conv_bdd hM hK.meas hv hcm
  have hc' := conv_bdd hM hK.meas hv' hcm'
  unfold IK
  rw [← intervalIntegral.integral_sub ((hu.mul hc).ii _ _) ((hu.mul hc').ii _ _)]
  refine intervalIntegral.integral_congr (fun θ _ => ?_)
  show u θ * conv K v θ - u θ * conv K v' θ = u θ * conv K (fun x => v x - v' x) θ
  rw [← mul_sub]
  congr 1
  unfold conv
  rw [← intervalIntegral.integral_sub (((hK.comp_sub θ).mul hv).ii _ _)
    (((hK.comp_sub θ).mul hv').ii _ _)]
  refine intervalIntegral.integral_congr (fun x _ => ?_)
  show K (θ - x) * v x - K (θ - x) * v' x = K (θ - x) * (v x - v' x)
  ring

/-- Linearity of `I_K` in the first argument. -/
theorem IK_sub_left {u u' v : ℝ → ℝ} (hK : Bdd K) (hu : Bdd u) (hu' : Bdd u') (hv : Bdd v)
    (hcm : Measurable (conv K v)) :
    IK K u v - IK K u' v = IK K (fun x => u x - u' x) v := by
  obtain ⟨M, hM⟩ := hK.bdd
  have hc := conv_bdd hM hK.meas hv hcm
  unfold IK
  rw [← intervalIntegral.integral_sub ((hu.mul hc).ii _ _) ((hu'.mul hc).ii _ _)]
  refine intervalIntegral.integral_congr (fun θ _ => ?_)
  show u θ * conv K v θ - u' θ * conv K v θ = (u θ - u' θ) * conv K v θ
  ring

/-! ### Canonical vectors and the symmetric step function (replacing Lemma 2.2) -/

section canon

variable {n : ℕ} [NeZero n]

theorem key_lt (z : ZMod n) : Riesz.key z < n := by
  unfold Riesz.key
  have := ZMod.val_lt z
  split_ifs <;> omega

theorem key_surj {j : ℕ} (hj : j < n) : ∃ z : ZMod n, Riesz.key z = j := by
  classical
  have himg : Finset.image Riesz.key (Finset.univ : Finset (ZMod n)) = Finset.range n := by
    apply Finset.eq_of_subset_of_card_le
    · intro i hi
      obtain ⟨z, -, rfl⟩ := Finset.mem_image.mp hi
      exact Finset.mem_range.mpr (key_lt z)
    · rw [Finset.card_range, Finset.card_image_of_injective _ (fun x y h => Riesz.key_inj h),
        Finset.card_univ, ZMod.card]
  have : j ∈ Finset.image Riesz.key (Finset.univ : Finset (ZMod n)) := by
    rw [himg]; exact Finset.mem_range.mpr hj
  obtain ⟨z, -, hz⟩ := Finset.mem_image.mp this
  exact ⟨z, hz⟩

/-- The value of `v` at canonical position `j` (`0, 1, -1, 2, -2, …`). -/
noncomputable def kval (v : ZMod n → ℝ) (j : ℕ) : ℝ :=
  ∑ z, if Riesz.key z = j then v z else 0

theorem kval_key (v : ZMod n → ℝ) (z : ZMod n) : kval v (Riesz.key z) = v z := by
  classical
  unfold kval
  rw [Finset.sum_eq_single z]
  · simp
  · intro b _ hb
    rw [ite_eq_right]
    intro h
    exact hb (Riesz.key_inj h)
  · intro h
    exact absurd (Finset.mem_univ z) h

theorem kval_anti {v : ZMod n → ℝ} (hv : Riesz.Canon v) {i j : ℕ} (hij : i ≤ j) (hj : j < n) :
    kval v j ≤ kval v i := by
  obtain ⟨z, hz⟩ := key_surj (n := n) (lt_of_le_of_lt hij hj)
  obtain ⟨w, hw⟩ := key_surj (n := n) hj
  rw [← hz, ← hw, kval_key, kval_key]
  rcases lt_or_eq_of_le hij with h | h
  · exact Riesz.canon_key hv (by rw [hz, hw]; exact h)
  · exact le_of_eq (congrArg v (Riesz.key_inj (hz.trans (h.trans hw.symm))).symm)

theorem kval_mem {v : ZMod n → ℝ} (h0 : ∀ z, 0 ≤ v z) (h1 : ∀ z, v z ≤ 1) {j : ℕ} (hj : j < n) :
    0 ≤ kval v j ∧ kval v j ≤ 1 := by
  obtain ⟨z, hz⟩ := key_surj (n := n) hj
  rw [← hz, kval_key]
  exact ⟨h0 z, h1 z⟩

/-- The half-cell index of `t ∈ [0, π]`: `(j h/2, (j+1) h/2] ↦ j`, clamped to `[0, n - 1]`. -/
noncomputable def hidx (n : ℕ) (t : ℝ) : ℕ := min (⌈2 * t / hs n⌉ - 1).toNat (n - 1)

theorem hidx_lt (t : ℝ) : hidx n t < n := by
  unfold hidx
  have := Nat.one_le_iff_ne_zero.mpr (NeZero.ne n)
  omega

theorem hidx_mono : Monotone (hidx n) := by
  intro s t hst
  unfold hidx
  have hp := hs_pos (n := n)
  have : ⌈2 * s / hs n⌉ ≤ ⌈2 * t / hs n⌉ :=
    Int.ceil_mono (div_le_div_of_nonneg_right (by linarith) hp.le)
  omega

/-- The symmetric decreasing step function `f⋆` of a canonical vector: the value at canonical
position `j` on the two half-cells `j h/2 < |θ| ≤ (j+1) h/2`. -/
noncomputable def fstar (v : ZMod n → ℝ) (θ : ℝ) : ℝ := kval v (hidx n (arccos (cos θ)))

theorem fstar_symDec {v : ZMod n → ℝ} (hv : Riesz.Canon v) : SymDecC (fstar v) := by
  refine ⟨fun θ => ?_, fun θ => ?_, ?_⟩
  · unfold fstar; rw [Real.cos_add_two_pi]
  · unfold fstar; rw [Real.cos_neg]
  · intro s hs t ht hst
    unfold fstar
    rw [Real.arccos_cos hs.1 hs.2, Real.arccos_cos ht.1 ht.2]
    exact kval_anti hv (hidx_mono hst) (hidx_lt t)

theorem val_intCast_of (k : ℤ) (h1 : -(n : ℤ) ≤ k) (h2 : k < n) :
    (((k : ZMod n).val : ℕ) : ℤ) = if 0 ≤ k then k else k + n := by
  rw [ZMod.val_intCast]
  split_ifs with h
  · exact Int.emod_eq_of_lt h h2
  · rw [← Int.add_emod_right]
    exact Int.emod_eq_of_lt (by omega) (by omega)

/-- **The index comparison**: on `[-π, π]`, the cell of `θ` and the half-cell of `|θ|` have
canonical positions differing by at most `2`. -/
theorem idx_close {θ : ℝ} (h1 : -π ≤ θ) (h2 : θ ≤ π) :
    Riesz.key (cidx n θ) ≤ hidx n |θ| + 2 ∧ hidx n |θ| ≤ Riesz.key (cidx n θ) + 2 := by
  have hp := hs_pos (n := n)
  have hnh := n_mul_hs (n := n)
  have hn1 : 1 ≤ n := Nat.one_le_iff_ne_zero.mpr (NeZero.ne n)
  unfold hidx cidx
  set x := θ / hs n with hx
  have hθ : θ = x * hs n := by rw [hx]; field_simp
  have hxl : -(n : ℝ) ≤ 2 * x := by
    have : -(n * hs n) ≤ 2 * (x * hs n) := by rw [hnh, ← hθ]; linarith
    nlinarith
  have hxu : 2 * x ≤ n := by
    have : 2 * (x * hs n) ≤ n * hs n := by rw [hnh, ← hθ]; linarith
    nlinarith
  have habs : 2 * |θ| / hs n = 2 * |x| := by
    rw [hx, abs_div, abs_of_pos hp]; ring
  rw [habs]
  set k := ⌈x - 1 / 2⌉ with hk
  set m := ⌈2 * |x|⌉ with hm
  have hk1 : (k : ℝ) < x - 1 / 2 + 1 := Int.ceil_lt_add_one _
  have hk2 : x - 1 / 2 ≤ k := Int.le_ceil _
  have hm1 : (m : ℝ) < 2 * |x| + 1 := Int.ceil_lt_add_one _
  have hm2 : 2 * |x| ≤ m := Int.le_ceil _
  have kb1 : 2 * k ≤ (n : ℤ) := by
    have : ((2 * k : ℤ) : ℝ) < ((n + 1 : ℤ) : ℝ) := by push_cast; linarith
    have := Int.cast_lt.mp this
    omega
  have kb2 : -(n : ℤ) - 1 ≤ 2 * k := by
    have : ((-(n : ℤ) - 1 : ℤ) : ℝ) ≤ ((2 * k : ℤ) : ℝ) := by push_cast; linarith
    exact_mod_cast this
  have hval := val_intCast_of (n := n) k (by omega) (by omega)
  unfold Riesz.key
  rcases le_or_gt 0 x with hx0 | hx0
  · rw [abs_of_nonneg hx0] at hm1 hm2
    have e1 : 2 * k ≤ m := by
      have : ((2 * k - 1 : ℤ) : ℝ) < ((m : ℤ) : ℝ) := by push_cast; linarith
      have := Int.cast_lt.mp this
      omega
    have e2 : m ≤ 2 * k + 1 := by
      have : ((m : ℤ) : ℝ) < ((2 * k + 2 : ℤ) : ℝ) := by push_cast; linarith
      have := Int.cast_lt.mp this
      omega
    have e3 : 0 ≤ k := by
      have : ((-1 : ℤ) : ℝ) ≤ ((2 * k : ℤ) : ℝ) := by push_cast; linarith
      have := Int.cast_le.mp this
      omega
    rw [ite_eq_left e3] at hval
    split_ifs <;> omega
  · rw [abs_of_neg hx0] at hm1 hm2
    have e1 : -2 * k - 1 ≤ m := by
      have : ((-2 * k - 1 : ℤ) : ℝ) ≤ ((m : ℤ) : ℝ) := by push_cast; linarith
      exact_mod_cast this
    have e2 : m ≤ -2 * k + 1 := by
      have : ((m : ℤ) : ℝ) < ((-2 * k + 2 : ℤ) : ℝ) := by push_cast; linarith
      have := Int.cast_lt.mp this
      omega
    have e3 : k ≤ 0 := by
      have : ((2 * k : ℤ) : ℝ) < ((1 : ℤ) : ℝ) := by push_cast; linarith
      have := Int.cast_lt.mp this
      omega
    have e4 : 1 ≤ m := by
      have : ((0 : ℤ) : ℝ) < ((m : ℤ) : ℝ) := by push_cast; linarith
      have := Int.cast_lt.mp this
      omega
    split_ifs at hval <;> split_ifs <;> omega

omit [NeZero n] in
theorem hidx_measurable : Measurable (hidx n) := by
  unfold hidx
  exact (measurable_of_countable (fun k : ℤ => min (k - 1).toNat (n - 1))).comp
    (Int.measurable_ceil.comp ((measurable_const.mul measurable_id).div_const _))

theorem hidx_of_mem (j : ℕ) (hj : j < n) {t : ℝ} (h1 : j * hs n / 2 < t)
    (h2 : t ≤ (j + 1) * hs n / 2) : hidx n t = j := by
  have hp := hs_pos (n := n)
  unfold hidx
  have hc : ⌈2 * t / hs n⌉ = (j : ℤ) + 1 := by
    rw [Int.ceil_eq_iff]
    push_cast
    constructor
    · rw [lt_div_iff₀ hp]; nlinarith
    · rw [div_le_iff₀ hp]; nlinarith
  rw [hc]
  omega

/-- Integration of a function of the half-cell index over `𝕋`. -/
theorem int_hidx (U : ℕ → ℝ) :
    ∫ θ in (-π)..π, U (hidx n (arccos (cos θ))) = hs n * ∑ j ∈ Finset.range n, U j := by
  have hp := hs_pos (n := n)
  have hnh := n_mul_hs (n := n)
  have hπ := Real.pi_pos
  set Φ : ℝ → ℝ := fun θ => U (hidx n (arccos (cos θ))) with hΦ
  have hΦb : Bdd Φ := by
    refine ⟨?_, ∑ j ∈ Finset.range n, |U j|, fun θ => ?_⟩
    · exact (measurable_of_countable U).comp
        (hidx_measurable.comp (Real.continuous_arccos.comp Real.continuous_cos).measurable)
    · exact Finset.single_le_sum (f := fun j => |U j|) (fun j _ => abs_nonneg _)
        (Finset.mem_range.mpr (hidx_lt _))
  have hneg : ∫ θ in (-π)..0, Φ θ = ∫ θ in (0 : ℝ)..π, Φ θ := by
    have h := intervalIntegral.integral_comp_neg (a := (0 : ℝ)) (b := π) Φ
    rw [neg_zero] at h
    rw [← h]
    refine intervalIntegral.integral_congr (fun θ _ => ?_)
    simp only [hΦ, Real.cos_neg]
  have hpos : ∫ θ in (0 : ℝ)..π, Φ θ = hs n / 2 * ∑ j ∈ Finset.range n, U j := by
    have e := intervalIntegral.sum_integral_adjacent_intervals
      (a := fun j : ℕ => (j : ℝ) * hs n / 2) (n := n) (f := Φ) (μ := volume)
      (fun k _ => hΦb.ii _ _)
    simp only [Nat.cast_zero, zero_mul, zero_div] at e
    rw [show (n : ℝ) * hs n / 2 = π by rw [hnh]; ring] at e
    rw [← e, Finset.mul_sum]
    refine Finset.sum_congr rfl (fun j hj => ?_)
    have hjn := Finset.mem_range.mp hj
    have hle : (j : ℝ) * hs n / 2 ≤ ((j + 1 : ℕ) : ℝ) * hs n / 2 := by push_cast; nlinarith
    have hcell : ∀ θ ∈ Ι ((j : ℝ) * hs n / 2) (((j + 1 : ℕ) : ℝ) * hs n / 2), Φ θ = U j := by
      intro θ hθ
      rw [uIoc_of_le hle] at hθ
      obtain ⟨h1, h2⟩ := hθ
      have h0 : 0 ≤ θ := by
        have : (0 : ℝ) ≤ (j : ℝ) * hs n / 2 := by positivity
        linarith
      have hθπ : θ ≤ π := by
        have : ((j + 1 : ℕ) : ℝ) ≤ n := by exact_mod_cast hjn
        have : ((j + 1 : ℕ) : ℝ) * hs n / 2 ≤ n * hs n / 2 := by
          apply div_le_div_of_nonneg_right _ (by norm_num); nlinarith
        linarith [show (n : ℝ) * hs n / 2 = π by rw [hnh]; ring]
      simp only [hΦ]
      rw [Real.arccos_cos h0 hθπ, hidx_of_mem j hjn h1 (by push_cast at h2; linarith)]
    rw [intervalIntegral.integral_congr_ae (Filter.Eventually.of_forall hcell),
      intervalIntegral.integral_const, smul_eq_mul]
    push_cast; ring
  rw [← intervalIntegral.integral_add_adjacent_intervals (hΦb.ii (-π) 0) (hΦb.ii 0 π), hneg, hpos]
  ring

theorem fstar_eq {v : ZMod n → ℝ} {θ : ℝ} (h1 : -π ≤ θ) (h2 : θ ≤ π) :
    fstar v θ = kval v (hidx n |θ|) := by
  unfold fstar
  rw [← Real.cos_abs θ, Real.arccos_cos (abs_nonneg θ) (abs_le.mpr ⟨h1, h2⟩)]

theorem sum_step4 (f : ℕ → ℝ) (N : ℕ) :
    ∑ j ∈ Finset.range N, (f j - f (j + 4)) = ∑ r ∈ Finset.range 4, (f r - f (N + r)) := by
  induction N with
  | zero => simp
  | succ N ih =>
    rw [Finset.sum_range_succ, ih]
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    ring_nf

/-- **The replacement for Lemma 2.2**: a canonical step function is `L¹`-close to the symmetric
decreasing step function `f⋆`: `‖st(v) - f⋆‖₁ ≤ 4h`. -/
theorem L1_st_fstar {v : ZMod n → ℝ} (hv : Riesz.Canon v) (h0 : ∀ z, 0 ≤ v z)
    (h1 : ∀ z, v z ≤ 1) : L1 (fun θ => st n v θ - fstar v θ) ≤ 4 * hs n := by
  have hp := hs_pos (n := n)
  have hπ := Real.pi_pos
  have hn1 : 1 ≤ n := Nat.one_le_iff_ne_zero.mpr (NeZero.ne n)
  set f : ℕ → ℝ := fun j => kval v (min (j - 2) (n - 1)) with hf
  have hD : ∀ θ ∈ Icc (-π) π, |st n v θ - fstar v θ| ≤
      (fun j => f j - f (j + 4)) (hidx n (arccos (cos θ))) := by
    intro θ hθ
    have hc := idx_close (n := n) hθ.1 hθ.2
    have hA : st n v θ = kval v (Riesz.key (cidx n θ)) := by unfold st; rw [kval_key]
    rw [hA, fstar_eq hθ.1 hθ.2]
    rw [← Real.cos_abs θ, Real.arccos_cos (abs_nonneg θ) (abs_le.mpr ⟨hθ.1, hθ.2⟩)]
    set i := Riesz.key (cidx n θ)
    set j := hidx n |θ|
    have hi : i < n := key_lt _
    have hj : j < n := hidx_lt _
    show |kval v i - kval v j| ≤ kval v (min (j - 2) (n - 1)) - kval v (min (j + 4 - 2) (n - 1))
    have u1 : kval v i ≤ kval v (min (j - 2) (n - 1)) := kval_anti hv (by omega) hi
    have u2 : kval v j ≤ kval v (min (j - 2) (n - 1)) := kval_anti hv (by omega) hj
    have l1 : kval v (min (j + 4 - 2) (n - 1)) ≤ kval v i := kval_anti hv (by omega) (by omega)
    have l2 : kval v (min (j + 4 - 2) (n - 1)) ≤ kval v j := kval_anti hv (by omega) (by omega)
    rw [abs_le]
    constructor <;> linarith
  have hsb : Bdd (fun θ => st n v θ - fstar v θ) := by
    obtain ⟨M, hM⟩ := (st_bdd (n := n) v).bdd
    obtain ⟨N, hN⟩ := (fstar_symDec hv).bdd.bdd
    refine ⟨(st_bdd v).meas.sub (fstar_symDec hv).bdd.meas, M + N, fun θ => ?_⟩
    exact (abs_sub _ _).trans (add_le_add (hM θ) (hN θ))
  have hDb : Bdd (fun θ => (fun j => f j - f (j + 4)) (hidx n (arccos (cos θ)))) := by
    refine ⟨(measurable_of_countable (fun j => f j - f (j + 4))).comp
      ((hidx_measurable (n := n)).comp (Real.continuous_arccos.comp Real.continuous_cos).measurable),
      ∑ j ∈ Finset.range n, |f j - f (j + 4)|, fun θ => ?_⟩
    exact Finset.single_le_sum (f := fun j => |f j - f (j + 4)|) (fun j _ => abs_nonneg _)
      (Finset.mem_range.mpr (hidx_lt _))
  unfold L1
  calc ∫ θ in (-π)..π, |st n v θ - fstar v θ|
      ≤ ∫ θ in (-π)..π, (fun j => f j - f (j + 4)) (hidx n (arccos (cos θ))) :=
        intervalIntegral.integral_mono_on (by linarith) (hsb.ii _ _).abs (hDb.ii _ _) hD
    _ = hs n * ∑ j ∈ Finset.range n, (f j - f (j + 4)) := int_hidx (n := n) (fun j => f j - f (j + 4))
    _ ≤ hs n * 4 := by
        apply mul_le_mul_of_nonneg_left _ hp.le
        rw [sum_step4]
        have hb : ∀ j, 0 ≤ f j ∧ f j ≤ 1 := fun j => kval_mem h0 h1 (by omega)
        simp only [Finset.sum_range_succ, Finset.sum_range_zero, add_zero, zero_add]
        linarith [(hb 0).2, (hb 1).2, (hb 2).2, (hb 3).2, (hb n).1, (hb (n + 1)).1,
          (hb (n + 2)).1, (hb (n + 3)).1]
    _ = 4 * hs n := by ring

/-- The mass of `f⋆` equals the mass of the step function. -/
theorem int_fstar (v : ZMod n → ℝ) :
    ∫ θ in (-π)..π, fstar v θ = hs n * ∑ z, v z := by
  classical
  unfold fstar
  rw [int_hidx (kval v)]
  congr 1
  unfold kval
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl (fun z _ => ?_)
  rw [Finset.sum_ite_eq (Finset.range n) (Riesz.key z) (fun _ => v z)]
  rw [ite_eq_left (Finset.mem_range.mpr (key_lt z))]

theorem int_st (v : ZMod n → ℝ) : ∫ θ in (-π)..π, st n v θ = hs n * ∑ z, v z := by
  have h1 : Function.Periodic (fun _ : ℝ => (1 : ℝ)) (2 * π) := fun _ => rfl
  have h1b : Bdd (fun _ : ℝ => (1 : ℝ)) := ⟨measurable_const, 1, fun _ => by norm_num⟩
  have e := int_st_mul v h1 h1b
  simp only [mul_one, intervalIntegral.integral_const, smul_eq_mul] at e
  rw [e, Finset.mul_sum]
  refine Finset.sum_congr rfl (fun z _ => ?_)
  ring

end canon

/-! ### Cell averages and their `L¹` convergence (Lemma 3.1) -/

section avg

theorem Bdd.comp_add_left {F : ℝ → ℝ} (hF : Bdd F) (c : ℝ) : Bdd (fun u => F (c + u)) := by
  obtain ⟨M, hM⟩ := hF.bdd
  exact ⟨hF.meas.comp (measurable_const.add measurable_id), M, fun u => hM _⟩

/-- The cell averages `aᵢ = (1/h) ∫_{Cᵢ} f`. -/
noncomputable def avg (n : ℕ) (f : ℝ → ℝ) (i : ZMod n) : ℝ :=
  (∫ t in (-(hs n / 2))..(hs n / 2), f (i.val * hs n + t)) / hs n

variable {n : ℕ} [NeZero n] {f : ℝ → ℝ}

theorem avg_mem (hfb : Bdd f) (h0 : ∀ x, 0 ≤ f x) (h1 : ∀ x, f x ≤ 1) (i : ZMod n) :
    0 ≤ avg n f i ∧ avg n f i ≤ 1 := by
  have hp := hs_pos (n := n)
  unfold avg
  have hint := (hfb.comp_add_left ((i.val : ℝ) * hs n)).ii (-(hs n / 2)) (hs n / 2)
  constructor
  · exact div_nonneg (intervalIntegral.integral_nonneg (by linarith) (fun t _ => h0 _)) hp.le
  · rw [div_le_one hp]
    have := intervalIntegral.integral_mono_on (by linarith) hint intervalIntegrable_const
      (fun t _ => h1 ((i.val : ℝ) * hs n + t))
    rw [intervalIntegral.integral_const, smul_eq_mul, mul_one] at this
    linarith

theorem avg_abs_le {M : ℝ} (hM : ∀ x, |f x| ≤ M) (i : ZMod n) : |avg n f i| ≤ M := by
  have hp := hs_pos (n := n)
  unfold avg
  rw [abs_div, abs_of_pos hp, div_le_iff₀ hp]
  have := intervalIntegral.norm_integral_le_of_norm_le_const (a := -(hs n / 2)) (b := hs n / 2)
    (C := M) (f := fun t => f ((i.val : ℝ) * hs n + t)) (fun t _ => by rw [Real.norm_eq_abs]; exact hM _)
  rw [Real.norm_eq_abs, show hs n / 2 - -(hs n / 2) = hs n by ring, abs_of_pos hp] at this
  exact this

/-- The step function of the cell averages has the same mass. -/
theorem int_st_avg (hfb : Bdd f) (hper : Function.Periodic f (2 * π)) :
    ∫ θ in (-π)..π, st n (avg n f) θ = ∫ θ in (-π)..π, f θ := by
  have hp := hs_pos (n := n)
  have e1 := int_st_mul (n := n) (fun _ => (1 : ℝ)) hper hfb
  have e2 : ∫ θ in (-π)..π, st n (fun _ => (1 : ℝ)) θ * f θ = ∫ θ in (-π)..π, f θ := by
    refine intervalIntegral.integral_congr (fun θ _ => ?_)
    show st n (fun _ => (1 : ℝ)) θ * f θ = f θ
    unfold st; ring
  rw [e2] at e1
  rw [int_st, e1, Finset.mul_sum]
  refine Finset.sum_congr rfl (fun i _ => ?_)
  unfold avg
  field_simp

/-- A cell average is the average over the closed ball (= cell) around the cell centre. -/
theorem st_avg_eq (hper : Function.Periodic f (2 * π)) (θ : ℝ) :
    st n (avg n f) θ =
      ⨍ y in Metric.closedBall ((⌈θ / hs n - 1 / 2⌉ : ℝ) * hs n) (hs n / 2), f y := by
  have hp := hs_pos (n := n)
  have hnh := n_mul_hs (n := n)
  unfold st avg cidx
  set k := ⌈θ / hs n - 1 / 2⌉ with hk
  have hval : (((k : ZMod n).val : ℕ) : ℝ) = (k : ℝ) - (n : ℝ) * ((k / n : ℤ) : ℝ) := by
    have h := ZMod.val_intCast (n := n) k
    rw [Int.emod_def] at h
    have h' : ((((k : ZMod n).val : ℕ) : ℤ) : ℝ) = ((k - n * (k / n) : ℤ) : ℝ) := by rw [h]
    push_cast at h'
    exact h'
  have hshift : ∀ t, f ((((k : ZMod n).val : ℕ) : ℝ) * hs n + t) = f ((k : ℝ) * hs n + t) := by
    intro t
    rw [hval, show ((k : ℝ) - n * ((k / n : ℤ) : ℝ)) * hs n + t =
      ((k : ℝ) * hs n + t) - ((k / n : ℤ) : ℝ) * (2 * π) by rw [← hnh]; ring]
    exact hper.sub_int_mul_eq (k / n)
  rw [intervalIntegral.integral_congr (fun t _ => hshift t),
    intervalIntegral.integral_comp_add_left f ((k : ℝ) * hs n),
    MeasureTheory.setAverage_eq, Real.closedBall_eq_Icc,
    integral_Icc_eq_integral_Ioc, ← intervalIntegral.integral_of_le (by linarith), smul_eq_mul]
  have hvol : volume.real (Icc ((k : ℝ) * hs n - hs n / 2) ((k : ℝ) * hs n + hs n / 2)) = hs n := by
    rw [measureReal_def, Real.volume_Icc, ENNReal.toReal_ofReal (by linarith)]; ring
  rw [hvol, show (k : ℝ) * hs n + -(hs n / 2) = (k : ℝ) * hs n - hs n / 2 by ring]
  field_simp

theorem locallyIntegrable_of_bdd (hfb : Bdd f) : LocallyIntegrable f volume := by
  rw [MeasureTheory.locallyIntegrable_iff]
  intro k hk
  obtain ⟨M, hM⟩ := hfb.bdd
  exact Measure.integrableOn_of_bounded hk.measure_lt_top.ne hfb.meas.aestronglyMeasurable
    (M := M) (Filter.Eventually.of_forall fun x => by rw [Real.norm_eq_abs]; exact hM x)

end avg

/-- **Lemma 3.1 (cell averages), a.e. form**: by the Lebesgue differentiation theorem. -/
theorem ae_tendsto_st_avg {f : ℝ → ℝ} (hfb : Bdd f) (hper : Function.Periodic f (2 * π)) :
    ∀ᵐ θ, Filter.Tendsto (fun N : ℕ => st (N + 1) (avg (N + 1) f) θ) Filter.atTop
      (nhds (f θ)) := by
  filter_upwards [IsUnifLocDoublingMeasure.ae_tendsto_average volume
    (locallyIntegrable_of_bdd hfb) 1] with θ hθ
  have hδ : Filter.Tendsto (fun N : ℕ => hs (N + 1) / 2) Filter.atTop (nhdsWithin 0 (Ioi 0)) := by
    refine tendsto_nhdsWithin_iff.mpr ⟨?_, Filter.Eventually.of_forall fun N => ?_⟩
    · have h := (tendsto_one_div_add_atTop_nhds_zero_nat).const_mul π
      rw [mul_zero] at h
      refine h.congr (fun N => ?_)
      unfold hs; push_cast; field_simp
    · exact div_pos (hs_pos (n := N + 1)) (by norm_num)
  have hmem : ∀ᶠ N : ℕ in Filter.atTop, θ ∈ Metric.closedBall
      ((⌈θ / hs (N + 1) - 1 / 2⌉ : ℝ) * hs (N + 1)) (1 * (hs (N + 1) / 2)) := by
    refine Filter.Eventually.of_forall fun N => ?_
    have hp := hs_pos (n := N + 1)
    have c1 : ((⌈θ / hs (N + 1) - 1 / 2⌉ : ℤ) : ℝ) < θ / hs (N + 1) - 1 / 2 + 1 :=
      Int.ceil_lt_add_one _
    have c2 : θ / hs (N + 1) - 1 / 2 ≤ ((⌈θ / hs (N + 1) - 1 / 2⌉ : ℤ) : ℝ) := Int.le_ceil _
    have e : θ = θ / hs (N + 1) * hs (N + 1) := by field_simp
    rw [Metric.mem_closedBall, Real.dist_eq, one_mul, abs_le]
    constructor <;> nlinarith
  exact (hθ _ _ hδ hmem).congr (fun N => (st_avg_eq hper θ).symm)

/-- **Lemma 3.1 (cell averages)**: `‖f - E_n f‖₁ → 0`. -/
theorem tendsto_L1_avg {f : ℝ → ℝ} (hfb : Bdd f) (hper : Function.Periodic f (2 * π)) :
    Filter.Tendsto (fun N : ℕ => L1 (fun θ => f θ - st (N + 1) (avg (N + 1) f) θ))
      Filter.atTop (nhds 0) := by
  obtain ⟨M, hM⟩ := hfb.bdd
  have hlim := ae_tendsto_st_avg hfb hper
  unfold L1
  have h0 : (∫ θ in (-π)..π, (0 : ℝ)) = 0 := by simp
  rw [← h0]
  refine intervalIntegral.tendsto_integral_filter_of_dominated_convergence (fun _ => 2 * M)
    (Filter.Eventually.of_forall fun N =>
      (hfb.meas.sub (st_bdd (n := N + 1) (avg (N + 1) f)).meas).norm.aestronglyMeasurable)
    (Filter.Eventually.of_forall fun N => Filter.Eventually.of_forall fun θ _ => ?_)
    intervalIntegrable_const ?_
  · rw [Real.norm_eq_abs, abs_abs]
    have h1 := hM θ
    have h2 : |st (N + 1) (avg (N + 1) f) θ| ≤ M := by unfold st; exact avg_abs_le hM _
    exact (abs_sub _ _).trans (by linarith)
  · filter_upwards [hlim] with θ hθ _
    have := ((tendsto_const_nhds (x := f θ)).sub hθ).abs
    rw [sub_self, abs_zero] at this
    exact this

/-! ### Theorem 12.6R -/

theorem Bdd.sub {F G : ℝ → ℝ} (hF : Bdd F) (hG : Bdd G) : Bdd (fun x => F x - G x) := by
  obtain ⟨M, hM⟩ := hF.bdd
  obtain ⟨N, hN⟩ := hG.bdd
  exact ⟨hF.meas.sub hG.meas, M + N, fun x => (abs_sub _ _).trans (add_le_add (hM x) (hN x))⟩

theorem L1_of_nonneg {u : ℝ → ℝ} (hu : ∀ x, 0 ≤ u x) : L1 u = ∫ θ in (-π)..π, u θ := by
  unfold L1
  exact intervalIntegral.integral_congr (fun θ _ => abs_of_nonneg (hu θ))

/-- **Theorem 12.6R (circle rearrangement inequality with centred-arc extremals).** Let `K` be
symmetric decreasing on the circle, and let `f, g` be measurable, `2π`-periodic, with values in
`[0, 1]`, `∫_𝕋 f = 2Q` and `∫_𝕋 g = 2R`. Then
`∫∫ f(θ) K(θ - φ) g(φ) dφ dθ ≤ ∫_{-R}^{R} ∫_{-Q}^{Q} K(φ - θ) dθ dφ`. -/
theorem circle_rearrangement (hK : SymDecC K) {f g : ℝ → ℝ} (hfm : Measurable f)
    (hgm : Measurable g) (hfp : Function.Periodic f (2 * π)) (hgp : Function.Periodic g (2 * π))
    (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∀ x, f x ≤ 1) (hg0 : ∀ x, 0 ≤ g x) (hg1 : ∀ x, g x ≤ 1)
    {Q R : ℝ} (hfmass : ∫ θ in (-π)..π, f θ = 2 * Q) (hgmass : ∫ θ in (-π)..π, g θ = 2 * R) :
    IK K f g ≤ VK K Q R := by
  have hπ := Real.pi_pos
  have hKb := hK.bdd
  obtain ⟨M, hM⟩ := hKb.bdd
  have hM0 : 0 ≤ M := (abs_nonneg _).trans (hM 0)
  have hfb : Bdd f := ⟨hfm, 1, fun x => abs_le.mpr ⟨by linarith [hf0 x], hf1 x⟩⟩
  have hgb : Bdd g := ⟨hgm, 1, fun x => abs_le.mpr ⟨by linarith [hg0 x], hg1 x⟩⟩
  have mass_bounds : ∀ {u : ℝ → ℝ} {P : ℝ}, Bdd u → (∀ x, 0 ≤ u x) → (∀ x, u x ≤ 1) →
      ∫ θ in (-π)..π, u θ = 2 * P → 0 ≤ P ∧ P ≤ π := by
    intro u P hu h0 h1 hm
    have a1 : 0 ≤ ∫ θ in (-π)..π, u θ :=
      intervalIntegral.integral_nonneg (by linarith : -π ≤ π) (fun x _ => h0 x)
    have a2 := intervalIntegral.integral_mono_on (by linarith : -π ≤ π) (hu.ii _ _)
      intervalIntegrable_const (fun x _ => h1 x)
    rw [intervalIntegral.integral_const, smul_eq_mul, mul_one] at a2
    constructor <;> linarith
  obtain ⟨hQ0, hQ⟩ := mass_bounds hfb hf0 hf1 hfmass
  obtain ⟨hR0, hR⟩ := mass_bounds hgb hg0 hg1 hgmass
  have hL1g : 0 ≤ L1 g := L1_nonneg g
  have hbound : ∀ N : ℕ, IK K f g ≤ VK K Q R +
      (M * L1 (fun θ => f θ - st (N + 1) (avg (N + 1) f) θ) * L1 g +
        M * (2 * π) * L1 (fun θ => g θ - st (N + 1) (avg (N + 1) g) θ) +
        M * (2 * π) * (4 * hs (N + 1))) := by
    intro N
    set a := avg (N + 1) f with ha_def
    set b := avg (N + 1) g with hb_def
    have ha := fun i => avg_mem (n := N + 1) hfb hf0 hf1 i
    have hb := fun i => avg_mem (n := N + 1) hgb hg0 hg1 i
    have hma : ∫ θ in (-π)..π, st (N + 1) a θ = 2 * Q := by rw [int_st_avg hfb hfp, hfmass]
    have hmb : ∫ θ in (-π)..π, st (N + 1) b θ = 2 * R := by rw [int_st_avg hgb hgp, hgmass]
    have hL1a : L1 (st (N + 1) a) = 2 * Q := by
      rw [L1_of_nonneg (u := st (N + 1) a) (fun x => (ha _).1), hma]
    -- the discrete step (Theorem D) on the cells
    obtain ⟨σ, τ, hσ, hτ, hS⟩ := Riesz.discrete_riesz (ckern_symDec (n := N + 1) hK hKb) a b
    set a' := a ∘ σ with ha'_def
    set b' := b ∘ τ with hb'_def
    have ha' : ∀ i, 0 ≤ a' i ∧ a' i ≤ 1 := fun i => ha (σ i)
    have hb' : ∀ i, 0 ≤ b' i ∧ b' i ≤ 1 := fun i => hb (τ i)
    have hma' : ∫ θ in (-π)..π, st (N + 1) a' θ = 2 * Q := by
      rw [int_st, ← hma, int_st]
      congr 1
      exact Equiv.sum_comp σ a
    have hmb' : ∫ θ in (-π)..π, fstar b' θ = 2 * R := by
      rw [int_fstar, ← hmb, int_st]
      congr 1
      exact Equiv.sum_comp τ b
    have hL1a' : L1 (st (N + 1) a') = 2 * Q := by
      rw [L1_of_nonneg (u := st (N + 1) a') (fun x => (ha' _).1), hma']
    have h3 : IK K (st (N + 1) a) (st (N + 1) b) ≤ IK K (st (N + 1) a') (st (N + 1) b') := by
      rw [IK_st hK hKb, IK_st hK hKb]
      exact hS
    -- the symmetric decreasing replacement of `st(b')` and the bathtub bound
    have hfs := fstar_symDec hτ
    have hfs01 : ∀ x, 0 ≤ fstar b' x ∧ fstar b' x ≤ 1 := fun x =>
      kval_mem (fun z => (hb' z).1) (fun z => (hb' z).2) (hidx_lt _)
    have h4a : IK K (st (N + 1) a') (fstar b') ≤ VK K Q R :=
      bathtub_bound hK (st_bdd a').meas (fun x => (ha' _).1) (fun x => (ha' _).2) hfs
        (fun x => (hfs01 x).1) (fun x => (hfs01 x).2) hQ0 hQ hR0 hR hma' hmb'
    have hdb : Bdd (fun x => st (N + 1) b' x - fstar b' x) := (st_bdd b').sub hfs.bdd
    have h4b : IK K (st (N + 1) a') (st (N + 1) b') - IK K (st (N + 1) a') (fstar b') ≤
        M * (2 * π) * (4 * hs (N + 1)) := by
      rw [IK_sub_right hKb (st_bdd a') (st_bdd b') hfs.bdd
        (conv_measurable hKb.meas (st_bdd b').meas) (conv_measurable hKb.meas hfs.bdd.meas)]
      have e := IK_abs_le hM hKb.meas (st_bdd a') hdb (conv_measurable hKb.meas hdb.meas)
      have hd := L1_st_fstar hτ (fun z => (hb' z).1) (fun z => (hb' z).2)
      have hd0 := L1_nonneg (fun x => st (N + 1) b' x - fstar b' x)
      rw [hL1a'] at e
      have : M * (2 * Q) * L1 (fun x => st (N + 1) b' x - fstar b' x) ≤
          M * (2 * π) * (4 * hs (N + 1)) := by
        apply mul_le_mul (mul_le_mul_of_nonneg_left (by linarith) hM0) hd hd0
        positivity
      exact (le_abs_self _).trans (e.trans this)
    -- the approximation step
    have hsa := st_bdd (n := N + 1) a
    have hsb := st_bdd (n := N + 1) b
    have h12 : IK K f g - IK K (st (N + 1) a) (st (N + 1) b) ≤
        M * L1 (fun θ => f θ - st (N + 1) a θ) * L1 g +
          M * (2 * π) * L1 (fun θ => g θ - st (N + 1) b θ) := by
      have e1 := IK_sub_left hKb hfb hsa hgb (conv_measurable hKb.meas hgm)
      have e2 := IK_sub_right hKb hsa hgb hsb (conv_measurable hKb.meas hgm)
        (conv_measurable hKb.meas hsb.meas)
      have b1 := IK_abs_le hM hKb.meas (hfb.sub hsa) hgb (conv_measurable hKb.meas hgm)
      have b2 := IK_abs_le hM hKb.meas hsa (hgb.sub hsb)
        (conv_measurable hKb.meas (hgb.sub hsb).meas)
      rw [hL1a] at b2
      have hd0 := L1_nonneg (fun θ => g θ - st (N + 1) b θ)
      have b3 : M * (2 * Q) * L1 (fun θ => g θ - st (N + 1) b θ) ≤
          M * (2 * π) * L1 (fun θ => g θ - st (N + 1) b θ) :=
        mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left (by linarith) hM0) hd0
      have s1 := le_abs_self (IK K (fun x => f x - st (N + 1) a x) g)
      have s2 := le_abs_self (IK K (st (N + 1) a) (fun x => g x - st (N + 1) b x))
      linarith
    linarith
  -- the error tends to zero
  have t1 := tendsto_L1_avg hfb hfp
  have t2 := tendsto_L1_avg hgb hgp
  have t3 : Filter.Tendsto (fun N : ℕ => hs (N + 1)) Filter.atTop (nhds 0) := by
    have h := (tendsto_const_div_atTop_nhds_zero_nat (2 * π)).comp (Filter.tendsto_add_atTop_nat 1)
    refine h.congr (fun N => ?_)
    simp only [Function.comp_apply]
    unfold hs
    push_cast
    ring
  have ta := (t1.const_mul M).mul_const (L1 g)
  have tb := t2.const_mul (M * (2 * π))
  have tc := (t3.const_mul 4).const_mul (M * (2 * π))
  have tsum := tendsto_const_nhds (x := VK K Q R) |>.add ((ta.add tb).add tc)
  rw [show VK K Q R + (M * 0 * L1 g + M * (2 * π) * 0 + M * (2 * π) * (4 * 0)) = VK K Q R by ring]
    at tsum
  exact ge_of_tendsto tsum (Filter.Eventually.of_forall hbound)

end EP1038.Circ
