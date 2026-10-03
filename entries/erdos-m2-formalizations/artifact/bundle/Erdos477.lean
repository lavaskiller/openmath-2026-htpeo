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
# Erdős Problem 477

*References:*
- [erdosproblems.com/477](https://www.erdosproblems.com/477)
- [Sek59](http://dml.cz/dmlcz/100376) Milan Sekanina, Замечания к фактoризации беcкoнечнoй цикличеcкoй группы, Czechoslovak Mathematical Journal, Vol. 9 (1959), No. 4, 485–495
- The resolution is recorded at [erdosproblems.com/477](https://www.erdosproblems.com/477), with a
  proof exposition by T. F. Bloom of a construction found independently by several provers.
-/

@[expose] public section

open Polynomial Set

namespace Erdos477

/--
Is there a polynomial $f:\mathbb{Z}\to \mathbb{Z}$ of degree at least $2$ and a set
$A\subset \mathbb{Z}$ such that for any $n\in \mathbb{Z}$ there is exactly one $a\in A$ and
$b\in \{ f(k) : k\in\mathbb{Z}\}$ such that $n=a+b$?

The answer is yes, contrary to the expectation of Erdős and Graham: such an `A` exists whenever
$f(n) = n^d$ for even $d \ge 6$.

The linked formal proof (Codex, following Price's exposition) exhibits a complement of
$\{k^6 : k \in \mathbb{Z}\}$; it states uniqueness as `∃! p : ℤ × ℤ, p.1 ∈ A ∧ p.2 ∈ B ∧ p.1 + p.2 = n`
and the degree condition as `2 ≤ f.natDegree`.
-/
@[category research solved, AMS 12, formal_proof using lean4 at
  "https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos477.lean#L54"]
theorem erdos_477 : answer(True) ↔
    ∃ f : ℤ[X], 2 ≤ f.degree ∧ ∃ A : Set ℤ,
      ∀ z, ∃! ab ∈ A ×ˢ (Set.range f.eval), z = ab.1 + ab.2 := by
  sorry

/--
There is no such $A$ for the polynomial $f(x) = X^2$.

This is shown in [Sek59].
-/
@[category research solved, AMS 12]
theorem erdos_477.variants.S_sq :
    letI f := X ^ 2
    ∀ A : Set ℤ, ∃ z, ¬ ∃! a ∈ A ×ˢ (Set.range f.eval), z = a.1 + a.2 := by
  show ∀ A : Set ℤ, ∃ z, ¬ ∃! a ∈ A ×ˢ (Set.range (X ^ 2 : ℤ[X]).eval), z = a.1 + a.2
  intro A
  by_contra hcon
  push_neg at hcon
  -- every square is a value of `X ^ 2`, and every value is nonnegative
  have hS : ∀ k : ℤ, k ^ 2 ∈ Set.range (X ^ 2 : ℤ[X]).eval := fun k => ⟨k, by simp⟩
  have hSnn : ∀ s ∈ Set.range (X ^ 2 : ℤ[X]).eval, 0 ≤ s := by
    rintro s ⟨k, rfl⟩
    show (0 : ℤ) ≤ eval k (X ^ 2 : ℤ[X])
    have h : eval k (X ^ 2 : ℤ[X]) = k ^ 2 := by simp
    rw [h]
    exact sq_nonneg k
  -- uniqueness of representations: `a + j² = a' + j'²` with `a, a' ∈ A` forces `a = a'`
  have uniq : ∀ a ∈ A, ∀ a' ∈ A, ∀ j j' : ℤ, a + j ^ 2 = a' + j' ^ 2 → a = a' := by
    intro a ha a' ha' j j' hjj
    obtain ⟨p, -, hp⟩ := hcon (a + j ^ 2)
    have e1 := hp (a, j ^ 2) ⟨Set.mk_mem_prod ha (hS j), rfl⟩
    have e2 := hp (a', j' ^ 2) ⟨Set.mk_mem_prod ha' (hS j'), hjj⟩
    exact congrArg Prod.fst (e1.trans e2.symm)
  -- differences of squares are exactly the integers that are odd or divisible by 4,
  -- so two distinct elements of `A` differ by something `≡ 2 (mod 4)`
  have mod4 : ∀ a ∈ A, ∀ a' ∈ A, a ≠ a' → (a' - a) % 4 = 2 := by
    intro a ha a' ha' hne
    have hodd : ∀ j : ℤ, a' - a ≠ 2 * j + 1 := by
      intro j hj
      have e : a' = a + (2 * j + 1) := by linarith
      exact hne (uniq a ha a' ha' (j + 1) j (by rw [e]; ring))
    have h4 : ∀ j : ℤ, a' - a ≠ 4 * j := by
      intro j hj
      have e : a' = a + 4 * j := by linarith
      exact hne (uniq a ha a' ha' (j + 1) (j - 1) (by rw [e]; ring))
    by_contra hmod
    have hd : (a' - a) % 4 = 0 ∨ (a' - a) % 4 = 1 ∨ (a' - a) % 4 = 3 := by omega
    rcases hd with h | h | h
    · exact h4 ((a' - a) / 4) (by omega)
    · exact hodd ((a' - a) / 2) (by omega)
    · exact hodd ((a' - a) / 2) (by omega)
  -- every integer `z` is `a + (square)` for some `a ∈ A`, in particular `a ≤ z`
  have cover : ∀ z : ℤ, ∃ a ∈ A, a ≤ z := by
    intro z
    obtain ⟨p, ⟨hpm, hpz⟩, -⟩ := hcon z
    have hpm' := Set.mem_prod.mp hpm
    refine ⟨p.1, hpm'.1, ?_⟩
    have := hSnn p.2 hpm'.2
    linarith
  -- so `A` has three distinct elements, which is impossible modulo 4
  obtain ⟨a0, ha0, -⟩ := cover 0
  obtain ⟨a1, ha1, h1⟩ := cover (a0 - 1)
  obtain ⟨a2, ha2, h2⟩ := cover (a1 - 1)
  have m01 := mod4 a0 ha0 a1 ha1 (by omega)
  have m02 := mod4 a0 ha0 a2 ha2 (by omega)
  have m12 := mod4 a1 ha1 a2 ha2 (by omega)
  omega

/--
There is no such $A$ for any polynomial $f(x) = aX^2 + bX + c$, if $a | b$
with $a \ne 0$ and $b \ne 0$.
This was found be AlphaProof for the specific instance $X^2 - X + 1$ and then generalised.
 -/
@[category research solved, AMS 12]
theorem erdos_477.variants.degree_two_dvd_condition_b_ne_zero {a b c : ℤ} (ha : a ≠ 0) (hb : b ≠ 0)
    (hab : a ∣ b) :
    let f := a • X ^ 2 + b • X + C c
    ∀ A : Set ℤ, ∃ z, ¬ ∃! a ∈ A ×ˢ (Set.range f.eval), z = a.1 + a.2 := by
  obtain ⟨m, rfl⟩ := hab
  intro f A
  by_contra hcon
  push_neg at hcon
  -- values of `f`
  have hev : ∀ k : ℤ, f.eval k = a * k ^ 2 + a * m * k + c := by
    intro k
    simp [f]
  have hS : ∀ k : ℤ, a * k ^ 2 + a * m * k + c ∈ Set.range f.eval := fun k => ⟨k, hev k⟩
  -- uniqueness of representations
  have uniq : ∀ x ∈ A, ∀ x' ∈ A, ∀ k l : ℤ,
      x + (a * k ^ 2 + a * m * k + c) = x' + (a * l ^ 2 + a * m * l + c) → x = x' := by
    intro x hx x' hx' k l hkl
    obtain ⟨p, -, hp⟩ := hcon (x + (a * k ^ 2 + a * m * k + c))
    have e1 := hp (x, a * k ^ 2 + a * m * k + c) ⟨Set.mk_mem_prod hx (hS k), rfl⟩
    have e2 := hp (x', a * l ^ 2 + a * m * l + c) ⟨Set.mk_mem_prod hx' (hS l), hkl⟩
    exact congrArg Prod.fst (e1.trans e2.symm)
  -- every multiple of `4a` is a difference of two values of `f`, so two distinct elements of `A`
  -- never differ by a multiple of `4a`
  have nomult : ∀ x ∈ A, ∀ x' ∈ A, x ≠ x' → ∀ j : ℤ, x' - x ≠ 4 * a * j := by
    intro x hx x' hx' hne j hj
    have e : x' = x + 4 * a * j := by linarith
    obtain ⟨m', hm | hm⟩ := Int.even_or_odd' m
    · exact hne (uniq x hx x' hx' (1 + j - m') (j - 1 - m') (by rw [e, hm]; ring))
    · exact hne (uniq x hx x' hx' (2 * j - m') (2 * j - 1 - m') (by rw [e, hm]; ring))
  -- every `z` is `x + f(k)` with `x ∈ A`; as `4a·f(k) ≥ 4ac - a²m²`, this bounds `4a·x` from above
  have cover : ∀ z : ℤ, ∃ x ∈ A, 4 * a * x ≤ 4 * a * z + (a ^ 2 * m ^ 2 - 4 * a * c) := by
    intro z
    obtain ⟨p, ⟨hpm, hpz⟩, -⟩ := hcon z
    have hpm' := Set.mem_prod.mp hpm
    obtain ⟨k, hk⟩ := hpm'.2
    refine ⟨p.1, hpm'.1, ?_⟩
    have hk' : p.2 = a * k ^ 2 + a * m * k + c := by rw [← hk]; exact hev k
    have h1 : 4 * a * (a * k ^ 2 + a * m * k + c)
        = (a * (2 * k + m)) ^ 2 - a ^ 2 * m ^ 2 + 4 * a * c := by ring
    have h2 : 4 * a * z = 4 * a * p.1 + 4 * a * (a * k ^ 2 + a * m * k + c) := by
      rw [← hk', hpz]; ring
    have h3 := sq_nonneg (a * (2 * k + m))
    linarith
  -- hence below (in the order `x ↦ 4a·x`) every integer there is an element of `A`
  have ha2 : 1 ≤ a ^ 2 := by
    have h0 : 0 < a ^ 2 := lt_of_le_of_ne (sq_nonneg a) (Ne.symm (pow_ne_zero 2 ha))
    linarith
  have step : ∀ x : ℤ, ∃ y, y ∈ A ∧ 4 * a * y < 4 * a * x := by
    intro x
    obtain ⟨y, hy, hle⟩ := cover (x - a * (1 + |a ^ 2 * m ^ 2 - 4 * a * c|))
    refine ⟨y, hy, ?_⟩
    have hB : a ^ 2 * m ^ 2 - 4 * a * c ≤ |a ^ 2 * m ^ 2 - 4 * a * c| := le_abs_self _
    have hB0 : 0 ≤ |a ^ 2 * m ^ 2 - 4 * a * c| := abs_nonneg _
    have hT : 1 * (1 + |a ^ 2 * m ^ 2 - 4 * a * c|) ≤ a ^ 2 * (1 + |a ^ 2 * m ^ 2 - 4 * a * c|) :=
      mul_le_mul_of_nonneg_right ha2 (by linarith)
    have hexp : 4 * a * (x - a * (1 + |a ^ 2 * m ^ 2 - 4 * a * c|))
        = 4 * a * x - 4 * (a ^ 2 * (1 + |a ^ 2 * m ^ 2 - 4 * a * c|)) := by ring
    rw [hexp] at hle
    linarith
  choose nxt hnA hnlt using step
  -- an infinite sequence of pairwise distinct elements of `A`
  obtain ⟨g, hg0, hgs⟩ : ∃ g : ℕ → ℤ, g 0 = nxt 0 ∧ ∀ n, g (n + 1) = nxt (g n) :=
    ⟨fun n => Nat.rec (nxt 0) (fun _ x => nxt x) n, rfl, fun _ => rfl⟩
  have hgA : ∀ n, g n ∈ A := by
    intro n
    cases n with
    | zero => rw [hg0]; exact hnA 0
    | succ k => rw [hgs]; exact hnA _
  have hgstep : ∀ n, 4 * a * g (n + 1) < 4 * a * g n := by
    intro n
    rw [hgs]
    exact hnlt _
  have hganti : StrictAnti (fun n => 4 * a * g n) := strictAnti_nat_of_succ_lt hgstep
  have hginj : ∀ i j : ℕ, i ≠ j → g i ≠ g j := by
    intro i j hij h
    exact hij (hganti.injective (by show 4 * a * g i = 4 * a * g j; rw [h]))
  -- pigeonhole modulo `|4a|`
  obtain ⟨N, hN⟩ : ∃ N : ℕ, N = (4 * a).natAbs := ⟨_, rfl⟩
  have h4a : 4 * a ≠ 0 := mul_ne_zero (by norm_num) ha
  have hNpos : 0 < N := by rw [hN]; exact Int.natAbs_pos.mpr h4a
  have : NeZero N := ⟨hNpos.ne'⟩
  obtain ⟨i, j, hij, hcast⟩ := Fintype.exists_ne_map_eq_of_card_lt
    (fun i : Fin (N + 1) => ((g i.val : ℤ) : ZMod N))
    (by rw [ZMod.card, Fintype.card_fin]; omega)
  have hdvd : (N : ℤ) ∣ g j.val - g i.val :=
    (ZMod.intCast_eq_intCast_iff_dvd_sub _ _ _).mp hcast
  obtain ⟨t, ht⟩ := hdvd
  have hij' : g i.val ≠ g j.val := hginj i.val j.val (fun h => hij (Fin.ext h))
  rcases Int.natAbs_eq (4 * a) with h | h
  · rw [← hN] at h
    exact nomult (g i.val) (hgA _) (g j.val) (hgA _) hij' t (by rw [ht, h])
  · rw [← hN] at h
    have hN' : (N : ℤ) = -(4 * a) := by linarith
    exact nomult (g i.val) (hgA _) (g j.val) (hgA _) hij' (-t) (by rw [ht, hN']; ring)

/--
Probably there is no such $A$ for the polynomial $X^3$.
-/
@[category research open, AMS 12]
theorem erdos_477.variants.X_pow_three :
    letI f := X ^ 3
    ∀ A : Set ℤ, ∃ z, ¬ ∃! a ∈ A ×ˢ (Set.range f.eval), z = a.1 + a.2 := by
  sorry

/--
Sekanina [Sek59] asked whether there is no such $A$ for $X^k$, for every $k \ge 2$.
This is false: a complement exists for every even $k \ge 6$. The linked formal proof gives the
case $k = 6$.
-/
@[category research solved, AMS 12, formal_proof using lean4 at
  "https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos477.lean#L42"]
theorem erdos_477.variants.monomial : answer(False) ↔
    ∀ (k : ℕ), 2 ≤ k →
      letI f := X ^ k
      ∀ A : Set ℤ, ∃ z, ¬ ∃! a ∈ A ×ˢ (Set.range f.eval), z = a.1 + a.2 := by
  sorry

end Erdos477

#print axioms Erdos477.erdos_477.variants.S_sq

#print axioms Erdos477.erdos_477.variants.degree_two_dvd_condition_b_ne_zero
