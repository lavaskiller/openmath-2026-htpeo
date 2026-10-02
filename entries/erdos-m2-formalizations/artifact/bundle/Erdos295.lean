/-
Copyright 2025 The Formal Conjectures Authors.

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
# Erdős Problem 295

*Reference:* [erdosproblems.com/295](https://www.erdosproblems.com/295)
-/

@[expose] public section

open scoped Real

namespace Erdos295

private theorem egyptian_greedy (a : ℕ) :
    ∀ (b d : ℕ), 0 < a → 0 < d → d * a < b →
      ∃ E : Finset ℕ, (∀ e ∈ E, d < e) ∧
        (a : ℚ) / b = ∑ e ∈ E, (1 : ℚ) / e := by
  classical
  induction a using Nat.strong_induction_on with
  | h a ih =>
    intro b d ha hd hbd
    let q := b ⌈/⌉ a
    have hqhi : b ≤ a * q := (ceilDiv_le_iff_le_mul ha).1 le_rfl
    have hqpos : 0 < q := by
      by_contra h
      have hq0 : q = 0 := by omega
      simp [hq0] at hqhi
      omega
    have hqlo : a * (q - 1) < b := by
      by_contra h
      have hle : q ≤ q - 1 := (ceilDiv_le_iff_le_mul ha).2 (by omega)
      omega
    have hdq : d < q := by
      by_contra h
      have hqle : q ≤ d := by omega
      have hmul : a * q ≤ d * a := Nat.mul_le_mul_left a hqle |>.trans_eq (mul_comm a d)
      omega
    let r := a * q - b
    have hrel : a * q = b + r := by omega
    have hrlt : r < a := by
      have hmul : a * q = a * (q - 1) + a := by
        conv_lhs => rw [show q = (q - 1) + 1 by omega]
        ring
      omega
    have hab : a < b := by nlinarith
    have hrb : r < b := by omega
    have hrat : (a : ℚ) / b = (1 : ℚ) / q + (r : ℚ) / (b * q) := by
      have hb0 : (b : ℚ) ≠ 0 := by exact_mod_cast (by omega : b ≠ 0)
      have hq0 : (q : ℚ) ≠ 0 := by exact_mod_cast (by omega : q ≠ 0)
      have hrel' : (a : ℚ) * q = b + r := by exact_mod_cast hrel
      field_simp
      nlinarith
    by_cases hr : r = 0
    · refine ⟨{q}, ?_, ?_⟩
      · intro e he
        simp only [Finset.mem_singleton] at he
        subst e
        exact hdq
      · simp [hr, hrat]
    · have hrpos : 0 < r := Nat.pos_of_ne_zero hr
      have hnext : q * r < b * q := by nlinarith
      obtain ⟨E, hE, hsum⟩ := ih r hrlt (b * q) q hrpos hqpos hnext
      have hqnot : q ∉ E := by
        intro h
        exact (Nat.lt_irrefl q) (hE q h)
      refine ⟨insert q E, ?_, ?_⟩
      · intro e he
        rcases Finset.mem_insert.mp he with rfl | he
        · exact hdq
        · exact hdq.trans (hE e he)
      · rw [Finset.sum_insert hqnot, ← hsum]
        simpa only [Nat.cast_mul] using hrat

private theorem harmonic_tail_exists (L : ℕ) :
    ∃ M : ℕ, L < M ∧ (1 : ℚ) ≤ ∑ j ∈ Finset.Ioc L M, (1 : ℚ) / j := by
  classical
  let f : ℕ → ℝ := fun j => (1 : ℝ) / j
  have hdiv := Real.tendsto_sum_range_one_div_nat_succ_atTop
  let C : ℝ := 1 + ∑ j ∈ Finset.Icc 1 L, f j
  obtain ⟨M, hM, hML⟩ :
      ∃ M : ℕ, C ≤ ∑ i ∈ Finset.range M, (1 : ℝ) / (i + 1) ∧ L ≤ M :=
    ((Filter.tendsto_atTop.1 hdiv C).and (Filter.eventually_ge_atTop L)).exists
  have hfull : (∑ i ∈ Finset.range M, (1 : ℝ) / (i + 1)) =
      ∑ j ∈ Finset.Icc 1 M, f j := by
    rw [show Finset.Icc 1 M = Finset.Ico 1 (M + 1) from by ext j; simp]
    rw [Finset.sum_Ico_eq_sum_range]
    simp [f, Nat.add_comm]
  have hsplit : Finset.Icc 1 M = Finset.Icc 1 L ∪ Finset.Ioc L M := by
    ext j
    simp only [Finset.mem_Icc, Finset.mem_union, Finset.mem_Ioc]
    omega
  have hdisj : Disjoint (Finset.Icc 1 L) (Finset.Ioc L M) := by
    apply Finset.disjoint_left.mpr
    intro j hj hk
    have hj' := Finset.mem_Icc.mp hj
    have hk' := Finset.mem_Ioc.mp hk
    omega
  have htail : (1 : ℝ) ≤ ∑ j ∈ Finset.Ioc L M, f j := by
    rw [hfull, hsplit, Finset.sum_union hdisj] at hM
    dsimp [C] at hM
    linarith
  have htailQ : (1 : ℚ) ≤ ∑ j ∈ Finset.Ioc L M, (1 : ℚ) / j := by
    have htail' : (1 : ℝ) ≤ ∑ j ∈ Finset.Ioc L M, (1 : ℝ) / j := by
      simpa [f] using htail
    apply (Rat.cast_le (K := ℝ)).mp
    simpa only [Rat.cast_one, Rat.cast_sum, Rat.cast_div, Rat.cast_natCast] using htail'
  refine ⟨M, ?_, htailQ⟩
  by_contra h
  have hle : M ≤ L := by omega
  have hempty : Finset.Ioc L M = ∅ := by simp [hle]
  simp [hempty, f] at htail
  linarith

private theorem egyptian_set (N : ℕ) :
    ∃ E : Finset ℕ, (∀ e ∈ E, N ≤ e) ∧
      ∑ e ∈ E, (1 : ℚ) / e = 1 := by
  classical
  let L := max N 1
  have hL : 1 ≤ L := le_max_right N 1
  have hNL : N ≤ L := le_max_left N 1
  let H : ℕ → ℚ := fun m => ∑ j ∈ Finset.Ioc L m, (1 : ℚ) / j
  have hex : ∃ m : ℕ, L < m ∧ 1 ≤ H m := by
    obtain ⟨m, hm, hsum⟩ := harmonic_tail_exists L
    exact ⟨m, hm, hsum⟩
  let m := Nat.find hex
  have hm : L < m ∧ 1 ≤ H m := Nat.find_spec hex
  have hmpos : 0 < m := by omega
  have hprev : H (m - 1) < 1 := by
    by_contra h
    have hge : (1 : ℚ) ≤ H (m - 1) := le_of_not_gt h
    by_cases hLprev : L < m - 1
    · exact (Nat.find_min hex (by omega : m - 1 < m)) ⟨hLprev, hge⟩
    · have hempty : Finset.Ioc L (m - 1) = ∅ := by simp [show m - 1 ≤ L by omega]
      simp [H, hempty] at hge
      linarith
  have hsplit : Finset.Ioc L m = insert m (Finset.Ioc L (m - 1)) := by
    ext j
    simp only [Finset.mem_Ioc, Finset.mem_insert]
    omega
  have hnot : m ∉ Finset.Ioc L (m - 1) := by simp; omega
  have hHsplit : H m = H (m - 1) + (1 : ℚ) / m := by
    simp only [H, hsplit, Finset.sum_insert hnot]
    ring
  let R : ℚ := 1 - H (m - 1)
  have hRpos : 0 < R := by dsimp [R]; linarith
  have hRle : R ≤ (1 : ℚ) / m := by
    dsimp [R]
    rw [hHsplit] at hm
    linarith [hm.2]
  let a : ℕ := R.num.natAbs
  let b : ℕ := R.den
  have hnumpos : 0 < R.num := Rat.num_pos.mpr hRpos
  have ha : 0 < a := by
    dsimp [a]
    exact Int.natAbs_pos.mpr (ne_of_gt hnumpos)
  have hb : 0 < b := R.den_pos
  have hRrepr : R = (a : ℚ) / b := by
    have hn : (a : ℤ) = R.num := by
      exact Int.natAbs_of_nonneg hnumpos.le
    have hcast : (R.num : ℚ) = (a : ℚ) := by exact_mod_cast hn.symm
    calc
      R = (R.num : ℚ) / R.den := R.num_div_den.symm
      _ = (a : ℚ) / b := by rw [hcast]
  have hm2 : 1 < m := by omega
  have ham : a * m ≤ b := by
    rw [hRrepr] at hRle
    have hq : (a : ℚ) * m ≤ b := by
      exact (div_le_div_iff₀ (by exact_mod_cast hb : (0 : ℚ) < b)
        (by exact_mod_cast hmpos : (0 : ℚ) < m)).mp hRle |>.trans_eq (by ring)
    exact_mod_cast hq
  have hbound : (m - 1) * a < b := by
    have hlt : (m - 1) * a < m * a := Nat.mul_lt_mul_of_pos_right (by omega) ha
    nlinarith [ham]
  obtain ⟨E', hE', hsumE'⟩ := egyptian_greedy a b (m - 1) ha (by omega) hbound
  let E := Finset.Ioc L (m - 1) ∪ E'
  have hdisj : Disjoint (Finset.Ioc L (m - 1)) E' := by
    apply Finset.disjoint_left.mpr
    intro e he he'
    have he1 := Finset.mem_Ioc.mp he
    have he2 := hE' e he'
    omega
  refine ⟨E, ?_, ?_⟩
  · intro e he
    rcases Finset.mem_union.mp he with he | he
    · exact hNL.trans (Finset.mem_Ioc.mp he).1.le
    · have := hE' e he
      omega
  · dsimp [E]
    rw [Finset.sum_union hdisj]
    have hsumR : R = ∑ e ∈ E', (1 : ℚ) / e := by
      simpa only [← hRrepr] using hsumE'
    rw [← hsumR]
    dsimp [R, H]
    ring

/--
Helper lemma: for each $N$, there exists $k$ and $n_1 < ... < n_k$ such that
$N ≤ n_1 < ⋯ < n_k$ with $\frac 1 {n_1} + ... + \frac 1 {n_k} = 1$.
-/
@[category textbook, AMS 5 11]
lemma exists_k (N : ℕ) : ∃ (k : ℕ) (n : Fin k → ℕ),
    (∀ i, N ≤ n i) ∧ StrictMono n ∧ ∑ i, (1 / n i : ℝ) = 1 := by
  classical
  obtain ⟨E, hE, hsum⟩ := egyptian_set N
  let n : Fin E.card → ℕ := E.orderEmbOfFin rfl
  refine ⟨E.card, n, ?_, ?_, ?_⟩
  · intro i
    exact hE _ (E.orderEmbOfFin_mem rfl i)
  · exact (E.orderEmbOfFin rfl).strictMono
  · have hcast := congrArg (fun q : ℚ => (q : ℝ)) hsum
    have hsumR : ∑ e ∈ E, (1 : ℝ) / e = 1 := by
      simpa only [Rat.cast_sum, Rat.cast_div, Rat.cast_one, Rat.cast_natCast] using hcast
    have hsumimage : (∑ e ∈ E, (1 : ℝ) / e) =
        ∑ i : Fin E.card, (1 : ℝ) / E.orderEmbOfFin rfl i := by
      conv_lhs => rw [← Finset.image_orderEmbOfFin_univ E rfl]
      rw [Finset.sum_image]
      exact (E.orderEmbOfFin rfl).injective.injOn
    calc
      ∑ i : Fin E.card, (1 : ℝ) / n i = ∑ e ∈ E, (1 : ℝ) / e := by
        simpa only [n] using hsumimage.symm
      _ = 1 := hsumR

/--
Let $k(N)$ denote the smallest $k$ such that there exists
$N ≤ n_1 < ⋯ < n_k$ with $\frac 1 {n_1} + ... + \frac 1 {n_k} = 1$.
-/
noncomputable abbrev k (N : ℕ) : ℕ :=
  open scoped Classical in
  Nat.find (exists_k N)


/--
Let $k(N)$ denote the smallest $k$ such that there exists
$N ≤ n_1 < ⋯ < n_k$ with $\frac 1 {n_1} + ... + \frac 1 {n_k} = 1$

Is it true that $\lim_{N \to \infty} k(N) - (e - 1)N = \infty$?
-/
@[category research open, AMS 5 11]
theorem erdos_295 :
    answer(sorry) ↔ Filter.atTop.Tendsto (fun N => k N - (rexp 1 - 1)*N) Filter.atTop := by
  sorry

/--
Erdős and Straus have proved the existence of some constant $c>0$
such that $-c < k(N)-(e-1)N \ll \frac N {\log N}$
-/
@[category research solved, AMS 5 11]
theorem erdos_295.variants.erdos_straus :
    ∃ᵉ (C > 0) (O > 0), ∀ᶠ (N : ℕ) in Filter.atTop,
      (k N - (rexp 1 - 1)*N) ∈ Set.Ioc (-C) (O * N / (N : ℝ).log):= by
  sorry

end Erdos295

#print axioms Erdos295.exists_k
