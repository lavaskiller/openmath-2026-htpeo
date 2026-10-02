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
# Erdős Problem 261

*References:*
 - [erdosproblems.com/261](https://www.erdosproblems.com/261)
 - [BoLo90] Borwein, Peter and Loring, Terry A., Some questions of Erdős and Graham on numbers
    of the form $\sum g_n/2^{g_n}$. Math. Comp. (1990), 377--394.
 - [Er88c] Erdős, P., On the irrationality of certain series: problems and results. New advances
    in transcendence theory (Durham, 1986) (1988), 102--109.
 - [TUZ20] Tengely, Szabolcs and Ulas, Maciej and Zygadlo, Jakub, On a Diophantine equation of
    Erdős and Graham. J. Number Theory (2020), 445--459.
-/

@[expose] public section

open scoped Cardinal

namespace Erdos261

private theorem sum_Ioc_div_pow_two (a b : ℕ) (hab : a ≤ b) :
    (∑ k ∈ Finset.Ioc a b, (k : ℚ) / (2 ^ k : ℚ)) =
      (a + 2 : ℚ) / (2 ^ a : ℚ) - (b + 2 : ℚ) / (2 ^ b : ℚ) := by
  induction b, hab using Nat.le_induction with
  | base => simp
  | succ b hab ih =>
    rw [Finset.sum_Ioc_succ_top hab, ih]
    push_cast
    rw [pow_succ]
    have h : (2 ^ b : ℚ) ≠ 0 := pow_ne_zero _ (by norm_num)
    field_simp
    ring

private theorem two_pow_ge_add_two (m : ℕ) : m + 2 ≤ 2 ^ (m + 1) := by
  induction m with
  | zero => norm_num
  | succ m ih =>
    rw [show m + 1 + 1 = (m + 1) + 1 by omega, pow_succ]
    omega

private theorem two_pow_ge_double_add_two (m : ℕ) : 2 * m + 2 ≤ 2 ^ (m + 1) := by
  induction m with
  | zero => norm_num
  | succ m ih =>
    rw [show m + 1 + 1 = (m + 1) + 1 by omega, pow_succ]
    omega

/-- A natural number $n$ is said to have property `Erdos261Prop` if there exist $t \ge 2$
pairwise distinct positive integers $a_1, \ldots, a_t$ such that
$n / 2^n = \sum_{1 \le k \le t} a_k / 2^{a_k}$. -/
def Erdos261Prop (n : ℕ) : Prop := ∃ᵉ (t ≥ 2) (a : Fin t → ℕ), a.Injective ∧
  (1 ≤ a) ∧ n / (2 ^ n : ℚ) = ∑ k, (a k) / (2 ^ (a k) : ℚ)

/-- A canonical infinite representation of a rational number $x$ by positive integers. The
denominators are strictly increasing so that reorderings are not counted as different
representations. -/
def Erdos261InfiniteRepresentation (x : ℚ) (a : ℕ → ℕ) : Prop :=
  StrictMono a ∧ (1 ≤ a) ∧ Summable (fun k => (a k) / (2 ^ (a k) : ℚ)) ∧
    x = ∑' k, (a k) / (2 ^ (a k) : ℚ)

/-- For every positive integer $m$, if $n = 2^{m+1} - m - 2$, then
$$\frac{n}{2^n} = \sum_{n < k \le n + m} \frac{k}{2^k}.$$

This construction is due to Borwein and Loring [BoLo90]. -/
@[category textbook, AMS 11]
theorem erdos_261.variants.borwein_loring (m : ℕ) (hm : 0 < m) :
    let n := 2 ^ (m + 1) - m - 2
    n / (2 ^ n : ℚ) = ∑ k ∈ Finset.Ioc n (n + m), k / (2 ^ k : ℚ) := by
  dsimp
  set n := 2 ^ (m + 1) - m - 2 with hn
  have hge := two_pow_ge_add_two m
  have hnadd : n + m + 2 = 2 ^ (m + 1) := by
    dsimp [n]
    omega
  rw [sum_Ioc_div_pow_two n (n + m) (by omega)]
  have hpow : (2 ^ (n + m) : ℚ) = (2 ^ n : ℚ) * (2 ^ m : ℚ) := by
    rw [pow_add]
  have hpowm : (2 ^ (m + 1) : ℚ) = 2 * (2 ^ m : ℚ) := by
    rw [pow_succ]
    ring
  have hcast : (n + m + 2 : ℚ) = (2 ^ (m + 1) : ℚ) := by exact_mod_cast hnadd
  push_cast
  rw [hcast, hpow, hpowm]
  have h1 : (2 ^ n : ℚ) ≠ 0 := pow_ne_zero _ (by norm_num)
  have h2 : (2 ^ m : ℚ) ≠ 0 := pow_ne_zero _ (by norm_num)
  field_simp
  ring

/-- The Borwein--Loring construction gives the required property when $m \ge 2$. This lower
bound ensures that the representation contains at least two terms. -/
@[category textbook, AMS 11]
theorem erdos_261.variants.borwein_loring_property (m : ℕ) (hm : 2 ≤ m) :
    Erdos261Prop (2 ^ (m + 1) - m - 2) := by
  classical
  let n := 2 ^ (m + 1) - m - 2
  have hn : n = 2 ^ (m + 1) - m - 2 := rfl
  change Erdos261Prop n
  clear_value n
  unfold Erdos261Prop
  refine ⟨m, hm, (fun i : Fin m => n + i.val + 1), ?_, ?_, ?_⟩
  · intro i j hij
    apply Fin.ext
    exact Nat.add_left_cancel (Nat.add_right_cancel hij)
  · intro i
    simp only [Pi.one_apply]
    omega
  · have hsum :
        (∑ i : Fin m, ((n + i.val + 1 : ℕ) : ℚ) / (2 ^ (n + i.val + 1) : ℚ)) =
          ∑ k ∈ Finset.Ioc n (n + m), (k : ℚ) / (2 ^ k : ℚ) := by
      refine Finset.sum_bij (fun i _ => n + i.val + 1) ?_ ?_ ?_ ?_
      · intro i _
        simp only [Finset.mem_Ioc]
        omega
      · intro i _ j _ hij
        apply Fin.ext
        omega
      · intro k hk
        have hk' := Finset.mem_Ioc.mp hk
        refine ⟨⟨k - n - 1, by omega⟩, Finset.mem_univ _, ?_⟩
        change n + (k - n - 1) + 1 = k
        omega
      · intro i _
        rfl
    rw [hsum]
    simpa only [hn] using erdos_261.variants.borwein_loring m (by omega)

/-- Are there infinitely many positive integers $n$ such that there exist some $t \ge 2$ and
distinct integers $a_1, \ldots, a_t \ge 1$ satisfying
$$\frac{n}{2^n} = \sum_{1 \le k \le t} \frac{a_k}{2^{a_k}}?$$

In [Er88c], Erdős notes that Cusick had a simple proof that infinitely many such $n$ exist. -/
@[category research solved, AMS 11]
theorem erdos_261.parts.i : answer(True) ↔ {n : ℕ | 0 < n ∧ Erdos261Prop n}.Infinite := by
  constructor
  · intro _
    apply Set.infinite_of_forall_exists_gt
    intro k
    let m := k + 2
    let n := 2 ^ (m + 1) - m - 2
    have hm : 2 ≤ m := by omega
    have hpow := two_pow_ge_double_add_two m
    have hmn : m ≤ n := by dsimp [n]; omega
    refine ⟨n, ?_, ?_⟩
    · exact ⟨by omega, erdos_261.variants.borwein_loring_property m hm⟩
    · omega
  · intro _
    trivial

/-- Tengely, Ulas, and Zygadlo [TUZ20] verified that every positive integer $n \le 10000$ has
the required property. -/
@[category research solved, AMS 11]
theorem erdos_261.variants.le_10000 {n : ℕ} (hn_pos : 0 < n) (hn : n ≤ 10000) :
    Erdos261Prop n := by
  sorry

/-- Do all positive integers $n$ have the required property? -/
@[category research open, AMS 11]
theorem erdos_261.parts.ii : answer(sorry) ↔ ∀ n > 0, Erdos261Prop n := by
  sorry

/-- Is there a rational number $x$ such that
$$x = \sum_{k=1}^{\infty} \frac{a_k}{2^{a_k}}$$
has at least $2^{\aleph_0}$ representations by pairwise distinct positive integers $a_k$? -/
@[category research open, AMS 11]
theorem erdos_261.parts.iii : answer(sorry) ↔ ∃ x : ℚ,
    𝔠 ≤ #{a : ℕ → ℕ | Erdos261InfiniteRepresentation x a} := by
  sorry

/-- In [Er88c], Erdős asks the weaker question of whether there exists a rational $x$ with at
least two representations
$$x = \sum_{k=1}^{\infty} \frac{a_k}{2^{a_k}}$$
by pairwise distinct positive integers $a_k$.

The answer is yes: Z. Rafik (erdosproblems.com forum, 27 Apr 2026) observed that
$4/2^4 = 5/2^5 + 6/2^6$ and $\sum_{m \ge 1} m/2^m = 2$, so $7/4$ is represented both by
$\mathbb{N}_{>0} \setminus \{4\}$ and by $\mathbb{N}_{>0} \setminus \{5, 6\}$. It is generally believed that
"two" here is a misprint for $2^{\aleph_0}$ (see `erdos_261.parts.iii`, which remains open). -/
@[category research solved, AMS 11, formal_proof using lean4 at
  "https://github.com/g8r-b8/erdos261-lean/blob/976bddf21eafc93ea86a7a1bfd92b847070a6f31/Erdos261.lean#L87"]
theorem erdos_261.variants.two_representations : answer(True) ↔ ∃ x : ℚ,
    2 ≤ #{a : ℕ → ℕ | Erdos261InfiniteRepresentation x a} := by
  sorry

end Erdos261

#print axioms Erdos261.erdos_261.variants.borwein_loring
#print axioms Erdos261.erdos_261.variants.borwein_loring_property
#print axioms Erdos261.erdos_261.parts.i
