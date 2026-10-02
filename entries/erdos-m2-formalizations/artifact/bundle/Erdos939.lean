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
# Erdős Problem 939

*References:*
- [erdosproblems.com/939](https://www.erdosproblems.com/939)
- [Ni95] Nitaj, A., _On a conjecture of Erdős on 3-powerful numbers_. Bull. London Math. Soc.
  (1995), 317-318.
- [Co98] Cohn, J. H. E., _A conjecture of Erdős on 3-powerful numbers_. Math. Comp. (1998),
  439-440.
- [Wa24] Walsh, P., _A question of Erdős on 3-powerful numbers and an elliptic curve analogue
  of the Ankeny-Artin-Chowla conjecture_. arXiv:2404.03970 (2024).
- [LaPa67] Lander, L. J. and Parkin, T. R., _A counterexample to Euler's sum of powers
  conjecture_. Math. Comp. (1967), 101-103.
-/

@[expose] public section

open Nat

namespace Erdos939

/--
A set `S` belongs to `Erdos939Sums r` if it meets the following criteria:
- The elements are positive. `0` has no prime factors, so it is vacuously `r`-powerful, and
  the source means positive integers.
- The size of the set is `$|S| = r - 2$`.
- The elements of the set are coprime (their greatest common divisor is 1).
- Every element in `S` is an `$r$-powerful` number.
- The sum of the elements in `S`, i.e., `$\sum_{s \in S} s$`, is also an `$r$-powerful` number.

The summands are taken to be distinct (`S` is a `Finset`). The source does not say whether
repeated summands are allowed; all known examples and constructions use distinct summands.
-/
def Erdos939Sums (r : ℕ) :=
    {S : Finset ℕ | S.card = r - 2 ∧ S.Coprime ∧ r.Full (∑ s ∈ S, s) ∧
      ∀ s ∈ S, 0 < s ∧ r.Full s}

/--
If $r≥4$ then can the sum of $r-2$ coprime $r$-powerful numbers ever be itself $r$-powerful?
-/
@[category research open, AMS 11]
theorem erdos_939 : answer(sorry) ↔ ∀ r ≥ 4, (Erdos939Sums r).Nonempty := by
  sorry

/--
If $r≥4$, are there at most finitely many sums of $r-2$ coprime $r$-powerful numbers
that are themselves $r$-powerful?

The answer is no: for every $r \ge 6$ there are infinitely many such sums, see
`erdos_939.variants.infinite_of_six_le`. (For $r = 4$ and $r = 5$ the question is open; for
$r = 4$ no example is known at all, see `erdos_939`.)
A construction in the site's comments, from GPT-5.5 Pro prompted by Price, gives infinitely
many for every $r \ge 6$. This statement quantifies over every $r \ge 4$, so it stays open at
$r = 4$ and $r = 5$. The category is unchanged because the construction is recorded in the
comments and not in the literature.
-/
@[category research solved, AMS 11]
theorem erdos_939.variants.finite : answer(False) ↔ ∀ r ≥ 4, (Erdos939Sums r).Finite := by
  sorry

/--
For every $r \ge 6$ there are infinitely many sums of $r - 2$ coprime $r$-powerful numbers that
are themselves $r$-powerful.

A construction, found by GPT-5.5 Pro prompted by Liam Price and recorded in the comments on
[erdosproblems.com/939](https://www.erdosproblems.com/forum/thread/939), expands
$(X+Y)^r = (X-Y)^r + \sum_{j \text{ odd}} 2\binom{r}{j} X^{r-j} Y^j$, splits the $j = 3$ term into
$\lfloor r/2 \rfloor - 2$ distinct pieces to obtain exactly $r - 2$ summands, and takes
$X = q^r$, $Y = B^r$ with $B$ divisible by all primes in the coefficients and $q > B$ a prime not
dividing $B$; varying $q$ gives infinitely many solutions.
-/
@[category research solved, AMS 11]
theorem erdos_939.variants.infinite_of_six_le : ∀ r ≥ 6, (Erdos939Sums r).Infinite := by
  sorry

/--
Are there infinitely many triples of coprime $3$-powerful numbers $a, b, c$ such that $a + b = c$?

The answer is yes. Nitaj [Ni95] proved it, with $2^3\cdot 3^5\cdot 73^3 + 271^3 = 919^3$ as an
example. In Nitaj's construction at least two of $a, b, c$ are perfect cubes. Cohn [Co98]
constructed infinitely many triples of which none is a perfect cube, and Walsh [Wa24] gave a
further construction.
-/
@[category research solved, AMS 11]
theorem erdos_939.variants.triples :
    answer(True) ↔ {(a,b,c) | ({a, b, c} : Finset ℕ).Coprime ∧
      0 < a ∧ 0 < b ∧
      (3).Full a ∧ (3).Full b ∧ (3).Full c ∧
      a + b = c}.Infinite := by
  sorry

/--
Cambie has found several examples of the sum of $r - 2$ coprime $r$-powerful numbers being itself
$r$-powerful. For example when $r=5$ we have
$$3^7\cdot 61^5 = 2^8\cdot3^{10}\cdot 5^7 + 2^{12}\cdot 23^6 + 11^5\cdot 13^5$$.
-/
@[category research solved, AMS 11]
theorem erdos_939.variants.examples : (∃ r ≥ 4, (Erdos939Sums r).Nonempty) := by
  use 5
  simp only [ge_iff_le, reduceLeDiff, true_and]
  unfold Erdos939Sums
  simp [Set.Nonempty]
  use {2^8 * 3^10 * 5^7, 2^12 * 23^6, 11^5 * 13^5}
  simp
  constructor
  · unfold Finset.Coprime
    aesop
  · norm_num [Nat.Full, Nat.primeFactors, Nat.primeFactorsList]


/-- Cambie has also found solutions when $r=7$. -/
@[category research solved, AMS 11]
theorem erdos_939.variants.seven : (Erdos939Sums 7).Nonempty := by
  unfold Erdos939Sums
  simp only [Set.Nonempty]
  refine ⟨{1, 839808, 40000000, 1934917632, 5000000000}, ?_⟩
  simp
  constructor
  · unfold Finset.Coprime
    aesop
  · norm_num [Nat.Full, Nat.primeFactors, Nat.primeFactorsList]

private lemma full_eighth_power (a : ℕ) : (8 : ℕ).Full (a ^ 8) := by
  intro p hp
  have hprime : p.Prime := Nat.prime_of_mem_primeFactors hp
  have hpdvd : p ∣ a ^ 8 := Nat.dvd_of_mem_primeFactors hp
  obtain ⟨c, rfl⟩ := hprime.dvd_of_dvd_pow hpdvd
  exact ⟨c ^ 8, by rw [mul_pow]⟩

private lemma full_two_seven (a b : ℕ) (ha : 8 ≤ a) (hb : 8 ≤ b) :
    (8 : ℕ).Full (2 ^ a * 7 ^ b) := by
  intro p hp
  have hpprime : p.Prime := Nat.prime_of_mem_primeFactors hp
  have hpdvd : p ∣ 2 ^ a * 7 ^ b := Nat.dvd_of_mem_primeFactors hp
  rcases hpprime.dvd_mul.mp hpdvd with h2 | h7
  · have hpbase : p ∣ 2 := hpprime.dvd_of_dvd_pow h2
    have hple : p ≤ 2 := Nat.le_of_dvd (by norm_num) hpbase
    have hpeq : p = 2 := by have := hpprime.one_lt; omega
    subst p
    exact (pow_dvd_pow 2 ha).trans (dvd_mul_right (2 ^ a) (7 ^ b))
  · have hpbase : p ∣ 7 := hpprime.dvd_of_dvd_pow h7
    have hpeq : p = 7 :=
      (Nat.prime_dvd_prime_iff_eq hpprime (by norm_num : Nat.Prime 7)).mp hpbase
    subst p
    exact (pow_dvd_pow 7 hb).trans (dvd_mul_left (7 ^ b) (2 ^ a))


/--
Cambie has also found solutions when $r=8$.

The source adds that the $r=8$ solution works "even with the sum of $5$ $8$-powerful numbers".
That is a stronger result than this statement, which asks for the $r - 2 = 6$ summands of
`Erdos939Sums`.
-/
@[category research solved, AMS 11]
theorem erdos_939.variants.eight : (Erdos939Sums 8).Nonempty := by
  let X : ℕ := 8 ^ 8
  let Y : ℕ := 7 ^ 8
  let S : Finset ℕ :=
    {(X - Y) ^ 8, 16 * X ^ 7 * Y, 14 * X ^ 5 * Y ^ 3,
      98 * X ^ 5 * Y ^ 3, 112 * X ^ 3 * Y ^ 5, 16 * X * Y ^ 7}
  have hcard : S.card = 6 := by decide
  have hcop : S.Coprime := by decide
  have hsum : S.sum id = (X + Y) ^ 8 := by
    dsimp [S]
    rw [Finset.sum_insert (by decide)]
    rw [Finset.sum_insert (by decide)]
    rw [Finset.sum_insert (by decide)]
    rw [Finset.sum_insert (by decide)]
    rw [Finset.sum_insert (by decide)]
    simp only [Finset.sum_singleton, id_eq]
    generalize hz : X - Y = z
    have hx : X = z + Y := by omega
    rw [hx]
    ring
  change ∃ T : Finset ℕ, T.card = 8 - 2 ∧ T.Coprime ∧
    (8 : ℕ).Full (T.sum id) ∧ ∀ s ∈ T, 0 < s ∧ (8 : ℕ).Full s
  refine ⟨S, by simpa using hcard, hcop, ?_, ?_⟩
  · rw [hsum]
    exact full_eighth_power (X + Y)
  · intro s hs
    simp only [S, Finset.mem_insert, Finset.mem_singleton] at hs
    rcases hs with h | h | h | h | h | h
    · rw [h]
      exact ⟨by decide, full_eighth_power (X - Y)⟩
    · rw [h]
      refine ⟨by decide, ?_⟩
      convert full_two_seven 172 8 (by decide) (by decide) using 1 <;> decide
    · rw [h]
      refine ⟨by decide, ?_⟩
      convert full_two_seven 121 25 (by decide) (by decide) using 1 <;> decide
    · rw [h]
      refine ⟨by decide, ?_⟩
      convert full_two_seven 121 26 (by decide) (by decide) using 1 <;> decide
    · rw [h]
      refine ⟨by decide, ?_⟩
      convert full_two_seven 76 41 (by decide) (by decide) using 1 <;> decide
    · rw [h]
      refine ⟨by decide, ?_⟩
      convert full_two_seven 28 56 (by decide) (by decide) using 1 <;> decide

/--
Euler had conjectured that the sum of $k - 1$ many $k$-th powers is never a
$k$-th power, but this is false for $k=5$, as Lander and Parkin [LaPa67] found
$$27^5+84^5+110^5+133^5=144^5$$.

The summands must be positive. Without that condition a set containing `0` would count, so the
negation would be satisfied by a sum of fewer than $k-1$ powers and would claim less than the
refutation of Euler's conjecture that this theorem records.
-/
@[category research solved, AMS 11]
theorem erdos_939.variants.euler : ¬ (∀ k ≥ 4, ∀ S : Finset ℕ, S.card = k - 1 →
    (∀ s ∈ S, 0 < s) → ¬ (∃ q, ∑ s ∈ S, s ^ k = q ^k)) := by
  push Not
  use 5
  norm_num
  use {27, 84, 110, 133}
  refine ⟨by decide, by decide, 144, by norm_num⟩

end Erdos939

#print axioms Erdos939.erdos_939.variants.seven
#print axioms Erdos939.erdos_939.variants.eight
