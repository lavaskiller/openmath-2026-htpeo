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
# Erdős Problem 1148

*References:*
- [erdosproblems.com/1148](https://www.erdosproblems.com/1148)
- [Ch26] P. Chojecki, [Bounded Representations by $x^2 + y^2 - z^2$](https://www.ulam.ai/research/erdos1148-full.pdf) (2026)
- [Va99] Various, Some of Paul's favorite problems. Booklet produced for the conference "Paul Erdős
  and his mathematics", Budapest, July 1999 (1999).
-/

@[expose] public section

open Filter

namespace Erdos1148

/--
A natural number $n$ which can be written as $n$ if $n = x^2 + y^2 - z^2$ with $\max(x^2, y^2, z^2)
\leq n$.
-/
def Erdos1148Prop (n : ℕ) : Prop :=
  ∃ x y z : ℕ, n = x ^ 2 + y ^ 2 - z ^ 2 ∧ x ^ 2 ≤ n ∧ y ^ 2 ≤ n ∧ z ^ 2 ≤ n

/--
Can every large integer $n$ be written as $n=x^2+y^2-z^2$ with $\max(x^2,y^2,z^2)\leq n$?

This was proved affirmatively by Chojecki [Ch26], using a Duke-type equidistribution theorem.
A Lean formalisation of the reduction (conditional on a Duke-type equidistribution theorem) exists;
see the [forum discussion](https://www.erdosproblems.com/forum/thread/1148#post-4849). The linked
formal proof (plby/lean-proofs) removes the Duke hypothesis; it is stated over `ℤ`, as
`∃ N, ∀ n ≥ N, ∃ x y z : ℤ, n = x ^ 2 + y ^ 2 - z ^ 2 ∧ max (x ^ 2) (max (y ^ 2) (z ^ 2)) ≤ n`,
which gives the statement below by taking absolute values.
-/
@[category research solved, AMS 11, formal_proof using lean4 at
  "https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos1148.lean#L238"]
theorem erdos_1148 : answer(True) ↔ ∀ᶠ n in atTop, Erdos1148Prop n := by
  sorry

/--
The largest integer known which cannot be written this way is $6563$.
-/
private instance (n : ℕ) : Decidable (Erdos1148Prop n) :=
  decidable_of_iff
    (∃ x ∈ Finset.range (Nat.sqrt n + 1), ∃ y ∈ Finset.range (Nat.sqrt n + 1),
      ∃ z ∈ Finset.range (Nat.sqrt n + 1),
      n = x ^ 2 + y ^ 2 - z ^ 2 ∧ x ^ 2 ≤ n ∧ y ^ 2 ≤ n ∧ z ^ 2 ≤ n)
    (by
      constructor
      · rintro ⟨x, -, y, -, z, -, h⟩; exact ⟨x, y, z, h⟩
      · rintro ⟨x, y, z, h1, h2, h3, h4⟩
        refine ⟨x, Finset.mem_range.mpr ?_, y, Finset.mem_range.mpr ?_,
                z, Finset.mem_range.mpr ?_, h1, h2, h3, h4⟩
        all_goals (simp only [Nat.lt_succ_iff]; exact Nat.le_sqrt'.mpr ‹_›))

/--
The integer $6563$ cannot be written as $x^2 + y^2 - z^2$ with $\max(x^2, y^2, z^2) \leq 6563$.
-/
@[category textbook, AMS 11]
theorem erdos_1148.variants.lower_bound : ¬ Erdos1148Prop 6563 := by
  decide +native

/--
The weaker property: $n = x^2 + y^2 - z^2$ such that $\max(x^2, y^2, z^2) \leq n + 2\sqrt{n}$.
-/
def erdos_1148_weaker_prop (n : ℕ) : Prop :=
  ∃ x y z : ℕ, n = x ^ 2 + y ^ 2 - z ^ 2 ∧
    (x ^ 2 : ℝ) ≤ n + 2 * Real.sqrt n ∧
    (y ^ 2 : ℝ) ≤ n + 2 * Real.sqrt n ∧
    (z ^ 2 : ℝ) ≤ n + 2 * Real.sqrt n

/--
[Va99] reports this is 'obvious' if we replace $\leq n$ with $\leq n+2\sqrt{n}$.
-/
@[category research solved, AMS 11]
theorem erdos_1148.variants.weaker : ∀ n, erdos_1148_weaker_prop n := by
  intro n
  -- s = ⌊√n⌋, n = s² + d with 0 ≤ d ≤ 2s
  obtain ⟨s, hs⟩ : ∃ s, s = Nat.sqrt n := ⟨_, rfl⟩
  have h1 : s * s ≤ n := by rw [hs]; exact Nat.sqrt_le n
  have h2 : n < (s + 1) * (s + 1) := by rw [hs]; exact Nat.lt_succ_sqrt n
  have hn0 : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have hsqrt0 := Real.sqrt_nonneg (n : ℝ)
  have hsr : (s : ℝ) ≤ Real.sqrt n := by
    have hsq := Real.sq_sqrt hn0
    have h1' : (s : ℝ) * s ≤ n := by exact_mod_cast h1
    by_contra hlt
    push_neg at hlt
    nlinarith
  -- a square `w²` with `w² ≤ n` satisfies the (weaker) bound
  have small : ∀ w : ℕ, w * w ≤ n → ((w : ℝ) ^ 2) ≤ n + 2 * Real.sqrt n := by
    intro w hw
    have hw' : (w : ℝ) * w ≤ n := by exact_mod_cast hw
    nlinarith
  obtain ⟨d, hd⟩ : ∃ d, n = s * s + d := ⟨n - s * s, by omega⟩
  have hd2 : d ≤ 2 * s := by
    have h3 : (s + 1) * (s + 1) = s * s + 2 * s + 1 := by ring
    omega
  obtain ⟨e, he | he⟩ := Nat.even_or_odd' d
  · rcases Nat.eq_zero_or_pos e with he0 | hepos
    · -- n = s² : n = s² + 0² - 0²
      refine ⟨s, 0, 0, ?_, small s h1, small 0 (by omega), small 0 (by omega)⟩
      have h4 : s ^ 2 + 0 ^ 2 = n + 0 ^ 2 := by rw [hd, he, he0]; ring
      exact Nat.eq_sub_of_add_eq h4.symm
    · -- n = s² + 2e with 1 ≤ e ≤ s : n = (s+1)² + j² - (j+1)² with j = s - e
      obtain ⟨j, hj⟩ : ∃ j, s = j + e := ⟨s - e, by omega⟩
      have hjs : j + 1 ≤ s := by omega
      refine ⟨s + 1, j, j + 1, ?_, ?_,
        small j (le_trans (Nat.mul_le_mul (by omega) (by omega)) h1),
        small (j + 1) (le_trans (Nat.mul_le_mul hjs hjs) h1)⟩
      · have h4 : (s + 1) ^ 2 + j ^ 2 = n + (j + 1) ^ 2 := by rw [hd, he, hj]; ring
        exact Nat.eq_sub_of_add_eq h4.symm
      · have hnr : (n : ℝ) = (s : ℝ) * s + 2 * e := by rw [hd, he]; push_cast; ring
        have he1 : (1 : ℝ) ≤ e := by exact_mod_cast hepos
        push_cast
        nlinarith
  · -- n = s² + 2e + 1 with e + 1 ≤ s : n = s² + (e+1)² - e²
    have hes : e + 1 ≤ s := by omega
    refine ⟨s, e + 1, e, ?_, small s h1,
      small (e + 1) (le_trans (Nat.mul_le_mul hes hes) h1),
      small e (le_trans (Nat.mul_le_mul (by omega) (by omega)) h1)⟩
    have h4 : s ^ 2 + (e + 1) ^ 2 = n + e ^ 2 := by rw [hd, he]; ring
    exact Nat.eq_sub_of_add_eq h4.symm

end Erdos1148

#print axioms Erdos1148.erdos_1148.variants.weaker
