import LeanProject.Stage10C12

/-!
# EP-1038, Stage 10: Lemma 10.13(4) and **Theorem 10.14** (convex supporting inequality)

* `fix_of_sep`, `fix_of_contact`, `wser_eq_of_fix`: for admissible `S` the width series converges and
  equals `x₊ - x₋` (Proposition 10.10);
* `xp_deriv`, `xm_deriv` (**Lemma 10.13(4)**): `x±'(0) = -D±/L±`, `D± = ∫ (T-T₀)/(T₀-x±)`,
  `L± = k G_{T₀}(x±) = W_{T₀}'(x±)`;
* `wser_deriv`: `Ṁ_k(T₀; T-T₀) = -D₊/L₊ + D₋/L₋ = -σ₊ D₊ - σ₋ D₋` with `σ₊ = 1/L₊ > 0`,
  `σ₋ = -1/L₋ > 0`;
* `convex_supporting` (**Theorem 10.14**): `M_k(T) ≥ M_k(T₀) + Ṁ_k(T₀; T-T₀)` for admissible `T`.
-/

open Real Set Filter Topology MeasureTheory intervalIntegral PowerSeries

namespace EP1038.Stage10

section fix

variable {k a : ℝ} {S : ℝ → ℝ} (hSm : Measurable S) (ha : 0 < a) (hSa : ∀ u, a ≤ S u)
  (hS2 : ∀ u, S u ≤ 2) (hk : 0 < k)
include hSm ha hSa hS2 hk

theorem fix_of_sep {r : ℝ} (hr0 : 0 < r) (hra : r < a) (hsep : RS k S < PsiS k S r) :
    RS k S * phiv (phiS k S) r ≤ r := by
  have hr_abs : |r| < a := by rwa [abs_of_pos hr0]
  have hpr := phiv_pos hSm ha hSa hS2 hk hr_abs
  rw [PsiS_eq_div hSm ha hSa hS2 hk hr_abs, lt_div_iff₀ hpr] at hsep
  exact hsep.le

theorem fix_of_contact (hyc : yc k a S < a) (hcon : RS k S = PsiS k S (yc k a S)) :
    RS k S * phiv (phiS k S) (yc k a S) ≤ yc k a S := by
  have hycpos := yc_pos hSm ha hSa hS2 hk
  have hyc_abs : |yc k a S| < a := by rwa [abs_of_pos hycpos]
  have hpy := phiv_pos hSm ha hSa hS2 hk hyc_abs
  rw [hcon, PsiS_eq_div hSm ha hSa hS2 hk hyc_abs, div_mul_cancel₀ _ hpy.ne']

theorem wser_eq_of_fix {r : ℝ} (hr : 0 < r) (hra : r < a) (hfix : RS k S * phiv (phiS k S) r ≤ r) :
    Summable (fun n => coeff n (cS k S) * (RS k S ^ n - (-RS k S) ^ n)) ∧
      wser k S = xpS k S - xmS k S := by
  have hφ := phiS_nonneg hSm ha hSa hS2 hk
  have hconv := hconvS hSm ha hSa hS2 hk
  have hR := RS_pos hSm ha hSa hS2 hk
  have h1 := (AC_Phi hφ hconv hR hr hra hfix (le_of_eq (abs_of_pos hR))).of_norm
  have h2 := (AC_Phi hφ hconv hR hr hra hfix (le_of_eq (by rw [abs_neg, abs_of_pos hR]))).of_norm
  refine ⟨(h1.sub h2).congr fun n => by unfold cS; ring, ?_⟩
  unfold wser
  exact (width_series hSm ha hSa hS2 hk hr hra hfix).symm

theorem xm_gt {r : ℝ} (hr0 : 0 < r) (hra : r < a) (hsep : RS k S < PsiS k S r) : -a < xmS k S := by
  obtain ⟨-, -, -, -, h, -⟩ := series_package hSm ha hSa hS2 hk hr0 hra
    (fix_of_sep hSm ha hSa hS2 hk hr0 hra hsep)
  linarith [neg_abs_le (xmS k S)]

end fix

theorem eventually_seg {s1 : ℝ} (hs1 : 0 < s1) :
    ∀ᶠ s in 𝓝[Ici 0] (0 : ℝ), s ∈ Icc (0 : ℝ) s1 := by
  filter_upwards [self_mem_nhdsWithin, nhdsWithin_le_nhds (Iio_mem_nhds hs1)] with s h1 h2
  exact ⟨h1, (Set.mem_Iio.mp h2).le⟩

section seg

variable {T0 T : ℝ → ℝ} {a0 a1 k r : ℝ} (hm0 : Measurable T0) (hm1 : Measurable T)
  (ha0 : 0 < a0) (h0a : ∀ u, a0 ≤ T0 u) (h02 : ∀ u, T0 u ≤ 2) (ha1 : 0 < a1) (h1a : ∀ u, a1 ≤ T u)
  (h12 : ∀ u, T u ≤ 2) (hk : 0 < k) (hr0 : 0 < r) (hra : r < a0)
  (hsep : RS k T0 < PsiS k T0 r)
include hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hsep

/-- Bundled facts at `T_s` for `s ∈ [0, s₁]`. -/
theorem seg_facts : ∃ s1, 0 < s1 ∧ ∀ s ∈ Icc (0 : ℝ) s1,
    Measurable (Seg T0 T s) ∧ (∀ u, (r + a0) / 2 ≤ Seg T0 T s u) ∧ (∀ u, Seg T0 T s u ≤ 2) ∧
      RS k (Seg T0 T s) < PsiS k (Seg T0 T s) r := by
  have hT1 := h1nn hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra
  obtain ⟨s1, hs1, hs1δ, hs11, hsep'⟩ := seg_sep hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hsep
  refine ⟨s1, hs1, fun s hs => ⟨Seg_measurable hm0 hm1 s, Seg_lower h0a h02 hT1 h12 (by linarith)
    (by linarith) hs.1 (hs.2.trans hs1δ), Seg_upper h0a h02 hT1 h12 (by linarith) (by linarith) hs.1
    (hs.2.trans hs11), hsep' s hs⟩⟩

/-- **Lemma 10.13(4)**, right endpoint. -/
theorem xp_deriv :
    HasDerivWithinAt (fun s => xpS k (Seg T0 T s))
      (-(∫ u in (0 : ℝ)..1, (T u - T0 u) / (T0 u - xpS k T0)) / (k * GS k T0 (xpS k T0)))
      (Ici 0) 0 := by
  obtain ⟨s1, hs1, hF⟩ := seg_facts hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hsep
  have hra' : r < (r + a0) / 2 := by linarith
  have ha' : 0 < (r + a0) / 2 := by linarith
  obtain ⟨hp0, hpyc, -, -, -⟩ := sep_series hm0 ha0 h0a h02 hk hr0 hra hsep
  have hxr := xp_lt_r hm0 ha0 h0a h02 hk hr0 hra hsep
  have hL : k * GS k T0 (xpS k T0) ≠ 0 :=
    (mul_pos hk (GS_pos_of_lt_yc hm0 ha0 h0a h02 hk hp0 hpyc)).ne'
  have hs0mem : (0 : ℝ) ∈ Icc (0 : ℝ) s1 := ⟨le_rfl, hs1.le⟩
  refine implicit_root_deriv (Ω := fun x s => WS k (Seg T0 T s) x) hL (by simp [Seg_zero])
    (by simp only [Seg_zero]; exact W_xp_zero hm0 ha0 h0a h02 hk hr0 hra hsep) ?_ ?_
    (hlin_seg hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hp0.ne' (by linarith))
    (hD_seg hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra (by linarith))
  · filter_upwards [eventually_seg hs1] with s hs
    obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
    exact W_xp_zero hSm ha' hSa hS2 hk hr0 hra' hsep'
  · have h := root_cont (Ω := fun x s => WS k (Seg T0 T s) x) (X := fun s => xpS k (Seg T0 T s))
      (lo := 0) (hi := r) hs1
      (fun s hs => by
        obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
        exact ⟨(sep_series hSm ha' hSa hS2 hk hr0 hra' hsep').1,
          xp_lt_r hSm ha' hSa hS2 hk hr0 hra' hsep'⟩)
      (fun s hs y h1 h2 => by
        obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
        have hm := (sep_series hSm ha' hSa hS2 hk hr0 hra' hsep').2.2.2.1
        exact W_mid_neg hSm ha' hSa hS2 hk hr0 hra' hsep' (by linarith) h2 (ne_of_gt h1))
      (fun s hs y h1 h2 => by
        obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
        exact W_right_pos hSm ha' hSa hS2 hk hr0 hra' hsep' h1 h2)
      (fun s hs => by
        obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
        exact W_xp_zero hSm ha' hSa hS2 hk hr0 hra' hsep')
      (fun y _ hy => by
        have := W_seg_cont hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra (x := y) (by linarith)
        simpa only [Seg_zero] using this)
    simpa only [Seg_zero] using h

/-- **Lemma 10.13(4)**, left endpoint. -/
theorem xm_deriv :
    HasDerivWithinAt (fun s => xmS k (Seg T0 T s))
      (-(∫ u in (0 : ℝ)..1, (T u - T0 u) / (T0 u - xmS k T0)) / (k * GS k T0 (xmS k T0)))
      (Ici 0) 0 := by
  obtain ⟨s1, hs1, hF⟩ := seg_facts hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hsep
  have hra' : r < (r + a0) / 2 := by linarith
  have ha' : 0 < (r + a0) / 2 := by linarith
  obtain ⟨hp0, hpyc, -, hm0', -⟩ := sep_series hm0 ha0 h0a h02 hk hr0 hra hsep
  have hL : k * GS k T0 (xmS k T0) ≠ 0 := by
    have hJ := JS_pos hm0 ha0 h0a h02 (show xmS k T0 < a0 by linarith)
    have : GS k T0 (xmS k T0) < 0 := by
      unfold GS
      have : 1 / xmS k T0 < 0 := one_div_neg.mpr hm0'
      have : 0 < (1 / k) * JS T0 (xmS k T0) := mul_pos (by positivity) hJ
      linarith
    exact (mul_neg_of_pos_of_neg hk this).ne
  refine implicit_root_deriv (Ω := fun x s => WS k (Seg T0 T s) x) hL (by simp [Seg_zero])
    (by simp only [Seg_zero]; exact W_xm_zero hm0 ha0 h0a h02 hk hr0 hra hsep) ?_ ?_
    (hlin_seg hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hm0'.ne (by linarith))
    (hD_seg hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra (by linarith))
  · filter_upwards [eventually_seg hs1] with s hs
    obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
    exact W_xm_zero hSm ha' hSa hS2 hk hr0 hra' hsep'
  · -- reflect: `X' = -x₋(s)` is a root of `Ω'(x, s) = W_{T_s}(-x)` with the standard sign pattern
    have h := root_cont (Ω := fun x s => WS k (Seg T0 T s) (-x)) (X := fun s => -xmS k (Seg T0 T s))
      (lo := 0) (hi := (r + a0) / 2) hs1
      (fun s hs => by
        obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
        exact ⟨by linarith [(sep_series hSm ha' hSa hS2 hk hr0 hra' hsep').2.2.2.1],
          by linarith [xm_gt hSm ha' hSa hS2 hk hr0 hra' hsep']⟩)
      (fun s hs y h1 h2 => by
        obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
        have hp := (sep_series hSm ha' hSa hS2 hk hr0 hra' hsep').1
        exact W_mid_neg hSm ha' hSa hS2 hk hr0 hra' hsep' (by linarith) (by linarith)
          (by intro h; linarith))
      (fun s hs y h1 _ => by
        obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
        exact W_left_pos hSm ha' hSa hS2 hk hr0 hra' hsep' (by linarith))
      (fun s hs => by
        obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
        simp only [neg_neg]
        exact W_xm_zero hSm ha' hSa hS2 hk hr0 hra' hsep')
      (fun y h1 _ => by
        have := W_seg_cont hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra (x := -y) (by linarith)
        simpa only [Seg_zero] using this)
    have h' := h.neg
    simp only [neg_neg, Seg_zero] at h'
    exact h'

/-- `Ṁ_k(T₀; T - T₀)`, **Lemma 10.13(4)** closed form. -/
noncomputable def Mdot (k : ℝ) (T0 T : ℝ → ℝ) : ℝ :=
  -(∫ u in (0 : ℝ)..1, (T u - T0 u) / (T0 u - xpS k T0)) / (k * GS k T0 (xpS k T0)) -
    -(∫ u in (0 : ℝ)..1, (T u - T0 u) / (T0 u - xmS k T0)) / (k * GS k T0 (xmS k T0))

/-- The width `M_k(T_s)` has right derivative `Ṁ` at `0`. -/
theorem wser_deriv : HasDerivWithinAt (fun s => wser k (Seg T0 T s)) (Mdot k T0 T) (Ici 0) 0 := by
  obtain ⟨s1, hs1, hF⟩ := seg_facts hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hsep
  have hra' : r < (r + a0) / 2 := by linarith
  have ha' : 0 < (r + a0) / 2 := by linarith
  have hd := (xp_deriv hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hsep).sub
    (xm_deriv hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hsep)
  refine hd.congr_of_eventuallyEq ?_ ?_
  · filter_upwards [eventually_seg hs1] with s hs
    obtain ⟨hSm, hSa, hS2, hsep'⟩ := hF s hs
    exact (wser_eq_of_fix hSm ha' hSa hS2 hk hr0 hra'
      (fix_of_sep hSm ha' hSa hS2 hk hr0 hra' hsep')).2
  · simp only [Pi.sub_apply, Seg_zero]
    exact (wser_eq_of_fix hm0 ha0 h0a h02 hk hr0 hra (fix_of_sep hm0 ha0 h0a h02 hk hr0 hra hsep)).2

/-- **Theorem 10.14** (convex supporting inequality): if the width series of `T` converges
(`T` admissible), then `M_k(T) ≥ M_k(T₀) + Ṁ_k(T₀; T - T₀)`. -/
theorem convex_supporting
    (hsumT : Summable fun n => coeff n (cS k T) * (RS k T ^ n - (-RS k T) ^ n)) :
    wser k T0 + Mdot k T0 T ≤ wser k T := by
  have hmin : 0 < min a0 a1 := lt_min ha0 ha1
  have h0m : ∀ u, min a0 a1 ≤ T0 u := fun u => (min_le_left _ _).trans (h0a u)
  have h1m : ∀ u, min a0 a1 ≤ T u := fun u => (min_le_right _ _).trans (h1a u)
  have hsum0 := (wser_eq_of_fix hm0 ha0 h0a h02 hk hr0 hra
    (fix_of_sep hm0 ha0 h0a h02 hk hr0 hra hsep)).1
  have hD := wser_deriv hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hsep
  have hle := deriv_le_of_slope hD fun s hs0 hs1 => by
    have := wser_slope hm0 hm1 hmin h0m h1m h02 h12 hk hsum0 hsumT hs0 hs1
    simpa only [Seg_zero] using this
  linarith

/-- **Theorem 10.14** for a strictly separated target `T` (in terms of the true widths). -/
theorem convex_supporting_sep {r1 : ℝ} (hr1 : 0 < r1) (hr1a : r1 < a1)
    (hsepT : RS k T < PsiS k T r1) :
    xpS k T0 - xmS k T0 + Mdot k T0 T ≤ xpS k T - xmS k T := by
  obtain ⟨hsumT, heqT⟩ := wser_eq_of_fix hm1 ha1 h1a h12 hk hr1 hr1a
    (fix_of_sep hm1 ha1 h1a h12 hk hr1 hr1a hsepT)
  have heq0 := (wser_eq_of_fix hm0 ha0 h0a h02 hk hr0 hra
    (fix_of_sep hm0 ha0 h0a h02 hk hr0 hra hsep)).2
  have := convex_supporting hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hsep hsumT
  rw [heq0, heqT] at this
  exact this

/-- **Theorem 10.14** for a target `T` in contact. -/
theorem convex_supporting_contact (hyc : yc k a1 T < a1) (hcon : RS k T = PsiS k T (yc k a1 T)) :
    xpS k T0 - xmS k T0 + Mdot k T0 T ≤ xpS k T - xmS k T := by
  have hycpos := yc_pos hm1 ha1 h1a h12 hk
  obtain ⟨hsumT, heqT⟩ := wser_eq_of_fix hm1 ha1 h1a h12 hk hycpos hyc
    (fix_of_contact hm1 ha1 h1a h12 hk hyc hcon)
  have heq0 := (wser_eq_of_fix hm0 ha0 h0a h02 hk hr0 hra
    (fix_of_sep hm0 ha0 h0a h02 hk hr0 hra hsep)).2
  have := convex_supporting hm0 hm1 ha0 h0a h02 ha1 h1a h12 hk hr0 hra hsep hsumT
  rw [heq0, heqT] at this
  exact this

end seg

end EP1038.Stage10
