import LeanProject.AtomicAdjoint
import Mathlib.Analysis.SpecialFunctions.Integrability.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds

/-!
# Exact adjoint identities at interior jumps

The one-sided ramps have an integrable joint majorant. Dominated convergence,
rather than Fatou alone, preserves the exact adjoint identity and endpoint term.
-/

open Real Set Filter Topology MeasureTheory intervalIntegral Finset
open scoped ENNReal

namespace EP1038.Stage11
open EP1038.Arc

set_option maxHeartbeats 2000000

noncomputable def clipRamp (K z x : ℝ) : ℝ := min 1 (max 0 (K * (z - x)))

theorem clipRamp_bounds (K z x : ℝ) : clipRamp K z x ∈ Icc (0 : ℝ) 1 :=
  ⟨le_min zero_le_one (le_max_left _ _), min_le_left _ _⟩

theorem clipRamp_dq_max_bound_of_le {K z x y : ℝ} (hK : 0 ≤ K) (hxy : x ≤ y) :
    |clipRamp K z x - clipRamp K z y| * max |x - z| |y - z| ≤ |x - y| := by
  have hmono : clipRamp K z y ≤ clipRamp K z x := by
    exact min_le_min le_rfl (max_le_max le_rfl
      (mul_le_mul_of_nonneg_left (by linarith : z - y ≤ z - x) hK))
  rw [abs_of_nonneg (sub_nonneg.mpr hmono), abs_of_nonpos (sub_nonpos.mpr hxy)]
  have hx0 := (clipRamp_bounds K z x).1
  have hx1 := (clipRamp_bounds K z x).2
  by_cases hzx : z ≤ x
  · have hz0x : K * (z - x) ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hK (by linarith)
    have hz0y : K * (z - y) ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hK (by linarith)
    simp only [clipRamp, max_eq_left hz0x, max_eq_left hz0y,
      min_eq_right zero_le_one, sub_self, zero_mul]
    linarith
  have hxz : x < z := lt_of_not_ge hzx
  by_cases hzy : z ≤ y
  · have hy0 : clipRamp K z y = 0 := by
      simp only [clipRamp, max_eq_left
        (mul_nonpos_of_nonneg_of_nonpos hK (by linarith : z - y ≤ 0)),
        min_eq_right zero_le_one]
    rw [hy0, sub_zero]
    have hb : max |x - z| |y - z| ≤ y - x := by
      rw [abs_of_neg (by linarith : x - z < 0), abs_of_nonneg (by linarith : 0 ≤ y - z)]
      exact max_le (by linarith) (by linarith)
    have hm : 0 ≤ max |x - z| |y - z| := (abs_nonneg _).trans (le_max_left _ _)
    have hh := mul_le_mul hx1 hb hm zero_le_one
    simpa only [one_mul, neg_sub] using hh
  have hyz : y < z := lt_of_not_ge hzy
  rw [abs_of_neg (by linarith : x - z < 0), abs_of_neg (by linarith : y - z < 0),
    max_eq_left (by linarith : -(y - z) ≤ -(x - z))]
  have hKx : 0 ≤ K * (z - x) := mul_nonneg hK (by linarith)
  have hKy : 0 ≤ K * (z - y) := mul_nonneg hK (by linarith)
  by_cases hy1 : 1 ≤ K * (z - y)
  · have hx1' : 1 ≤ K * (z - x) := hy1.trans
      (mul_le_mul_of_nonneg_left (by linarith) hK)
    simp only [clipRamp, max_eq_right hKx, max_eq_right hKy,
      min_eq_left hx1', min_eq_left hy1, sub_self, zero_mul]
    linarith
  have hKy1 : K * (z - y) ≤ 1 := (lt_of_not_ge hy1).le
  by_cases hx1' : K * (z - x) ≤ 1
  · simp only [clipRamp, max_eq_right hKx, max_eq_right hKy,
      min_eq_right hx1', min_eq_right hKy1]
    nlinarith [mul_nonneg (sub_nonneg.mpr hx1') (sub_nonneg.mpr hxy)]
  · have hKx1 : 1 ≤ K * (z - x) := (lt_of_not_ge hx1').le
    simp only [clipRamp, max_eq_right hKx, max_eq_right hKy,
      min_eq_left hKx1, min_eq_right hKy1]
    nlinarith [mul_nonneg (sub_nonneg.mpr hKx1) (by linarith : 0 ≤ z - y)]

theorem clipRamp_dq_max_bound {K z x y : ℝ} (hK : 0 ≤ K) :
    |clipRamp K z x - clipRamp K z y| * max |x - z| |y - z| ≤ |x - y| := by
  rcases le_total x y with hxy | hyx
  · exact clipRamp_dq_max_bound_of_le hK hxy
  · simpa only [abs_sub_comm, max_comm] using clipRamp_dq_max_bound_of_le (z := z) hK hyx

theorem sqrt_mul_le_max (a b : ℝ) (ha : 0 ≤ a) (_hb : 0 ≤ b) :
    sqrt a * sqrt b ≤ max a b := by
  have hm : 0 ≤ max a b := ha.trans (le_max_left _ _)
  calc
    _ ≤ sqrt (max a b) * sqrt (max a b) :=
      mul_le_mul (sqrt_le_sqrt (le_max_left _ _)) (sqrt_le_sqrt (le_max_right _ _))
        (sqrt_nonneg _) (sqrt_nonneg _)
    _ = _ := mul_self_sqrt hm

theorem clipRamp_dq_sqrt_bound {K z x y : ℝ} (hK : 0 ≤ K)
    (hx : x ≠ z) (hy : y ≠ z) :
    |(clipRamp K z x - clipRamp K z y) / (x - y)| ≤
      (1 / sqrt |x - z|) * (1 / sqrt |y - z|) := by
  have hpx : 0 < sqrt |x - z| := sqrt_pos.mpr (abs_pos.mpr (sub_ne_zero.mpr hx))
  have hpy : 0 < sqrt |y - z| := sqrt_pos.mpr (abs_pos.mpr (sub_ne_zero.mpr hy))
  by_cases heq : x = y
  · subst y
    simp only [sub_self, zero_div, abs_zero]
    positivity
  rw [abs_div, one_div_mul_one_div]
  apply (div_le_div_iff₀ (abs_pos.mpr (sub_ne_zero.mpr heq)) (mul_pos hpx hpy)).mpr
  rw [one_mul]
  exact (mul_le_mul_of_nonneg_left (sqrt_mul_le_max _ _ (abs_nonneg _) (abs_nonneg _))
    (abs_nonneg _)).trans (clipRamp_dq_max_bound hK)

theorem integrable_abs_sub_rpow (ω p : ℝ) (hp : -1 < p) :
    Integrable (fun θ => |θ - ω| ^ p) angleMeasure := by
  classical
  have hplus : IntervalIntegrable (fun θ : ℝ => (θ - ω) ^ p) volume 0 π := by
    convert (intervalIntegrable_rpow' (a := -ω) (b := π - ω) hp).comp_sub_right ω using 1 <;> ring
  have hminus : IntervalIntegrable (fun θ : ℝ => (ω - θ) ^ p) volume 0 π := by
    convert (intervalIntegrable_rpow' (a := ω) (b := ω - π) hp).comp_sub_left ω using 1 <;> ring
  rw [intervalIntegrable_iff_integrableOn_Ioc_of_le Real.pi_pos.le] at hplus hminus
  change Integrable (fun θ => (θ - ω) ^ p) angleMeasure at hplus
  change Integrable (fun θ => (ω - θ) ^ p) angleMeasure at hminus
  have hi : Integrable ((Ici ω).piecewise (fun θ => (θ - ω) ^ p)
      (fun θ => (ω - θ) ^ p)) angleMeasure :=
    Integrable.piecewise measurableSet_Ici
      (hplus.mono_measure Measure.restrict_le_self) (hminus.mono_measure Measure.restrict_le_self)
  apply hi.congr (Eventually.of_forall fun θ => ?_)
  by_cases hθ : ω ≤ θ
  · simp only [Set.piecewise, Set.mem_Ici, hθ, ite_true, abs_of_nonneg (sub_nonneg.mpr hθ)]
  · simp only [Set.piecewise, Set.mem_Ici, hθ, ite_false, abs_of_neg (by linarith : θ - ω < 0)]
    congr 1
    ring

theorem integrable_inv_sqrt_sub (ω : ℝ) :
    Integrable (fun θ => 1 / sqrt |θ - ω|) angleMeasure := by
  have heq : (fun θ : ℝ => |θ - ω| ^ (-(1 / 2 : ℝ))) =
      (fun θ => 1 / sqrt |θ - ω|) := by
    funext θ
    rw [rpow_neg (abs_nonneg _), sqrt_eq_rpow]
    simp only [one_div]
  rw [← heq]
  exact integrable_abs_sub_rpow ω _ (by norm_num)

/-- On the whole reference interval an interior cosine root has a linear lower bound. -/
theorem exists_cos_chord_lower {ω : ℝ} (hω : ω ∈ Ioo (0 : ℝ) π) :
    ∃ c : ℝ, 0 < c ∧ ∀ θ ∈ Icc (0 : ℝ) π,
      c * |θ - ω| ≤ |cos θ - cos ω| := by
  have hn : (Icc (ω / 2) ((π + ω) / 2)).Nonempty :=
    ⟨ω / 2, le_rfl, by linarith [Real.pi_pos]⟩
  obtain ⟨t, ht, hmin⟩ := isCompact_Icc.exists_isMinOn hn Real.continuous_sin.continuousOn
  have hst : 0 < sin t := sin_pos_of_pos_of_lt_pi
    (by linarith [ht.1, hω.1]) (by linarith [ht.2, hω.2])
  refine ⟨2 * sin t / π, div_pos (mul_pos (by norm_num) hst) Real.pi_pos, ?_⟩
  intro θ hθ
  have hs : sin t ≤ sin ((θ + ω) / 2) := hmin ⟨by linarith [hθ.1], by linarith [hθ.2]⟩
  have hsa : sin t ≤ |sin ((θ + ω) / 2)| := hs.trans (le_abs_self _)
  have hd : |(θ - ω) / 2| ≤ π / 2 := by
    rw [abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 2)]
    have hb : |θ - ω| ≤ π := abs_le.mpr
      ⟨by linarith [hθ.1, hω.2], by linarith [hθ.2, hω.1]⟩
    linarith
  have hj := mul_abs_le_abs_sin hd
  calc
    _ = (2 * sin t) * (2 / π * |(θ - ω) / 2|) := by
      rw [abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 2)]
      ring
    _ ≤ (2 * sin t) * |sin ((θ - ω) / 2)| :=
      mul_le_mul_of_nonneg_left hj (by positivity)
    _ ≤ (2 * |sin ((θ + ω) / 2)|) * |sin ((θ - ω) / 2)| :=
      mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hsa (by norm_num)) (abs_nonneg _)
    _ = _ := by rw [cos_sub_cos, abs_mul, abs_mul]; norm_num

theorem integrable_inv_sqrt_cos_root {ω : ℝ} (hω : ω ∈ Ioo (0 : ℝ) π) :
    Integrable (fun θ => 1 / sqrt |cos θ - cos ω|) angleMeasure := by
  obtain ⟨c, hc, hb⟩ := exists_cos_chord_lower hω
  have hm : Measurable (fun θ => 1 / sqrt |cos θ - cos ω|) :=
    measurable_const.div (Real.continuous_cos.sub continuous_const).abs.sqrt.measurable
  apply ((integrable_inv_sqrt_sub ω).const_mul (1 / sqrt c)).mono' hm.aestronglyMeasurable
  filter_upwards [ae_restrict_mem measurableSet_Ioc,
    ae_restrict_of_ae (EP1038.Stage9.ae_ne_real ω)] with θ hθ hne
  rw [Real.norm_eq_abs, abs_of_nonneg (by positivity), one_div_mul_one_div]
  have hd : 0 < |θ - ω| := abs_pos.mpr (sub_ne_zero.mpr hne)
  have hp : 0 < sqrt c * sqrt |θ - ω| := mul_pos (sqrt_pos.mpr hc) (sqrt_pos.mpr hd)
  have hl := sqrt_le_sqrt (hb θ ⟨hθ.1.le, hθ.2⟩)
  rw [sqrt_mul hc.le] at hl
  exact one_div_le_one_div_of_le hp hl

theorem integrable_inv_sqrt_cos_sub {z : ℝ} (hz : z ∈ Ioo (-1 : ℝ) 1) :
    Integrable (fun θ => 1 / sqrt |cos θ - z|) angleMeasure := by
  have hω : arccos z ∈ Ioo (0 : ℝ) π := ⟨arccos_pos.mpr hz.2, arccos_lt_pi.mpr hz.1⟩
  simpa only [cos_arccos hz.1.le hz.2.le] using integrable_inv_sqrt_cos_root hω

theorem ae_cos_ne_interior (z : ℝ) (hz : z ∈ Ioo (-1 : ℝ) 1) :
    ∀ᵐ θ ∂angleMeasure, cos θ ≠ z := by
  have hω : arccos z ∈ Ioo (0 : ℝ) π := ⟨arccos_pos.mpr hz.2, arccos_lt_pi.mpr hz.1⟩
  filter_upwards [ae_restrict_mem measurableSet_Ioc,
    ae_restrict_of_ae (EP1038.Stage9.ae_ne_real (arccos z))] with θ hθ hne
  intro heq
  exact hne (Real.injOn_cos ⟨hθ.1.le, hθ.2⟩ ⟨hω.1.le, hω.2.le⟩
    (heq.trans (cos_arccos hz.1.le hz.2.le).symm))

theorem ae_angle_pair_cos_ne (z : ℝ) (hz : z ∈ Ioo (-1 : ℝ) 1) :
    ∀ᵐ p ∂angleMeasure.prod angleMeasure, cos p.1 ≠ z ∧ cos p.2 ≠ z := by
  have hm : MeasurableSet {θ : ℝ | cos θ ≠ z} :=
    (isClosed_eq Real.continuous_cos continuous_const).measurableSet.compl
  apply (Measure.ae_prod_iff_ae_ae (hm.prod hm)).mpr
  filter_upwards [ae_cos_ne_interior z hz] with θ hθ
  filter_upwards [ae_cos_ne_interior z hz] with φ hφ
  exact ⟨hθ, hφ⟩

/-- The actual ramps have a single integrable majorant, independent of n. -/
theorem integral_weightedDQ_ramp_tendsto {B : ℝ → ℝ} {C z : ℝ}
    (hB : Measurable B) (_hC : 0 ≤ C) (hBC : ∀ θ, |B θ| ≤ C)
    (hz : z ∈ Ioo (-1 : ℝ) 1) :
    Tendsto (fun n => ∫ p, weightedDQ B (jumpRamp z n) p
      ∂angleMeasure.prod angleMeasure) atTop
      (𝓝 (∫ p, weightedDQ B (jump z) p ∂angleMeasure.prod angleMeasure)) := by
  let g := fun θ => 1 / sqrt |cos θ - z|
  have hgi : Integrable g angleMeasure := integrable_inv_sqrt_cos_sub hz
  refine tendsto_integral_of_dominated_convergence
    (μ := angleMeasure.prod angleMeasure)
    (F := fun (n : ℕ) (p : ℝ × ℝ) => weightedDQ B (jumpRamp z n) p)
    (f := weightedDQ B (jump z)) (fun p : ℝ × ℝ => (g p.1 * g p.2) * C)
    (fun n => (weightedDQ_measurable hB (jumpRamp_XLip hz.1 n).continuous.measurable).aestronglyMeasurable)
    ((hgi.mul_prod hgi).mul_const C) ?_ ?_
  · intro n
    filter_upwards [ae_angle_pair_cos_ne z hz] with p hp
    have hK : 0 ≤ ((n : ℝ) + 1) / (z + 1) := div_nonneg (by positivity) (by linarith [hz.1])
    have hd := clipRamp_dq_sqrt_bound hK hp.1 hp.2
    change |(jumpRamp z n p.1 - jumpRamp z n p.2) / (cos p.1 - cos p.2)| ≤
      g p.1 * g p.2 at hd
    have hq : |(jumpRamp z n p.2 - jumpRamp z n p.1) / (cos p.1 - cos p.2)| ≤
        g p.1 * g p.2 := by
      rw [abs_div, abs_sub_comm (jumpRamp z n p.1) (jumpRamp z n p.2), ← abs_div] at hd
      exact hd
    rw [Real.norm_eq_abs, weightedDQ, abs_mul]
    exact mul_le_mul hq (hBC p.1) (abs_nonneg _) (by dsimp [g]; positivity)
  · exact Eventually.of_forall fun p =>
      (((jumpRamp_tendsto hz.1 p.2).sub (jumpRamp_tendsto hz.1 p.1)).div_const
        (cos p.1 - cos p.2)).mul_const (B p.1)

/-- Exact vanishing for each interior jump, including its endpoint value. -/
theorem L_jump_eq_zero {r ρ1 ρ2 σ1 σ2 z : ℝ} (hr : 0 < r)
    (h10 : 0 < ρ1) (h11 : ρ1 < 1) (h20 : 0 < ρ2) (h21 : ρ2 < 1)
    (hs1 : 0 ≤ σ1) (hs2 : 0 ≤ σ2) (hz : z ∈ Ioo (-1 : ℝ) 1) :
    Lfun r ρ1 ρ2 σ1 σ2 (jump z) = 0 := by
  let B := Bxi ρ1 ρ2 σ1 σ2
  let C := σ1 * Pq ρ1 0 + σ2 * Pq ρ2 0
  have hBn : ∀ θ, 0 ≤ B θ := fun θ => (Bxi_bounds h10.le h11 h20.le h21 hs1 hs2 θ).1
  have hBC : ∀ θ, |B θ| ≤ C := by
    intro θ
    rw [abs_of_nonneg (hBn θ)]
    exact (Bxi_bounds h10.le h11 h20.le h21 hs1 hs2 θ).2
  have hC : 0 ≤ C := (abs_nonneg (B 0)).trans (hBC 0)
  have hBm : Measurable B := (Bxi_cont h10.le h11 h20.le h21).measurable
  have hFi : ∀ n, Integrable (weightedDQ B (jumpRamp z n))
      (angleMeasure.prod angleMeasure) := fun n =>
    weightedDQ_integrable (jumpRamp_XLip hz.1 n)
      (div_nonneg (by positivity) (by linarith [hz.1])) hBm hBC
  have hji : Integrable (weightedDQ B (jump z)) (angleMeasure.prod angleMeasure) :=
    (L_jump_nonneg hr h10 h11 h20 h21 hs1 hs2 hz.1).1
  have hJ := integral_weightedDQ_ramp_tendsto hBm hC hBC hz
  simp_rw [integral_weightedDQ (hFi _), integral_weightedDQ hji] at hJ
  have hI : Tendsto (fun n => ∫ θ in (0 : ℝ)..π, HT (jumpRamp z n) θ * B θ) atTop
      (𝓝 (∫ θ in (0 : ℝ)..π, HT (jump z) θ * B θ)) := by
    simpa only [mul_div_cancel_left₀ _ Real.pi_ne_zero] using hJ.div_const π
  have hP :=
    (((int_ramp_Pq_tendsto hz.1 h10.le h11).const_mul (1 / π)).const_mul (σ1 / Kr r ρ1)).add
      (((int_ramp_Pq_tendsto hz.1 h20.le h21).const_mul (1 / π)).const_mul (σ2 / Kr r ρ2))
  have hL : Tendsto (fun n => Lfun r ρ1 ρ2 σ1 σ2 (jumpRamp z n)) atTop
      (𝓝 (Lfun r ρ1 ρ2 σ1 σ2 (jump z))) := by
    have hπ : jump z π = 1 := by simp [jump, hz.1]
    simp only [Lfun, jumpRamp_pi hz.1, hπ, mul_one]
    exact (hP.neg.sub (hI.const_mul (1 / (π * r)))).add tendsto_const_nhds
  have hzero : ∀ n, Lfun r ρ1 ρ2 σ1 σ2 (jumpRamp z n) = 0 := fun n =>
    L_XLip hr h10 h11 h20 h21
      (div_nonneg (by positivity) (by linarith [hz.1])) (jumpRamp_XLip hz.1 n)
  exact tendsto_nhds_unique hL (by simp_rw [hzero]; exact tendsto_const_nhds)

/-- Finite jump assembly is exact; no limit-equality hypothesis is input. -/
theorem finite_jump_adjoint_eq {ι : Type*} {r ρ1 ρ2 σ1 σ2 M : ℝ} {fc : ℝ → ℝ}
    (hr : 0 < r) (h10 : 0 < ρ1) (h11 : ρ1 < 1) (h20 : 0 < ρ2) (h21 : ρ2 < 1)
    (hs1 : 0 ≤ σ1) (hs2 : 0 ≤ σ2) (hM : 0 ≤ M) (hfc : XLip M fc)
    (s : Finset ι) (Δ z : ι → ℝ) (hz : ∀ i ∈ s, z i ∈ Ioo (-1 : ℝ) 1) :
    AdjointIntegrable ρ1 ρ2 (Bxi ρ1 ρ2 σ1 σ2) (fc + ∑ i ∈ s, Δ i • jump (z i)) ∧
      Lfun r ρ1 ρ2 σ1 σ2 (fc + ∑ i ∈ s, Δ i • jump (z i)) = 0 := by
  classical
  have hj : ∀ i ∈ s, AdjointIntegrable ρ1 ρ2 (Bxi ρ1 ρ2 σ1 σ2) (jump (z i)) := by
    intro i hi
    exact ⟨jump_poisson_integrable h10.le h11 _, jump_poisson_integrable h20.le h21 _,
      (L_jump_nonneg hr h10 h11 h20 h21 hs1 hs2 (hz i hi).1).1⟩
  have hsum : AdjointIntegrable ρ1 ρ2 (Bxi ρ1 ρ2 σ1 σ2) (∑ i ∈ s, Δ i • jump (z i)) ∧
      Lfun r ρ1 ρ2 σ1 σ2 (∑ i ∈ s, Δ i • jump (z i)) = 0 := by
    induction s using Finset.induction_on with
    | empty =>
      simp only [sum_empty]
      exact ⟨AdjointIntegrable.zero _ _ _, by simp [Lfun, HT]⟩
    | @insert i s hi ih =>
      have hji := (hj i (mem_insert_self i s)).smul (Δ i)
      have hsj := ih (fun j hj' => hz j (mem_insert_of_mem hj'))
        (fun j hj' => hj j (mem_insert_of_mem hj'))
      rw [sum_insert hi]
      refine ⟨hji.add hsj.1, ?_⟩
      rw [Lfun_add hji hsj.1, Lfun_smul (hj i (mem_insert_self i s)),
        L_jump_eq_zero hr h10 h11 h20 h21 hs1 hs2 (hz i (mem_insert_self i s)), hsj.2]
      ring
  have hfi := hfc.adjointIntegrable hM h10.le h11 h20.le h21 hs1 hs2
  refine ⟨hfi.add hsum.1, ?_⟩
  rw [Lfun_add hfi hsum.1, L_XLip hr h10 h11 h20 h21 hM hfc, hsum.2]
  ring

theorem endpoint_corrected_equality {r ρ1 ρ2 σ1 σ2 : ℝ} {f : ℝ → ℝ}
    (hL : Lfun r ρ1 ρ2 σ1 σ2 f = 0) :
    widthVariation r ρ1 ρ2 σ1 σ2 f - adjointIntegral r ρ1 ρ2 σ1 σ2 f =
      -Gam r ρ1 ρ2 σ1 σ2 * f π := by
  dsimp [Lfun, widthVariation, poissonPair, adjointIntegral] at *
  linarith

end EP1038.Stage11
