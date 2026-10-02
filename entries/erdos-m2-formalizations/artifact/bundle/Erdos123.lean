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
# Erdős Problem 123

*References:*
- [erdosproblems.com/123](https://www.erdosproblems.com/123)
- [ChYu23b] Chen, Yong-Gao and Yu, Wang-Xing, On {$d$}-complete sequences of integers, {II}. Acta
  Arith. (2023), 161--181.
- [Er92b] Erdős, Paul, Some of my favourite problems in various branches of combinatorics.
  Matematiche (Catania) (1992), 231-240.
- [Er97] Erdős, Paul, Problems in number theory. New Zealand J. Math. (1997), 155-160.
- [Er97e] Erdős, Paul, Some of my favourite unsolved problems. Math. Japon. (1997), 527-537.
- [ErLe96] Erdős, P. and Lewin, Mordechai, $d$-complete sequences of integers. Math. Comp. (1996),
  837-840.
- [MaCh16] Ma, Mi-Mi and Chen, Yong-Gao, On {$d$}-complete sequences of integers. J. Number Theory
  (2016), 1--12.
-/

@[expose] public section

open Filter
open Submonoid
open scoped Pointwise

namespace Erdos123

/--
A sequence is said to be $d$-complete if every large integer is the sum of distinct integers from the
sequence, none of which divide any other. This particular case of $d$-completeness was conjectured by
Erdős and Lewin [ErLe96], who (among other related results) prove this when $a=3$, $b=5$, and $c=7$.
-/
def IsDComplete (A : Set ℕ) : Prop :=
  ∀ᶠ n in atTop, ∃ s : Finset ℕ,
    -- The summands come from A
    (s : Set ℕ) ⊆ A ∧
    -- No summand divides another
    IsAntichain (· ∣ ·) (s : Set ℕ) ∧
    -- They sum to n
    s.sum id = n

/--
Characterizes a "snug" finite set of natural numbers:
all elements are within a multiplicative factor $(1 + ε)$ of the minimum.
Specifically, for a finite set $A$ and $ε > 0$, all $a ∈ A$ satisfy $a < (1 + ε) · min(A)$.
-/
def IsSnug (ε : ℝ) (A : Finset ℕ) : Prop :=
  ∃ hA : A.Nonempty, ∀ a ∈ A, a < (1 + ε) * A.min' hA

/--
Predicate for pairwise coprimality of three integers.
Requires all three input values to be pairwise coprime to each other.
-/
def PairwiseCoprime (a b c : ℕ) : Prop := Pairwise (Nat.Coprime.onFun ![a, b, c])

/--
Let $a, b, c$ be three integers which are pairwise coprime. Is every large integer
the sum of distinct integers of the form $a^k b^l c^m$ ($k, l, m ≥ 0$), none of which
divide any other?

Equivalently: is the set $\{a^k b^l c^m : k, l, m \geq 0\}$ d-complete?

Note: For this not to reduce to the two-integer case, we need the integers
to be greater than one and distinct.

The prize of \$250 is offered by Erdős in [Er97] and [Er97e] for a 'proof or disproof'.

The main problem was resolved in the affirmative by GPT 5.6 (prompted by Snyder).

This was formalized in Lean by Alexeev.
-/
@[category research solved, AMS 11, formal_proof using lean4 at
  "https://github.com/plby/lean-proofs/blob/a28a04b6b8ce43d5260a7466677c1f23833bfc38/src/latest/ErdosProblems/Erdos123.lean"]
theorem erdos_123 : answer(True) ↔ ∀ a > 1, ∀ b > 1, ∀ c > 1, PairwiseCoprime a b c →
    IsDComplete (↑(powers a) * ↑(powers b) * ↑(powers c)) := by sorry

/--
Erdős and Lewin [ErLe96] proved this conjecture when $a = 3$, $b = 5$, and $c = 7$.
-/
@[category research solved, AMS 11]
theorem erdos_123.variants.erdos_lewin_3_5_7 :
    IsDComplete (↑(powers 3) * ↑(powers 5) * ↑(powers 7)) := by sorry

private lemma smooth23_mul_two {x : ℕ}
    (hx : x ∈ (↑(powers 2) * ↑(powers 3) : Set ℕ)) :
    2 * x ∈ (↑(powers 2) * ↑(powers 3) : Set ℕ) := by
  rcases hx with ⟨a, ha, b, hb, rfl⟩
  refine ⟨2 * a, ?_, b, hb, by ring⟩
  exact mul_mem (Submonoid.mem_powers 2) ha

private lemma smooth23_pow_three (k : ℕ) :
    3 ^ k ∈ (↑(powers 2) * ↑(powers 3) : Set ℕ) := by
  refine ⟨1, one_mem _, 3 ^ k, ?_, by simp⟩
  exact pow_mem (Submonoid.mem_powers 3) k

private lemma smooth23_pos {x : ℕ}
    (hx : x ∈ (↑(powers 2) * ↑(powers 3) : Set ℕ)) : 0 < x := by
  rcases hx with ⟨a, ha, b, hb, rfl⟩
  obtain ⟨i, rfl⟩ := (Submonoid.mem_powers_iff a 2).mp ha
  obtain ⟨j, rfl⟩ := (Submonoid.mem_powers_iff b 3).mp hb
  positivity

private lemma sum_double23 (s : Finset ℕ) :
    (s.sum fun x => 2 * x) = 2 * s.sum id := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | @insert x s hx ih => simp [hx, ih, mul_add]

private lemma represent23 (n : ℕ) :
    ∃ s : Finset ℕ, (s : Set ℕ) ⊆ ↑(powers 2) * ↑(powers 3) ∧
      IsAntichain (· ∣ ·) (s : Set ℕ) ∧ s.sum id = n := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases hn0 : n = 0
    · subst n
      exact ⟨∅, by simp, by simp, by simp⟩
    by_cases heven : Even n
    · rcases heven with ⟨m, rfl⟩
      have hm : m < m + m := by omega
      rcases ih m hm with ⟨s, hsA, hsAnti, hsSum⟩
      refine ⟨s.image (fun x => 2 * x), ?_, ?_, ?_⟩
      · rintro y hy
        rcases Finset.mem_image.mp hy with ⟨x, hx, rfl⟩
        exact smooth23_mul_two (hsA hx)
      · intro a ha b hb hab hdiv
        rcases Finset.mem_image.mp ha with ⟨x, hx, rfl⟩
        rcases Finset.mem_image.mp hb with ⟨y, hy, rfl⟩
        apply hsAnti hx hy (by omega)
        exact (Nat.mul_dvd_mul_iff_left (by omega : 0 < 2)).mp hdiv
      · rw [Finset.sum_image (fun _ _ _ _ h => by omega)]
        simp only [id_eq]
        rw [sum_double23, hsSum]
        omega
    · let k := Nat.log 3 n
      let q := 3 ^ k
      have hqpos : 0 < q := by positivity
      have hqle : q ≤ n := Nat.pow_log_le_self 3 hn0
      have hnlt : n < 3 * q := by
        simpa [q, k, pow_succ, mul_comm] using Nat.lt_pow_succ_log_self (by omega : 1 < 3) n
      have hqodd : Odd q := (show Odd (3 : ℕ) by decide).pow
      have hnodd : Odd n := (Nat.not_even_iff_odd).mp heven
      have hdiff : Even (n - q) := by
        rcases hqodd with ⟨u, hu⟩
        rcases hnodd with ⟨v, hv⟩
        refine ⟨(n - q) / 2, ?_⟩
        omega
      rcases hdiff with ⟨m, hm⟩
      have hnm : n = 2 * m + q := by omega
      have hmlt : m < n := by omega
      have hsmall : 2 * m < 2 * q := by omega
      rcases ih m hmlt with ⟨s, hsA, hsAnti, hsSum⟩
      let t := s.image (fun x => 2 * x)
      have htSum : t.sum id = 2 * m := by
        dsimp [t]
        rw [Finset.sum_image (fun _ _ _ _ h => by omega)]
        simp only [id_eq]
        rw [sum_double23, hsSum]
      have htA : (t : Set ℕ) ⊆ ↑(powers 2) * ↑(powers 3) := by
        rintro y hy
        rcases Finset.mem_image.mp hy with ⟨x, hx, rfl⟩
        exact smooth23_mul_two (hsA hx)
      have htAnti : IsAntichain (· ∣ ·) (t : Set ℕ) := by
        intro a ha b hb hab hdiv
        rcases Finset.mem_image.mp ha with ⟨x, hx, rfl⟩
        rcases Finset.mem_image.mp hb with ⟨y, hy, rfl⟩
        apply hsAnti hx hy (by omega)
        exact (Nat.mul_dvd_mul_iff_left (by omega : 0 < 2)).mp hdiv
      refine ⟨insert q t, ?_, ?_, ?_⟩
      · intro x hx
        rcases Finset.mem_insert.mp hx with rfl | hx
        · exact smooth23_pow_three k
        · exact htA hx
      · simp only [Finset.coe_insert]
        apply IsAntichain.insert htAnti
        · intro x hx _ hdiv
          rcases Finset.mem_image.mp hx with ⟨y, _, hy⟩
          have hx2 : 2 ∣ x := by rw [← hy]; exact dvd_mul_right 2 y
          have htwo : 2 ∣ q := dvd_trans hx2 hdiv
          rcases hqodd with ⟨u, hu⟩
          rcases htwo with ⟨v, hv⟩
          omega
        · intro x hx _ hdiv
          have hxle : x ≤ 2 * m := (Finset.single_le_sum (fun _ _ => Nat.zero_le _) hx).trans_eq htSum
          have hcop : Nat.Coprime q 2 := hqodd.coprime_two_right
          rcases Finset.mem_image.mp hx with ⟨y, hyMem, hy⟩
          have hqdiv : q ∣ y := hcop.dvd_of_dvd_mul_left (hy ▸ hdiv)
          have hypos : 0 < y := smooth23_pos (hsA hyMem)
          have hqley : q ≤ y := Nat.le_of_dvd hypos hqdiv
          omega
      · have hnot : q ∉ t := by
          intro hqmem
          rcases Finset.mem_image.mp hqmem with ⟨x, _, hx⟩
          have hqeven : Even q := ⟨x, by omega⟩
          exact (Nat.not_even_iff_odd.mpr hqodd) hqeven
        rw [Finset.sum_insert hnot, htSum]
        simp [hnm, add_comm]


/--
A simpler case: the set of numbers of the form $2^k 3^l$ ($k, l ≥ 0$) is d-complete.

This was initially conjectured by Erdős in 1992, who called it a "nice and difficult"
problem, but it was quickly proven by Jansen and others using a simple inductive argument:
- If $n = 2m$ is even, apply the inductive hypothesis to $m$ and double all summands.
- If $n$ is odd, let $3^k$ be the largest power of $3$ with $3^k ≤ n$, and apply the
  inductive hypothesis to $n - 3^k$ (which is even).
-/
@[category research solved, AMS 11]
theorem erdos_123.variants.powers_2_3 : IsDComplete (↑(powers 2) * ↑(powers 3)) := by
  exact Filter.Eventually.of_forall represent23

/--
In [Er92b] Erdős makes the stronger conjecture (for $a=2$, $b=3$, and $c=5$) that, for any
$\epsilon>0$, all large integers $n$ can be written as the sum of distinct integers
$b_1<\cdots <b_t$ of the form $2^k3^l5^m$ where $b_t<(1+\epsilon)b_1$.
-/
@[category research open, AMS 11]
theorem erdos_123.variants.powers_2_3_5_snug :
    answer(sorry) ↔ ∀ ε > 0, ∀ᶠ n in atTop,
      ∃ A : Finset ℕ, (A : Set ℕ) ⊆ ↑(powers 2) * ↑(powers 3) * ↑(powers 5) ∧ IsSnug ε A ∧
        ∑ x ∈ A, x = n := by sorry

end Erdos123

#print axioms Erdos123.erdos_123.variants.powers_2_3
