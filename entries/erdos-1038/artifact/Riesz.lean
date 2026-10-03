import LeanProject.Elementary
import Mathlib.Data.ZMod.ValMinAbs


/-!
# EP-1038, Stage 12b §1: the discrete cyclic Riesz inequality (Theorem D)

On `ℤ_n`, for every symmetric decreasing kernel `c` and all `a b : ℤ_n → ℝ`,
`S_c(a, b) = ∑ᵢ ∑ⱼ aᵢ bⱼ c(i - j) ≤ S_c(a^#, b^#)`, where `a^#` is the canonical arrangement:
nonincreasing along `0, 1, -1, 2, -2, …`.

* `nrm z = |z|_n`; `SymDec c`: `c` is symmetric decreasing (`|x|_n ≤ |y|_n → c y ≤ c x`).
* `pref m z`: the half `H_m` preferred by the polarization about `m/2` (proof.md Lemma 1.1,
  Corollary 1.2); `geom`: two points of `H_m` are closer to each other than to reflections.
* `P m a`: the polarization; `four_S`, `T_le`, `two_point`: Lemma 1.3.
* `pot_le`, `pot_lt`: the potential `∑ |z|_n a_z` decreases strictly under a nontrivial `P_m`,
  `m ≠ 0`; `radial`: Lemma 1.4.
* `discrete_riesz`: **Theorem D**, with the canonical arrangement described by `Canon`, and
  `canon_unique`: a canonical rearrangement is unique.
-/

open Finset

namespace EP1038.Riesz

variable {n : ℕ} [NeZero n]

/-- The cyclic norm `|z|_n`. -/
def nrm (z : ZMod n) : ℕ := z.valMinAbs.natAbs

theorem nrm_eq (z : ZMod n) : nrm z = min z.val (n - z.val) := ZMod.valMinAbs_natAbs_eq_min z

omit [NeZero n] in
theorem nrm_neg (z : ZMod n) : nrm (-z) = nrm z := ZMod.natAbs_valMinAbs_neg z

theorem vadd (a b : ZMod n) :
    (a + b).val = if a.val + b.val < n then a.val + b.val else a.val + b.val - n := by
  have ha := ZMod.val_lt a
  have hb := ZMod.val_lt b
  rw [ZMod.val_add]
  split_ifs with h
  · exact Nat.mod_eq_of_lt h
  · rw [Nat.mod_eq_sub_mod (not_lt.mp h), Nat.mod_eq_of_lt (by omega)]

theorem vneg (a : ZMod n) : (-a).val = if a.val = 0 then 0 else n - a.val := by
  rw [ZMod.neg_val]
  by_cases h : a = 0
  · rw [ite_eq_left h, ite_eq_left (by rw [h, ZMod.val_zero])]
  · rw [ite_eq_right h, ite_eq_right (by rwa [ZMod.val_eq_zero])]

theorem vsub (a b : ZMod n) :
    (a - b).val = if b.val ≤ a.val then a.val - b.val else a.val + n - b.val := by
  have ha := ZMod.val_lt a
  have hb := ZMod.val_lt b
  rw [sub_eq_add_neg, vadd, vneg]
  split_ifs <;> omega

/-- `c` is a symmetric decreasing kernel: `c_d = γ(|d|_n)` with `γ` nonincreasing. -/
def SymDec (c : ZMod n → ℝ) : Prop := ∀ x y : ZMod n, nrm x ≤ nrm y → c y ≤ c x

omit [NeZero n] in
theorem SymDec.even {c : ZMod n → ℝ} (hc : SymDec c) (d : ZMod n) : c (-d) = c d :=
  le_antisymm (hc _ _ (by rw [nrm_neg])) (hc _ _ (by rw [nrm_neg]))

/-- `S_c(a, b) = ∑ᵢ ∑ⱼ aᵢ bⱼ c(i - j)`. -/
def S (c a b : ZMod n → ℝ) : ℝ := ∑ i, ∑ j, a i * b j * c (i - j)

/-- The preferred half `H_m` of the reflection `z ↦ m - z`. -/
def pref (m z : ZMod n) : Prop :=
  if m = 0 then 0 < z.val ∧ 2 * z.val < n else nrm z < nrm (m - z)

theorem pref_excl {m z : ZMod n} (h : pref m z) : ¬ pref m (m - z) := by
  unfold pref at h ⊢
  by_cases hm : m = 0
  · rw [ite_eq_left hm] at h ⊢
    rw [hm, zero_sub, vneg]
    split_ifs <;> omega
  · rw [ite_eq_right hm] at h ⊢
    rw [sub_sub_cancel]
    omega

theorem fixed_of_not {m z : ZMod n} (h1 : ¬ pref m z) (h2 : ¬ pref m (m - z)) : m - z = z := by
  unfold pref at h1 h2
  by_cases hm : m = 0
  · rw [ite_eq_left hm] at h1 h2
    rw [hm, zero_sub] at h2 ⊢
    apply ZMod.val_injective
    have := ZMod.val_lt z
    rw [vneg] at h2 ⊢
    split_ifs at h2 ⊢ <;> omega
  · rw [ite_eq_right hm] at h1 h2
    rw [sub_sub_cancel] at h2
    have heq : nrm z = nrm (m - z) := by omega
    rcases (ZMod.natAbs_valMinAbs_eq_natAbs_valMinAbs).mp heq with h | h
    · exact h.symm
    · exact absurd (by linear_combination h) hm

/-- For `m ≠ 0`, the half `H_m` in coordinates: `2z < m` or `2z > m + n` (`0 ≤ z, m < n`). -/
theorem pref_iff {m z : ZMod n} (hm : m ≠ 0) :
    pref m z ↔ 2 * z.val < m.val ∨ m.val + n < 2 * z.val := by
  have hz := ZMod.val_lt z
  have hml := ZMod.val_lt m
  have hm0 : m.val ≠ 0 := by rwa [Ne, ZMod.val_eq_zero]
  unfold pref
  rw [ite_eq_right hm, nrm_eq, nrm_eq, vsub]
  split_ifs <;> constructor <;> intro h <;> omega

/-- **Lemma 1.1(2)**: two points of `H_m` are no farther from each other than from each other's
reflections (`≤`; proof.md has the strict form). -/
theorem geom {m x y : ZMod n} (hx : pref m x) (hy : pref m y) :
    nrm (x - y) ≤ nrm (x - (m - y)) := by
  have hxl := ZMod.val_lt x
  have hyl := ZMod.val_lt y
  have hml := ZMod.val_lt m
  by_cases hm : m = 0
  · unfold pref at hx hy
    rw [ite_eq_left hm] at hx hy
    rw [hm, zero_sub, sub_neg_eq_add, nrm_eq, nrm_eq, vsub, vadd]
    split_ifs <;> omega
  · rw [pref_iff hm] at hx hy
    have hm0 : m.val ≠ 0 := by rwa [Ne, ZMod.val_eq_zero]
    rw [nrm_eq, nrm_eq, vsub x y, vsub x (m - y), vsub m y]
    split_ifs <;> omega

open Classical in
/-- The polarization `P_m`. -/
noncomputable def P (m : ZMod n) (a : ZMod n → ℝ) (z : ZMod n) : ℝ :=
  if pref m z then max (a z) (a (m - z))
  else if pref m (m - z) then min (a z) (a (m - z)) else a z

theorem pol_cases (m z : ZMod n) (a : ZMod n → ℝ) :
    (pref m z ∧ P m a z = max (a z) (a (m - z)) ∧ P m a (m - z) = min (a z) (a (m - z))) ∨
    (pref m (m - z) ∧ P m a z = min (a z) (a (m - z)) ∧
      P m a (m - z) = max (a z) (a (m - z))) ∨
    (m - z = z ∧ P m a z = a z ∧ P m a (m - z) = a (m - z)) := by
  by_cases h1 : pref m z
  · left
    refine ⟨h1, ?_, ?_⟩
    · unfold P; rw [ite_eq_left h1]
    · unfold P; rw [ite_eq_right (pref_excl h1), sub_sub_cancel, ite_eq_left h1, min_comm]
  · by_cases h2 : pref m (m - z)
    · right; left
      refine ⟨h2, ?_, ?_⟩
      · unfold P; rw [ite_eq_right h1, ite_eq_left h2]
      · unfold P; rw [ite_eq_left h2, sub_sub_cancel, max_comm]
    · right; right
      have hf := fixed_of_not h1 h2
      refine ⟨hf, ?_, ?_⟩
      · unfold P; rw [ite_eq_right h1, ite_eq_right h2]
      · rw [hf]; unfold P; rw [ite_eq_right h1, ite_eq_right h2]

theorem P_pair (m z : ZMod n) (a : ZMod n → ℝ) :
    P m a z + P m a (m - z) = a z + a (m - z) := by
  rcases pol_cases m z a with ⟨-, h1, h2⟩ | ⟨-, h1, h2⟩ | ⟨-, h1, h2⟩
  · rw [h1, h2, max_add_min]
  · rw [h1, h2, min_add_max]
  · rw [h1, h2]

theorem rearr (u u' w w' : ℝ) : u * w + u' * w' ≤ max u u' * max w w' + min u u' * min w w' := by
  rcases le_total u u' with h1 | h1 <;> rcases le_total w w' with h2 | h2
  · rw [max_eq_right h1, min_eq_left h1, max_eq_right h2, min_eq_left h2]; nlinarith
  · rw [max_eq_right h1, min_eq_left h1, max_eq_left h2, min_eq_right h2]; nlinarith
  · rw [max_eq_left h1, min_eq_right h1, max_eq_right h2, min_eq_left h2]; nlinarith
  · rw [max_eq_left h1, min_eq_right h1, max_eq_left h2, min_eq_right h2]

theorem anti (u u' w w' : ℝ) : max u u' * min w w' + min u u' * max w w' ≤ u * w + u' * w' := by
  rcases le_total u u' with h1 | h1 <;> rcases le_total w w' with h2 | h2
  · rw [max_eq_right h1, min_eq_left h1, max_eq_right h2, min_eq_left h2]; nlinarith
  · rw [max_eq_right h1, min_eq_left h1, max_eq_left h2, min_eq_right h2]; nlinarith
  · rw [max_eq_left h1, min_eq_right h1, max_eq_right h2, min_eq_left h2]
  · rw [max_eq_left h1, min_eq_right h1, max_eq_left h2, min_eq_right h2]; nlinarith

/-- The four reflected copies of `S`. -/
theorem four_S {c : ZMod n → ℝ} (hc : SymDec c) (a b : ZMod n → ℝ) (m : ZMod n) :
    4 * S c a b = ∑ i, ∑ j, ((c (i - j) - c (i - (m - j))) *
      (a i * b j + a (m - i) * b (m - j)) +
      c (i - (m - j)) * (a i + a (m - i)) * (b j + b (m - j))) := by
  have e0 : ∑ i, ∑ j, c (i - j) * a i * b j = S c a b := by
    unfold S
    exact Finset.sum_congr rfl (fun i _ => Finset.sum_congr rfl (fun j _ => by ring))
  have e1 : ∑ i, ∑ j, c (i - j) * a (m - i) * b (m - j) = S c a b := by
    unfold S
    refine Fintype.sum_equiv (Equiv.subLeft m) _ _ (fun i => ?_)
    refine Fintype.sum_equiv (Equiv.subLeft m) _ _ (fun j => ?_)
    simp only [Equiv.subLeft_apply]
    rw [show m - i - (m - j) = -(i - j) by ring, hc.even]; ring
  have e2 : ∑ i, ∑ j, c (i - (m - j)) * a i * b (m - j) = S c a b := by
    unfold S
    refine Finset.sum_congr rfl (fun i _ => ?_)
    refine Fintype.sum_equiv (Equiv.subLeft m) _ _ (fun j => ?_)
    simp only [Equiv.subLeft_apply]; ring
  have e3 : ∑ i, ∑ j, c (i - (m - j)) * a (m - i) * b j = S c a b := by
    unfold S
    refine Fintype.sum_equiv (Equiv.subLeft m) _ _ (fun i => ?_)
    refine Finset.sum_congr rfl (fun j _ => ?_)
    simp only [Equiv.subLeft_apply]
    rw [show i - (m - j) = -(m - i - j) by ring, hc.even]; ring
  have hpt : ∀ i j, (c (i - j) - c (i - (m - j))) * (a i * b j + a (m - i) * b (m - j)) +
      c (i - (m - j)) * (a i + a (m - i)) * (b j + b (m - j)) =
      c (i - j) * a i * b j + c (i - j) * a (m - i) * b (m - j) +
        c (i - (m - j)) * a i * b (m - j) + c (i - (m - j)) * a (m - i) * b j := by
    intro i j; ring
  simp only [hpt, Finset.sum_add_distrib]
  rw [e0, e1, e2, e3]; ring

/-- The pointwise step of **Lemma 1.3**. -/
theorem T_le {c : ZMod n → ℝ} (hc : SymDec c) (a b : ZMod n → ℝ) (m i j : ZMod n) :
    (c (i - j) - c (i - (m - j))) * (a i * b j + a (m - i) * b (m - j)) +
      c (i - (m - j)) * (a i + a (m - i)) * (b j + b (m - j)) ≤
    (c (i - j) - c (i - (m - j))) * (P m a i * P m b j + P m a (m - i) * P m b (m - j)) +
      c (i - (m - j)) * (P m a i + P m a (m - i)) * (P m b j + P m b (m - j)) := by
  have hpa := P_pair m i a
  have hpb := P_pair m j b
  rw [hpa, hpb]
  suffices h : (c (i - j) - c (i - (m - j))) * (a i * b j + a (m - i) * b (m - j)) ≤
      (c (i - j) - c (i - (m - j))) * (P m a i * P m b j + P m a (m - i) * P m b (m - j)) by
    linarith
  rcases pol_cases m i a with ⟨hi, hai, hai'⟩ | ⟨hi, hai, hai'⟩ | ⟨hi, hai, hai'⟩ <;>
  rcases pol_cases m j b with ⟨hj, hbj, hbj'⟩ | ⟨hj, hbj, hbj'⟩ | ⟨hj, hbj, hbj'⟩
  · -- i ∈ H, j ∈ H
    have hk : 0 ≤ c (i - j) - c (i - (m - j)) := sub_nonneg.mpr (hc _ _ (geom hi hj))
    rw [hai, hai', hbj, hbj']
    exact mul_le_mul_of_nonneg_left (rearr _ _ _ _) hk
  · -- i ∈ H, j ∈ σH
    have g := geom hi hj
    rw [sub_sub_cancel] at g
    have hk : c (i - j) - c (i - (m - j)) ≤ 0 := sub_nonpos.mpr (hc _ _ g)
    rw [hai, hai', hbj, hbj']
    exact mul_le_mul_of_nonpos_left (by linarith [anti (a i) (a (m - i)) (b j) (b (m - j))]) hk
  · simp only [hj, sub_self, zero_mul, le_refl]
  · -- i ∈ σH, j ∈ H
    have g := geom hi hj
    rw [show m - i - j = -(i - (m - j)) by ring, show m - i - (m - j) = -(i - j) by ring,
      nrm_neg, nrm_neg] at g
    have hk : c (i - j) - c (i - (m - j)) ≤ 0 := sub_nonpos.mpr (hc _ _ g)
    rw [hai, hai', hbj, hbj']
    exact mul_le_mul_of_nonpos_left (by linarith [anti (a i) (a (m - i)) (b j) (b (m - j))]) hk
  · -- i ∈ σH, j ∈ σH
    have g := geom hi hj
    rw [show m - i - (m - j) = -(i - j) by ring, show m - i - (m - (m - j)) = -(i - (m - j)) by ring,
      nrm_neg, nrm_neg] at g
    have hk : 0 ≤ c (i - j) - c (i - (m - j)) := sub_nonneg.mpr (hc _ _ g)
    rw [hai, hai', hbj, hbj']
    exact mul_le_mul_of_nonneg_left (by linarith [rearr (a i) (a (m - i)) (b j) (b (m - j))]) hk
  · simp only [hj, sub_self, zero_mul, le_refl]
  · -- i fixed
    rw [hai, hai', hi]
    have e : a i * P m b j + a i * P m b (m - j) = a i * b j + a i * b (m - j) := by
      rw [← mul_add, ← mul_add, hpb]
    rw [e]
  · rw [hai, hai', hi]
    have e : a i * P m b j + a i * P m b (m - j) = a i * b j + a i * b (m - j) := by
      rw [← mul_add, ← mul_add, hpb]
    rw [e]
  · simp only [hj, sub_self, zero_mul, le_refl]

/-- **Lemma 1.3 (two-point inequality)**: `S_c(P_m a, P_m b) ≥ S_c(a, b)`. -/
theorem two_point {c : ZMod n → ℝ} (hc : SymDec c) (a b : ZMod n → ℝ) (m : ZMod n) :
    S c a b ≤ S c (P m a) (P m b) := by
  have h1 := four_S hc a b m
  have h2 := four_S hc (P m a) (P m b) m
  have h3 : ∑ i, ∑ j, ((c (i - j) - c (i - (m - j))) * (a i * b j + a (m - i) * b (m - j)) +
      c (i - (m - j)) * (a i + a (m - i)) * (b j + b (m - j))) ≤
      ∑ i, ∑ j, ((c (i - j) - c (i - (m - j))) *
        (P m a i * P m b j + P m a (m - i) * P m b (m - j)) +
      c (i - (m - j)) * (P m a i + P m a (m - i)) * (P m b j + P m b (m - j))) :=
    Finset.sum_le_sum fun i _ => Finset.sum_le_sum fun j _ => T_le hc a b m i j
  linarith

/-- `P_m a` is a rearrangement of `a`. -/
theorem P_perm (m : ZMod n) (a : ZMod n → ℝ) : ∃ ρ : Equiv.Perm (ZMod n), P m a = a ∘ ρ := by
  classical
  let sw : ZMod n → Prop := fun z => (pref m z ∧ a z < a (m - z)) ∨
    (pref m (m - z) ∧ a (m - z) < a z)
  have hsw : ∀ z, sw (m - z) ↔ sw z := by
    intro z
    simp only [sw, sub_sub_cancel]
    tauto
  let f : ZMod n → ZMod n := fun z => if sw z then m - z else z
  have hf : Function.Involutive f := by
    intro z
    by_cases h : sw z
    · have h' : sw (m - z) := (hsw z).mpr h
      simp only [f, ite_eq_left h, ite_eq_left h', sub_sub_cancel]
    · simp only [f, ite_eq_right h]
  refine ⟨hf.toPerm f, ?_⟩
  funext z
  simp only [Function.comp_apply, Function.Involutive.coe_toPerm]
  rcases pol_cases m z a with ⟨h1, hP, -⟩ | ⟨h1, hP, -⟩ | ⟨h1, hP, -⟩
  · rw [hP]
    by_cases hlt : a z < a (m - z)
    · have : sw z := Or.inl ⟨h1, hlt⟩
      simp only [f, ite_eq_left this]; exact max_eq_right hlt.le
    · have : ¬ sw z := by
        rintro (⟨-, h⟩ | ⟨h, -⟩)
        · exact hlt h
        · exact pref_excl h1 h
      simp only [f, ite_eq_right this]; exact max_eq_left (not_lt.mp hlt)
  · rw [hP]
    by_cases hlt : a (m - z) < a z
    · have : sw z := Or.inr ⟨h1, hlt⟩
      simp only [f, ite_eq_left this]; exact min_eq_right hlt.le
    · have : ¬ sw z := by
        rintro (⟨h, -⟩ | ⟨-, h⟩)
        · exact pref_excl h h1
        · exact hlt h
      simp only [f, ite_eq_right this]; exact min_eq_left (not_lt.mp hlt)
  · rw [hP]
    by_cases h : sw z
    · simp only [f, ite_eq_left h, h1]
    · simp only [f, ite_eq_right h]

/-- The potential `∑ |z|_n a_z`. -/
noncomputable def pot (a : ZMod n → ℝ) : ℝ := ∑ z, (nrm z : ℝ) * a z

theorem two_pot (m : ZMod n) (a : ZMod n → ℝ) :
    2 * pot a = ∑ z, ((nrm z : ℝ) * a z + (nrm (m - z) : ℝ) * a (m - z)) := by
  rw [Finset.sum_add_distrib, two_mul]
  unfold pot
  congr 1
  exact (Fintype.sum_equiv (Equiv.subLeft m) (fun z => (nrm (m - z) : ℝ) * a (m - z))
    (fun z => (nrm z : ℝ) * a z) (fun z => rfl)).symm

/-- For `m ≠ 0`, polarization does not increase the potential. -/
theorem pot_pt {m : ZMod n} (hm : m ≠ 0) (a : ZMod n → ℝ) (z : ZMod n) :
    (nrm z : ℝ) * P m a z + (nrm (m - z) : ℝ) * P m a (m - z) ≤
      (nrm z : ℝ) * a z + (nrm (m - z) : ℝ) * a (m - z) ∧
    (P m a z ≠ a z → (nrm z : ℝ) * P m a z + (nrm (m - z) : ℝ) * P m a (m - z) <
      (nrm z : ℝ) * a z + (nrm (m - z) : ℝ) * a (m - z)) := by
  rcases pol_cases m z a with ⟨h1, hP, hP'⟩ | ⟨h1, hP, hP'⟩ | ⟨h1, hP, hP'⟩
  · unfold pref at h1
    rw [ite_eq_right hm] at h1
    have hw : (nrm z : ℝ) < nrm (m - z) := by exact_mod_cast h1
    rw [hP, hP']
    rcases le_total (a z) (a (m - z)) with h | h
    · rw [max_eq_right h, min_eq_left h]
      refine ⟨by nlinarith, fun hne => ?_⟩
      have hlt : a z < a (m - z) := lt_of_le_of_ne h (Ne.symm hne)
      nlinarith
    · rw [max_eq_left h, min_eq_right h]
      exact ⟨le_refl _, fun hne => absurd rfl hne⟩
  · unfold pref at h1
    rw [ite_eq_right hm, sub_sub_cancel] at h1
    have hw : (nrm (m - z) : ℝ) < nrm z := by exact_mod_cast h1
    rw [hP, hP']
    rcases le_total (a z) (a (m - z)) with h | h
    · rw [max_eq_right h, min_eq_left h]
      exact ⟨le_refl _, fun hne => absurd rfl hne⟩
    · rw [max_eq_left h, min_eq_right h]
      refine ⟨by nlinarith, fun hne => ?_⟩
      have hlt : a (m - z) < a z := lt_of_le_of_ne h hne
      nlinarith
  · rw [hP, hP']
    exact ⟨le_refl _, fun hne => absurd rfl hne⟩

theorem pot_le {m : ZMod n} (hm : m ≠ 0) (a : ZMod n → ℝ) : pot (P m a) ≤ pot a := by
  have h1 := two_pot m a
  have h2 := two_pot m (P m a)
  have h3 := Finset.sum_le_sum (fun z (_ : z ∈ (univ : Finset (ZMod n))) => (pot_pt hm a z).1)
  linarith

theorem pot_lt {m : ZMod n} (hm : m ≠ 0) (a : ZMod n → ℝ) (hne : P m a ≠ a) :
    pot (P m a) < pot a := by
  have h1 := two_pot m a
  have h2 := two_pot m (P m a)
  obtain ⟨z, hz⟩ : ∃ z, P m a z ≠ a z := by
    by_contra h
    push Not at h
    exact hne (funext h)
  have h3 := Finset.sum_lt_sum (fun z (_ : z ∈ (univ : Finset (ZMod n))) => (pot_pt hm a z).1)
    ⟨z, mem_univ _, (pot_pt hm a z).2 hz⟩
  linarith

omit [NeZero n] in
/-- **Lemma 1.4**: a vector fixed by every `P_m`, `m ≠ 0`, is radially nonincreasing. -/
theorem radial {v : ZMod n → ℝ} (hv : ∀ m, m ≠ 0 → P m v = v) (x y : ZMod n)
    (hxy : nrm x < nrm y) : v y ≤ v x := by
  have hm : x + y ≠ 0 := by
    intro h
    have : y = -x := by linear_combination h
    rw [this, nrm_neg] at hxy
    exact lt_irrefl _ hxy
  have hpref : pref (x + y) x := by
    unfold pref
    rw [ite_eq_right hm, add_sub_cancel_left]
    exact hxy
  have := congrFun (hv _ hm) x
  unfold P at this
  rw [ite_eq_left hpref, add_sub_cancel_left] at this
  rw [← this]
  exact le_max_right _ _

/-- The canonical arrangement: nonincreasing along `0, 1, -1, 2, -2, …`. -/
def Canon (v : ZMod n → ℝ) : Prop :=
  (∀ x y : ZMod n, nrm x < nrm y → v y ≤ v x) ∧ (∀ z : ZMod n, pref 0 z → v (-z) ≤ v z)

theorem P_bounds (m z : ZMod n) (v : ZMod n → ℝ) :
    min (v z) (v (m - z)) ≤ P m v z ∧ P m v z ≤ max (v z) (v (m - z)) := by
  rcases pol_cases m z v with ⟨-, hP, -⟩ | ⟨-, hP, -⟩ | ⟨-, hP, -⟩ <;> rw [hP]
  · exact ⟨min_le_max, le_refl _⟩
  · exact ⟨le_refl _, min_le_max⟩
  · exact ⟨min_le_left _ _, le_max_left _ _⟩

/-- The final step `P_0` keeps radial monotonicity and fixes the orientation. -/
theorem canon_P0 {v : ZMod n → ℝ} (hv : ∀ x y : ZMod n, nrm x < nrm y → v y ≤ v x) :
    Canon (P 0 v) := by
  constructor
  · intro x y hxy
    obtain ⟨hx1, -⟩ := P_bounds 0 x v
    obtain ⟨-, hy2⟩ := P_bounds 0 y v
    rw [zero_sub] at hx1 hy2
    have hxy' : nrm (-x) < nrm y := by rwa [nrm_neg]
    have hxy'' : nrm x < nrm (-y) := by rwa [nrm_neg]
    have hxy''' : nrm (-x) < nrm (-y) := by rwa [nrm_neg, nrm_neg]
    have a1 := hv x y hxy
    have a2 := hv (-x) y hxy'
    have a3 := hv x (-y) hxy''
    have a4 := hv (-x) (-y) hxy'''
    calc P 0 v y ≤ max (v y) (v (-y)) := hy2
      _ ≤ min (v x) (v (-x)) := max_le (le_min a1 a2) (le_min a3 a4)
      _ ≤ P 0 v x := hx1
  · intro z hz
    rcases pol_cases 0 z v with ⟨-, hP, hP'⟩ | ⟨h1, -, -⟩ | ⟨h1, -, -⟩
    · rw [← zero_sub, hP, hP']; exact min_le_max
    · exact absurd h1 (pref_excl hz)
    · rw [← zero_sub, h1]

/-- **Theorem D (discrete cyclic Riesz inequality)**: some canonical rearrangements `a ∘ π`,
`b ∘ τ` satisfy `S_c(a, b) ≤ S_c(a ∘ π, b ∘ τ)`. -/
theorem discrete_riesz {c : ZMod n → ℝ} (hc : SymDec c) (a b : ZMod n → ℝ) :
    ∃ π τ : Equiv.Perm (ZMod n), Canon (a ∘ π) ∧ Canon (b ∘ τ) ∧
      S c a b ≤ S c (a ∘ π) (b ∘ τ) := by
  classical
  -- minimise the potential among rearrangements that do not decrease `S`
  set F := (univ : Finset (Equiv.Perm (ZMod n) × Equiv.Perm (ZMod n))).filter
    (fun p => S c a b ≤ S c (a ∘ p.1) (b ∘ p.2)) with hF
  have hne : F.Nonempty := ⟨(1, 1), by simp [hF]⟩
  obtain ⟨⟨π, τ⟩, hmem, hmin⟩ := F.exists_min_image (fun p => pot (a ∘ p.1) + pot (b ∘ p.2)) hne
  have hS : S c a b ≤ S c (a ∘ π) (b ∘ τ) := (Finset.mem_filter.mp hmem).2
  have hfix : ∀ m, m ≠ 0 → P m (a ∘ π) = a ∘ π ∧ P m (b ∘ τ) = b ∘ τ := by
    intro m hm
    obtain ⟨ρ, hρ⟩ := P_perm m (a ∘ π)
    obtain ⟨ρ', hρ'⟩ := P_perm m (b ∘ τ)
    have hmem' : (π * ρ, τ * ρ') ∈ F := by
      refine Finset.mem_filter.mpr ⟨mem_univ _, ?_⟩
      simp only [Equiv.Perm.coe_mul]
      rw [← Function.comp_assoc, ← Function.comp_assoc, ← hρ, ← hρ']
      exact hS.trans (two_point hc _ _ m)
    have hle := hmin _ hmem'
    simp only [Equiv.Perm.coe_mul] at hle
    rw [← Function.comp_assoc, ← Function.comp_assoc, ← hρ, ← hρ'] at hle
    have l1 := pot_le hm (a ∘ π)
    have l2 := pot_le hm (b ∘ τ)
    constructor
    · by_contra h
      have := pot_lt hm _ h
      linarith
    · by_contra h
      have := pot_lt hm _ h
      linarith
  have rad_a := radial (fun m hm => (hfix m hm).1)
  have rad_b := radial (fun m hm => (hfix m hm).2)
  obtain ⟨ρ, hρ⟩ := P_perm 0 (a ∘ π)
  obtain ⟨ρ', hρ'⟩ := P_perm 0 (b ∘ τ)
  refine ⟨π * ρ, τ * ρ', ?_, ?_, ?_⟩
  · simp only [Equiv.Perm.coe_mul]
    rw [← Function.comp_assoc, ← hρ]
    exact canon_P0 rad_a
  · simp only [Equiv.Perm.coe_mul]
    rw [← Function.comp_assoc, ← hρ']
    exact canon_P0 rad_b
  · simp only [Equiv.Perm.coe_mul]
    rw [← Function.comp_assoc, ← Function.comp_assoc, ← hρ, ← hρ']
    exact hS.trans (two_point hc _ _ 0)

/-- The canonical position of `z` in the order `0, 1, -1, 2, -2, …` (0-indexed). -/
def key (z : ZMod n) : ℕ :=
  if z.val = 0 then 0 else if 2 * z.val ≤ n then 2 * z.val - 1 else 2 * (n - z.val)

theorem key_inj {x y : ZMod n} (h : key x = key y) : x = y := by
  apply ZMod.val_injective
  have hx := ZMod.val_lt x
  have hy := ZMod.val_lt y
  unfold key at h
  split_ifs at h <;> omega

/-- A canonical vector is nonincreasing along the canonical order. -/
theorem canon_key {v : ZMod n → ℝ} (hv : Canon v) {x y : ZMod n} (h : key x < key y) :
    v y ≤ v x := by
  have hx := ZMod.val_lt x
  have hy := ZMod.val_lt y
  have hle : nrm x ≤ nrm y := by
    rw [nrm_eq, nrm_eq]
    unfold key at h
    split_ifs at h ⊢ <;> omega
  rcases lt_or_eq_of_le hle with hlt | heq
  · exact hv.1 x y hlt
  · have hyx : y = -x := by
      apply ZMod.val_injective
      rw [vneg]
      rw [nrm_eq, nrm_eq] at heq
      unfold key at h
      split_ifs at h heq ⊢ <;> omega
    subst hyx
    have hp : pref 0 x := by
      unfold pref
      rw [ite_eq_left rfl]
      unfold key at h
      rw [vneg] at h
      split_ifs at h <;> omega
    exact hv.2 x hp

/-- **Uniqueness of the canonical arrangement**: a canonical rearrangement of a canonical vector
is the vector itself. -/
theorem canon_unique {v : ZMod n → ℝ} (π : Equiv.Perm (ZMod n)) (hv : Canon v)
    (hw : Canon (v ∘ π)) : v ∘ π = v := by
  classical
  have hcard : ∀ t : ℝ, (univ.filter (fun z => t < (v ∘ π) z)).card =
      (univ.filter (fun z => t < v z)).card := by
    intro t
    refine Finset.card_bij (fun z _ => π z) ?_ ?_ ?_
    · intro z hz
      simp only [mem_filter, mem_univ, true_and, Function.comp_apply] at hz ⊢
      exact hz
    · intro a _ b _ h
      exact π.injective h
    · intro w hw'
      refine ⟨π.symm w, ?_, by simp⟩
      simp only [mem_filter, mem_univ, true_and, Function.comp_apply] at hw' ⊢
      simpa using hw'
  have nested : ∀ f g : ZMod n → ℝ, Canon f → Canon g → ∀ t : ℝ,
      univ.filter (fun z => t < f z) ⊆ univ.filter (fun z => t < g z) ∨
      univ.filter (fun z => t < g z) ⊆ univ.filter (fun z => t < f z) := by
    intro f g hf hg t
    by_contra hcon
    obtain ⟨h1, h2⟩ := not_or.mp hcon
    rw [Finset.not_subset] at h1 h2
    obtain ⟨a, ha, hna⟩ := h1
    obtain ⟨b, hb, hnb⟩ := h2
    simp only [mem_filter, mem_univ, true_and] at ha hna hb hnb
    rcases lt_trichotomy (key a) (key b) with hab | hab | hab
    · exact hna (lt_of_lt_of_le hb (canon_key hg hab))
    · exact hna (by rw [key_inj hab]; exact hb)
    · exact hnb (lt_of_lt_of_le ha (canon_key hf hab))
  have key_fact : ∀ f g : ZMod n → ℝ, Canon f → Canon g →
      (∀ t : ℝ, (univ.filter (fun z => t < f z)).card = (univ.filter (fun z => t < g z)).card) →
      ∀ z, ¬ f z < g z := by
    intro f g hf hg hc z hlt
    have hzB : z ∈ univ.filter (fun y => f z < g y) := by simp [hlt]
    have hzA : z ∉ univ.filter (fun y => f z < f y) := by simp
    rcases nested f g hf hg (f z) with hAB | hBA
    · have heq := Finset.eq_of_subset_of_card_le hAB (le_of_eq (hc (f z)).symm)
      rw [heq] at hzA
      exact hzA hzB
    · exact hzA (hBA hzB)
  funext z
  rcases lt_trichotomy ((v ∘ π) z) (v z) with h | h | h
  · exact absurd h (key_fact (v ∘ π) v hw hv hcard z)
  · exact h
  · exact absurd h (key_fact v (v ∘ π) hv hw (fun t => (hcard t).symm) z)

/-- **Theorem D** in the form of proof.md: for any canonical arrangements `a^# = a ∘ σ` and
`b^# = b ∘ τ`, `S_c(a, b) ≤ S_c(a^#, b^#)`. -/
theorem discrete_riesz' {c : ZMod n → ℝ} (hc : SymDec c) (a b : ZMod n → ℝ)
    (σ τ : Equiv.Perm (ZMod n)) (ha : Canon (a ∘ σ)) (hb : Canon (b ∘ τ)) :
    S c a b ≤ S c (a ∘ σ) (b ∘ τ) := by
  obtain ⟨π, π', hπ, hπ', hS⟩ := discrete_riesz hc a b
  have e1 : a ∘ π = a ∘ σ := by
    have hre : (a ∘ σ) ∘ ⇑(σ⁻¹ * π) = a ∘ π := by
      funext z; simp
    have := canon_unique (σ⁻¹ * π) ha (by rw [hre]; exact hπ)
    rw [← this, hre]
  have e2 : b ∘ π' = b ∘ τ := by
    have hre : (b ∘ τ) ∘ ⇑(τ⁻¹ * π') = b ∘ π' := by
      funext z; simp
    have := canon_unique (τ⁻¹ * π') hb (by rw [hre]; exact hπ')
    rw [← this, hre]
  rw [← e1, ← e2]
  exact hS

end EP1038.Riesz
