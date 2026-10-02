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
# Erdős Problem 1136

*References:*
- [erdosproblems.com/1136](https://www.erdosproblems.com/1136)
- [Mu11] Müller, Helmut, *Über ein additiv-zahlentheoretisches Problem von P. Erdős*.
  Mitt. Math. Ges. Hamburg (2011), 75-78.
-/

@[expose] public section

namespace Erdos1136

/--
A set `A` of natural numbers has the property in the question if `a + b ≠ 2 ^ k` for all
`a, b ∈ A` (not necessarily distinct) and all `k ≥ 0`.
-/
def AvoidsPowersOfTwo (A : Set ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ k : ℕ, a + b ≠ 2 ^ k

/-- The set of all integers congruent to $3\cdot 2^i\pmod{2^{i+2}}$ for some $i\geq 0$. -/
def muellerSet : Set ℕ := {n | ∃ i : ℕ, n ≡ 3 * 2 ^ i [MOD 2 ^ (i + 2)]}

/--
Does there exist $A\subset \mathbb{N}$ with lower density $>1/3$ such that $a+b\neq 2^k$ for
any $a,b\in A$ and $k\geq 0$?

Müller [Mu11] settled this question in the affirmative: in fact one can take $A$ to be
the set of all integers congruent to $3\cdot 2^i\pmod{2^{i+2}}$ for any $i\geq 0$, which has
density $1/2$.
-/
@[category research solved, AMS 11, formal_proof using lean4 at "https://github.com/plby/lean-proofs/blob/main/src/v4.29.1/ErdosProblems/Erdos1136.lean"]
theorem erdos_1136 : answer(True) ↔
    ∃ A : Set ℕ, (1 / 3 : ℝ) < A.lowerDensity ∧ AvoidsPowersOfTwo A := by
  sorry

/--
Achieving density $1/3$ is trivial, taking $A$ to be all multiples of $3$.
-/
@[category research solved, AMS 11]
theorem erdos_1136.variants.multiples_of_three :
    AvoidsPowersOfTwo {n : ℕ | 3 ∣ n} ∧ Set.HasDensity {n : ℕ | 3 ∣ n} (1 / 3) := by
  constructor
  · intro a ha b hb k heq
    have hdiv : 3 ∣ 2 ^ k := heq ▸ dvd_add ha hb
    have hcop : Nat.Coprime 3 (2 ^ k) :=
      Nat.Coprime.pow_right k (by decide : Nat.Coprime 3 2)
    exact (Nat.prime_three.coprime_iff_not_dvd.mp hcop) hdiv
  · have hcount (n : ℕ) :
        ({x : ℕ | 3 ∣ x} ∩ Set.Iio n).ncard =
        ((Finset.range n).filter fun x => 3 ∣ x).card := by
      rw [← Set.ncard_coe_finset]
      congr 1
      ext x
      simp [Finset.mem_filter, Finset.mem_range, and_comm]
    have hcount_succ (N : ℕ) :
        ((Finset.range (N + 1)).filter fun x => 3 ∣ x).card = N / 3 + 1 := by
      have hset : ((Finset.range (N + 1)).filter fun x => 3 ∣ x) =
          insert 0 ((Finset.Ioc 0 N).filter fun x => 3 ∣ x) := by
        ext x
        simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_insert,
          Finset.mem_Ioc]
        constructor
        · intro hx
          by_cases hz : x = 0
          · exact Or.inl hz
          · exact Or.inr ⟨⟨by omega, by omega⟩, hx.2⟩
        · intro hx
          rcases hx with rfl | hx
          · simp
          · exact ⟨by omega, hx.2⟩
      rw [hset, Finset.card_insert_of_notMem (by simp), Nat.Ioc_filter_dvd_card_eq_div]
    have hevent : ∀ᶠ n : ℕ in Filter.atTop,
        (1 / 3 : ℝ) ≤ (({x : ℕ | 3 ∣ x} ∩ Set.Iio n).ncard : ℝ) / n ∧
        (({x : ℕ | 3 ∣ x} ∩ Set.Iio n).ncard : ℝ) / n ≤ 1 / 3 + 1 / n := by
      filter_upwards [Filter.eventually_ge_atTop (1 : ℕ)] with n hn
      obtain ⟨N, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : n ≠ 0)
      rw [hcount, hcount_succ]
      have hlow : N + 1 ≤ 3 * (N / 3 + 1) := by omega
      have hhigh : 3 * (N / 3 + 1) ≤ N + 3 := by omega
      have hlowR : ((N + 1 : ℕ) : ℝ) / 3 ≤ ((N / 3 + 1 : ℕ) : ℝ) := by
        have hh : ((N + 1 : ℕ) : ℝ) ≤ 3 * ((N / 3 + 1 : ℕ) : ℝ) := by
          exact_mod_cast hlow
        linarith
      have hhighR : ((N / 3 + 1 : ℕ) : ℝ) ≤ ((N + 1 : ℕ) : ℝ) / 3 + 1 := by
        have hh : 3 * ((N / 3 + 1 : ℕ) : ℝ) ≤ ((N + 3 : ℕ) : ℝ) := by
          exact_mod_cast hhigh
        push_cast at hh ⊢
        linarith
      have hN : (0 : ℝ) < (N + 1 : ℕ) := by positivity
      constructor
      · have hh := div_le_div_of_nonneg_right hlowR hN.le
        have heq : (((N + 1 : ℕ) : ℝ) / 3) / (N + 1 : ℕ) = (1 / 3 : ℝ) := by
          field_simp
        exact heq ▸ hh
      · have hh := div_le_div_of_nonneg_right hhighR hN.le
        have heq : ((((N + 1 : ℕ) : ℝ) / 3) + 1) / (N + 1 : ℕ) =
            (1 / 3 : ℝ) + 1 / (N + 1 : ℕ) := by field_simp
        exact heq ▸ hh
    have hlim : Filter.Tendsto
        (fun n : ℕ => (({x : ℕ | 3 ∣ x} ∩ Set.Iio n).ncard : ℝ) / n)
        Filter.atTop (nhds (1 / 3 : ℝ)) := by
      have hupper : Filter.Tendsto (fun n : ℕ => (1 / 3 : ℝ) + 1 / n)
          Filter.atTop (nhds (1 / 3 : ℝ)) := by
        have hconst : Filter.Tendsto (fun _ : ℕ => (1 / 3 : ℝ)) Filter.atTop
            (nhds (1 / 3 : ℝ)) := tendsto_const_nhds
        have hone : Filter.Tendsto (fun n : ℕ => (1 : ℝ) / n) Filter.atTop
            (nhds (0 : ℝ)) := tendsto_one_div_atTop_nhds_zero_nat
        simpa using hconst.add hone
      exact Filter.Tendsto.squeeze' tendsto_const_nhds hupper
        (hevent.mono fun n h => h.1) (hevent.mono fun n h => h.2)
    simpa [Set.HasDensity, Set.partialDensity] using hlim

/--
Müller [Mu11] settled this question in the affirmative: in fact one can take $A$ to be
the set of all integers congruent to $3\cdot 2^i\pmod{2^{i+2}}$ for any $i\geq 0$, which has
density $1/2$.
-/
@[category research solved, AMS 11]
theorem erdos_1136.variants.mueller :
    AvoidsPowersOfTwo muellerSet ∧ muellerSet.HasDensity (1 / 2) := by
  sorry

open scoped Classical in
private theorem reflection_card_le (A : Set ℕ) (N : ℕ)
    (hA : ∀ a ∈ A, ∀ b ∈ A, a + b ≠ N) :
    2 * ((Finset.range (N + 1)).filter fun x => x ∈ A).card ≤ N + 1 := by
  classical
  let F : Finset ℕ := (Finset.range (N + 1)).filter fun x => x ∈ A
  let c : ℕ → ℕ := fun x => N - x
  have hle : ∀ x ∈ F, x ≤ N := by
    intro x hx
    have := (Finset.mem_filter.mp hx).1
    simp only [Finset.mem_range] at this
    omega
  have hinj : Set.InjOn c (F : Set ℕ) := by
    intro x hx y hy hxy
    have hxN := hle x hx
    have hyN := hle y hy
    dsimp [c] at hxy
    omega
  have hdisj : Disjoint F (F.image c) := by
    rw [Finset.disjoint_left]
    intro x hx hxim
    obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hxim
    have hcy : c y ∈ A := (Finset.mem_filter.mp hx).2
    have hyA : y ∈ A := (Finset.mem_filter.mp hy).2
    have hyN := hle y hy
    exact hA (c y) hcy y hyA (by dsimp [c]; omega)
  have hsub : F ∪ F.image c ⊆ Finset.range (N + 1) := by
    intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · exact (Finset.mem_filter.mp hx).1
    · obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hx
      have hyN := hle y hy
      apply Finset.mem_range.mpr
      dsimp [c]
      omega
  calc
    2 * F.card = (F ∪ F.image c).card := by
      rw [Finset.card_union_of_disjoint hdisj, Finset.card_image_of_injOn hinj]
      omega
    _ ≤ (Finset.range (N + 1)).card := Finset.card_le_card hsub
    _ = N + 1 := by simp

/--
Müller also proved this is best possible, in that $A$ with the property in the question has
lower density at most $1/2$.
-/
@[category research solved, AMS 11]
theorem erdos_1136.variants.upper_bound (A : Set ℕ) (hA : AvoidsPowersOfTwo A) :
    A.lowerDensity ≤ 1 / 2 := by
  classical
  rw [Set.lowerDensity]
  apply Filter.liminf_le_of_frequently_le
  · apply Filter.frequently_atTop.mpr
    intro b
    let k := Nat.clog 2 b
    let N := 2 ^ k
    have hb : b ≤ N := Nat.le_pow_clog (by norm_num) b
    refine ⟨N + 1, by omega, ?_⟩
    have havoidN : ∀ a ∈ A, ∀ c ∈ A, a + c ≠ N := by
      intro a ha c hc
      exact hA a ha c hc k
    have hcard := reflection_card_le A N havoidN
    have hcount : (A ∩ Set.Iio (N + 1)).ncard =
        ((Finset.range (N + 1)).filter fun x => x ∈ A).card := by
      rw [← Set.ncard_coe_finset]
      congr 1
      ext x
      simp [Finset.mem_range, and_comm]
    simp only [Set.partialDensity, Set.inter_univ, Set.univ_inter, hcount,
      Nat.ncard_Iio]
    have hcardR : 2 * (((Finset.range (N + 1)).filter fun x => x ∈ A).card : ℝ) ≤
        (N + 1 : ℕ) := by exact_mod_cast hcard
    have hN : (0 : ℝ) < (N + 1 : ℕ) := by positivity
    apply (div_le_iff₀ hN).2
    nlinarith
  · change ∃ c : ℝ, ∀ᶠ n : ℕ in Filter.atTop, c ≤ A.partialDensity Set.univ n
    exact ⟨0, Filter.Eventually.of_forall (fun n => by positivity)⟩

end Erdos1136

#print axioms Erdos1136.erdos_1136.variants.multiples_of_three
#print axioms Erdos1136.erdos_1136.variants.upper_bound
