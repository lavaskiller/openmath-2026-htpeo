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
# Erdős Problem 358

*References:*
- [erdosproblems.com/358](https://www.erdosproblems.com/358)
- [Ta26] T. Tao, [Erdős problem 358](https://terrytao.wordpress.com/wp-content/uploads/2026/02/erdos-358-2.pdf) (2026)
-/

@[expose] public section

namespace Erdos358

open Filter Finset

/-
Let $a$ be an infinite sequence of integers. `intervalRepresentations A n` is the set of solutions
to $$n=\sum_{u\leq i\leq v}a_i.$$ where `u` and `v` are positive integers.
-/
def intervalRepresentations (A : ℕ → ℕ) (n : ℕ) : Set (ℕ × ℕ) :=
  {(u, v) | 0 < u ∧ 0 < v ∧ n = ∑ i ∈ Icc u v, A i}

/-
Let $a$ be an infinite sequence of integers. Let $f(n)$ count the number of
solutions to $$n=\sum_{u\leq i\leq v}a_i.$$
-/
noncomputable def f (A : ℕ → ℕ) (n : ℕ) : ℕ :=
  Nat.card (intervalRepresentations A n)

/-
Let $a$ be an infinite sequence of integers. `intervalRepresentationsNonTrivial A n` is the set of
solutions to $$n=\sum_{u\leq i\leq v}a_i$$ such that the sum has at least two terms.
-/
def intervalRepresentationsNonTrivial (A : ℕ → ℕ) (n : ℕ) : Set (ℕ × ℕ) :=
  {(u, v) | 0 < u ∧ 0 < v ∧ u < v ∧ n = ∑ i ∈ Icc u v, A i}

/-
Let $a$ be an infinite sequence of integers. Let $g(n)$ count the number of
solutions to $$n=\sum_{u\leq i\leq v}a_i.$$ such that the sum has at least two terms.
-/
noncomputable def g (A : ℕ → ℕ) (n : ℕ) : ℕ :=
  Nat.card (intervalRepresentationsNonTrivial A n)

/--
When $A_n = n$, the function $f$ defined above counts the number of odd divisors of $n$.
-/
@[category textbook, AMS 5 11]
theorem f_id : f id = fun n ↦ #{d ∈ n.divisors | Odd d} := by
  funext n
  show Nat.card (intervalRepresentations id n) = (Finset.filter (fun d => Odd d) n.divisors).card
  rw [Nat.card_coe_set_eq]
  -- Gauss: 2 * (u + (u+1) + ... + (u+L)) = (L+1) * (2u+L)
  have gauss : ∀ L u : ℕ, (∑ i ∈ Finset.Icc u (u + L), i) * 2 = (L + 1) * (2 * u + L) := by
    intro L u
    induction L with
    | zero =>
      rw [Nat.add_zero, Finset.Icc_self, Finset.sum_singleton]
      ring
    | succ L ih =>
      show (∑ i ∈ Finset.Icc u (u + L + 1), i) * 2 = (L + 1 + 1) * (2 * u + (L + 1))
      rw [Finset.sum_Icc_succ_top (show u ≤ u + L + 1 by omega), add_mul, ih]
      ring
  rcases Nat.eq_zero_or_pos n with hn0 | hn
  · -- n = 0 : infinitely many (empty) representations, `Nat.card` of an infinite set is 0
    subst hn0
    have hinf : (intervalRepresentations id 0).Infinite :=
      Set.infinite_of_injective_forall_mem (f := fun k : ℕ => (k + 2, 1))
        (fun a b h => by simpa using h)
        (fun k => by
          show 0 < k + 2 ∧ 0 < 1 ∧ 0 = ∑ i ∈ Finset.Icc (k + 2) 1, id i
          have he : Finset.Icc (k + 2) 1 = ∅ := Finset.Icc_eq_empty (by omega)
          rw [he]
          simp)
    rw [hinf.ncard]
    simp
  · -- n > 0 : (u, v) is a representation iff 0 < u ≤ v and (v + 1 - u) * (u + v) = 2 n
    have char : ∀ u v : ℕ, ((u, v) ∈ intervalRepresentations id n ↔
        0 < u ∧ u ≤ v ∧ (v + 1 - u) * (u + v) = 2 * n) := by
      intro u v
      constructor
      · rintro ⟨hu, hv, hsum⟩
        have huv : u ≤ v := by
          by_contra h
          have he : Finset.Icc u v = ∅ := Finset.Icc_eq_empty (by omega)
          rw [he] at hsum
          simp at hsum
          omega
        obtain ⟨L, rfl⟩ : ∃ L, v = u + L := ⟨v - u, by omega⟩
        have hsum' : n = ∑ i ∈ Finset.Icc u (u + L), i := hsum
        have g := gauss L u
        refine ⟨hu, by omega, ?_⟩
        have h1 : u + L + 1 - u = L + 1 := by omega
        have h2 : u + (u + L) = 2 * u + L := by ring
        rw [h1, h2, ← g, hsum']
        ring
      · rintro ⟨hu, huv, hprod⟩
        obtain ⟨L, rfl⟩ : ∃ L, v = u + L := ⟨v - u, by omega⟩
        have g := gauss L u
        have h1 : u + L + 1 - u = L + 1 := by omega
        have h2 : u + (u + L) = 2 * u + L := by ring
        rw [h1, h2] at hprod
        show 0 < u ∧ 0 < u + L ∧ n = ∑ i ∈ Finset.Icc u (u + L), id i
        refine ⟨hu, by omega, ?_⟩
        show n = ∑ i ∈ Finset.Icc u (u + L), i
        omega
    -- the bijection: an odd divisor d of n, with q = 2 * (n / d), goes to the representation with
    -- (number of terms, first + last) = (min d q, max d q)
    obtain ⟨φ, hφ⟩ : ∃ φ : ℕ → ℕ × ℕ, ∀ d, φ d =
        if d < 2 * (n / d) then ((2 * (n / d) - d + 1) / 2, (2 * (n / d) + d - 1) / 2)
        else ((d - 2 * (n / d) + 1) / 2, (d + 2 * (n / d) - 1) / 2) := ⟨fun d => _, fun d => rfl⟩
    have key : ∀ d ∈ Finset.filter (fun d => Odd d) n.divisors, ∀ u v : ℕ, φ d = (u, v) →
        0 < u ∧ u ≤ v ∧ ((v + 1 - u = d ∧ u + v = 2 * (n / d)) ∨
          (v + 1 - u = 2 * (n / d) ∧ u + v = d)) := by
      intro d hd u v h
      have hdo : d % 2 = 1 := Nat.odd_iff.mp (Finset.mem_filter.mp hd).2
      have hdvd : d ∣ n := (Nat.mem_divisors.mp (Finset.mem_filter.mp hd).1).1
      have hdpos : 0 < d := Nat.pos_of_dvd_of_pos hdvd hn
      have hq : 0 < n / d := Nat.div_pos (Nat.le_of_dvd hn hdvd) hdpos
      rw [hφ] at h
      generalize n / d = q at h hq ⊢
      split_ifs at h with hlt
      · rw [Prod.mk.injEq] at h
        obtain ⟨hu', hv'⟩ := h
        omega
      · rw [Prod.mk.injEq] at h
        obtain ⟨hu', hv'⟩ := h
        omega
    have hinj : Set.InjOn φ (↑(Finset.filter (fun d => Odd d) n.divisors) : Set ℕ) := by
      intro d1 h1 d2 h2 heq
      have h1' := Finset.mem_coe.mp h1
      have h2' := Finset.mem_coe.mp h2
      have ho1 : d1 % 2 = 1 := Nat.odd_iff.mp (Finset.mem_filter.mp h1').2
      have ho2 : d2 % 2 = 1 := Nat.odd_iff.mp (Finset.mem_filter.mp h2').2
      obtain ⟨-, -, c1⟩ := key d1 h1' (φ d1).1 (φ d1).2 rfl
      obtain ⟨-, -, c2⟩ := key d2 h2' (φ d1).1 (φ d1).2 heq.symm
      generalize (φ d1).1 = u at c1 c2
      generalize (φ d1).2 = v at c1 c2
      generalize n / d1 = q1 at c1
      generalize n / d2 = q2 at c2
      rcases c1 with ⟨a1, b1⟩ | ⟨a1, b1⟩ <;> rcases c2 with ⟨a2, b2⟩ | ⟨a2, b2⟩ <;> omega
    have himg : intervalRepresentations id n =
        φ '' (↑(Finset.filter (fun d => Odd d) n.divisors) : Set ℕ) := by
      ext ⟨u, v⟩
      rw [char u v]
      constructor
      · rintro ⟨hu, huv, hprod⟩
        by_cases hL : Odd (v + 1 - u)
        · -- the number of terms L = v + 1 - u is the odd divisor
          have hLo : (v + 1 - u) % 2 = 1 := Nat.odd_iff.mp hL
          obtain ⟨b, hb⟩ : ∃ b, u + v = 2 * b := ⟨(u + v) / 2, by omega⟩
          have hLb : (v + 1 - u) * b = n := by
            have h3 : 2 * ((v + 1 - u) * b) = 2 * n := by rw [← hprod, hb]; ring
            omega
          have hLpos : 0 < v + 1 - u := by omega
          have hdiv : n / (v + 1 - u) = b := Nat.div_eq_of_eq_mul_right hLpos hLb.symm
          refine ⟨v + 1 - u, Finset.mem_coe.mpr (Finset.mem_filter.mpr
            ⟨Nat.mem_divisors.mpr ⟨⟨b, hLb.symm⟩, hn.ne'⟩, hL⟩), ?_⟩
          have hlt : v + 1 - u < 2 * b := by omega
          rw [hφ, hdiv, if_pos hlt, Prod.mk.injEq]
          constructor <;> omega
        · -- otherwise first + last = u + v is the odd divisor
          have hLe : (v + 1 - u) % 2 = 0 := Nat.even_iff.mp (Nat.not_odd_iff_even.mp hL)
          obtain ⟨a, ha⟩ : ∃ a, v + 1 - u = 2 * a := ⟨(v + 1 - u) / 2, by omega⟩
          have hso : Odd (u + v) := Nat.odd_iff.mpr (by omega)
          have hsa : (u + v) * a = n := by
            have h3 : 2 * ((u + v) * a) = 2 * n := by rw [← hprod, ha]; ring
            omega
          have hspos : 0 < u + v := by omega
          have hdiv : n / (u + v) = a := Nat.div_eq_of_eq_mul_right hspos hsa.symm
          refine ⟨u + v, Finset.mem_coe.mpr (Finset.mem_filter.mpr
            ⟨Nat.mem_divisors.mpr ⟨⟨a, hsa.symm⟩, hn.ne'⟩, hso⟩), ?_⟩
          have hnlt : ¬ (u + v < 2 * a) := by omega
          rw [hφ, hdiv, if_neg hnlt, Prod.mk.injEq]
          constructor <;> omega
      · rintro ⟨d, hd, hd'⟩
        have hdm := Finset.mem_coe.mp hd
        obtain ⟨hu, huv, hc⟩ := key d hdm u v hd'
        have hdvd : d ∣ n := (Nat.mem_divisors.mp (Finset.mem_filter.mp hdm).1).1
        have hdq : d * (n / d) = n := Nat.mul_div_cancel' hdvd
        refine ⟨hu, huv, ?_⟩
        rcases hc with ⟨e1, e2⟩ | ⟨e1, e2⟩
        · rw [e1, e2]
          have h3 : d * (2 * (n / d)) = 2 * (d * (n / d)) := by ring
          rw [h3, hdq]
        · rw [e1, e2]
          have h3 : 2 * (n / d) * d = 2 * (d * (n / d)) := by ring
          rw [h3, hdq]
    rw [himg, hinj.ncard_image, Set.ncard_coe_finset]

/--
Let $A=\{a_1 < \cdots\}$ be an infinite sequence of integers. Let $f(n)$ count the number of
solutions to $$n=\sum_{u\leq i\leq v}a_i.$$
Is there such an $A$ for which $f(n)\to \infty$ as $n\to \infty$?

Tao [Ta26] constructed such a sequence with $f(n) \gg \log n$ for all sufficiently large $n$.
-/
@[category research solved, AMS 5 11, formal_proof using lean4 at "https://github.com/plby/lean-proofs/blob/1268917deaaaa0d674f651287027baa26cea9920/src/latest/ErdosProblems/Erdos358.lean#L9111"]
theorem erdos_358.parts.i :
    answer(True) ↔ ∃ A, StrictMono A ∧ atTop.Tendsto (f A) atTop := by
  sorry

/--
Let $A=\{a_1 < \cdots\}$ be an infinite sequence of integers. Let $f(n)$ count the number of
solutions to $$n=\sum_{u\leq i\leq v}a_i.$$
Is there an $A$ such that $f(n)\geq 2$ for all large $n$?

This also follows from Tao's construction with $f(n) \gg \log n$ [Ta26].
-/
@[category research solved, AMS 5 11, formal_proof using lean4 at "https://github.com/plby/lean-proofs/blob/1268917deaaaa0d674f651287027baa26cea9920/src/latest/ErdosProblems/Erdos358.lean#L9115"]
theorem erdos_358.parts.ii :
    answer(True) ↔ ∃ A, StrictMono A ∧ ∀ᶠ n in atTop, 2 ≤ f A n := by
  sorry

/--
When $A =\{a_1 < \cdots\}$ corresponds to the set of primes, it is conjectured that the
$\limsup$ of the number of representations $$n=\sum_{u\leq i\leq v}a_i$$ is infinite.
-/
@[category research open, AMS 5 11]
theorem erdos_358.variants.prime_set :
    atTop.limsup (fun n ↦ (f (Nat.nth Nat.Prime) n : ℕ∞)) = ⊤ := by
  sorry

/--
When $A =\{a_1 < \cdots\}$ corresponds to the set of primes, it is conjectured that the set of
numbers $n$ that have representations $$n=\sum_{u\leq i\leq v}a_i$$ has positive upper density.
-/
@[category research open, AMS 5 11]
theorem erdos_358.variants.prime_set_density_representation :
    0 < {n : ℕ | intervalRepresentations (Nat.nth Nat.Prime) n |>.Nonempty}.upperDensity := by
  sorry

/--
If $A$ is strictly increasing then any $n > 0$ has at most one representation
$$n=\sum_{u\leq i\leq v}a_i$$ with a single term, so discarding the single-term representations
loses at most one solution.
-/
@[category API, AMS 5 11]
theorem one_le_g_of_two_le_f {A : ℕ → ℕ} (hA : StrictMono A) {n : ℕ} (hn : 0 < n)
    (hf : 2 ≤ f A n) : 1 ≤ g A n := by
  classical
  have hfin : (intervalRepresentations A n).Finite := by
    rcases Set.finite_or_infinite (intervalRepresentations A n) with h | h
    · exact h
    · rw [f, @Nat.card_eq_zero_of_infinite _ h.to_subtype] at hf
      omega
  have hsub : intervalRepresentationsNonTrivial A n ⊆ intervalRepresentations A n := by
    rintro ⟨u, v⟩ hr
    simp only [intervalRepresentationsNonTrivial, Set.mem_ofPred_eq] at hr
    simp only [intervalRepresentations, Set.mem_ofPred_eq]
    exact ⟨hr.1, hr.2.1, hr.2.2.2⟩
  refine (Set.ncard_pos (hfin.subset hsub)).mpr ?_
  by_contra hempty
  rw [Set.not_nonempty_iff_eq_empty] at hempty
  -- Without a representation of length at least two, every representation is a single term.
  have key : ∀ r ∈ intervalRepresentations A n, r.1 = r.2 ∧ A r.1 = n := by
    rintro ⟨u, v⟩ hr
    simp only [intervalRepresentations, Set.mem_ofPred_eq] at hr
    obtain ⟨hu, hv, hsum⟩ := hr
    have hle : u ≤ v := by
      by_contra hc
      rw [Finset.Icc_eq_empty hc, Finset.sum_empty] at hsum
      omega
    have huv : u = v := by
      rcases eq_or_lt_of_le hle with h | h
      · exact h
      · exact absurd (Set.eq_empty_iff_forall_notMem.mp hempty (u, v)
          (by simp only [intervalRepresentationsNonTrivial, Set.mem_ofPred_eq]
              exact ⟨hu, hv, h, hsum⟩)) (by simp)
    subst huv
    exact ⟨rfl, by simpa using hsum.symm⟩
  -- Injectivity of `A` then makes that single term unique, contradicting `2 ≤ f A n`.
  have := hfin.to_subtype
  obtain ⟨p, hp, q, hq, hpq⟩ := Set.one_lt_ncard_iff_nontrivial.mp hf
  obtain ⟨hp₁, hpn⟩ := key p hp
  obtain ⟨hq₁, hqn⟩ := key q hq
  exact hpq (Prod.ext (hA.injective (hpn.trans hqn.symm))
    (by rw [← hp₁, ← hq₁]; exact hA.injective (hpn.trans hqn.symm)))

/--
In [ErGr80] Erdős and Graham further asked whether there is an $A$ with $f(n)\geq 1$ for all
large $n$. Egami observed that this holds trivially for $a_n=n$, so they may have intended to
count only those representations $$n=\sum_{u\leq i\leq v}a_i$$ that use at least two consecutive
terms, which is what $g$ counts.

This follows from Tao's construction [Ta26], which gives $f(n)\gg\log n$: see
`erdos_358.parts.ii` and `one_le_g_of_two_le_f`.
-/
@[category research solved, AMS 5 11]
theorem erdos_358.variants.one_le :
    ∃ A, StrictMono A ∧ ∀ᶠ n in atTop, 1 ≤ g A n := by
  obtain ⟨A, hA, hf⟩ := erdos_358.parts.ii.mp trivial
  refine ⟨A, hA, ?_⟩
  filter_upwards [hf, eventually_gt_atTop 0] with n hn hn₀
  exact one_le_g_of_two_le_f hA hn₀ hn


end Erdos358

#print axioms Erdos358.f_id
