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
# Erdős Problem 918

*References:*
- [erdosproblems.com/918](https://www.erdosproblems.com/918)
- [ErHa68b] Erdős, P. and Hajnal, A., On chromatic number of infinite graphs. (1968), 83--98.
- [Er69b] Erdős, P., Problems and results in chromatic graph theory. Proof Techniques in Graph Theory (Proc. Second Ann Arbor Graph Theory Conf., Ann Arbor, Mich., 1968) (1969), 27-35.
-/

@[expose] public section

universe u

open scoped Cardinal Ordinal

namespace Erdos918

/-- Is there a graph with $\aleph_2$ vertices and chromatic number $\aleph_2$ such that every
subgraph on $\aleph_1$ vertices has chromatic number $\leq\aleph_0$? -/
-- Formalisation note: source material [ErHa68b] uses only induced subgraphs
@[category research open, AMS 5]
theorem erdos_918.parts.i :
    answer(sorry) ↔ ∃ (V : Type u) (G : SimpleGraph V), #V = ℵ_ 2 ∧ G.chromaticCardinal = ℵ_ 2 ∧
      ∀ (W : Set V) (_ : #W = ℵ₁), (G.induce W).chromaticCardinal ≤ ℵ₀ := by
  sorry

/-- Is there a graph with $\aleph_{\omega+1}$ vertices and chromatic number $\aleph_1$ such that
every subgraph on $\aleph_\omega$ vertices has chromatic number $\leq\aleph_0$? -/
-- Formalisation note: `ω` here is `Ordinal.omega0`, from `open scoped Ordinal`, as in 623.lean.
-- It is the fixed first infinite ordinal, not a variable: `variants.erdos_hajnal` settles every
-- finite `k` under GCH, and `ℵ_ω` is the limit of that family, so this asks the single next case.
@[category research open, AMS 5]
theorem erdos_918.parts.ii :
    answer(sorry) ↔
    ∃ (V : Type u) (G : SimpleGraph V), #V = ℵ_ (ω + 1) ∧ G.chromaticCardinal = ℵ₁ ∧
      ∀ (W : Set V) (_ : #W = ℵ_ ω), (G.induce W).chromaticCardinal ≤ ℵ₀ := by
  sorry

/-- Is there a graph with $\aleph_2$ vertices and chromatic number $\aleph_2$ such that every
subgraph on $\aleph_1$ vertices has chromatic number $\leq\aleph_0$? -/
-- Formalisation note: for the `≤ ℵ₀` direction this is the same question as `parts.i`, not a
-- separate one. Every subgraph on `W` is contained in the induced subgraph on `W`, so its
-- chromatic cardinal is no larger; and the top subgraph induced on `W` has `coe` equal to
-- `G.induce W`. So the two quantifications are equivalent and the answers cannot differ. The
-- `= ℵ₀` pair below is genuinely different, because an edgeless subgraph has chromatic
-- cardinal `1`, and that is the source's own reason for the impossibility there.
@[category research open, AMS 5]
theorem erdos_918.variants.all_subgraphs.parts.i :
    answer(sorry) ↔ ∃ (V : Type u) (G : SimpleGraph V), #V = ℵ_ 2 ∧ G.chromaticCardinal = ℵ_ 2 ∧
      ∀ (H : G.Subgraph) (_ : #H.verts = ℵ₁), H.coe.chromaticCardinal ≤ ℵ₀ := by
  sorry

/-- Is there a graph with $\aleph_{\omega+1}$ vertices and chromatic number $\aleph_1$ such that
every subgraph on $\aleph_\omega$ vertices has chromatic number $\leq\aleph_0$? -/
@[category research open, AMS 5]
theorem erdos_918.variants.all_subgraphs.parts.ii :
    answer(sorry) ↔
      ∃ (V : Type u) (G : SimpleGraph V), #V = ℵ_ (ω + 1) ∧ G.chromaticCardinal = ℵ₁ ∧
      ∀ (H : G.Subgraph) (_ : #H.verts = ℵ_ ω), H.coe.chromaticCardinal ≤ ℵ₀ := by
  sorry

/-- A question of Erd\H{o}s and Hajnal [ErHa68b], who proved, assuming the generalized continuum
hypothesis, that for every finite $k \geq 1$ there is a graph with chromatic number $\aleph_1$ and
$\aleph_k$ vertices where each subgraph on less than $\aleph_k$ vertices has chromatic number
$\leq \aleph_0$. -/
-- Formalisation note: the source is missing the assumption that the graph have ℵₖ vertices
-- which can be found in [ErHa68b, Corollary 1]. That corollary assumes the generalized continuum
-- hypothesis, stated here as `2 ^ c = Order.succ c` for every infinite cardinal `c`.
@[category research solved, AMS 5]
theorem erdos_918.variants.erdos_hajnal (hGCH : ∀ c : Cardinal.{u}, ℵ₀ ≤ c → 2 ^ c = Order.succ c)
    (k : ℕ) (hk : 0 < k) : ∃ (V : Type u) (G : SimpleGraph V),
    #V = ℵ_ k ∧ G.chromaticCardinal = ℵ₁ ∧
      ∀ (W : Set V) (_ : #W < ℵ_ k), (G.induce W).chromaticCardinal ≤ ℵ₀ := by
  sorry

private theorem edgeless_subgraph_contradiction {V : Type u} (G : SimpleGraph V)
    (κ : Cardinal.{u}) (hκ : κ ≤ #V) :
    ¬ ∀ (H : G.Subgraph), #H.verts = κ → H.coe.chromaticCardinal = ℵ₀ := by
  intro hall
  obtain ⟨W, -, hW⟩ :=
    (Cardinal.le_mk_iff_exists_subset (s := (Set.univ : Set V))).mp (by simpa using hκ)
  let H : G.Subgraph := {
    verts := W
    Adj := fun _ _ => False
    adj_sub := by intros; contradiction
    edge_vert := by intros; contradiction
  }
  have hχ : H.coe.chromaticCardinal ≤ 1 := by
    unfold SimpleGraph.chromaticCardinal
    apply csInf_le'
    refine ⟨ULift.{u} PUnit, by rw [Cardinal.mk_uLift, Cardinal.mk_punit]; simp, ?_⟩
    exact ⟨SimpleGraph.Coloring.mk (fun _ => ULift.up PUnit.unit)
      (by intro v w h; exact False.elim h)⟩
  have heq : H.coe.chromaticCardinal = ℵ₀ := hall H hW
  rw [heq] at hχ
  exact (not_lt_of_ge hχ) Cardinal.one_lt_aleph0

private theorem induced_aleph_one_contradiction {V : Type u} (G : SimpleGraph V)
    (hV : ℵ₁ ≤ #V) :
    ¬ ∀ (W : Set V), #W = ℵ₁ → (G.induce W).chromaticCardinal = ℵ₀ := by
  intro hall
  obtain ⟨W, -, hW⟩ :=
    (Cardinal.le_mk_iff_exists_subset (s := (Set.univ : Set V))).mp
      (by simpa only [Cardinal.mk_univ] using hV)
  have hχ := hall W hW
  have hne : ({κ : Cardinal.{u} | ∃ (C : Type u) (_ : #C = κ),
      Nonempty ((G.induce W).Coloring C)}).Nonempty := by
    refine ⟨#W, W, rfl, ?_⟩
    exact ⟨SimpleGraph.Coloring.mk (fun v : W => v) (by intro v w h; exact h.ne)⟩
  have hmem : ℵ₀ ∈ {κ : Cardinal.{u} | ∃ (C : Type u) (_ : #C = κ),
      Nonempty ((G.induce W).Coloring C)} := by
    rw [← hχ]
    exact csInf_mem hne
  obtain ⟨C, hC, ⟨col⟩⟩ := hmem
  letI : Countable C := Cardinal.mk_le_aleph0_iff.mp hC.le
  have hW_unc : ¬ Countable W := by
    intro hc
    have hle := Cardinal.mk_le_aleph0_iff.mpr hc
    rw [hW] at hle
    exact (not_lt_of_ge hle) Cardinal.aleph0_lt_aleph_one
  have hex : ∃ c : C, ¬ ({v : W | col v = c} : Set W).Countable := by
    by_contra hn
    push_neg at hn
    have hU : (⋃ c : C, {v : W | col v = c}) = Set.univ := by
      ext v
      simp
    have hc : (Set.univ : Set W).Countable := by
      rw [← hU]
      exact Set.countable_iUnion hn
    exact hW_unc (Set.countable_univ_iff.mp hc)
  obtain ⟨c, hc⟩ := hex
  let T : Set W := {v | col v = c}
  have hT : #T = ℵ₁ := by
    apply le_antisymm
    · calc
        #T ≤ #(Set.univ : Set W) := Cardinal.mk_le_mk_of_subset (Set.subset_univ T)
        _ = #W := Cardinal.mk_univ
        _ = ℵ₁ := hW
    · apply Cardinal.aleph_one_le_iff.mpr
      by_contra hn
      have hle : #T ≤ ℵ₀ := le_of_not_gt hn
      exact hc (Cardinal.le_aleph0_iff_set_countable.mp hle)
  let W' : Set V := Subtype.val '' T
  have hW' : #W' = ℵ₁ := by
    rw [Cardinal.mk_image_eq Subtype.val_injective]
    exact hT
  have hnone : ∀ {v w : W'}, ¬ (G.induce W').Adj v w := by
    intro v w hadj
    obtain ⟨v₀, hv₀, hv⟩ := v.property
    obtain ⟨w₀, hw₀, hw⟩ := w.property
    have hne : col v₀ ≠ col w₀ := col.valid (by
      change G.Adj v₀.1 w₀.1
      simpa [hv, hw] using hadj)
    exact hne (hv₀.trans hw₀.symm)
  have hχ' : (G.induce W').chromaticCardinal ≤ 1 := by
    unfold SimpleGraph.chromaticCardinal
    apply csInf_le'
    refine ⟨ULift.{u} PUnit, by rw [Cardinal.mk_uLift, Cardinal.mk_punit]; simp, ?_⟩
    exact ⟨SimpleGraph.Coloring.mk (fun _ => ULift.up PUnit.unit)
      (by intro v w h; exact False.elim (hnone h))⟩
  rw [hall W' hW'] at hχ'
  exact (not_lt_of_ge hχ') Cardinal.one_lt_aleph0

/-- In [Er69b] the questions are stated with $= \aleph_0$ rather than $\leq\aleph_0$. This is
a likely typo since it can be shown that no such graph exists in this case.

This is the first question with induced subgraphs. -/
-- Formalisation note: the source states the impossibility for general subgraphs, in a
-- parenthetical, "assuming subgraph and not induced subgraph was intended". It does not
-- assert it for induced subgraphs, and the argument for the general case does not carry
-- over: an induced subgraph on `W` has chromatic cardinal at least that of any subgraph
-- on `W`, so the edgeless-subgraph argument is unavailable here.
@[category textbook, AMS 5]
theorem erdos_918.variants.eq_aleph_0.parts.i :
    ¬∃ (V : Type u) (G : SimpleGraph V), #V = ℵ_ 2 ∧ G.chromaticCardinal = ℵ_ 2 ∧
      ∀ (W : Set V) (_ : #W = ℵ₁), (G.induce W).chromaticCardinal = ℵ₀ := by
  rintro ⟨V, G, hV, -, hall⟩
  apply induced_aleph_one_contradiction G ?_ hall
  rw [hV, Cardinal.aleph_le_aleph]
  norm_num

/-- In [Er69b] the questions are stated with $= \aleph_0$ rather than $\leq\aleph_0$. This is
a likely typo since it can be shown that no such graph exists in this case.

This is the first question with all subgraphs. -/
@[category textbook, AMS 5]
theorem erdos_918.variants.eq_aleph_0_all_subgraphs.parts.i :
    ¬∃ (V : Type u) (G : SimpleGraph V), #V = ℵ_ 2 ∧ G.chromaticCardinal = ℵ_ 2 ∧
      ∀ (H : G.Subgraph) (_ : #H.verts = ℵ₁), H.coe.chromaticCardinal = ℵ₀ := by
  rintro ⟨V, G, hV, -, hall⟩
  apply edgeless_subgraph_contradiction G ℵ₁ ?_ hall
  rw [hV, Cardinal.aleph_le_aleph]
  norm_num

/-- In [Er69b] the questions are stated with $= \aleph_0$ rather than $\leq\aleph_0$. This is
a likely typo since it can be shown that no such graph exists in this case.

This is the second question with induced subgraphs. -/
-- Formalisation note: the source states the impossibility for general subgraphs, in a
-- parenthetical, "assuming subgraph and not induced subgraph was intended". It does not
-- assert it for induced subgraphs, and the argument for the general case does not carry
-- over: an induced subgraph on `W` has chromatic cardinal at least that of any subgraph
-- on `W`, so the edgeless-subgraph argument is unavailable here.
@[category textbook, AMS 5]
theorem erdos_918.variants.eq_aleph_0.parts.ii :
    ¬∃ (V : Type u) (G : SimpleGraph V), #V = ℵ_ (ω + 1) ∧ G.chromaticCardinal = ℵ₁ ∧
      ∀ (W : Set V) (_ : #W = ℵ_ ω), (G.induce W).chromaticCardinal = ℵ₀ := by
  sorry

/-- In [Er69b] the questions are stated with $= \aleph_0$ rather than $\leq\aleph_0$. This is
a likely typo since it can be shown that no such graph exists in this case.

This is the second question with all subgraphs. -/
@[category textbook, AMS 5]
theorem erdos_918.variants.eq_aleph_0_all_subgraphs.parts.ii :
    ¬∃ (V : Type u) (G : SimpleGraph V), #V = ℵ_ (ω + 1) ∧ G.chromaticCardinal = ℵ₁ ∧
      ∀ (H : G.Subgraph) (_ : #H.verts = ℵ_ ω), H.coe.chromaticCardinal = ℵ₀ := by
  rintro ⟨V, G, hV, -, hall⟩
  apply edgeless_subgraph_contradiction G (ℵ_ ω) ?_ hall
  rw [hV, Cardinal.aleph_le_aleph]
  exact le_add_of_nonneg_right (by positivity)

end Erdos918

#print axioms Erdos918.erdos_918.variants.eq_aleph_0_all_subgraphs.parts.i
#print axioms Erdos918.erdos_918.variants.eq_aleph_0_all_subgraphs.parts.ii
#print axioms Erdos918.erdos_918.variants.eq_aleph_0.parts.i
