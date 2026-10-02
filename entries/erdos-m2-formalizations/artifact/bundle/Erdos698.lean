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
# Erdős Problem 698

*References:*
- [erdosproblems.com/698](https://www.erdosproblems.com/698)
- [ErSz78] Erdős, P. and Szekeres, G., *Some number theoretic problems on binomial
  coefficients*. Austral. Math. Soc. Gaz. (1978), 97-99.
- [Be11] Bergman, George M., *On common divisors of multinomial coefficients*. Bull. Aust.
  Math. Soc. (2011), 138--157.
-/

@[expose] public section

namespace Erdos698

open Filter

private lemma choose_scale_le (n j i : ℕ) (h : 2 * j ≤ n) :
    2 ^ i * j.choose i ≤ n.choose i := by
  have aux : ∀ k : ℕ, 2 ^ k * j.descFactorial k ≤ n.descFactorial k := by
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      rw [Nat.descFactorial_succ, Nat.descFactorial_succ, pow_succ]
      have hf : 2 * (j - k) ≤ n - k := by omega
      calc
        2 ^ k * 2 * ((j - k) * j.descFactorial k) =
            (2 * (j - k)) * (2 ^ k * j.descFactorial k) := by ac_rfl
        _ ≤ (n - k) * n.descFactorial k := Nat.mul_le_mul hf ih
  have haux := aux i
  rw [Nat.descFactorial_eq_factorial_mul_choose,
      Nat.descFactorial_eq_factorial_mul_choose] at haux
  have hfac : 0 < i.factorial := Nat.factorial_pos i
  nlinarith

/--
Is there some $h(n)\to \infty$ such that for all $2\leq i<j\leq n/2$
$$\textrm{gcd}\left( \binom{n}{i},\binom{n}{j}\right) \geq h(n)?$$

This was resolved by Bergman [Be11], who proved that for any $2\leq i<j\leq n/2$
$$\textrm{gcd}\left( \binom{n}{i},\binom{n}{j}\right) \gg n^{1/2}\frac{2^i}{i^{3/2}},$$
where the implied constant is absolute.

The linked formal proof (van Doorn and Aristotle, see `erdos_698.variants.bergman`) gives the
explicit bound $\gcd > \frac{2^i \sqrt n}{4 i \sqrt{i - 1}}$, so $h(n) = \lfloor \sqrt n / 4 \rfloor$
works since $i \sqrt{i - 1} \le 2^i$ for $i \ge 2$.
-/
@[category research solved, AMS 5 11, formal_proof using lean4 at
  "https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos698.lean#L452"]
theorem erdos_698 : answer(True) ↔
    ∃ h : ℕ → ℕ, Tendsto h atTop atTop ∧
      ∀ n i j : ℕ, 2 ≤ i → i < j → j ≤ n / 2 →
        h n ≤ Nat.gcd (n.choose i) (n.choose j) := by
  sorry

/--
A problem of Erdős and Szekeres, who observed that
$$\textrm{gcd}\left( \binom{n}{i},\binom{n}{j}\right) \geq \frac{\binom{n}{i}}{\binom{j}{i}}
\geq 2^i$$
(in particular the greatest common divisor is always $>1$).
-/
@[category research solved, AMS 5 11]
theorem erdos_698.variants.erdos_szekeres (n i j : ℕ) (hi : 1 ≤ i) (hij : i < j)
    (hj : j ≤ n / 2) :
    (n.choose i : ℝ) / (j.choose i : ℝ) ≤ (Nat.gcd (n.choose i) (n.choose j) : ℝ) ∧
      (2 : ℝ) ^ i ≤ (n.choose i : ℝ) / (j.choose i : ℝ) := by
  have h2j : 2 * j ≤ n := by omega
  have hji : i ≤ j := by omega
  have hin : i ≤ n := by omega
  have hcn : 0 < n.choose i := Nat.choose_pos hin
  have hcj : 0 < j.choose i := Nat.choose_pos hji
  let A := n.choose i
  let B := n.choose j
  let C := j.choose i
  let D := (n - i).choose (j - i)
  let g := A.gcd B
  have hg : 0 < g := Nat.gcd_pos_of_pos_left B hcn
  have hident : A * D = B * C := by
    simpa [A, B, C, D] using (Nat.choose_mul hji (n := n) (k := j) (s := i)).symm
  have hga : g * (A / g) = A := Nat.mul_div_cancel' (Nat.gcd_dvd_left A B)
  have hgb : g * (B / g) = B := Nat.mul_div_cancel' (Nat.gcd_dvd_right A B)
  have hcop : (A / g).Coprime (B / g) := Nat.coprime_div_gcd_div_gcd hg
  have heq : (A / g) * D = (B / g) * C := by
    apply Nat.mul_left_cancel hg
    calc
      g * ((A / g) * D) = A * D := by rw [← mul_assoc, hga]
      _ = B * C := hident
      _ = g * ((B / g) * C) := by rw [← mul_assoc, hgb]
  have hdvd : A / g ∣ C := hcop.dvd_of_dvd_mul_left ⟨D, heq.symm⟩
  have hquot : A / g ≤ C := Nat.le_of_dvd hcj hdvd
  have hmain : A ≤ g * C := by
    calc
      A = g * (A / g) := hga.symm
      _ ≤ g * C := Nat.mul_le_mul_left g hquot
  constructor
  · apply (div_le_iff₀ (by exact_mod_cast hcj)).2
    exact_mod_cast hmain
  · apply (le_div_iff₀ (by exact_mod_cast hcj)).2
    have hchoose := choose_scale_le n j i h2j
    exact_mod_cast hchoose

/--
This inequality is sharp for $i=1$, $j=p$, and $n=2p$.
-/
@[category research solved, AMS 5 11]
theorem erdos_698.variants.erdos_szekeres_sharp (p : ℕ) (hp : p.Prime) (hp2 : 2 < p) :
    (Nat.gcd ((2 * p).choose 1) ((2 * p).choose p) : ℝ) =
        ((2 * p).choose 1 : ℝ) / (p.choose 1 : ℝ) ∧
      ((2 * p).choose 1 : ℝ) / (p.choose 1 : ℝ) = (2 : ℝ) ^ 1 := by
  have hp0 : 0 < p := by omega
  have hp1 : p - 1 + 1 = p := by omega
  have h2p : 2 * p - 1 + 1 = 2 * p := by omega
  have hsymm : (2 * p - 1).choose p = (2 * p - 1).choose (p - 1) := by
    have h := Nat.choose_symm (n := 2 * p - 1) (k := p) (by omega)
    have heq : 2 * p - 1 - p = p - 1 := by omega
    simpa [heq] using h.symm
  have heven : 2 ∣ (2 * p).choose p := by
    have h := Nat.choose_succ_succ' (2 * p - 1) (p - 1)
    rw [h2p, hp1, hsymm] at h
    exact ⟨(2 * p - 1).choose (p - 1), by simpa [two_mul] using h⟩
  letI : Fact p.Prime := ⟨hp⟩
  have hmod : (2 * p).choose p ≡ 2 [MOD p] := by
    simpa [Nat.choose_one_right, Nat.choose_self, mul_comm] using
      (Choose.choose_mul_mul_modEq_choose_nat (p := p) (a := 2) (b := 1))
  have hnot : ¬ p ∣ (2 * p).choose p := by
    intro hdvd
    have hzero : ((2 * p).choose p) % p = 0 := Nat.mod_eq_zero_of_dvd hdvd
    change ((2 * p).choose p) % p = 2 % p at hmod
    have htwo : 2 % p = 2 := Nat.mod_eq_of_lt hp2
    omega
  have hcop : p.Coprime ((2 * p).choose p) :=
    (hp.coprime_iff_not_dvd).2 hnot
  have hgcd : Nat.gcd (2 * p) ((2 * p).choose p) = 2 := by
    calc
      Nat.gcd (2 * p) ((2 * p).choose p) =
          Nat.gcd (p * 2) ((2 * p).choose p) := by congr 1; omega
      _ = 2 := Nat.gcd_mul_of_coprime_of_dvd hcop heven
  constructor
  · simp [hgcd, hp0.ne', Nat.choose_one_right]
  · simp [hp0.ne', Nat.choose_one_right]

/--
This was resolved by Bergman [Be11], who proved that for any $2\leq i<j\leq n/2$
$$\textrm{gcd}\left( \binom{n}{i},\binom{n}{j}\right) \gg n^{1/2}\frac{2^i}{i^{3/2}},$$
where the implied constant is absolute.
-/
@[category research solved, AMS 5 11, formal_proof using lean4 at "https://github.com/plby/lean-proofs/blob/main/src/v4.29.1/ErdosProblems/Erdos698.lean"]
theorem erdos_698.variants.bergman :
    ∃ c : ℝ, 0 < c ∧ ∀ n i j : ℕ, 2 ≤ i → i < j → j ≤ n / 2 →
      c * (Real.sqrt (n : ℝ) * (2 : ℝ) ^ i / ((i : ℝ) * Real.sqrt (i : ℝ))) ≤
        (Nat.gcd (n.choose i) (n.choose j) : ℝ) := by
  sorry

end Erdos698

#print axioms Erdos698.erdos_698.variants.erdos_szekeres
#print axioms Erdos698.erdos_698.variants.erdos_szekeres_sharp
