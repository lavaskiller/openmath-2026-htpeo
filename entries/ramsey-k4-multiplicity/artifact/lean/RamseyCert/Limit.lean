import Mathlib
import RamseyCert.Defs

namespace RamseyCert

open Finset Filter
open scoped BigOperators

/-- The number of monochromatic four-vertex complete subgraphs. -/
def monoK4 {m : ℕ} (c : Fin m → Fin m → Bool) : ℕ :=
  (Finset.univ.filter fun s : Finset (Fin m) =>
    s.card = 4 ∧
      ((∀ u ∈ s, ∀ v ∈ s, u ≠ v → c u v = true) ∨
       (∀ u ∈ s, ∀ v ∈ s, u ≠ v → c u v = false))).card

/-- The least possible monochromatic K4 count among symmetric colourings. -/
noncomputable def minMonoK4 (m : ℕ) : ℕ :=
  sInf {k : ℕ | ∃ c : Fin m → Fin m → Bool,
    (∀ u v, c u v = c v u) ∧ monoK4 c = k}

/-- The lower asymptotic Ramsey multiplicity of K4. -/
noncomputable def ramseyMultK4 : ℝ :=
  Filter.liminf (fun m : ℕ => (minMonoK4 m : ℝ) / (m.choose 4 : ℝ)) Filter.atTop

end RamseyCert

namespace RamseyCert
open Finset
attribute [local instance] Classical.propDecidable

private def good4 {m : ℕ} (c : Fin m → Fin m → Bool) (s : Finset (Fin m)) : Prop :=
  s.card = 4 ∧
    ((∀ u ∈ s, ∀ v ∈ s, u ≠ v → c u v = true) ∨
     (∀ u ∈ s, ∀ v ∈ s, u ≠ v → c u v = false))

private def monoOrdered {m : ℕ} (c : Fin m → Fin m → Bool) (f : Fin 4 → Fin m) : Prop :=
  (∀ i j, i ≠ j → c (f i) (f j) = true) ∨
  (∀ i j, i ≠ j → c (f i) (f j) = false)

private noncomputable def goodEnum {m : ℕ} {c : Fin m → Fin m → Bool}
    (s : {s : Finset (Fin m) // good4 c s}) : Fin 4 ≃ ↥s.val :=
  (finCongr s.property.1.symm).trans s.val.equivFin.symm

private noncomputable def enc {m : ℕ} {c : Fin m → Fin m → Bool}
    (p : {s : Finset (Fin m) // good4 c s} × Equiv.Perm (Fin 4))
    (i : Fin 4) : Fin m := ((goodEnum p.1) (p.2 i)).val

private lemma enc_mem {m : ℕ} {c : Fin m → Fin m → Bool}
    (p : {s : Finset (Fin m) // good4 c s} × Equiv.Perm (Fin 4)) (i : Fin 4) :
    enc p i ∈ p.1.val := (goodEnum p.1 (p.2 i)).property

private lemma enc_inj {m : ℕ} {c : Fin m → Fin m → Bool}
    (p : {s : Finset (Fin m) // good4 c s} × Equiv.Perm (Fin 4)) :
    Function.Injective (enc p) := by
  intro i j h
  apply p.2.injective
  apply (goodEnum p.1).injective
  exact Subtype.ext h

private lemma enc_surj {m : ℕ} {c : Fin m → Fin m → Bool}
    (p : {s : Finset (Fin m) // good4 c s} × Equiv.Perm (Fin 4))
    {x : Fin m} (hx : x ∈ p.1.val) : ∃ i : Fin 4, enc p i = x := by
  obtain ⟨j, hj⟩ := (goodEnum p.1).surjective ⟨x, hx⟩
  obtain ⟨i, hi⟩ := p.2.surjective j
  refine ⟨i, ?_⟩
  simpa [enc, hi] using congrArg Subtype.val hj

private lemma enc_mono {m : ℕ} {c : Fin m → Fin m → Bool}
    (p : {s : Finset (Fin m) // good4 c s} × Equiv.Perm (Fin 4)) :
    monoOrdered c (enc p) := by
  rcases p.1.property.2 with h | h
  · left
    intro i j hij
    exact h _ (enc_mem p i) _ (enc_mem p j) (fun heq => hij (enc_inj p heq))
  · right
    intro i j hij
    exact h _ (enc_mem p i) _ (enc_mem p j) (fun heq => hij (enc_inj p heq))

private lemma enc_injective {m : ℕ} {c : Fin m → Fin m → Bool} :
    Function.Injective (fun p : {s : Finset (Fin m) // good4 c s} × Equiv.Perm (Fin 4) => enc p) := by
  intro p q hfun
  have hset : p.1.val = q.1.val := by
    ext x
    constructor
    · intro hx
      obtain ⟨i, hi⟩ := enc_surj p hx
      have he : x = enc q i := hi.symm.trans (congrFun hfun i)
      exact he ▸ enc_mem q i
    · intro hx
      obtain ⟨i, hi⟩ := enc_surj q hx
      have he : x = enc p i := hi.symm.trans (congrFun hfun i).symm
      exact he ▸ enc_mem p i
  have hp : p.1 = q.1 := Subtype.ext hset
  rcases p with ⟨s, σ⟩
  rcases q with ⟨r, τ⟩
  change s = r at hp
  subst r
  have hperm : σ = τ := by
    apply Equiv.ext
    intro i
    apply (goodEnum s).injective
    apply Subtype.ext
    exact congrFun hfun i
  exact congrArg (fun ρ => (s, ρ)) hperm

private theorem ordered_bound {m : ℕ} (c : Fin m → Fin m → Bool) :
    24 * monoK4 c ≤ (Finset.univ.filter (monoOrdered c) : Finset (Fin 4 → Fin m)).card := by
  classical
  let G := {s : Finset (Fin m) // good4 c s}
  have hG : Fintype.card G = monoK4 c := by
    have hg' : Fintype.card G = (Finset.univ.filter (good4 c)).card :=
      Fintype.card_subtype (good4 c)
    rw [hg']
    unfold monoK4
    congr 1
    ext s
    simp only [Finset.mem_filter, Finset.mem_univ, true_and, good4]
  have hp : Fintype.card (Equiv.Perm (Fin 4)) = 24 := by
    rw [Fintype.card_perm]
    norm_num
  have hcard : Fintype.card (G × Equiv.Perm (Fin 4)) = 24 * monoK4 c := by
    simp [Fintype.card_prod, hG, hp, Nat.mul_comm]
  rw [← hcard]
  let f : G × Equiv.Perm (Fin 4) → {g : Fin 4 → Fin m // monoOrdered c g} :=
    fun p => ⟨enc p, enc_mono p⟩
  have hinj : Function.Injective f := by
    intro p q h
    exact enc_injective (congrArg Subtype.val h)
  have hc := Fintype.card_le_of_injective f hinj
  simpa only [Fintype.card_subtype] using hc

end RamseyCert

namespace RamseyCert
open Finset
attribute [local instance] Classical.propDecidable

private def fourEquiv (α : Type*) : (Fin 4 → α) ≃ α × α × α × α where
  toFun f := (f 0, f 1, f 2, f 3)
  invFun p i := if i = 0 then p.1 else if i = 1 then p.2.1 else if i = 2 then p.2.2.1 else p.2.2.2
  left_inv f := by
    funext i
    fin_cases i <;> simp
  right_inv p := by
    rcases p with ⟨a, b, c, d⟩
    simp

private theorem sigma_four_count (T : Template) (t : ℕ) :
    (∑ a : Σ i : Fin T.n, Fin (t * T.w i),
     ∑ b : Σ i : Fin T.n, Fin (t * T.w i),
     ∑ c : Σ i : Fin T.n, Fin (t * T.w i),
     ∑ d : Σ i : Fin T.n, Fin (t * T.w i),
       if T.mono a.1 b.1 c.1 d.1 = true then 1 else 0) = t ^ 4 * T.numer := by
  simp_rw [Fintype.sum_sigma]
  -- dsimp only [Fintype.sum]
  have hinner (i j k l : Fin T.n) :
      (∑ _ : Fin (t * T.w l),
        if T.mono i j k l = true then (1 : ℕ) else 0) =
      (if T.mono i j k l = true then t * T.w l else 0) := by
    split_ifs <;> simp
  simp_rw [hinner]
  have hcommc (i j k : Fin T.n) :
      (∑ _ : Fin (t * T.w k), ∑ l : Fin T.n,
        if T.mono i j k l = true then t * T.w l else 0) =
      (∑ l : Fin T.n, ∑ _ : Fin (t * T.w k),
        if T.mono i j k l = true then t * T.w l else 0) :=
    Finset.sum_comm
  simp_rw [hcommc]
  have hc (i j k l : Fin T.n) :
      (∑ _ : Fin (t * T.w k),
        if T.mono i j k l = true then t * T.w l else 0) =
      (if T.mono i j k l = true then (t * T.w k) * (t * T.w l) else 0) := by
    split_ifs <;> simp
  simp_rw [hc]
  have hcommb (i j : Fin T.n) :
      (∑ _ : Fin (t * T.w j), ∑ k : Fin T.n, ∑ l : Fin T.n,
        if T.mono i j k l = true then (t * T.w k) * (t * T.w l) else 0) =
      (∑ k : Fin T.n, ∑ l : Fin T.n, ∑ _ : Fin (t * T.w j),
        if T.mono i j k l = true then (t * T.w k) * (t * T.w l) else 0) := by
    calc
      _ = ∑ k : Fin T.n, ∑ _ : Fin (t * T.w j), ∑ l : Fin T.n,
          if T.mono i j k l = true then (t * T.w k) * (t * T.w l) else 0 := Finset.sum_comm
      _ = _ := by
        apply Finset.sum_congr rfl
        intro k _
        exact Finset.sum_comm
  simp_rw [hcommb]
  have hb (i j k l : Fin T.n) :
      (∑ _ : Fin (t * T.w j),
        if T.mono i j k l = true then (t * T.w k) * (t * T.w l) else 0) =
      (if T.mono i j k l = true then (t * T.w j) * (t * T.w k) * (t * T.w l) else 0) := by
    split_ifs <;> simp [Nat.mul_assoc]
  simp_rw [hb]
  have hcomma (i : Fin T.n) :
      (∑ _ : Fin (t * T.w i), ∑ j : Fin T.n, ∑ k : Fin T.n, ∑ l : Fin T.n,
        if T.mono i j k l = true then (t * T.w j) * (t * T.w k) * (t * T.w l) else 0) =
      (∑ j : Fin T.n, ∑ k : Fin T.n, ∑ l : Fin T.n, ∑ _ : Fin (t * T.w i),
        if T.mono i j k l = true then (t * T.w j) * (t * T.w k) * (t * T.w l) else 0) := by
    calc
      _ = ∑ j : Fin T.n, ∑ _ : Fin (t * T.w i), ∑ k : Fin T.n, ∑ l : Fin T.n,
          if T.mono i j k l = true then (t * T.w j) * (t * T.w k) * (t * T.w l) else 0 := Finset.sum_comm
      _ = ∑ j : Fin T.n, ∑ k : Fin T.n, ∑ _ : Fin (t * T.w i), ∑ l : Fin T.n,
          if T.mono i j k l = true then (t * T.w j) * (t * T.w k) * (t * T.w l) else 0 := by
        apply Finset.sum_congr rfl
        intro j _
        exact Finset.sum_comm
      _ = _ := by
        apply Finset.sum_congr rfl
        intro j _
        apply Finset.sum_congr rfl
        intro k _
        exact Finset.sum_comm
  simp_rw [hcomma]
  have ha (i j k l : Fin T.n) :
      (∑ _ : Fin (t * T.w i),
        if T.mono i j k l = true then (t * T.w j) * (t * T.w k) * (t * T.w l) else 0) =
      (if T.mono i j k l = true then (t * T.w i) * (t * T.w j) * (t * T.w k) * (t * T.w l) else 0) := by
    split_ifs <;> simp [Nat.mul_assoc]
  simp_rw [ha]
  unfold Template.numer
  simp_rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  apply Finset.sum_congr rfl
  intro k _
  apply Finset.sum_congr rfl
  intro l _
  split_ifs <;> ring

end RamseyCert

namespace RamseyCert
open Finset
attribute [local instance] Classical.propDecidable

theorem blowup_count (T : Template) (hsym : T.Symmetric) (t : ℕ) :
    ∃ c : Fin (t * T.total) → Fin (t * T.total) → Bool, (∀ u v, c u v = c v u) ∧
      24 * monoK4 c ≤ t ^ 4 * T.numer := by
  let V := Σ i : Fin T.n, Fin (t * T.w i)
  have hcard : Fintype.card V = t * T.total := by
    simp [V, Fintype.card_sigma, Template.total, Finset.mul_sum]
  let e : V ≃ Fin (t * T.total) := (Fintype.equivFin V).trans (finCongr hcard)
  let c : Fin (t * T.total) → Fin (t * T.total) → Bool :=
    fun u v => T.red (e.symm u).1 (e.symm v).1
  have hcsym : ∀ u v, c u v = c v u := by
    intro u v
    exact hsym _ _
  refine ⟨c, hcsym, ?_⟩
  have hmono (f : Fin 4 → Fin (t * T.total))
      (hf : monoOrdered c f) :
      T.mono (e.symm (f 0)).1 (e.symm (f 1)).1
        (e.symm (f 2)).1 (e.symm (f 3)).1 = true := by
    rcases hf with h | h
    · have h01 := h 0 1 (by decide)
      have h02 := h 0 2 (by decide)
      have h03 := h 0 3 (by decide)
      have h12 := h 1 2 (by decide)
      have h13 := h 1 3 (by decide)
      have h23 := h 2 3 (by decide)
      simp [Template.mono, c, h01, h02, h03, h12, h13, h23]
    · have h01 := h 0 1 (by decide)
      have h02 := h 0 2 (by decide)
      have h03 := h 0 3 (by decide)
      have h12 := h 1 2 (by decide)
      have h13 := h 1 3 (by decide)
      have h23 := h 2 3 (by decide)
      simp [Template.mono, c, h01, h02, h03, h12, h13, h23]
  let B : Finset (Fin 4 → Fin (t * T.total)) :=
    Finset.univ.filter (fun f => T.mono (e.symm (f 0)).1 (e.symm (f 1)).1
      (e.symm (f 2)).1 (e.symm (f 3)).1 = true)
  have hsubset : (Finset.univ.filter (monoOrdered c) : Finset (Fin 4 → Fin (t * T.total))) ⊆ B := by
    intro f hf
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hf
    dsimp [B]
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    exact hmono f hf
  have hcount : B.card = t ^ 4 * T.numer := by
    have hB : B.card =
        ∑ f : Fin 4 → Fin (t * T.total),
          if T.mono (e.symm (f 0)).1 (e.symm (f 1)).1
            (e.symm (f 2)).1 (e.symm (f 3)).1 = true then 1 else 0 := by
      unfold B
      exact Finset.card_filter _ _
    let E : (Fin 4 → V) ≃ (Fin 4 → Fin (t * T.total)) :=
      Equiv.piCongrRight (fun _ => e)
    calc
      B.card = ∑ f : Fin 4 → Fin (t * T.total),
          if T.mono (e.symm (f 0)).1 (e.symm (f 1)).1
            (e.symm (f 2)).1 (e.symm (f 3)).1 = true then 1 else 0 := hB
      _ = ∑ f : Fin 4 → V,
          if T.mono (f 0).1 (f 1).1 (f 2).1 (f 3).1 = true then 1 else 0 := by
        simpa [E] using (Equiv.sum_comp E (fun f : Fin 4 → Fin (t * T.total) =>
          if T.mono (e.symm (f 0)).1 (e.symm (f 1)).1
            (e.symm (f 2)).1 (e.symm (f 3)).1 = true then (1 : ℕ) else 0)).symm
      _ = ∑ p : V × V × V × V,
          if T.mono p.1.1 p.2.1.1 p.2.2.1.1 p.2.2.2.1 = true then 1 else 0 := by
        exact Equiv.sum_comp (fourEquiv V) (fun p : V × V × V × V =>
          if T.mono p.1.1 p.2.1.1 p.2.2.1.1 p.2.2.2.1 = true then (1 : ℕ) else 0)
      _ = ∑ a : V, ∑ b : V, ∑ c : V, ∑ d : V,
          if T.mono a.1 b.1 c.1 d.1 = true then 1 else 0 := by
        simp_rw [Fintype.sum_prod_type]
      _ = t ^ 4 * T.numer := sigma_four_count T t
  calc
    24 * monoK4 c ≤ (Finset.univ.filter (monoOrdered c) : Finset (Fin 4 → Fin (t * T.total))).card := ordered_bound c
    _ ≤ B.card := Finset.card_le_card hsubset
    _ = t ^ 4 * T.numer := hcount

end RamseyCert

namespace RamseyCert

theorem minMonoK4_le (T : Template) (hsym : T.Symmetric) (t : ℕ) :
    24 * minMonoK4 (t * T.total) ≤ t ^ 4 * T.numer := by
  obtain ⟨c, hc, hbound⟩ := blowup_count T hsym t
  have hmin : minMonoK4 (t * T.total) ≤ monoK4 c := by
    exact Nat.sInf_le ⟨c, hc, rfl⟩
  omega

end RamseyCert

namespace RamseyCert

private theorem choose2 (n : ℕ) :
    2 * (n + 2).choose 2 = (n + 2) * (n + 1) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    have h : (n + 1 + 2).choose 2 = (n + 2).choose 1 + (n + 2).choose 2 := by
      convert Nat.choose_succ_succ (n + 2) 1 using 1
    rw [h]
    simp only [Nat.choose_one_right]
    nlinarith

private theorem choose3 (n : ℕ) :
    6 * (n + 3).choose 3 = (n + 3) * (n + 2) * (n + 1) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    have h : (n + 1 + 3).choose 3 = (n + 3).choose 2 + (n + 3).choose 3 := by
      convert Nat.choose_succ_succ (n + 3) 2 using 1
    rw [h]
    nlinarith [choose2 (n + 1)]

private theorem choose4 (n : ℕ) :
    24 * (n + 4).choose 4 = (n + 4) * (n + 3) * (n + 2) * (n + 1) := by
  induction n with
  | zero => norm_num
  | succ n ih =>
    have h : (n + 1 + 4).choose 4 = (n + 4).choose 3 + (n + 4).choose 4 := by
      convert Nat.choose_succ_succ (n + 4) 3 using 1
    rw [h]
    nlinarith [choose3 (n + 1)]

private theorem choose_four_mul (m : ℕ) (hm : 4 ≤ m) :
    24 * m.choose 4 = m * (m - 1) * (m - 2) * (m - 3) := by
  have h0 : m - 4 + 4 = m := by omega
  have h1 : m - 4 + 3 = m - 1 := by omega
  have h2 : m - 4 + 2 = m - 2 := by omega
  have h3 : m - 4 + 1 = m - 3 := by omega
  simpa only [h0, h1, h2, h3] using choose4 (m - 4)

private noncomputable def normDenom (Q t : ℕ) : ℝ :=
  (Q : ℝ) * ((Q : ℝ) - 1 / (t : ℝ)) *
    ((Q : ℝ) - 2 / (t : ℝ)) * ((Q : ℝ) - 3 / (t : ℝ))

private theorem normDenom_tendsto (Q : ℕ) :
    Filter.Tendsto (normDenom Q) Filter.atTop (nhds ((Q : ℝ) ^ 4)) := by
  have hr : Filter.Tendsto (fun t : ℕ => (1 : ℝ) / (t : ℝ)) Filter.atTop (nhds 0) :=
    tendsto_one_div_atTop_nhds_zero_nat
  have hd (k : ℝ) : Filter.Tendsto (fun t : ℕ => k / (t : ℝ)) Filter.atTop (nhds 0) := by
    simpa [div_eq_mul_inv] using (tendsto_const_nhds.mul hr :
      Filter.Tendsto (fun t : ℕ => k * ((1 : ℝ) / (t : ℝ))) Filter.atTop (nhds (k * 0)))
  have h1 : Filter.Tendsto (fun t : ℕ => (Q : ℝ) - 1 / (t : ℝ)) Filter.atTop (nhds (Q : ℝ)) := by
    simpa using tendsto_const_nhds.sub (hd 1)
  have h2 : Filter.Tendsto (fun t : ℕ => (Q : ℝ) - 2 / (t : ℝ)) Filter.atTop (nhds (Q : ℝ)) := by
    simpa using tendsto_const_nhds.sub (hd 2)
  have h3 : Filter.Tendsto (fun t : ℕ => (Q : ℝ) - 3 / (t : ℝ)) Filter.atTop (nhds (Q : ℝ)) := by
    simpa using tendsto_const_nhds.sub (hd 3)
  change Filter.Tendsto (fun t : ℕ => (Q : ℝ) * ((Q : ℝ) - 1 / (t : ℝ)) *
    ((Q : ℝ) - 2 / (t : ℝ)) * ((Q : ℝ) - 3 / (t : ℝ))) Filter.atTop (nhds ((Q : ℝ) ^ 4))
  convert ((tendsto_const_nhds.mul h1).mul h2).mul h3 using 1
  ring_nf

private theorem normDenom_identity (Q t : ℕ) (ht : 0 < t) :
    (t : ℝ) ^ 4 * normDenom Q t =
      ((t * Q : ℕ) : ℝ) * (((t * Q : ℕ) : ℝ) - 1) *
        (((t * Q : ℕ) : ℝ) - 2) * (((t * Q : ℕ) : ℝ) - 3) := by
  have ht' : (t : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt ht)
  simp only [normDenom, Nat.cast_mul]
  field_simp [ht']

private theorem subseq_upper (T : RamseyCert.Template) (hsym : T.Symmetric)
    (t : ℕ) (ht : 0 < t) (hm : 4 ≤ t * T.total) :
    ((RamseyCert.minMonoK4 (t * T.total) : ℝ) / ((t * T.total).choose 4 : ℝ)) ≤
      (T.numer : ℝ) / normDenom T.total t := by
  let m := t * T.total
  let D := normDenom T.total t
  have hn := RamseyCert.minMonoK4_le T hsym t
  have hr : (24 : ℝ) * (RamseyCert.minMonoK4 m : ℝ) ≤ (t : ℝ) ^ 4 * (T.numer : ℝ) := by
    exact_mod_cast hn
  have hchooseNat := choose_four_mul m hm
  have hchooseR : (24 : ℝ) * (m.choose 4 : ℝ) =
      (m : ℝ) * ((m : ℝ) - 1) * ((m : ℝ) - 2) * ((m : ℝ) - 3) := by
    have h := congrArg (fun x : ℕ => (x : ℝ)) hchooseNat
    simp only [Nat.cast_mul, Nat.cast_ofNat, Nat.cast_sub (by omega : 1 ≤ m),
      Nat.cast_sub (by omega : 2 ≤ m), Nat.cast_sub (by omega : 3 ≤ m)] at h
    simpa using h
  have hD : (24 : ℝ) * (m.choose 4 : ℝ) = (t : ℝ) ^ 4 * D := by
    calc
      _ = (m : ℝ) * ((m : ℝ) - 1) * ((m : ℝ) - 2) * ((m : ℝ) - 3) := hchooseR
      _ = (t : ℝ) ^ 4 * D := (normDenom_identity T.total t ht).symm
  have hchoosePos : (0 : ℝ) < (m.choose 4 : ℝ) := by
    exact_mod_cast (Nat.choose_pos hm)
  have htPos : (0 : ℝ) < (t : ℝ) ^ 4 := by positivity
  have hDPos : (0 : ℝ) < D := by nlinarith [hD]
  apply (div_le_div_iff₀ hchoosePos hDPos).2
  have hmul := mul_le_mul_of_nonneg_right hr (le_of_lt hDPos)
  nlinarith [hD]

theorem ramseyMultK4_le_density (T : Template) (hsym : T.Symmetric)
    (hpos : 0 < T.total) : ramseyMultK4 ≤ (T.density : ℝ) := by
  let f : ℕ → ℝ := fun m => (RamseyCert.minMonoK4 m : ℝ) / (m.choose 4 : ℝ)
  let g : ℕ → ℝ := fun t => (T.numer : ℝ) / normDenom T.total t
  have hQ : (T.total : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hpos)
  have hlim : Filter.Tendsto g Filter.atTop
      (nhds ((T.numer : ℝ) / (T.total : ℝ) ^ 4)) := by
    exact tendsto_const_nhds.div (normDenom_tendsto T.total) (pow_ne_zero 4 hQ)
  have hmult : Filter.Tendsto (fun t : ℕ => t * T.total) Filter.atTop Filter.atTop := by
    apply Filter.tendsto_atTop.2
    intro M
    filter_upwards [Filter.eventually_ge_atTop M] with t ht
    calc
      M ≤ t := ht
      _ = t * 1 := by omega
      _ ≤ t * T.total := Nat.mul_le_mul_left t (by omega)
  have hupper : ∀ᶠ t : ℕ in Filter.atTop, f (t * T.total) ≤ g t := by
    filter_upwards [Filter.eventually_ge_atTop 4] with t ht
    have htm : 4 ≤ t * T.total := by
      calc
        4 ≤ t := ht
        _ = t * 1 := by omega
        _ ≤ t * T.total := Nat.mul_le_mul_left t (by omega)
    exact subseq_upper T hsym t (by omega) htm
  have hbounded : Filter.IsBoundedUnder (fun x y : ℝ => x ≥ y) Filter.atTop f := by
    apply Filter.isBoundedUnder_of
    refine ⟨0, ?_⟩
    intro m
    dsimp [f]
    positivity
  have hresult : Filter.liminf f Filter.atTop ≤
      (T.numer : ℝ) / (T.total : ℝ) ^ 4 := by
    apply Filter.liminf_le_of_le hbounded
    intro b hb
    have hbsub : ∀ᶠ t : ℕ in Filter.atTop, b ≤ f (t * T.total) := hmult.eventually hb
    have hb_g : (fun _ : ℕ => b) ≤ᶠ[Filter.atTop] g := by
      filter_upwards [hbsub, hupper] with t h1 h2
      exact h1.trans h2
    exact le_of_tendsto_of_tendsto tendsto_const_nhds hlim hb_g
  simpa [RamseyCert.ramseyMultK4, f, RamseyCert.Template.density] using hresult

end RamseyCert

#print axioms RamseyCert.blowup_count
#print axioms RamseyCert.minMonoK4_le
#print axioms RamseyCert.ramseyMultK4_le_density
