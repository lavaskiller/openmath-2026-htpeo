import Mathlib
import RamseyCert.Limit

namespace RamseyCert

open Finset Filter
open scoped BigOperators
attribute [local instance] Classical.propDecidable

private def good {m : ℕ} (c : Fin m → Fin m → Bool) (s : Finset (Fin m)) : Prop :=
  s.card = 4 ∧
    ((∀ u ∈ s, ∀ v ∈ s, u ≠ v → c u v = true) ∨
     (∀ u ∈ s, ∀ v ∈ s, u ≠ v → c u v = false))

private noncomputable def goodSets {m : ℕ} (c : Fin m → Fin m → Bool) :
    Finset (Finset (Fin m)) := Finset.univ.filter (good c)

private lemma card_goodSets {m : ℕ} (c : Fin m → Fin m → Bool) :
    (goodSets c).card = monoK4 c := by
  classical
  unfold monoK4
  congr 1
  ext s
  simp [goodSets, good]

private lemma good_map {m : ℕ} (c : Fin (m + 1) → Fin (m + 1) → Bool)
    (v : Fin (m + 1)) (s : Finset (Fin m)) :
    good (fun u w => c (v.succAbove u) (v.succAbove w)) s ↔
      good c (s.map v.succAboveEmb) := by
  simp only [good, Finset.card_map]
  constructor
  · rintro ⟨hs, hc⟩
    refine ⟨hs, ?_⟩
    rcases hc with hc | hc
    · left
      intro u hu w hw hne
      obtain ⟨u', hu', rfl⟩ := Finset.mem_map.mp hu
      obtain ⟨w', hw', rfl⟩ := Finset.mem_map.mp hw
      exact hc u' hu' w' hw' (fun h => hne (congrArg _ h))
    · right
      intro u hu w hw hne
      obtain ⟨u', hu', rfl⟩ := Finset.mem_map.mp hu
      obtain ⟨w', hw', rfl⟩ := Finset.mem_map.mp hw
      exact hc u' hu' w' hw' (fun h => hne (congrArg _ h))
  · rintro ⟨hs, hc⟩
    refine ⟨hs, ?_⟩
    rcases hc with hc | hc
    · left
      intro u hu w hw hne
      exact hc _ (Finset.mem_map.mpr ⟨u, hu, rfl⟩)
        _ (Finset.mem_map.mpr ⟨w, hw, rfl⟩) (v.succAboveEmb.injective.ne hne)
    · right
      intro u hu w hw hne
      exact hc _ (Finset.mem_map.mpr ⟨u, hu, rfl⟩)
        _ (Finset.mem_map.mpr ⟨w, hw, rfl⟩) (v.succAboveEmb.injective.ne hne)

private lemma card_restrict {m : ℕ} (c : Fin (m + 1) → Fin (m + 1) → Bool)
    (v : Fin (m + 1)) :
    monoK4 (fun u w : Fin m => c (v.succAbove u) (v.succAbove w)) =
      ((goodSets c).filter fun s => v ∉ s).card := by
  rw [← card_goodSets]
  apply Finset.card_bij (fun s _ => s.map v.succAboveEmb)
  · intro s hs
    have hgood : good (fun u w : Fin m => c (v.succAbove u) (v.succAbove w)) s := by
      simpa [goodSets] using hs
    simp only [Finset.mem_filter, goodSets, Finset.mem_filter, Finset.mem_univ,
      true_and]
    exact ⟨(good_map c v s).mp hgood, by
      intro hv
      obtain ⟨u, _, hu⟩ := Finset.mem_map.mp hv
      exact Fin.succAbove_ne v u hu⟩
  · intro s hs t ht hst
    exact Finset.map_injective v.succAboveEmb hst
  · intro t ht
    have htgood : good c t := by simpa [goodSets] using (Finset.mem_filter.mp ht).1
    have hvt : v ∉ t := (Finset.mem_filter.mp ht).2
    let s : Finset (Fin m) := Finset.univ.filter (fun u => v.succAbove u ∈ t)
    have hmap : s.map v.succAboveEmb = t := by
      ext x
      constructor
      · intro hx
        obtain ⟨u, hu, rfl⟩ := Finset.mem_map.mp hx
        exact (Finset.mem_filter.mp hu).2
      · intro hx
        obtain ⟨u, hu⟩ := Fin.exists_succAbove_eq (x := x) (y := v)
          (by intro heq; exact hvt (heq ▸ hx))
        exact Finset.mem_map.mpr ⟨u, Finset.mem_filter.mpr
          ⟨Finset.mem_univ _, hu ▸ hx⟩, hu⟩
    refine ⟨s, ?_, hmap⟩
    simp only [goodSets, Finset.mem_filter, Finset.mem_univ, true_and]
    exact (good_map c v s).mpr (hmap ▸ htgood)

private lemma sum_restrict {m : ℕ} (_hm : 4 ≤ m)
    (c : Fin (m + 1) → Fin (m + 1) → Bool) :
    (∑ v : Fin (m + 1),
      monoK4 (fun u w : Fin m => c (v.succAbove u) (v.succAbove w))) =
      (m - 3) * monoK4 c := by
  classical
  simp_rw [card_restrict c]
  have hcard (s : Finset (Fin (m + 1))) (hs : s ∈ goodSets c) :
      (Finset.univ.filter (fun v => v ∉ s)).card = m - 3 := by
    have hs4 : s.card = 4 := (by simpa [goodSets] using hs : good c s).1
    have heq : (Finset.univ.filter (fun v => v ∉ s)) = sᶜ := by ext v; simp
    rw [heq, Finset.card_compl, hs4]
    simp
  calc
    (∑ v : Fin (m + 1), ((goodSets c).filter fun s => v ∉ s).card) =
        ∑ v : Fin (m + 1), ∑ s ∈ goodSets c, if v ∉ s then (1 : ℕ) else 0 := by
          simp_rw [Finset.card_filter]
    _ = ∑ s ∈ goodSets c, ∑ v : Fin (m + 1), if v ∉ s then (1 : ℕ) else 0 := by
          rw [Finset.sum_comm]
    _ = ∑ s ∈ goodSets c, (m - 3) := by
          apply Finset.sum_congr rfl
          intro s hs
          simpa [Finset.card_filter] using hcard s hs
    _ = (m - 3) * monoK4 c := by simp [card_goodSets, mul_comm]

private lemma minMonoK4_le_mono {m : ℕ} (c : Fin m → Fin m → Bool)
    (hc : ∀ u v, c u v = c v u) : minMonoK4 m ≤ monoK4 c := by
  exact Nat.sInf_le ⟨c, hc, rfl⟩

private lemma minMonoK4_attained (m : ℕ) :
    ∃ c : Fin m → Fin m → Bool,
      (∀ u v, c u v = c v u) ∧ monoK4 c = minMonoK4 m := by
  have hne : {k : ℕ | ∃ c : Fin m → Fin m → Bool,
      (∀ u v, c u v = c v u) ∧ monoK4 c = k}.Nonempty := by
    refine ⟨monoK4 (fun _ _ => false), (fun _ _ => false), ?_, rfl⟩
    intro u v
    rfl
  exact Nat.sInf_mem hne

theorem minMonoK4_density_mono (m : ℕ) (hm : 4 ≤ m) :
    (minMonoK4 m : ℝ) / (m.choose 4 : ℝ) ≤
      (minMonoK4 (m + 1) : ℝ) / ((m + 1).choose 4 : ℝ) := by
  obtain ⟨c, hc, hcmin⟩ := minMonoK4_attained (m + 1)
  have hcount : (m + 1) * minMonoK4 m ≤ (m - 3) * minMonoK4 (m + 1) := by
    calc
      (m + 1) * minMonoK4 m =
          ∑ _ : Fin (m + 1), minMonoK4 m := by simp
      _ ≤ ∑ v : Fin (m + 1),
          monoK4 (fun u w : Fin m => c (v.succAbove u) (v.succAbove w)) := by
          apply Finset.sum_le_sum
          intro v _
          apply minMonoK4_le_mono
          intro u w
          exact hc _ _
      _ = (m - 3) * minMonoK4 (m + 1) := by rw [sum_restrict hm c, hcmin]
  have hchoose : (m + 1).choose 4 * (m - 3) = m.choose 4 * (m + 1) := by
    have hsub : m + 1 - 4 = m - 3 := by omega
    simpa only [hsub] using (Nat.choose_mul_succ_eq m 4).symm
  have hdenm : 0 < (m.choose 4 : ℝ) := by exact_mod_cast Nat.choose_pos hm
  have hdenp : 0 < ((m + 1).choose 4 : ℝ) := by
    exact_mod_cast Nat.choose_pos (by omega : 4 ≤ m + 1)
  have hreal : (m + 1 : ℝ) * (minMonoK4 m : ℝ) ≤
      ((m - 3 : ℕ) : ℝ) * (minMonoK4 (m + 1) : ℝ) := by
    exact_mod_cast hcount
  have hchooseR : ((m + 1).choose 4 : ℝ) * ((m - 3 : ℕ) : ℝ) =
      (m.choose 4 : ℝ) * (m + 1 : ℝ) := by exact_mod_cast hchoose
  apply (div_le_div_iff₀ hdenm hdenp).2
  have hpos : (0 : ℝ) < m + 1 := by positivity
  apply (mul_le_mul_iff_right₀ hpos).mp
  calc
    (m + 1 : ℝ) * ((minMonoK4 m : ℝ) * ((m + 1).choose 4 : ℝ)) =
        ((m + 1 : ℝ) * (minMonoK4 m : ℝ)) * ((m + 1).choose 4 : ℝ) := by ring
    _ ≤ (((m - 3 : ℕ) : ℝ) * (minMonoK4 (m + 1) : ℝ)) *
          ((m + 1).choose 4 : ℝ) :=
        mul_le_mul_of_nonneg_right hreal hdenp.le
    _ = (minMonoK4 (m + 1) : ℝ) *
          (((m + 1).choose 4 : ℝ) * ((m - 3 : ℕ) : ℝ)) := by ring
    _ = (minMonoK4 (m + 1) : ℝ) *
          ((m.choose 4 : ℝ) * (m + 1 : ℝ)) := by rw [hchooseR]
    _ = (m + 1 : ℝ) * ((minMonoK4 (m + 1) : ℝ) * (m.choose 4 : ℝ)) := by ring

private lemma minMonoK4_le_choose (m : ℕ) : minMonoK4 m ≤ m.choose 4 := by
  let c : Fin m → Fin m → Bool := fun _ _ => false
  calc
    minMonoK4 m ≤ monoK4 c := minMonoK4_le_mono c (by intro _ _; rfl)
    _ = (goodSets c).card := (card_goodSets c).symm
    _ ≤ ((Finset.univ : Finset (Fin m)).powersetCard 4).card := by
      apply Finset.card_le_card
      intro s hs
      have hgood : good c s := by simpa [goodSets] using hs
      exact Finset.mem_powersetCard.mpr ⟨Finset.subset_univ _, hgood.1⟩
    _ = m.choose 4 := by simp

private lemma density_le_one (m : ℕ) :
    (minMonoK4 m : ℝ) / (m.choose 4 : ℝ) ≤ 1 := by
  by_cases hm : 4 ≤ m
  · have hpos : 0 < (m.choose 4 : ℝ) := by exact_mod_cast Nat.choose_pos hm
    apply (div_le_iff₀ hpos).2
    simpa using (show (minMonoK4 m : ℝ) ≤ (m.choose 4 : ℝ) by
      exact_mod_cast minMonoK4_le_choose m)
  · have hzero : m.choose 4 = 0 := Nat.choose_eq_zero_of_lt (by omega)
    simp [hzero]

private lemma density_monoOn :
    MonotoneOn (fun m : ℕ => (minMonoK4 m : ℝ) / (m.choose 4 : ℝ))
      (Set.Ici 4) := by
  exact monotoneOn_nat_Ici_of_le_succ (fun n hn => minMonoK4_density_mono n hn)

theorem ramseyMultK4_tendsto :
    Filter.Tendsto (fun m : ℕ => (minMonoK4 m : ℝ) / (m.choose 4 : ℝ))
      Filter.atTop (nhds ramseyMultK4) := by
  let f : ℕ → ℝ := fun m => (minMonoK4 m : ℝ) / (m.choose 4 : ℝ)
  have hmon : MonotoneOn f (Set.Ici 4) := density_monoOn
  have hbdd : BddAbove (f '' Set.Ici 4) := by
    refine ⟨1, ?_⟩
    rintro x ⟨n, hn, rfl⟩
    exact density_le_one n
  have ht := Real.tendsto_atTop_csSup_of_monotoneOn_bddAbove_nat_Ici hmon hbdd
  change Filter.Tendsto f Filter.atTop (nhds (Filter.liminf f Filter.atTop))
  rw [ht.liminf_eq]
  exact ht

theorem minMonoK4_density_le (m : ℕ) (hm : 4 ≤ m) :
    (minMonoK4 m : ℝ) / (m.choose 4 : ℝ) ≤ ramseyMultK4 := by
  apply ge_of_tendsto ramseyMultK4_tendsto
  filter_upwards [Filter.eventually_ge_atTop m] with n hn
  exact density_monoOn hm (hm.trans hn) hn

#print axioms minMonoK4_density_mono
#print axioms ramseyMultK4_tendsto
#print axioms minMonoK4_density_le

end RamseyCert
