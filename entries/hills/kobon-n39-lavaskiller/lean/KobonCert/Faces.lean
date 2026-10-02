/-
Kobon triangle certificate: different triples of lines give DISJOINT open triangles.

`TriWitness L p q r A B C` is the body of `IsTriFace` (`IsTriFace L p q r ↔ ∃ A B C, TriWitness ..`).
Main result `triFaces_disjoint`: in an arrangement of proper, pairwise distinct lines, if two
different increasing index triples both bound a triangular face, the two open triangles are
disjoint.  Hence the triangular faces counted by `kobonCount` are pairwise non-overlapping.
-/
import KobonCert.Geom

namespace Kobon

def TriWitness (L : List Line) (p q r : Line) (A B C : ℝ × ℝ) : Prop :=
  OnLine p A ∧ OnLine q A ∧ OnLine p B ∧ OnLine r B ∧ OnLine q C ∧ OnLine r C ∧
    cross A B C ≠ 0 ∧ ∀ l ∈ L, ∀ P ∈ openTri A B C, ¬ OnLine l P

theorem isTriFace_iff (L : List Line) (p q r : Line) :
    IsTriFace L p q r ↔ ∃ A B C : ℝ × ℝ, TriWitness L p q r A B C := Iff.rfl

/-- the open triangle is nonempty (centroid) -/
lemma openTri_nonempty (A B C : ℝ × ℝ) : (openTri A B C).Nonempty :=
  ⟨(1 / 3 * A.1 + 1 / 3 * B.1 + 1 / 3 * C.1, 1 / 3 * A.2 + 1 / 3 * B.2 + 1 / 3 * C.2),
    1 / 3, 1 / 3, 1 / 3, by norm_num, by norm_num, by norm_num, by norm_num, rfl, rfl⟩

lemma mem_swap {A B C P : ℝ × ℝ} (h : P ∈ openTri A B C) : P ∈ openTri A C B := by
  obtain ⟨u, v, t, hu, hv, ht, hs, h1, h2⟩ := h
  exact ⟨u, t, v, hu, ht, hv, by linarith, by linarith, by linarith⟩

lemma mem_rot {A B C P : ℝ × ℝ} (h : P ∈ openTri A B C) : P ∈ openTri B C A := by
  obtain ⟨u, v, t, hu, hv, ht, hs, h1, h2⟩ := h
  exact ⟨v, t, u, hv, ht, hu, by linarith, by linarith, by linarith⟩

lemma ev_comb2 (l : Line) (X Z : ℝ × ℝ) (s : ℝ) :
    ev l ((1 - s) * X.1 + s * Z.1, (1 - s) * X.2 + s * Z.2) = (1 - s) * ev l X + s * ev l Z := by
  simp only [ev]; ring

/-- An affine form vanishing at three non-collinear points is zero. -/
lemma affine_zero {α β γ : ℝ} {A B C : ℝ × ℝ} (hc : cross A B C ≠ 0)
    (hA : α * A.1 + β * A.2 + γ = 0) (hB : α * B.1 + β * B.2 + γ = 0)
    (hC : α * C.1 + β * C.2 + γ = 0) : α = 0 ∧ β = 0 ∧ γ = 0 := by
  have h1 : α * cross A B C = 0 := by
    simp only [cross]; linear_combination (C.2 - A.2) * (hB - hA) - (B.2 - A.2) * (hC - hA)
  have h2 : β * cross A B C = 0 := by
    simp only [cross]; linear_combination (B.1 - A.1) * (hC - hA) - (C.1 - A.1) * (hB - hA)
  have a0 := (mul_eq_zero.mp h1).resolve_right hc
  have b0 := (mul_eq_zero.mp h2).resolve_right hc
  refine ⟨a0, b0, ?_⟩
  rw [a0, b0] at hA; linarith

/-- Barycentric identity for the triangle cut out by `p, q, r`
(`A = p ∩ q`, `B = p ∩ r`, `C = q ∩ r`), tested against the affine form `a0*x + b0*y + c0`. -/
lemma bary_gen {p q r : Line} {A B C : ℝ × ℝ}
    (hAp : OnLine p A) (hAq : OnLine q A) (hBp : OnLine p B) (hBr : OnLine r B)
    (hCq : OnLine q C) (hCr : OnLine r C) (hc : cross A B C ≠ 0)
    (fA : ev r A ≠ 0) (fB : ev q B ≠ 0) (fC : ev p C ≠ 0) (a0 b0 c0 : ℝ) (P : ℝ × ℝ) :
    ev r P / ev r A * (a0 * A.1 + b0 * A.2 + c0) + ev q P / ev q B * (a0 * B.1 + b0 * B.2 + c0)
      + ev p P / ev p C * (a0 * C.1 + b0 * C.2 + c0) = a0 * P.1 + b0 * P.2 + c0 := by
  unfold OnLine at hAp hAq hBp hBr hCq hCr
  obtain ⟨α, β, γ, gen⟩ : ∃ α β γ : ℝ, ∀ Q : ℝ × ℝ,
      ev r Q / ev r A * (a0 * A.1 + b0 * A.2 + c0) + ev q Q / ev q B * (a0 * B.1 + b0 * B.2 + c0)
        + ev p Q / ev p C * (a0 * C.1 + b0 * C.2 + c0) - (a0 * Q.1 + b0 * Q.2 + c0)
      = α * Q.1 + β * Q.2 + γ := by
    refine ⟨(r.a : ℝ) / ev r A * (a0 * A.1 + b0 * A.2 + c0)
          + (q.a : ℝ) / ev q B * (a0 * B.1 + b0 * B.2 + c0)
          + (p.a : ℝ) / ev p C * (a0 * C.1 + b0 * C.2 + c0) - a0,
        (r.b : ℝ) / ev r A * (a0 * A.1 + b0 * A.2 + c0)
          + (q.b : ℝ) / ev q B * (a0 * B.1 + b0 * B.2 + c0)
          + (p.b : ℝ) / ev p C * (a0 * C.1 + b0 * C.2 + c0) - b0,
        (r.c : ℝ) / ev r A * (a0 * A.1 + b0 * A.2 + c0)
          + (q.c : ℝ) / ev q B * (a0 * B.1 + b0 * B.2 + c0)
          + (p.c : ℝ) / ev p C * (a0 * C.1 + b0 * C.2 + c0) - c0, fun Q => ?_⟩
    have e : ∀ l : Line, ev l Q = (l.a : ℝ) * Q.1 + (l.b : ℝ) * Q.2 + (l.c : ℝ) := fun _ => rfl
    rw [e r, e q, e p]; ring
  have zA := gen A
  rw [hAq, hAp, div_self fA] at zA
  simp only [zero_div, zero_mul] at zA
  have zB := gen B
  rw [hBr, hBp, div_self fB] at zB
  simp only [zero_div, zero_mul] at zB
  have zC := gen C
  rw [hCr, hCq, div_self fC] at zC
  simp only [zero_div, zero_mul] at zC
  have key : α = 0 ∧ β = 0 ∧ γ = 0 :=
    affine_zero hc (by linarith) (by linarith) (by linarith)
  have zP := gen P
  rw [key.1, key.2.1, key.2.2] at zP
  linarith

/-- The open triangle is the set where the three normalised affine forms are positive. -/
lemma mem_openTri_iff {p q r : Line} {A B C : ℝ × ℝ}
    (hAp : OnLine p A) (hAq : OnLine q A) (hBp : OnLine p B) (hBr : OnLine r B)
    (hCq : OnLine q C) (hCr : OnLine r C) (hc : cross A B C ≠ 0)
    (fA : ev r A ≠ 0) (fB : ev q B ≠ 0) (fC : ev p C ≠ 0) (P : ℝ × ℝ) :
    P ∈ openTri A B C ↔ 0 < ev r P / ev r A ∧ 0 < ev q P / ev q B ∧ 0 < ev p P / ev p C := by
  constructor
  · rintro ⟨u, v, t, hu, hv, ht, hs, h1, h2⟩
    have hP : P = (u * A.1 + v * B.1 + t * C.1, u * A.2 + v * B.2 + t * C.2) := Prod.ext h1 h2
    unfold OnLine at hAp hAq hBp hBr hCq hCr
    have er : ev r P / ev r A = u := by
      rw [hP, ev_comb r A B C hs, hBr, hCr, mul_zero, mul_zero, add_zero, add_zero,
        mul_div_assoc, div_self fA, mul_one]
    have eq : ev q P / ev q B = v := by
      rw [hP, ev_comb q A B C hs, hAq, hCq, mul_zero, mul_zero, zero_add, add_zero,
        mul_div_assoc, div_self fB, mul_one]
    have ep : ev p P / ev p C = t := by
      rw [hP, ev_comb p A B C hs, hAp, hBp, mul_zero, mul_zero, zero_add, zero_add,
        mul_div_assoc, div_self fC, mul_one]
    rw [er, eq, ep]; exact ⟨hu, hv, ht⟩
  · rintro ⟨hu, hv, ht⟩
    have s := bary_gen hAp hAq hBp hBr hCq hCr hc fA fB fC 0 0 1 P
    have x := bary_gen hAp hAq hBp hBr hCq hCr hc fA fB fC 1 0 0 P
    have y := bary_gen hAp hAq hBp hBr hCq hCr hc fA fB fC 0 1 0 P
    exact ⟨_, _, _, hu, hv, ht, by linarith, by linarith, by linarith⟩

/-- Moving from a point `X` of the open triangle `U V W` towards a point `Z` of the open side
`U V` stays inside the open triangle. -/
lemma seg_mem {U V W X : ℝ × ℝ} (hX : X ∈ openTri U V W) {τ s : ℝ} (h0 : 0 < τ) (h1 : τ < 1)
    (hs0 : 0 ≤ s) (hs1 : s < 1) :
    ((1 - s) * X.1 + s * ((1 - τ) * U.1 + τ * V.1), (1 - s) * X.2 + s * ((1 - τ) * U.2 + τ * V.2))
      ∈ openTri U V W := by
  obtain ⟨u, v, t, hu, hv, ht, hsum, h1', h2'⟩ := hX
  have a : 0 < 1 - s := by linarith
  have b : 0 < 1 - τ := by linarith
  refine ⟨(1 - s) * u + s * (1 - τ), (1 - s) * v + s * τ, (1 - s) * t, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · have := mul_pos a hu; have := mul_nonneg hs0 b.le; linarith
  · have := mul_pos a hv; have := mul_nonneg hs0 h0.le; linarith
  · exact mul_pos a ht
  · linear_combination (1 - s) * hsum
  · show (1 - s) * X.1 + s * ((1 - τ) * U.1 + τ * V.1) = _
    rw [h1']; ring
  · show (1 - s) * X.2 + s * ((1 - τ) * U.2 + τ * V.2) = _
    rw [h2']; ring

/-- If the line `m` misses the open triangle `U V W`, the normalised form of `m` is positive at
the interior point `X`, then it is nonnegative at every point of the open side `U V`. -/
lemma nonneg_on_side {m : Line} {U V W X : ℝ × ℝ} (hX : X ∈ openTri U V W)
    (hm : ∀ P ∈ openTri U V W, ¬ OnLine m P) {c : ℝ} (hc : c ≠ 0) (hpos : 0 < ev m X / c)
    {τ : ℝ} (h0 : 0 < τ) (h1 : τ < 1) :
    0 ≤ ev m ((1 - τ) * U.1 + τ * V.1, (1 - τ) * U.2 + τ * V.2) / c := by
  by_contra hneg
  push Not at hneg
  set Z : ℝ × ℝ := ((1 - τ) * U.1 + τ * V.1, (1 - τ) * U.2 + τ * V.2) with hZ
  set x := ev m X / c with hx
  set z := ev m Z / c with hz
  have eX : ev m X = x * c := (div_mul_cancel₀ _ hc).symm
  have eZ : ev m Z = z * c := (div_mul_cancel₀ _ hc).symm
  have hD : 0 < x - z := by linarith
  have hsD : x / (x - z) * (x - z) = x := div_mul_cancel₀ x hD.ne'
  have hs0 : 0 ≤ x / (x - z) := div_nonneg hpos.le hD.le
  have hs1 : x / (x - z) < 1 := (div_lt_one hD).mpr (by linarith)
  have hY := seg_mem hX h0 h1 hs0 hs1
  apply hm _ hY
  show ev m ((1 - x / (x - z)) * X.1 + x / (x - z) * Z.1,
    (1 - x / (x - z)) * X.2 + x / (x - z) * Z.2) = 0
  rw [ev_comb2, eX, eZ]
  linear_combination (-c) * hsD

/-- Two proper lines through two distinct common points: every point of `l` is on `m`. -/
lemma onLine_of_two_points {l m : Line} (hl : l.a ≠ 0 ∨ l.b ≠ 0) {U V : ℝ × ℝ} (hne : U ≠ V)
    (hlU : OnLine l U) (hlV : OnLine l V) (hmU : OnLine m U) (hmV : OnLine m V)
    {P : ℝ × ℝ} (hP : OnLine l P) : OnLine m P := by
  have hcr := collinear_of_onLine hl hlU hlV hP
  simp only [cross] at hcr
  simp only [OnLine, ev] at hmU hmV ⊢
  have h1 : (V.1 - U.1) * ((m.a : ℝ) * P.1 + m.b * P.2 + m.c) = 0 := by
    linear_combination (V.1 - U.1) * hmU + (m.b : ℝ) * hcr + (P.1 - U.1) * (hmV - hmU)
  have h2 : (V.2 - U.2) * ((m.a : ℝ) * P.1 + m.b * P.2 + m.c) = 0 := by
    linear_combination (V.2 - U.2) * hmU - (m.a : ℝ) * hcr + (P.2 - U.2) * (hmV - hmU)
  by_contra h
  have d1 : V.1 - U.1 = 0 := (mul_eq_zero.mp h1).resolve_right h
  have d2 : V.2 - U.2 = 0 := (mul_eq_zero.mp h2).resolve_right h
  exact hne (Prod.ext (by linarith) (by linarith))

/-- Key step.  `T = openTri A B C` is cut out by `p, q, r`; `T' = openTri U V W` is missed by
`p, q, r`; `T` and `T'` share a point; the line `l` through `U, V` misses `T`.  Then one of
`p, q, r` passes through `U` and `V`. -/
lemma side_on_line {p q r : Line} {A B C : ℝ × ℝ}
    (hp : p.a ≠ 0 ∨ p.b ≠ 0) (hq : q.a ≠ 0 ∨ q.b ≠ 0)
    (hAp : OnLine p A) (hAq : OnLine q A) (hBp : OnLine p B) (hBr : OnLine r B)
    (hCq : OnLine q C) (hCr : OnLine r C) (hc : cross A B C ≠ 0) (hr : r.a ≠ 0 ∨ r.b ≠ 0)
    {U V W X : ℝ × ℝ} (hX : X ∈ openTri A B C) (hX' : X ∈ openTri U V W)
    (mp : ∀ P ∈ openTri U V W, ¬ OnLine p P) (mq : ∀ P ∈ openTri U V W, ¬ OnLine q P)
    (mr : ∀ P ∈ openTri U V W, ¬ OnLine r P)
    {l : Line} (hl : ∀ P ∈ openTri A B C, ¬ OnLine l P) (hlU : OnLine l U) (hlV : OnLine l V) :
    (OnLine p U ∧ OnLine p V) ∨ (OnLine q U ∧ OnLine q V) ∨ (OnLine r U ∧ OnLine r V) := by
  have fC : ev p C ≠ 0 := fun h => hc (collinear_of_onLine hp hAp hBp h)
  have fB : ev q B ≠ 0 := fun h => hc (collinear_of_onLine hq hAq h hCq)
  have fA : ev r A ≠ 0 := fun h => hc (collinear_of_onLine hr h hBr hCr)
  have char := mem_openTri_iff hAp hAq hBp hBr hCq hCr hc fA fB fC
  obtain ⟨xr, xq, xp⟩ := (char X).mp hX
  set M : ℝ × ℝ := ((1 - 1 / 2) * U.1 + 1 / 2 * V.1, (1 - 1 / 2) * U.2 + 1 / 2 * V.2) with hM
  -- the generic argument for one of the three lines
  have ends : ∀ (m : Line) (c : ℝ), c ≠ 0 → (∀ P ∈ openTri U V W, ¬ OnLine m P) →
      0 < ev m X / c →
      ev m M / c ≤ 0 →
      OnLine m U ∧ OnLine m V := by
    intro m c hc0 hm hpos hmid
    have q1 := nonneg_on_side hX' hm hc0 hpos (τ := 1 / 4) (by norm_num) (by norm_num)
    have q3 := nonneg_on_side hX' hm hc0 hpos (τ := 3 / 4) (by norm_num) (by norm_num)
    rw [hM] at hmid
    rw [ev_comb2] at q1 q3 hmid
    have e1 : ((1 - 1 / 4) * ev m U + 1 / 4 * ev m V) / c
        = (1 - 1 / 4) * (ev m U / c) + 1 / 4 * (ev m V / c) := by ring
    have e3 : ((1 - 3 / 4) * ev m U + 3 / 4 * ev m V) / c
        = (1 - 3 / 4) * (ev m U / c) + 3 / 4 * (ev m V / c) := by ring
    have e2 : ((1 - 1 / 2) * ev m U + 1 / 2 * ev m V) / c
        = (1 - 1 / 2) * (ev m U / c) + 1 / 2 * (ev m V / c) := by ring
    rw [e1] at q1; rw [e3] at q3; rw [e2] at hmid
    have a0 : ev m U / c = 0 := by linarith
    have b0 : ev m V / c = 0 := by linarith
    exact ⟨(div_eq_zero_iff.mp a0).resolve_right hc0, (div_eq_zero_iff.mp b0).resolve_right hc0⟩
  -- the midpoint of U V lies on l, hence not in T
  have hmidl : OnLine l M := by
    rw [hM]
    unfold OnLine at hlU hlV ⊢
    rw [ev_comb2, hlU, hlV]; ring
  by_contra hcon
  rw [not_or, not_or] at hcon
  obtain ⟨np, nq, nr⟩ := hcon
  refine hl M ((char M).mpr ⟨?_, ?_, ?_⟩) hmidl
  · by_contra h; exact nr (ends r _ fA mr xr (not_lt.mp h))
  · by_contra h; exact nq (ends q _ fB mq xq (not_lt.mp h))
  · by_contra h; exact np (ends p _ fC mp xp (not_lt.mp h))

/-- If two face triangles of the same arrangement share a point, every line of the second
triple is one of the lines of the first triple. -/
theorem lines_eq_of_common_point {L : List Line} (hL : ∀ l ∈ L, l.a ≠ 0 ∨ l.b ≠ 0)
    (hd : ∀ l ∈ L, ∀ m ∈ L, (∀ P : ℝ × ℝ, OnLine l P ↔ OnLine m P) → l = m)
    {p q r p' q' r' : Line} (hp : p ∈ L) (hq : q ∈ L) (hr : r ∈ L)
    (hp' : p' ∈ L) (hq' : q' ∈ L) (hr' : r' ∈ L) {A B C A' B' C' : ℝ × ℝ}
    (h : TriWitness L p q r A B C) (h' : TriWitness L p' q' r' A' B' C') {X : ℝ × ℝ}
    (hX : X ∈ openTri A B C) (hX' : X ∈ openTri A' B' C') :
    (p' = p ∨ p' = q ∨ p' = r) ∧ (q' = p ∨ q' = q ∨ q' = r) ∧ (r' = p ∨ r' = q ∨ r' = r) := by
  obtain ⟨hAp, hAq, hBp, hBr, hCq, hCr, hc, he⟩ := h
  obtain ⟨hAp', hAq', hBp', hBr', hCq', hCr', hc', he'⟩ := h'
  -- the three vertices of the second triangle are pairwise distinct
  have nAB : A' ≠ B' := by
    intro e; apply hc'; rw [e]; simp only [cross]; ring
  have nAC : A' ≠ C' := by
    intro e; apply hc'; rw [e]; simp only [cross]; ring
  have nBC : B' ≠ C' := by
    intro e; apply hc'; rw [e]; simp only [cross]; ring
  -- generic: a line l ∈ L through two distinct points U, V lying on one of p, q, r
  have fin : ∀ (l : Line), l ∈ L → ∀ U V : ℝ × ℝ, U ≠ V → OnLine l U → OnLine l V →
      (OnLine p U ∧ OnLine p V) ∨ (OnLine q U ∧ OnLine q V) ∨ (OnLine r U ∧ OnLine r V) →
      l = p ∨ l = q ∨ l = r := by
    intro l hlL U V hne hlU hlV hcase
    rcases hcase with ⟨a, b⟩ | ⟨a, b⟩ | ⟨a, b⟩
    · exact Or.inl (hd l hlL p hp fun P =>
        ⟨onLine_of_two_points (hL l hlL) hne hlU hlV a b,
          onLine_of_two_points (hL p hp) hne a b hlU hlV⟩)
    · exact Or.inr (Or.inl (hd l hlL q hq fun P =>
        ⟨onLine_of_two_points (hL l hlL) hne hlU hlV a b,
          onLine_of_two_points (hL q hq) hne a b hlU hlV⟩))
    · exact Or.inr (Or.inr (hd l hlL r hr fun P =>
        ⟨onLine_of_two_points (hL l hlL) hne hlU hlV a b,
          onLine_of_two_points (hL r hr) hne a b hlU hlV⟩))
  refine ⟨?_, ?_, ?_⟩
  · -- p' passes through A', B'
    exact fin p' hp' A' B' nAB hAp' hBp'
      (side_on_line (hL p hp) (hL q hq) hAp hAq hBp hBr hCq hCr hc (hL r hr) hX hX' (he' p hp) (he' q hq) (he' r hr) (he p' hp') hAp' hBp')
  · -- q' passes through A', C'
    exact fin q' hq' A' C' nAC hAq' hCq'
      (side_on_line (hL p hp) (hL q hq) hAp hAq hBp hBr hCq hCr hc (hL r hr) hX (mem_swap hX') (fun P hP => he' p hp P (mem_swap hP))
        (fun P hP => he' q hq P (mem_swap hP)) (fun P hP => he' r hr P (mem_swap hP))
        (he q' hq') hAq' hCq')
  · -- r' passes through B', C'
    exact fin r' hr' B' C' nBC hBr' hCr'
      (side_on_line (hL p hp) (hL q hq) hAp hAq hBp hBr hCq hCr hc (hL r hr) hX (mem_rot hX') (fun P hP => he' p hp P (mem_rot (mem_rot hP)))
        (fun P hP => he' q hq P (mem_rot (mem_rot hP)))
        (fun P hP => he' r hr P (mem_rot (mem_rot hP))) (he r' hr') hBr' hCr')

lemma nth_eq_getElem {L : List Line} {i : ℕ} (h : i < L.length) : nth L i = L[i] := by
  simp [nth, h]

lemma nth_inj {L : List Line}
    (hd : L.Pairwise (fun p q => ¬ ∀ P : ℝ × ℝ, OnLine p P ↔ OnLine q P))
    {i j : ℕ} (hi : i < L.length) (hj : j < L.length)
    (h : ∀ P : ℝ × ℝ, OnLine (nth L i) P ↔ OnLine (nth L j) P) : i = j := by
  rw [nth_eq_getElem hi, nth_eq_getElem hj] at h
  rw [List.pairwise_iff_getElem] at hd
  rcases Nat.lt_trichotomy i j with c | c | c
  · exact absurd h (hd i j hi hj c)
  · exact c
  · exact absurd (fun P => (h P).symm) (hd j i hj hi c)

/-- **Disjointness.**  In an arrangement of proper, pairwise distinct lines, two different
increasing index triples that both bound a triangular face have disjoint open triangles. -/
theorem triFaces_disjoint (L : List Line) (hL : ∀ l ∈ L, l.a ≠ 0 ∨ l.b ≠ 0)
    (hd : L.Pairwise (fun p q => ¬ ∀ P : ℝ × ℝ, OnLine p P ↔ OnLine q P))
    {i j k i' j' k' : ℕ} (hij : i < j) (hjk : j < k) (hk : k < L.length)
    (hij' : i' < j') (hjk' : j' < k') (hk' : k' < L.length)
    {A B C A' B' C' : ℝ × ℝ}
    (h : TriWitness L (nth L i) (nth L j) (nth L k) A B C)
    (h' : TriWitness L (nth L i') (nth L j') (nth L k') A' B' C')
    (hne : (i, j, k) ≠ (i', j', k')) :
    Disjoint (openTri A B C) (openTri A' B' C') := by
  rw [Set.disjoint_left]
  intro X hX hX'
  have hi : i < L.length := by omega
  have hj : j < L.length := by omega
  have hi' : i' < L.length := by omega
  have hj' : j' < L.length := by omega
  have hd' : ∀ l ∈ L, ∀ m ∈ L, (∀ P : ℝ × ℝ, OnLine l P ↔ OnLine m P) → l = m := by
    intro l hl m hm hlm
    obtain ⟨a, ha, rfl⟩ := List.getElem_of_mem hl
    obtain ⟨b, hb, rfl⟩ := List.getElem_of_mem hm
    have : a = b := nth_inj hd ha hb (by rw [nth_eq_getElem ha, nth_eq_getElem hb]; exact hlm)
    subst this; rfl
  obtain ⟨e1, e2, e3⟩ := lines_eq_of_common_point hL hd' (nth_mem hi) (nth_mem hj) (nth_mem hk)
    (nth_mem hi') (nth_mem hj') (nth_mem hk') h h' hX hX'
  have idx : ∀ {a b : ℕ}, a < L.length → b < L.length → nth L a = nth L b → a = b :=
    fun ha hb e => nth_inj hd ha hb (by intro P; rw [e])
  have f1 : i' = i ∨ i' = j ∨ i' = k :=
    e1.imp (idx hi' hi) (Or.imp (idx hi' hj) (idx hi' hk))
  have f2 : j' = i ∨ j' = j ∨ j' = k :=
    e2.imp (idx hj' hi) (Or.imp (idx hj' hj) (idx hj' hk))
  have f3 : k' = i ∨ k' = j ∨ k' = k :=
    e3.imp (idx hk' hi) (Or.imp (idx hk' hj) (idx hk' hk))
  apply hne
  have : i = i' ∧ j = j' ∧ k = k' := by omega
  rw [this.1, this.2.1, this.2.2]

/-- **Family of non-overlapping triangles.**  If the checker returns the strictly increasing list
`F` for an arrangement `L` of proper, pairwise distinct lines, then there are `F.length` index
triples, each with a nondegenerate triangle `tri t = (A, B, C)` whose vertices are the pairwise
intersections of the three lines, whose open interior meets no line of `L`, and these open
triangles are pairwise disjoint. -/
theorem exists_family (L : List Line) (hL : ∀ l ∈ L, l.a ≠ 0 ∨ l.b ≠ 0)
    (hd : L.Pairwise (fun p q => ¬ ∀ P : ℝ × ℝ, OnLine p P ↔ OnLine q P))
    (F : List (ℕ × ℕ × ℕ)) (hF : faces L = F) (hinc : incB F = true) :
    ∃ (T : Finset (ℕ × ℕ × ℕ)) (tri : ℕ × ℕ × ℕ → (ℝ × ℝ) × (ℝ × ℝ) × (ℝ × ℝ)),
      T.card = F.length ∧
      (∀ t ∈ T, t.1 < t.2.1 ∧ t.2.1 < t.2.2 ∧ t.2.2 < L.length ∧
        TriWitness L (nth L t.1) (nth L t.2.1) (nth L t.2.2) (tri t).1 (tri t).2.1 (tri t).2.2) ∧
      (∀ t ∈ T, ∀ t' ∈ T, t ≠ t' →
        Disjoint (openTri (tri t).1 (tri t).2.1 (tri t).2.2)
          (openTri (tri t').1 (tri t').2.1 (tri t').2.2)) := by
  have key : ∀ t ∈ F, (t.1 < t.2.1 ∧ t.2.1 < t.2.2 ∧ t.2.2 < L.length) ∧
      IsTriFace L (nth L t.1) (nth L t.2.1) (nth L t.2.2) := by
    intro t ht
    rw [← hF] at ht
    simp only [faces, List.mem_filter, mem_idxTriples, faceB] at ht
    obtain ⟨⟨h1, h2, h3⟩, h4⟩ := ht
    exact ⟨⟨h1, h2, h3⟩, (triCheck_iff L _ _ _ hL (hL _ (nth_mem (by omega)))
      (hL _ (nth_mem (by omega))) (hL _ (nth_mem h3))).mp h4⟩
  have ex : ∀ t : ℕ × ℕ × ℕ, ∃ ABC : (ℝ × ℝ) × (ℝ × ℝ) × (ℝ × ℝ), t ∈ F →
      TriWitness L (nth L t.1) (nth L t.2.1) (nth L t.2.2) ABC.1 ABC.2.1 ABC.2.2 := by
    intro t
    by_cases ht : t ∈ F
    · obtain ⟨A, B, C, hw⟩ := (key t ht).2
      exact ⟨(A, B, C), fun _ => hw⟩
    · exact ⟨((0, 0), (0, 0), (0, 0)), fun h => absurd h ht⟩
  choose tri htri using ex
  refine ⟨F.toFinset, tri, List.toFinset_card_of_nodup (nodup_of_incB F hinc), ?_, ?_⟩
  · intro t ht
    rw [List.mem_toFinset] at ht
    exact ⟨(key t ht).1.1, (key t ht).1.2.1, (key t ht).1.2.2, htri t ht⟩
  · intro t ht t' ht' hne
    rw [List.mem_toFinset] at ht ht'
    exact triFaces_disjoint L hL hd (key t ht).1.1 (key t ht).1.2.1 (key t ht).1.2.2
      (key t' ht').1.1 (key t' ht').1.2.1 (key t' ht').1.2.2 (htri t ht) (htri t' ht') hne

end Kobon
