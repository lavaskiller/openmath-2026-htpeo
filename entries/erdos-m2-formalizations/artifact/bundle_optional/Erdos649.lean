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
# Erdős Problem 649

*References:*
- [erdosproblems.com/649](https://www.erdosproblems.com/649)
- [Ma35] Mahler, Kurt, *Über den grössten Primteiler spezieller Polynome zweiten Grades*. Archiv
  für math. og naturvid (1935).
- [Ro64b] Rotkiewicz, André, *Sur les nombres naturels $n$ et $k$ tels que les nombres $n$ et $nk$
  sont à la fois pseudopremiers*. Atti Accad. Naz. Lincei Rend. Cl. Sci. Fis. Mat. Nat. (8)
  (1964), 816-818.
-/

@[expose] public section

namespace Erdos649

/--
Let $P(m)$ denote the greatest prime factor of $m$. Is it true that, for any two primes $p,q$,
there exists some integer $n$ such that $P(n)=p$ and $P(n+1)=q$?

In fact, the answer to this question as written is easily seen to be no, since there are no
solutions to $2^k\equiv -1\pmod{7}$, and hence this fails with $p=2$ and $q=7$. It is possible
that Erdős meant to exclude such obstructions, by amending this to 'odd primes' or 'all
sufficiently large primes' or such.

The statement below assumes $p \neq q$: for $p = q$ no such $n$ exists, because $p$ would divide
both $n$ and $n+1$.
-/
@[category research solved, AMS 11, formal_proof using lean4 at "https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos649.lean#L488"]
theorem erdos_649 : answer(False) ↔
    ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
      ∃ n : ℕ, n.maxPrimeFac = p ∧ (n + 1).maxPrimeFac = q := by
  sorry

/--
In fact, the answer to this question as written is easily seen to be no, since there are no
solutions to $2^k\equiv -1\pmod{7}$, and hence this fails with $p=2$ and $q=7$.
-/
@[category textbook, AMS 11]
theorem erdos_649.variants.no_solution_two_seven :
    ¬ ∃ n : ℕ, n.maxPrimeFac = 2 ∧ (n + 1).maxPrimeFac = 7 := by
  rintro ⟨n, hn, hn'⟩
  have h1n : 1 < n := by
    have := (Nat.one_lt_maxPrimeFac_iff n).mp (by omega)
    omega
  -- Since `2` is the greatest prime factor of `n`, it is the only one, so `n` is a power of `2`.
  obtain ⟨k, hpow⟩ : ∃ k, n = 2 ^ k :=
    ⟨_, Nat.eq_prime_pow_of_unique_prime_dvd (by omega)
      (fun {q} hq hqd ↦
        le_antisymm (hn ▸ Nat.le_maxPrimeFac (by omega) hq hqd) hq.two_le)⟩
  -- On the other hand `7` divides `n + 1`, i.e. `2 ^ k ≡ -1 (mod 7)`.
  have h7 : 7 ∣ n + 1 := hn' ▸ Nat.maxPrimeFac_dvd
  -- This is impossible: `2 ^ k` is congruent to `1`, `2` or `4` modulo `7`, never to `6`.
  have hmod : 2 ^ k % 7 = 2 ^ (k % 3) % 7 := by
    conv_lhs => rw [← Nat.div_add_mod k 3, pow_add, pow_mul]
    rw [Nat.mul_mod, Nat.pow_mod]
    norm_num
  have hk3 : k % 3 < 3 := Nat.mod_lt _ (by norm_num)
  interval_cases h : k % 3 <;> omega

private lemma mod_eq_sub_one_of_dvd_succ {m q : ℕ} (hm : 0 < m)
    (h : m ∣ q + 1) : q % m = m - 1 := by
  have h0 : (q + 1) % m = 0 := Nat.mod_eq_zero_of_dvd h
  have hmod : (q + 1) % m = (q % m + 1) % m := by simp [Nat.add_mod]
  have hlt := Nat.mod_lt q hm
  have hle : q % m + 1 ≤ m := by omega
  rcases eq_or_lt_of_le hle with he | hlt2
  · omega
  · rw [Nat.mod_eq_of_lt hlt2] at hmod
    omega

private lemma cast_eq_neg_one_of_dvd_succ {m q : ℕ} [NeZero m] (h : m ∣ q + 1) :
    (q : ZMod m) = -1 := by
  have hh : ((q + 1 : ℕ) : ZMod m) = 0 :=
    (CharP.cast_eq_zero_iff (ZMod m) m _).2 h
  push_cast at hh
  linear_combination hh

private lemma square_prime_of_dvd_succ {q r : ℕ} (hq : q.Prime) (hr : r.Prime)
    (hq8 : q % 8 = 7) (hdiv : r ∣ q + 1) : IsSquare (r : ZMod q) := by
  letI : Fact q.Prime := ⟨hq⟩
  letI : Fact r.Prime := ⟨hr⟩
  have hq2 : q ≠ 2 := by omega
  have hq4 : q % 4 = 3 := by omega
  by_cases hr2 : r = 2
  · subst r
    exact (ZMod.exists_sq_eq_two_iff hq2).2 (Or.inr hq8)
  have hrmod : r % 4 = 1 ∨ r % 4 = 3 :=
    Nat.odd_mod_four_iff.mp ((Nat.Prime.mod_two_eq_one_iff_ne_two hr).mpr hr2)
  have hqr : (q : ZMod r) = -1 := cast_eq_neg_one_of_dvd_succ hdiv
  have hneq : r ≠ q := by
    intro he
    subst r
    have hm := mod_eq_sub_one_of_dvd_succ hq.pos hdiv
    simp at hm
    omega
  rcases hrmod with hr1 | hr3
  · have hs : IsSquare (q : ZMod r) := by
      rw [hqr]
      exact (ZMod.exists_sq_eq_neg_one_iff (p := r)).2 (by omega)
    exact (ZMod.exists_sq_eq_prime_iff_of_mod_four_eq_one hr1 hq2).mp hs
  · have hns : ¬ IsSquare (q : ZMod r) := by
      rw [hqr]
      exact fun hs => ((ZMod.exists_sq_eq_neg_one_iff (p := r)).mp hs) hr3
    exact Classical.byContradiction fun h =>
      hns ((ZMod.exists_sq_eq_prime_iff_of_mod_four_eq_three hr3 hq4 hneq).mpr h)

/--
Even with such amendments, this problem is false in a strong sense: Alan Tong has provided the
following elegant elementary proof that, for any given prime $p$, there are infinitely many
primes $q$ such that this statement is false: let $m$ be the product of all primes $\leq p$, and
choose a prime $q$ congruent to $-1$ modulo $4m$. If $p$ is the greatest prime divisor of $n$
then, using quadratic reciprocity, every prime divisor of $n$ is a quadratic residue modulo $q$,
and hence $n$ is a quadratic residue modulo $q$. On the other hand, since $q\equiv 3\pmod{4}$ we
know that $-1$ is not a quadratic residue modulo $q$, and hence $n\not\equiv -1\pmod{q}$, so it
is impossible for $q\mid n+1$.
-/
@[category research solved, AMS 11]
theorem erdos_649.variants.tong (p : ℕ) (hp : p.Prime) :
    {q : ℕ |
      q.Prime ∧ ¬ ∃ n : ℕ, n.maxPrimeFac = p ∧ (n + 1).maxPrimeFac = q}.Infinite := by
  let M : ℕ := 8 * p.factorial
  have hMpos : 0 < M := by dsimp [M]; positivity
  letI : NeZero M := ⟨by omega⟩
  have hi : {q : ℕ | q.Prime ∧ (q : ZMod M) = -1}.Infinite :=
    Nat.infinite_setOfPred_prime_and_eq_mod isUnit_neg_one
  apply hi.mono
  intro q hq
  obtain ⟨hq, hqcast⟩ := hq
  refine ⟨hq, ?_⟩
  have hcast : ((q + 1 : ℕ) : ZMod M) = 0 := by
    push_cast
    rw [hqcast]
    ring
  have hdiv : M ∣ q + 1 := (CharP.cast_eq_zero_iff (ZMod M) M _).mp hcast
  have h8M : 8 ∣ M := by
    dsimp [M]
    exact dvd_mul_right 8 p.factorial
  have hq8 : q % 8 = 7 := by
    have hh := mod_eq_sub_one_of_dvd_succ (m := 8) (q := q) (by omega)
      (dvd_trans h8M hdiv)
    norm_num at hh ⊢
    exact hh
  have hq4 : q % 4 = 3 := by omega
  letI : Fact q.Prime := ⟨hq⟩
  rintro ⟨n, hn, hn'⟩
  have hnpos : 1 < n := (Nat.one_lt_maxPrimeFac_iff n).mp (by rw [hn]; exact hp.one_lt)
  have hsqfactor (r : ℕ) (hr : r ∈ n.primeFactorsList) : IsSquare (r : ZMod q) := by
    have hrprime : r.Prime := Nat.prime_of_mem_primeFactorsList hr
    have hrle : r ≤ p := by
      rw [← hn]
      exact Nat.le_maxPrimeFac (by omega) hrprime (Nat.dvd_of_mem_primeFactorsList hr)
    have hdf : r ∣ p.factorial := Nat.dvd_factorial hrprime.pos hrle
    have hdM : r ∣ M := by
      dsimp [M]
      exact dvd_mul_of_dvd_right hdf 8
    exact square_prime_of_dvd_succ hq hrprime hq8 (dvd_trans hdM hdiv)
  have hsqprod : ∀ l : List ℕ, (∀ r ∈ l, IsSquare (r : ZMod q)) →
      IsSquare ((l.prod : ℕ) : ZMod q) := by
    intro l
    induction l with
    | nil => simp [IsSquare.one]
    | cons r l ih =>
      intro hs
      simpa only [List.prod_cons, Nat.cast_mul] using
        (hs r (by simp)).mul (ih (by intro a ha; exact hs a (by simp [ha])))
  have hsq : IsSquare (n : ZMod q) := by
    simpa [Nat.prod_primeFactorsList (by omega : n ≠ 0)] using
      hsqprod n.primeFactorsList hsqfactor
  have hqdiv : q ∣ n + 1 := hn' ▸ Nat.maxPrimeFac_dvd
  have hncast : (n : ZMod q) = -1 := cast_eq_neg_one_of_dvd_succ hqdiv
  have hminus : IsSquare (-1 : ZMod q) := hncast ▸ hsq
  exact ((ZMod.exists_sq_eq_neg_one_iff (p := q)).mp hminus) hq4

/--
Tong asks whether, for any given odd prime $q$, there are infinitely many primes $p$ such that
there is no integer $n$ with $P(n)=p$ and $P(n+1)=q$.
-/
@[category research open, AMS 11]
theorem erdos_649.variants.tong_question : answer(sorry) ↔
    ∀ q : ℕ, q.Prime → Odd q →
      {p : ℕ |
        p.Prime ∧ ¬ ∃ n : ℕ, n.maxPrimeFac = p ∧ (n + 1).maxPrimeFac = q}.Infinite := by
  sorry

/--
Sampaio independently observed that the answer to Erdős' original problem is no if one of the
primes can be $2$ - for example this is false with $p=19$ and $q=2$, since if $n+1=2^k$ and
$19\mid n$ then (since $2$ is a primitive root modulo $19$) we must have $18\mid k$, and hence
$73\mid 2^{18}-1\mid n$.
-/
@[category textbook, AMS 11]
theorem erdos_649.variants.sampaio :
    ¬ ∃ n : ℕ, n.maxPrimeFac = 19 ∧ (n + 1).maxPrimeFac = 2 := by
  rintro ⟨n, hn, hn'⟩
  have hn_pos : 1 < n := by
    have := (Nat.one_lt_maxPrimeFac_iff n).mp (by omega)
    omega
  obtain ⟨k, hpow⟩ : ∃ k, n + 1 = 2 ^ k :=
    ⟨_, Nat.eq_prime_pow_of_unique_prime_dvd (by omega)
      (fun {q} hq hqd =>
        le_antisymm (hn' ▸ Nat.le_maxPrimeFac (by omega) hq hqd) hq.two_le)⟩
  have h19 : 19 ∣ n := hn ▸ Nat.maxPrimeFac_dvd
  have hmod19 : 2 ^ k % 19 = 1 := by omega
  have hk18 : 18 ∣ k := by
    apply Nat.dvd_of_mod_eq_zero
    have hr : k % 18 < 18 := Nat.mod_lt _ (by norm_num)
    rw [← Nat.mod_add_div k 18, pow_add, pow_mul] at hmod19
    norm_num [Nat.mul_mod, Nat.pow_mod] at hmod19
    interval_cases h : k % 18 <;> norm_num at hmod19 <;> simp_all
  have hmod73 : 2 ^ k % 73 = 1 := by
    obtain ⟨m, hm⟩ := hk18
    rw [hm, pow_mul, Nat.pow_mod]
    norm_num
  have h73 : 73 ∣ n := by omega
  have hle : 73 ≤ n.maxPrimeFac :=
    Nat.le_maxPrimeFac (by omega) (by norm_num) h73
  omega

/--
Problem 6 in the 12th Romanian Master of Mathematics Competitions in 2020 was to prove that there
exist infinitely many odd primes $p$ such that, for every $n$, $P(n)P(n+1)\neq 2p$.
-/
@[category textbook, AMS 11]
theorem erdos_649.variants.rmm_2020 :
    {p : ℕ | p.Prime ∧ Odd p ∧
      ∀ n : ℕ, n.maxPrimeFac * (n + 1).maxPrimeFac ≠ 2 * p}.Infinite := by
  sorry

end Erdos649

#print axioms Erdos649.erdos_649.variants.tong

#print axioms Erdos649.erdos_649.variants.sampaio
