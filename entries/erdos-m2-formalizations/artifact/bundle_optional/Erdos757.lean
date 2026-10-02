/-
Copyright 2026 The Formal Conjectures Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-/
module

public import FormalConjecturesUtil

/-!
# Erdős Problem 757

*References:*
 - [erdosproblems.com/757](https://www.erdosproblems.com/757)
 - [GyLe95] Gyárfás, András and Lehel, Jenő, Linear sets with five distinct differences among any
    four elements. J. Combin. Theory Ser. B (1995), 108-118.
-/

@[expose] public section

open scoped Pointwise
open Filter

namespace Erdos757

/-- We say that `c` is admissible if, for any finite set `A` such that every four-element
subset `B` determines at least five positive differences, there exists a Sidon subset `S`
of size at least `c * A.ncard`. The difference condition is equivalent to
`11 ≤ (B - B).ncard`. -/
def IsAdmissible (c : ℝ) : Prop := ∀ {A : Set ℝ}, A.Finite → (∀ B ⊆ A,
  B.ncard = 4 → 11 ≤ (B - B).ncard) → ∃ S ⊆ A, IsSidon S ∧ c * A.ncard ≤ (S.ncard : ℝ)

open scoped Classical
set_option maxRecDepth 10000
set_option maxHeartbeats 2000000

private def base757 : Finset ℤ :=
  {0, 136, 200, 243, 246, 249, 272, 286, 298, 323, 400, 528, 596, 1056}

private theorem local757 :
    ∀ B ∈ base757.powersetCard 4, 11 ≤ (B - B).card := by
  decide

private def aps757 : Finset (Finset ℤ) :=
  { {0,136,272}, {0,200,400}, {0,298,596}, {0,528,1056},
    {136,596,1056}, {200,243,286}, {200,249,298}, {243,246,249},
    {246,272,298}, {246,323,400}, {249,286,323}, {272,400,528} }

private theorem cover757 :
    ∀ B ∈ base757.powersetCard 9, ∃ T ∈ aps757, T ⊆ B := by
  decide

private theorem ap_nosidon757 :
    ∀ T ∈ aps757, ¬ IsSidon (T : Set ℤ) := by
  decide

private def realBase757 : Set ℝ :=
  (Int.castRingHom ℝ) '' (base757 : Set ℤ)

private theorem lift_sidon757 {C : Finset ℤ}
    (h : IsSidon ((Int.castRingHom ℝ) '' (C : Set ℤ))) :
    IsSidon (C : Set ℤ) := by
  intro i₁ hi₁ j₁ hj₁ i₂ hi₂ j₂ hj₂ hsum
  have H := h (i₁ : ℝ) ⟨i₁, hi₁, rfl⟩ (j₁ : ℝ) ⟨j₁, hj₁, rfl⟩
    (i₂ : ℝ) ⟨i₂, hi₂, rfl⟩ (j₂ : ℝ) ⟨j₂, hj₂, rfl⟩
    (by exact_mod_cast hsum)
  rcases H with ⟨h₁, h₂⟩ | ⟨h₁, h₂⟩
  · exact Or.inl ⟨by exact_mod_cast h₁, by exact_mod_cast h₂⟩
  · exact Or.inr ⟨by exact_mod_cast h₁, by exact_mod_cast h₂⟩

private theorem preimage_bound757 {C : Finset ℤ}
    (hC : C ⊆ base757) (hS : IsSidon (C : Set ℤ)) : C.card ≤ 8 := by
  by_contra h
  have h9 : 9 ≤ C.card := by omega
  obtain ⟨T, hTC, hTcard⟩ := Finset.exists_subset_card_eq h9
  obtain ⟨U, hU, hUT⟩ := cover757 T (Finset.mem_powersetCard.mpr ⟨hTC.trans hC, hTcard⟩)
  exact ap_nosidon757 U hU (Set.IsSidon.subset hS (by exact_mod_cast hUT.trans hTC))

private theorem repr757 {B : Set ℝ} (hB : B ⊆ realBase757) :
    B = (Int.castRingHom ℝ) '' ((base757.filter (fun z => (Int.castRingHom ℝ) z ∈ B) : Finset ℤ) : Set ℤ) := by
  classical
  ext y
  constructor
  · intro hy
    obtain ⟨z, hz, rfl⟩ := hB hy
    have hzf : z ∈ base757.filter (fun z => (Int.castRingHom ℝ) z ∈ B) :=
      Finset.mem_filter.mpr ⟨hz, hy⟩
    exact ⟨z, hzf, rfl⟩
  · rintro ⟨z, hz, rfl⟩
    simp only [Finset.mem_coe, Finset.mem_filter] at hz
    exact hz.2

private theorem realBase_local757 : ∀ B ⊆ realBase757,
    B.ncard = 4 → 11 ≤ (B - B).ncard := by
  classical
  intro B hB hcard
  let C : Finset ℤ := base757.filter fun z => (Int.castRingHom ℝ) z ∈ B
  have hrepr : B = (Int.castRingHom ℝ) '' (C : Set ℤ) := repr757 hB
  have hinj : Function.Injective (Int.castRingHom ℝ) := by
    intro a b h
    change (a : ℝ) = (b : ℝ) at h
    exact_mod_cast h
  have hCcard : C.card = 4 := by
    rw [hrepr, Set.ncard_image_of_injective _ hinj, Set.ncard_coe_finset] at hcard
    exact hcard
  have hC : C ⊆ base757 := Finset.filter_subset _ _
  have hh := local757 C (Finset.mem_powersetCard.mpr ⟨hC, hCcard⟩)
  rw [hrepr, ← Set.image_sub (Int.castRingHom ℝ),
      Set.ncard_image_of_injective _ hinj]
  simpa only [← Finset.coe_sub, Set.ncard_coe_finset] using hh

private theorem realBase_card757 : realBase757.ncard = 14 := by
  have hinj : Function.Injective (Int.castRingHom ℝ) := by
    intro a b h
    change (a : ℝ) = (b : ℝ) at h
    exact_mod_cast h
  rw [realBase757, Set.ncard_image_of_injective _ hinj, Set.ncard_coe_finset]
  decide

private theorem upper757 : sSup {c : ℝ | IsAdmissible c} < 3 / 5 := by
  have hfinite : realBase757.Finite := (Finset.finite_toSet base757).image _
  have hbound : ∀ c : ℝ, IsAdmissible c → c ≤ 4 / 7 := by
    intro c hc
    obtain ⟨S, hS, hSid, hineq⟩ := hc hfinite realBase_local757
    let C : Finset ℤ := base757.filter fun z => (Int.castRingHom ℝ) z ∈ S
    have hrepr : S = (Int.castRingHom ℝ) '' (C : Set ℤ) := repr757 hS
    have hCsub : C ⊆ base757 := Finset.filter_subset _ _
    have hSidC : IsSidon (C : Set ℤ) := by
      rw [hrepr] at hSid
      exact lift_sidon757 hSid
    have hCcard := preimage_bound757 hCsub hSidC
    have hinj : Function.Injective (Int.castRingHom ℝ) := by
      intro a b h
      change (a : ℝ) = (b : ℝ) at h
      exact_mod_cast h
    have hScard : S.ncard = C.card := by
      rw [hrepr, Set.ncard_image_of_injective _ hinj, Set.ncard_coe_finset]
    rw [realBase_card757, hScard] at hineq
    have hCcardR : (C.card : ℝ) ≤ 8 := by exact_mod_cast hCcard
    norm_num at hineq ⊢
    nlinarith
  have hnonempty : {c : ℝ | IsAdmissible c}.Nonempty := by
    refine ⟨0, ?_⟩
    intro A hA hlocal
    refine ⟨∅, Set.empty_subset _, ?_, ?_⟩
    · simp [IsSidon]
    · simp
  have hs := csSup_le hnonempty (by intro c hc; exact hbound c hc)
  norm_num at hs ⊢
  linarith

/-- What is the supremum of the set of admissible numbers? -/
@[category research open, AMS 5]
theorem erdos_757 {A : Set ℝ} :
    answer(sorry) = sSup {c | IsAdmissible c} := by
  sorry

/-- The supremum is strictly larger than `1 / 2`, which is proved in [GyLe95]. -/
@[category research solved, AMS 5]
theorem erdos_757.variants.lowerBound {A : Set ℝ} : 1 / (2 : ℝ) < sSup {c | IsAdmissible c} := by
  sorry

/-- In [GyLe95], the authors also prove that the supremum is smaller than `3 / 5`. -/
@[category research solved, AMS 5]
theorem erdos_757.variants.upperBound {A : Set ℝ} : sSup {c | IsAdmissible c} < 3 / (5 : ℝ) := by
  exact upper757

end Erdos757

#print axioms Erdos757.erdos_757.variants.upperBound
