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
# Erdős Problem 292

*References:*
- [erdosproblems.com/292](https://www.erdosproblems.com/292)
- [ErGr80] Erdős, P. and Graham, R., *Old and new problems and results in combinatorial number
  theory*. Monographies de L'Enseignement Mathematique (1980).
- [Ma00] Martin, Greg, *Denser Egyptian fractions*. Acta Arith. (2000), 231-260.
-/

@[expose] public section

open Filter Asymptotics

namespace Erdos292

/-- The set $A$ of $n\in \mathbb{N}$ such that there exist $1\leq m_1<\cdots <m_k=n$ with
$\sum\tfrac{1}{m_i}=1$. -/
def A : Set ℕ :=
  {n | ∃ S : Finset ℕ, S ⊆ Finset.Icc 1 n ∧ n ∈ S ∧ ∑ m ∈ S, (1 : ℚ) / m = 1}

/--
Let $A$ be the set of $n\in \mathbb{N}$ such that there exist $1\leq m_1<\cdots <m_k=n$ with
$\sum\tfrac{1}{m_i}=1$. Explore $A$. In particular, does $A$ have density $1$?

Straus observed that $A$ is closed under multiplication. Furthermore, it is easy to see that $A$
does not contain any prime power.

The answer is yes, as proved by Martin [Ma00], who in fact proved that if
$B=\mathbb{N}\backslash A$ then, for all large $x$,
$$\frac{\lvert B\cap [1,x]\rvert}{x}\asymp \frac{\log\log x}{\log x},$$
and also gave an essentially complete description of $B$ as those integers which are small
multiples of prime powers.

van Doorn has observed that if $n\in A$ (with $n>1$) then $2n\in A$ also, since if
$\sum \frac{1}{m_i}=1$ then $\frac{1}{2}+\sum\frac{1}{2m_i}=1$ also.
-/
@[category research solved, AMS 11, formal_proof using lean4 at
  "https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos292.lean#L116"]
theorem erdos_292 : answer(True) ↔ A.HasDensity 1 := by
  sorry

/-- Martin [Ma00] proved that if $B=\mathbb{N}\backslash A$ then
$\frac{\lvert B\cap [1,x]\rvert}{x}\asymp \frac{\log\log x}{\log x}$. -/
@[category research solved, AMS 11]
theorem erdos_292.variants.martin :
    (fun x : ℕ ↦ ((Aᶜ ∩ Set.Icc 1 x).ncard : ℝ) / x) =Θ[atTop]
      fun x ↦ Real.log (Real.log x) / Real.log x := by
  sorry

/-- Straus observed that $A$ is closed under multiplication. -/
@[category research solved, AMS 11]
theorem erdos_292.variants.mul : ∀ m ∈ A, ∀ n ∈ A, m * n ∈ A := by
  classical
  intro m hm n hn
  obtain ⟨S, hS, hmS, hsumS⟩ := hm
  obtain ⟨T, hT, hnT, hsumT⟩ := hn
  have hnpos : 0 < n := (Finset.mem_Icc.mp (hT hnT)).1
  have hmpos : 0 < m := (Finset.mem_Icc.mp (hS hmS)).1
  have hinj : Set.InjOn (fun x : ℕ ↦ n * x) S := by
    intro a _ b _ hab
    exact mul_left_cancel₀ (Nat.ne_of_gt hnpos) hab
  have hdisj : Disjoint (T.erase n) (S.image fun x ↦ n * x) := by
    apply Finset.disjoint_left.mpr
    intro x hx hx'
    obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp hx'
    have hxT : n * s ∈ T := Finset.mem_of_mem_erase hx
    have hxne : n * s ≠ n := Finset.ne_of_mem_erase hx
    have hxle : n * s ≤ n := (Finset.mem_Icc.mp (hT hxT)).2
    have hsone : 1 ≤ s := (Finset.mem_Icc.mp (hS hs)).1
    have hns : n ≤ n * s := by
      calc n = n * 1 := by simp
        _ ≤ n * s := Nat.mul_le_mul_left n hsone
    omega
  refine ⟨(T.erase n) ∪ S.image (fun x ↦ n * x), ?_, ?_, ?_⟩
  · intro x hx
    rcases Finset.mem_union.mp hx with hx | hx
    · have hxT : x ∈ T := Finset.mem_of_mem_erase hx
      have hxI := Finset.mem_Icc.mp (hT hxT)
      apply Finset.mem_Icc.mpr
      constructor
      · exact hxI.1
      · calc x ≤ n := hxI.2
          _ ≤ m * n := by simpa [mul_comm] using
            Nat.mul_le_mul_right n (Nat.one_le_iff_ne_zero.mpr (Nat.ne_of_gt hmpos))
    · obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp hx
      have hsI := Finset.mem_Icc.mp (hS hs)
      apply Finset.mem_Icc.mpr
      constructor
      · exact le_trans hnpos (by
          calc n = n * 1 := by simp
            _ ≤ n * s := Nat.mul_le_mul_left n hsI.1)
      · simpa [mul_comm] using Nat.mul_le_mul_left n hsI.2
  · apply Finset.mem_union.mpr
    right
    apply Finset.mem_image.mpr
    exact ⟨m, hmS, by ac_rfl⟩
  · rw [Finset.sum_union hdisj]
    have hscale : (∑ x ∈ S.image (fun x ↦ n * x), (1 : ℚ) / x) =
        (1 : ℚ) / n := by
      rw [Finset.sum_image hinj]
      calc
        (∑ x ∈ S, (1 : ℚ) / ↑(n * x)) =
            (1 : ℚ) / n * ∑ x ∈ S, (1 : ℚ) / x := by
              rw [Finset.mul_sum]
              apply Finset.sum_congr rfl
              intro x _
              simp only [Nat.cast_mul]
              ring
        _ = (1 : ℚ) / n := by rw [hsumS]; ring
    rw [hscale]
    have herase := Finset.sum_erase_add (s := T) (a := n)
      (f := fun x : ℕ ↦ (1 : ℚ) / x) hnT
    linarith [hsumT]

/-- $A$ does not contain any prime power. -/
@[category research solved, AMS 11]
theorem erdos_292.variants.prime_pow : ∀ n ∈ A, ¬ IsPrimePow n := by
  classical
  intro n hn hpp
  obtain ⟨S, hS, hnS, hsumS⟩ := hn
  obtain ⟨p, k, hp, hk, hpk⟩ := (isPrimePow_nat_iff n).mp hpp
  have : Fact (Nat.Prime p) := ⟨hp⟩
  have hnpos : 0 < n := (Finset.mem_Icc.mp (hS hnS)).1
  have hn1 : 1 < n := by
    have hnne : n ≠ 1 := hpp.ne_one
    omega
  have hSpos (s : ℕ) (hs : s ∈ S) : 0 < s :=
    (Finset.mem_Icc.mp (hS hs)).1
  have herase := Finset.sum_erase_add (s := S) (a := n)
    (f := fun s : ℕ ↦ (1 : ℚ) / s) hnS
  have hE : (∑ s ∈ S.erase n, (1 : ℚ) / s) + (1 : ℚ) / n = 1 := by
    rw [herase]
    exact hsumS
  have hne : (S.erase n).Nonempty := by
    by_contra h
    have he : S.erase n = ∅ := Finset.not_nonempty_iff_eq_empty.mp h
    have hq : (1 : ℚ) / n = 1 := by simpa [he] using hE
    have hnQ : (1 : ℚ) < n := by exact_mod_cast hn1
    have hq' : (1 : ℚ) / n < 1 := by
      apply (div_lt_iff₀ (by positivity : (0 : ℚ) < n)).2
      simpa using hnQ
    linarith
  have hval (s : ℕ) : padicValRat p ((1 : ℚ) / s) = -(padicValNat p s : ℤ) := by
    rw [one_div, padicValRat.inv, padicValRat.of_nat]
  have hvaln : padicValRat p ((1 : ℚ) / n) = -(k : ℤ) := by
    rw [hval, ← hpk, padicValNat.prime_pow]
  have hless (s : ℕ) (hs : s ∈ S.erase n) :
      padicValRat p ((1 : ℚ) / n) < padicValRat p ((1 : ℚ) / s) := by
    have hsS : s ∈ S := Finset.mem_of_mem_erase hs
    have hsne : s ≠ n := Finset.ne_of_mem_erase hs
    have hslt : s < n := by
      have := (Finset.mem_Icc.mp (hS hsS)).2
      omega
    have hspos : 0 < s := hSpos s hsS
    have hnotdvd : ¬ p ^ k ∣ s := by
      intro hdvd
      have hle : n ≤ s := by rw [← hpk]; exact Nat.le_of_dvd hspos hdvd
      omega
    have hvalk : padicValNat p s < k := by
      by_contra h
      exact hnotdvd ((Nat.pow_dvd_iff_le_padicValNat hp.ne_one (Nat.ne_of_gt hspos)).2 (by omega))
    rw [hvaln, hval]
    exact neg_lt_neg (by exact_mod_cast hvalk)
  let F : ℕ → ℚ := fun s ↦ if s = 0 then 1 else 1 / s
  have hFpos (s : ℕ) : 0 < F s := by
    by_cases hs : s = 0
    · simp [F, hs]
    · simp [F, hs]
      positivity
  have hFval (s : ℕ) (hs : s ∈ S.erase n) :
      padicValRat p (F n) < padicValRat p (F s) := by
    have hspos : 0 < s := hSpos s (Finset.mem_of_mem_erase hs)
    simpa [F, Nat.ne_of_gt hnpos, Nat.ne_of_gt hspos] using hless s hs
  have hlt := padicValRat.lt_sum_of_lt (p := p) (j := n) (S := S.erase n)
    (F := F) hne hFval hFpos
  have hFsum : (∑ s ∈ S.erase n, F s) = ∑ s ∈ S.erase n, (1 : ℚ) / s := by
    apply Finset.sum_congr rfl
    intro s hs
    simp [F, Nat.ne_of_gt (hSpos s (Finset.mem_of_mem_erase hs))]
  have hlt' : padicValRat p ((1 : ℚ) / n) <
      padicValRat p (∑ s ∈ S.erase n, (1 : ℚ) / s) := by
    rw [hFsum] at hlt
    simpa [F, Nat.ne_of_gt hnpos] using hlt
  have hsumpos : 0 < ∑ s ∈ S.erase n, (1 : ℚ) / s := by
    apply Finset.sum_pos
    · intro s hs
      have hspos := hSpos s (Finset.mem_of_mem_erase hs)
      positivity
    · exact hne
  have hqpos : (0 : ℚ) < 1 / n := by positivity
  have heq := padicValRat.add_eq_of_lt (p := p)
    (q := (1 : ℚ) / n) (r := ∑ s ∈ S.erase n, (1 : ℚ) / s)
    (by rw [add_comm, hE]; norm_num) (ne_of_gt hqpos) (ne_of_gt hsumpos) hlt'
  rw [add_comm, hE, padicValRat.one, hvaln] at heq
  omega

/-- van Doorn observed that if $n\in A$ (with $n>1$) then $2n\in A$ also. -/
@[category research solved, AMS 11]
theorem erdos_292.variants.two_mul : ∀ n ∈ A, 1 < n → 2 * n ∈ A := by
  classical
  intro n hn hn1
  obtain ⟨S, hS, hnS, hsumS⟩ := hn
  have hone : 1 ∉ S := by
    intro h1S
    have hnErase : n ∈ S.erase 1 := Finset.mem_erase.mpr ⟨by omega, hnS⟩
    have hle : (1 : ℚ) / n ≤ ∑ x ∈ S.erase 1, (1 : ℚ) / x := by
      exact Finset.single_le_sum (s := S.erase 1)
        (f := fun x : ℕ ↦ (1 : ℚ) / x) (by intro x hx; positivity) hnErase
    have hpos : (0 : ℚ) < 1 / n := by
      have hn0 : (n : ℚ) ≠ 0 := Nat.cast_ne_zero.mpr (by omega)
      positivity
    have herase := Finset.sum_erase_add (s := S) (a := 1)
      (f := fun x : ℕ ↦ (1 : ℚ) / x) h1S
    rw [hsumS] at herase
    norm_num at herase
    simp only [one_div] at hle hpos
    linarith
  have hinj : Set.InjOn (fun x : ℕ ↦ 2 * x) S := by
    intro a _ b _ hab
    exact mul_left_cancel₀ (by norm_num : (2 : ℕ) ≠ 0) hab
  have h2not : 2 ∉ S.image (fun x ↦ 2 * x) := by
    intro h2
    obtain ⟨x, hxS, hx⟩ := Finset.mem_image.mp h2
    have hx1 : x = 1 := by omega
    exact hone (hx1 ▸ hxS)
  refine ⟨insert 2 (S.image (fun x ↦ 2 * x)), ?_, ?_, ?_⟩
  · intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_Icc.mpr ⟨by omega, by omega⟩
    · obtain ⟨s, hsS, rfl⟩ := Finset.mem_image.mp hx
      have hsI := Finset.mem_Icc.mp (hS hsS)
      exact Finset.mem_Icc.mpr ⟨by omega, Nat.mul_le_mul_left 2 hsI.2⟩
  · apply Finset.mem_insert.mpr
    right
    exact Finset.mem_image.mpr ⟨n, hnS, rfl⟩
  · rw [Finset.sum_insert h2not, Finset.sum_image hinj]
    have hscale : (∑ x ∈ S, (1 : ℚ) / ↑(2 * x)) = (1 : ℚ) / 2 := by
      calc
        (∑ x ∈ S, (1 : ℚ) / ↑(2 * x)) =
            (1 : ℚ) / 2 * ∑ x ∈ S, (1 : ℚ) / x := by
              rw [Finset.mul_sum]
              apply Finset.sum_congr rfl
              intro x _
              simp only [Nat.cast_mul]
              ring
        _ = (1 : ℚ) / 2 := by rw [hsumS]; ring
    rw [hscale]
    norm_num

end Erdos292

#print axioms Erdos292.erdos_292.variants.mul
#print axioms Erdos292.erdos_292.variants.two_mul
#print axioms Erdos292.erdos_292.variants.prime_pow
