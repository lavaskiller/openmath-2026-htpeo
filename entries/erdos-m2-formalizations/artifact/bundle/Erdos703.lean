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
# Erdős Problem 703

*References:*
- [erdosproblems.com/703](https://www.erdosproblems.com/703)
- [Er75f] Erdős, Paul, _On some problems of elementary and combinatorial geometry_. Ann. Mat.
  Pura Appl. (4) (1975), 99-108.
- [Er76b] Erdős, P., _Problems and results in graph theory and combinatorial analysis_.
  Proceedings of the Fifth British Combinatorial Conference (Univ. Aberdeen, Aberdeen, 1975)
  (1976), 169-192.
- [Er81] Erdős, P., _On the combinatorial problems which I would most like to see solved_.
  Combinatorica (1981), 25-42.
- [Er82e] Erdős, Paul, _Some of my favourite problems which recently have been solved_. (1982),
  59--79.
- [FrFu84b] Frankl, P. and Füredi, Z., _On hypergraphs without two edges intersecting in a given
  number of vertices_. J. Combin. Theory Ser. A (1984), 230-236.
- [Fr77b] Frankl, P., _An intersection problem for finite sets_. Acta Math. Acad. Sci. Hungar.
  (1977), 371-373.
- [FrRo87] Frankl, Peter and Rödl, Vojtech, _Forbidden intersections_. Trans. Amer. Math. Soc.
  (1987), 259-286.
-/

@[expose] public section

open Finset

namespace Erdos703

/-- `T n r` is maximal such that there exists a family $\mathcal{F}$ of subsets of
$\{1,\ldots,n\}$ of size `T n r` such that $\lvert A\cap B\rvert\neq r$ for all
$A,B\in \mathcal{F}$ (including $A=B$). -/
noncomputable def T (n r : ℕ) : ℕ :=
  sSup {k | ∃ 𝓕 : Finset (Finset (Fin n)),
    (∀ A ∈ 𝓕, ∀ B ∈ 𝓕, (A ∩ B).card ≠ r) ∧ 𝓕.card = k}

/--
Let $r\geq 1$ and define $T(n,r)$ to be maximal such that there exists a family $\mathcal{F}$ of
subsets of $\{1,\ldots,n\}$ of size $T(n,r)$ such that $\lvert A\cap B\rvert\neq r$ for all
$A,B\in \mathcal{F}$.

Estimate $T(n,r)$ for $r\geq 2$. In particular, is it true that for every $\epsilon>0$ there
exists $\delta>0$ such that for all $\epsilon n<r<(1/2-\epsilon) n$ we have
$$T(n,r)<(2-\delta)^n?$$

The answer is yes, proved by Frankl and Rödl [FrRo87].
-/
@[category research solved, AMS 5, formal_proof using lean4 at
  "https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos703.lean#L331"]
theorem erdos_703 : answer(True) ↔
    ∀ ε : ℝ, 0 < ε → ∃ δ : ℝ, 0 < δ ∧
      ∀ (n r : ℕ), ε * n < r → r < (1 / 2 - ε) * n → (T n r : ℝ) < (2 - δ) ^ n := by
  sorry

private theorem zero_family_card_le (n : ℕ) (hn : 1 ≤ n)
    (𝓕 : Finset (Finset (Fin n)))
    (havoid : ∀ A ∈ 𝓕, ∀ B ∈ 𝓕, (A ∩ B).card ≠ 0) :
    𝓕.card ≤ 2 ^ (n - 1) := by
  classical
  let c : Finset (Fin n) → Finset (Fin n) := fun A => Aᶜ
  have hc_notMem : ∀ A ∈ 𝓕, c A ∉ 𝓕 := by
    intro A hA hcA
    have hne := havoid A hA (c A) hcA
    exact hne (by simp [c])
  have hdisj : Disjoint 𝓕 (𝓕.image c) := by
    rw [Finset.disjoint_left]
    intro A hA hAc
    obtain ⟨B, hB, rfl⟩ := Finset.mem_image.mp hAc
    exact hc_notMem B hB hA
  have hinj : Function.Injective c := by
    intro A B hAB
    have := congrArg c hAB
    simpa [c] using this
  have htwo : 𝓕.card + 𝓕.card ≤ 2 ^ n := by
    calc
      𝓕.card + 𝓕.card = (𝓕 ∪ 𝓕.image c).card := by
        rw [Finset.card_union_of_disjoint hdisj,
          Finset.card_image_of_injective _ hinj]
      _ ≤ (Finset.univ : Finset (Finset (Fin n))).card :=
        Finset.card_le_card (Finset.subset_univ _)
      _ = 2 ^ n := by simp
  have hp : 2 ^ n = 2 * 2 ^ (n - 1) := by
    conv_lhs => rw [show n = (n - 1) + 1 by omega]
    rw [Nat.pow_succ']
  omega

private theorem zero_star_card (n : ℕ) (hn : 1 ≤ n) :
    ((Finset.univ : Finset (Finset (Fin n))).filter
      (fun A => (⟨0, hn⟩ : Fin n) ∈ A)).card = 2 ^ (n - 1) := by
  classical
  let U : Finset (Fin n) := Finset.univ
  let z : Fin n := ⟨0, hn⟩
  have hcard : (U.erase z).card = n - 1 := by simp [U, z]
  rw [← hcard, ← Finset.card_powerset]
  apply Finset.card_nbij' (fun A => A.erase z) (fun B => insert z B)
  · intro A hA
    rw [Finset.mem_coe, Finset.mem_filter] at hA
    rw [Finset.mem_coe, Finset.mem_powerset]
    intro x hx
    exact Finset.mem_erase.mpr ⟨(Finset.mem_erase.mp hx).1, Finset.mem_univ _⟩
  · intro B hB
    rw [Finset.mem_coe, Finset.mem_powerset] at hB
    rw [Finset.mem_coe, Finset.mem_filter]
    exact ⟨Finset.mem_univ _, Finset.mem_insert_self _ _⟩
  · intro A hA
    rw [Finset.mem_coe, Finset.mem_filter] at hA
    exact Finset.insert_erase hA.2
  · intro B hB
    rw [Finset.mem_coe, Finset.mem_powerset] at hB
    have h0B : z ∉ B := fun h =>
      (Finset.mem_erase.mp (hB h)).1 rfl
    exact Finset.erase_insert h0B

/-- It is trivial that $T(n,0)=2^{n-1}$. -/
@[category textbook, AMS 5]
theorem erdos_703.variants.zero (n : ℕ) (hn : 1 ≤ n) : T n 0 = 2 ^ (n - 1) := by
  classical
  unfold T
  apply le_antisymm
  · apply csSup_le
    · refine ⟨0, ?_⟩
      exact ⟨∅, by simp, by simp⟩
    · intro k hk
      obtain ⟨𝓕, havoid, rfl⟩ := hk
      exact zero_family_card_le n hn 𝓕 havoid
  · let 𝓕 : Finset (Finset (Fin n)) :=
      Finset.univ.filter fun A => (⟨0, hn⟩ : Fin n) ∈ A
    have hcard : 𝓕.card = 2 ^ (n - 1) := zero_star_card n hn
    have havoid : ∀ A ∈ 𝓕, ∀ B ∈ 𝓕, (A ∩ B).card ≠ 0 := by
      intro A hA B hB
      have ha : (⟨0, hn⟩ : Fin n) ∈ A := (Finset.mem_filter.mp hA).2
      have hb : (⟨0, hn⟩ : Fin n) ∈ B := (Finset.mem_filter.mp hB).2
      exact ne_of_gt (Finset.card_pos.mpr ⟨⟨0, hn⟩, Finset.mem_inter.mpr ⟨ha, hb⟩⟩)
    have hbd : BddAbove {k : ℕ | ∃ 𝓕 : Finset (Finset (Fin n)),
        (∀ A ∈ 𝓕, ∀ B ∈ 𝓕, (A ∩ B).card ≠ 0) ∧ 𝓕.card = k} := by
      refine ⟨2 ^ n, ?_⟩
      intro k hk
      obtain ⟨G, _, rfl⟩ := hk
      simpa using (Finset.card_le_card (Finset.subset_univ G))
    exact le_csSup hbd ⟨𝓕, havoid, hcard⟩

/--
Frankl and Füredi [FrFu84b] proved that, for fixed $r$ and $n$ sufficiently large in terms of
$r$, the maximal $T(n,r)$ is achieved by taking
$$\mathcal{F} = \left\{ A\subseteq \{1,\ldots,n\} : \lvert A\rvert> \frac{n+r}{2}\textrm{ or }
\lvert A\rvert < r\right\}$$
when $n+r$ is odd, and
$$\mathcal{F} = \left\{ A\subseteq \{1,\ldots,n\} : \lvert A\backslash \{1\}\rvert\geq
\frac{n+r}{2}\textrm{ or }\lvert A\rvert < r\right\}$$
when $n+r$ is even.
-/
@[category research solved, AMS 5]
theorem erdos_703.variants.frankl_furedi (r : ℕ) : ∀ᶠ n : ℕ in Filter.atTop,
    T n r = if (n + r) % 2 = 1 then
      ((univ : Finset (Finset (Fin n))).filter fun A ↦
        (n + r : ℝ) / 2 < A.card ∨ A.card < r).card
    else
      ((univ : Finset (Finset (Fin n))).filter fun A ↦
        (n + r : ℝ) / 2 ≤ (A.filter fun i : Fin n ↦ (i : ℕ) ≠ 0).card ∨
          A.card < r).card := by
  sorry

end Erdos703

#print axioms Erdos703.erdos_703.variants.zero
