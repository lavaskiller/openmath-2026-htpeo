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
# Erdős Problem 942

*Reference:* [erdosproblems.com/942](https://www.erdosproblems.com/942)
-/

@[expose] public section

open Nat Filter Topology

namespace Erdos942

/--
Let $h(n)$ count the number of powerful integers in $[n^2, (n + 1)^2)$.
-/
def erdos_942.h (n : ℕ) : ℕ := ((Finset.Ico (n ^ 2) ((n + 1) ^ 2)).filter Powerful).card

/--
Is there some constant $c > 0$ such that $h(n) < (\log n)^{c + o(1)}$ and, for infinitely many $n$,
$h(n) > (\log n)^{c - o(1)}$.
-/
@[category research open, AMS 11]
theorem erdos_942 : answer(sorry) ↔ ∃ c > 0, ∃ (o : ℕ → ℝ), o =o[atTop] (1 : ℕ → ℝ) ∧
    (∀ᶠ n in atTop, erdos_942.h n < (Real.log n) ^ (c + o n)) ∧
    {n | erdos_942.h n > (Real.log n) ^ (c - o n)}.Infinite := by
  sorry

open MeasureTheory

private theorem approx_return (k : ℕ) (ξ : Fin k → AddCircle (1 : ℝ))
    (ε : ℝ) (hε : 0 < ε) (N : ℕ) :
    ∃ q : ℕ, N ≤ q ∧ ‖q • ξ‖ ≤ ε := by
  let η : ℝ := ε / (N + 1)
  have hη : 0 < η := div_pos hε (by positivity)
  let μ : Measure (Fin k → AddCircle (1 : ℝ)) := volume
  have hball : 0 < μ (Metric.closedBall 0 (η / 2)) := by
    apply lt_of_lt_of_le (IsOpen.measure_pos μ Metric.isOpen_ball ?_)
      (measure_mono Metric.ball_subset_closedBall)
    exact ⟨0, Metric.mem_ball_self (half_pos hη)⟩
  obtain ⟨m, hm⟩ := ENNReal.exists_nat_mul_gt hball.ne' ((IsFiniteMeasure.measure_univ_lt_top (μ := μ)).ne)
  have hμ : μ Set.univ ≤ (m + 1 + 1) • μ (Metric.closedBall 0 (η / 2)) := by
    rw [nsmul_eq_mul]
    calc
      μ Set.univ ≤ (m : ENNReal) * μ (Metric.closedBall 0 (η / 2)) := hm.le
      _ ≤ ((m + 1 + 1 : ℕ) : ENNReal) * μ (Metric.closedBall 0 (η / 2)) := by gcongr; omega
  obtain ⟨j, hj, hjε⟩ :=
    NormedAddCommGroup.exists_norm_nsmul_le (μ := μ) ξ (show 0 < m + 1 by omega) η hμ
  refine ⟨j * (N + 1), ?_, ?_⟩
  · have hjpos : 1 ≤ j := hj.1
    have hh := Nat.mul_le_mul_right (N + 1) hjpos
    omega
  · rw [mul_nsmul]
    calc
      ‖(N + 1) • (j • ξ)‖ ≤ (N + 1) * ‖j • ξ‖ := by simpa [Nat.cast_add] using (norm_nsmul_le (n := N + 1) (a := j • ξ))
      _ ≤ (N + 1) * η := by gcongr
      _ = ε := by dsimp [η]; field_simp

private theorem approx_ints (k : ℕ) (r : Fin k → ℝ) (ε : ℝ) (hε : 0 < ε) (N : ℕ) :
    ∃ q : ℕ, N ≤ q ∧ ∀ i, ∃ z : ℤ, |(q : ℝ) * r i - z| ≤ ε := by
  let ξ : Fin k → AddCircle (1 : ℝ) := fun i => (r i : AddCircle (1 : ℝ))
  obtain ⟨q, hqN, hq⟩ := approx_return k ξ ε hε N
  refine ⟨q, hqN, fun i => ?_⟩
  have hi : ‖(q • ξ) i‖ ≤ ε := (norm_le_pi_norm (q • ξ) i).trans hq
  have hcast : (q • ξ) i = (((q : ℝ) * r i) : AddCircle (1 : ℝ)) := by
    simp [ξ]
  rw [hcast, AddCircle.norm_eq' 1 (by norm_num : (0 : ℝ) < 1)] at hi
  refine ⟨round ((q : ℝ) * r i), ?_⟩
  simpa using hi

private theorem powerful_sq_mul_cube (a p : ℕ) (hp : p.Prime) :
    Nat.Powerful (a ^ 2 * p ^ 3) := by
  intro q hq
  have hqp : q.Prime := Nat.prime_of_mem_primeFactors hq
  have hqd : q ∣ a ^ 2 * p ^ 3 := Nat.dvd_of_mem_primeFactors hq
  rcases (hqp.dvd_mul).mp hqd with hqa | hqp3
  · have hqa' : q ∣ a := hqp.dvd_of_dvd_pow hqa
    exact dvd_mul_of_dvd_left (pow_dvd_pow_of_dvd hqa' 2) _
  · have hqp' : q ∣ p := hqp.dvd_of_dvd_pow hqp3
    have heq : q = p := (Nat.prime_dvd_prime_iff_eq hqp hp).mp hqp'
    subst q
    exact dvd_mul_of_dvd_right (pow_dvd_pow p (by omega : 2 ≤ 3)) _

private theorem sq_mul_cube_distinct {a b p q : ℕ} (hp : p.Prime) (hq : q.Prime)
    (hpq : p ≠ q) (ha : 0 < a) (hb : 0 < b)
    (heq : a ^ 2 * p ^ 3 = b ^ 2 * q ^ 3) : False := by
  apply_fun fun x => x.factorization p at heq
  simp_all +decide [hp.ne_zero, hq.ne_zero, Nat.factorization_mul, ha.ne', hb.ne']
  omega

private theorem approx_positive_scales (k : ℕ) (s : Fin k → ℝ) (hs : ∀ i, 0 < s i)
    (N : ℕ) : ∃ q : ℕ, N ≤ q ∧ ∃ a : Fin k → ℕ,
    (∀ i, 0 < a i) ∧ (∀ i, |(a i : ℝ) * s i - q| < 1 / 2) := by
  let S : ℝ := ∑ i : Fin k, s i
  have hS : 0 ≤ S := Finset.sum_nonneg (fun i _ => (hs i).le)
  have hsi_le (i : Fin k) : s i ≤ S := by
    exact Finset.single_le_sum (fun j _ => (hs j).le) (Finset.mem_univ i)
  obtain ⟨K, hK⟩ := exists_nat_gt (S + 2)
  have hKpos : 0 < K := by exact_mod_cast (lt_of_le_of_lt (by positivity : (0:ℝ) ≤ S+2) hK)
  let ε : ℝ := 1 / (4 * K)
  have hε : 0 < ε := by dsimp [ε]; positivity
  have hεle : ε ≤ 1 / 4 := by
    dsimp [ε]
    apply (div_le_iff₀ (by positivity : (0:ℝ) < 4 * K)).mpr
    have : (1:ℝ) ≤ K := by exact_mod_cast hKpos
    nlinarith
  have hεs (i : Fin k) : ε * s i < 1 / 4 := by
    dsimp [ε]
    apply (lt_div_iff₀ (by positivity : (0:ℝ) < 4)).mpr
    have hsk : s i < (K:ℝ) := by linarith [hsi_le i, hK]
    have hKreal : (0:ℝ) < K := by exact_mod_cast hKpos
    field_simp
    nlinarith
  obtain ⟨q, hqN, happrox⟩ := approx_ints k (fun i => (s i)⁻¹) ε hε (max N K)
  choose z hz using happrox
  have hqK : K ≤ q := le_trans (le_max_right N K) hqN
  have hqreal : S + 2 < (q : ℝ) := by
    have : (K : ℝ) ≤ q := by exact_mod_cast hqK
    linarith
  have hzpos (i : Fin k) : 0 < z i := by
    have hqdiv : 1 < (q : ℝ) / s i := by
      apply (one_lt_div (hs i)).mpr
      linarith [hsi_le i]
    have hzabs : |(q : ℝ) / s i - z i| ≤ ε := by simpa [div_eq_mul_inv] using hz i
    have hzle := (abs_le.mp hzabs).2
    have hzreal : (0:ℝ) < z i := by linarith
    exact_mod_cast hzreal
  let a : Fin k → ℕ := fun i => (z i).toNat
  have hza (i : Fin k) : (a i : ℝ) = z i := by
    dsimp [a]
    exact_mod_cast Int.toNat_of_nonneg (le_of_lt (hzpos i))
  refine ⟨q, le_trans (le_max_left N K) hqN, a, ?_, ?_⟩
  · intro i
    have := hzpos i
    exact Int.lt_toNat.mpr this
  · intro i
    have hqdiv : (q : ℝ) / s i * s i = q := div_mul_cancel₀ _ (hs i).ne'
    have hzabs : |(q : ℝ) / s i - z i| ≤ ε := by simpa [div_eq_mul_inv] using hz i
    have hleft := (abs_le.mp hzabs).1
    have hright := (abs_le.mp hzabs).2
    have hleft' := mul_le_mul_of_nonneg_right hleft (hs i).le
    have hright' := mul_le_mul_of_nonneg_right hright (hs i).le
    rw [hza i]
    apply abs_lt.mpr
    constructor <;> nlinarith [hεs i]

private theorem square_near (q x : ℕ) (t : ℝ) (hq : 1 ≤ q) (ht : 0 ≤ t)
    (htsq : t ^ 2 = (x : ℝ)) (hclose : |t - q| < 1 / 2) :
    (q - 1) ^ 2 ≤ x ∧ x < (q + 1) ^ 2 := by
  have hqreal : (1 : ℝ) ≤ q := by exact_mod_cast hq
  have hlow : (q : ℝ) - 1 < t := by
    have := (abs_lt.mp hclose).1
    linarith
  have hhigh : t < (q : ℝ) + 1 := by
    have := (abs_lt.mp hclose).2
    linarith
  have hlow_sq : ((q : ℝ) - 1) ^ 2 ≤ (x : ℝ) := by
    rw [← htsq]
    nlinarith
  have hhigh_sq : (x : ℝ) < ((q : ℝ) + 1) ^ 2 := by
    rw [← htsq]
    nlinarith
  constructor
  · exact_mod_cast (by simpa [Nat.cast_sub hq] using hlow_sq : (((q - 1) ^ 2 : ℕ) : ℝ) ≤ x)
  · exact_mod_cast (by simpa using hhigh_sq : (x : ℝ) < (((q + 1) ^ 2 : ℕ) : ℝ))

private theorem near_powerfuls (k N : ℕ) (p : Fin k → ℕ) (hp : ∀ i, (p i).Prime) :
    ∃ q : ℕ, N + 1 ≤ q ∧ ∃ a : Fin k → ℕ,
      (∀ i, 0 < a i) ∧
      (∀ i, (q - 1) ^ 2 ≤ a i ^ 2 * p i ^ 3 ∧ a i ^ 2 * p i ^ 3 < (q + 1) ^ 2) := by
  let s : Fin k → ℝ := fun i => Real.sqrt ((p i : ℝ) ^ 3)
  have hs (i : Fin k) : 0 < s i := by
    dsimp [s]
    apply Real.sqrt_pos.2
    exact pow_pos (by exact_mod_cast (hp i).pos) _
  obtain ⟨q, hq, a, ha, hclose⟩ := approx_positive_scales k s hs (N + 1)
  refine ⟨q, hq, a, ha, fun i => ?_⟩
  have hsq : ((a i : ℝ) * s i) ^ 2 = (a i ^ 2 * p i ^ 3 : ℕ) := by
    rw [mul_pow, Real.sq_sqrt (by positivity : 0 ≤ (p i : ℝ) ^ 3)]
    norm_cast
  exact square_near q (a i ^ 2 * p i ^ 3) ((a i : ℝ) * s i) (by omega)
    (mul_nonneg (Nat.cast_nonneg _) (hs i).le) hsq (hclose i)


private theorem h_ge_of_family {k n : ℕ} (t : Finset (Fin k)) {p a : Fin k → ℕ}
    (hp : ∀ i, (p i).Prime) (hpinj : Function.Injective p) (ha : ∀ i, 0 < a i)
    (hinterval : ∀ i ∈ t, n ^ 2 ≤ a i ^ 2 * p i ^ 3 ∧ a i ^ 2 * p i ^ 3 < (n + 1) ^ 2) :
    t.card ≤ erdos_942.h n := by
  let f : Fin k → ℕ := fun i => a i ^ 2 * p i ^ 3
  have hfinj : Function.Injective f := by
    intro i j hij
    by_contra hne
    exact sq_mul_cube_distinct (hp i) (hp j) (fun e => hne (hpinj e)) (ha i) (ha j) hij
  have hsub : Finset.image f t ⊆
      (Finset.Ico (n ^ 2) ((n + 1) ^ 2)).filter Nat.Powerful := by
    intro x hx
    obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hx
    exact Finset.mem_filter.mpr ⟨Finset.mem_Ico.mpr (hinterval i hi), powerful_sq_mul_cube (a i) (p i) (hp i)⟩
  calc
    t.card = (Finset.image f t).card := by simp [Finset.card_image_of_injective _ hfinj]
    _ ≤ erdos_942.h n := Finset.card_le_card hsub

private theorem h_unbounded (M N : ℕ) : ∃ n : ℕ, N ≤ n ∧ M ≤ erdos_942.h n := by
  classical
  let p : Fin (2 * M) → ℕ := fun i => Nat.nth Nat.Prime i
  have hp (i : Fin (2 * M)) : (p i).Prime := Nat.prime_nth_prime _
  have hpinj : Function.Injective p := by
    intro i j hij
    apply Fin.ext
    exact Nat.nth_injective Nat.infinite_setOfPred_prime hij
  obtain ⟨q, hq, a, ha, hnear⟩ := near_powerfuls (2 * M) N p hp
  let F : Finset (Fin (2 * M)) := Finset.univ.filter (fun i => a i ^ 2 * p i ^ 3 < q ^ 2)
  let G : Finset (Fin (2 * M)) := Finset.univ.filter (fun i => ¬ a i ^ 2 * p i ^ 3 < q ^ 2)
  have hcard : F.card + G.card = 2 * M := by
    simpa only [F, G, Finset.card_univ, Fintype.card_fin] using Finset.card_filter_add_card_filter_not
      (s := Finset.univ) (p := fun i : Fin (2 * M) => a i ^ 2 * p i ^ 3 < q ^ 2)
  by_cases hF : M ≤ F.card
  · refine ⟨q - 1, by omega, le_trans hF ?_⟩
    apply h_ge_of_family F hp hpinj ha
    intro i hi
    have hi : a i ^ 2 * p i ^ 3 < q ^ 2 := (Finset.mem_filter.mp hi).2
    have hn := hnear i
    have hq' : q - 1 + 1 = q := by omega
    simpa [hq'] using (show (q - 1) ^ 2 ≤ a i ^ 2 * p i ^ 3 ∧
      a i ^ 2 * p i ^ 3 < (q - 1 + 1) ^ 2 from ⟨hn.1, by simpa [hq'] using hi⟩)
  · have hG : M ≤ G.card := by omega
    refine ⟨q, by omega, le_trans hG ?_⟩
    apply h_ge_of_family G hp hpinj ha
    intro i hi
    have hi : ¬ a i ^ 2 * p i ^ 3 < q ^ 2 := (Finset.mem_filter.mp hi).2
    exact ⟨Nat.le_of_not_lt hi, (hnear i).2⟩

private theorem h_limsup :
    atTop.limsup (((fun (n : ℕ) ↦ (n : ℕ∞)) ∘ erdos_942.h)) = ⊤ := by
  rw [Filter.limsup_eq]
  simp +decide [Filter.eventually_atTop]
  intro a x hx
  contrapose! hx
  cases' a with a
  norm_cast at *
  obtain ⟨n, hn, hM⟩ := h_unbounded (a + 1) x
  exact ⟨n, hn, by exact_mod_cast (by omega : a < erdos_942.h n)⟩

/--
It is not hard to prove that $\limsup h(n) = \infty$.
-/
@[category textbook, AMS 11]
theorem erdos_942.variants.limsup :
    atTop.limsup (((fun (n : ℕ) ↦ (n : ℕ∞)) ∘ erdos_942.h)) = ⊤ := by
  exact h_limsup


/--
It is not hard to prove that the density $\delta_l$ of integers for which $h(n) = l$ exists
and satisfies $$\sum_l \delta_l = 1$$.
-/
@[category textbook, AMS 11]
theorem erdos_942.variants.density :
    ∃ δ : ℕ → ℝ, ∀ l, {n | erdos_942.h n = l}.HasDensity (δ l) ∧
    ∑' l, δ l = 1 := by
  sorry

end Erdos942

#print axioms Erdos942.erdos_942.variants.limsup
