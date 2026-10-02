/-
Kobon triangle certificate: link between the integer checker `triCheck` (Defs.lean)
and the geometric definition of a triangular face in the real plane.

DEFINITION taken as the meaning of "triangular face" (hill README: "nonzero-area triangles
whose interiors are not crossed by any line in the arrangement"):
`IsTriFace L p q r` -- there are points A ∈ p ∩ q, B ∈ p ∩ r, C ∈ q ∩ r, not collinear, such
that no line of `L` meets the open triangle ABC (`openTri`: strictly positive barycentric
combinations of A, B, C).

THEOREM `triCheck_iff`: for proper lines (a, b not both 0), `triCheck L p q r = true ↔ IsTriFace L p q r`.
No general-position hypothesis is needed.

NOT proved here: that `openTri A B C` is the topological interior of the convex hull, that such
a triangle is a connected component of the complement of the union of the lines (a "face"), and
that different index triples give different faces.
-/
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Card
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum
import KobonCert.Defs

namespace Kobon

/-- value of the affine form `a*x + b*y + c` of `l` at the point `P` -/
def ev (l : Line) (P : ℝ × ℝ) : ℝ := (l.a : ℝ) * P.1 + (l.b : ℝ) * P.2 + (l.c : ℝ)

/-- the point `P` of the real plane lies on the line `l` -/
def OnLine (l : Line) (P : ℝ × ℝ) : Prop := ev l P = 0

/-- open triangle with vertices `A, B, C` -/
def openTri (A B C : ℝ × ℝ) : Set (ℝ × ℝ) :=
  {P | ∃ u v t : ℝ, 0 < u ∧ 0 < v ∧ 0 < t ∧ u + v + t = 1 ∧
        P.1 = u * A.1 + v * B.1 + t * C.1 ∧ P.2 = u * A.2 + v * B.2 + t * C.2}

/-- twice the signed area of the triangle `A B C` -/
def cross (A B C : ℝ × ℝ) : ℝ := (B.1 - A.1) * (C.2 - A.2) - (B.2 - A.2) * (C.1 - A.1)

/-- The lines `p, q, r` bound a nondegenerate triangle whose interior meets no line of `L`. -/
def IsTriFace (L : List Line) (p q r : Line) : Prop :=
  ∃ A B C : ℝ × ℝ, OnLine p A ∧ OnLine q A ∧ OnLine p B ∧ OnLine r B ∧ OnLine q C ∧ OnLine r C ∧
    cross A B C ≠ 0 ∧ ∀ l ∈ L, ∀ P ∈ openTri A B C, ¬ OnLine l P

/-! ### real lemmas -/

lemma exists_weights {x y z : ℝ} (hx : 0 < x) (hy : y < 0) :
    ∃ u v t : ℝ, 0 < u ∧ 0 < v ∧ 0 < t ∧ u + v + t = 1 ∧ u * x + v * y + t * z = 0 := by
  have ht : 0 < -x * y := by nlinarith
  rcases le_total 0 z with hz | hz
  · have hu : 0 < -y := by linarith
    have hv : 0 < x * (1 + z) := by positivity
    have hs : 0 < -y + x * (1 + z) + -x * y := by linarith
    refine ⟨-y / (-y + x * (1 + z) + -x * y), x * (1 + z) / (-y + x * (1 + z) + -x * y),
      -x * y / (-y + x * (1 + z) + -x * y), div_pos hu hs, div_pos hv hs, div_pos ht hs, ?_, ?_⟩
    · rw [← add_div, ← add_div]; exact div_self hs.ne'
    · have e : -y / (-y + x * (1 + z) + -x * y) * x + x * (1 + z) / (-y + x * (1 + z) + -x * y) * y
          + -x * y / (-y + x * (1 + z) + -x * y) * z
          = (-y * x + x * (1 + z) * y + -x * y * z) / (-y + x * (1 + z) + -x * y) := by ring
      rw [e, show -y * x + x * (1 + z) * y + -x * y * z = 0 by ring, zero_div]
  · have hu : 0 < -y * (1 - z) := by nlinarith
    have hs : 0 < -y * (1 - z) + x + -x * y := by linarith
    refine ⟨-y * (1 - z) / (-y * (1 - z) + x + -x * y), x / (-y * (1 - z) + x + -x * y),
      -x * y / (-y * (1 - z) + x + -x * y), div_pos hu hs, div_pos hx hs, div_pos ht hs, ?_, ?_⟩
    · rw [← add_div, ← add_div]; exact div_self hs.ne'
    · have e : -y * (1 - z) / (-y * (1 - z) + x + -x * y) * x + x / (-y * (1 - z) + x + -x * y) * y
          + -x * y / (-y * (1 - z) + x + -x * y) * z
          = (-y * (1 - z) * x + x * y + -x * y * z) / (-y * (1 - z) + x + -x * y) := by ring
      rw [e, show -y * (1 - z) * x + x * y + -x * y * z = 0 by ring, zero_div]

/-- weak same-sign condition -/
def SS (x y z : ℝ) : Prop := (0 ≤ x ∧ 0 ≤ y ∧ 0 ≤ z) ∨ (x ≤ 0 ∧ y ≤ 0 ∧ z ≤ 0)

lemma same_sign_of_no_zero {x y z : ℝ}
    (h : ∀ u v t : ℝ, 0 < u → 0 < v → 0 < t → u + v + t = 1 → u * x + v * y + t * z ≠ 0) :
    SS x y z := by
  by_contra hc
  rw [SS, not_or] at hc
  obtain ⟨h1, h2⟩ := hc
  have hneg : x < 0 ∨ y < 0 ∨ z < 0 := by
    by_contra hn; push Not at hn; exact h1 ⟨hn.1, hn.2.1, hn.2.2⟩
  have hpos : 0 < x ∨ 0 < y ∨ 0 < z := by
    by_contra hn; push Not at hn; exact h2 ⟨hn.1, hn.2.1, hn.2.2⟩
  rcases hpos with hp | hp | hp <;> rcases hneg with hn | hn | hn
  · linarith
  · obtain ⟨u, v, t, hu, hv, ht, hs, he⟩ := exists_weights (z := z) hp hn
    exact h u v t hu hv ht hs he
  · obtain ⟨u, v, t, hu, hv, ht, hs, he⟩ := exists_weights (z := y) hp hn
    exact h u t v hu ht hv (by linarith) (by linarith)
  · obtain ⟨u, v, t, hu, hv, ht, hs, he⟩ := exists_weights (z := z) hp hn
    exact h v u t hv hu ht (by linarith) (by linarith)
  · linarith
  · obtain ⟨u, v, t, hu, hv, ht, hs, he⟩ := exists_weights (z := x) hp hn
    exact h t u v ht hu hv (by linarith) (by linarith)
  · obtain ⟨u, v, t, hu, hv, ht, hs, he⟩ := exists_weights (z := y) hp hn
    exact h v t u hv ht hu (by linarith) (by linarith)
  · obtain ⟨u, v, t, hu, hv, ht, hs, he⟩ := exists_weights (z := x) hp hn
    exact h t v u ht hv hu (by linarith) (by linarith)
  · linarith

lemma zero_of_comb {x y z u v t : ℝ} (hu : 0 < u) (hv : 0 < v) (ht : 0 < t) (hs : SS x y z)
    (h : u * x + v * y + t * z = 0) : x = 0 ∧ y = 0 ∧ z = 0 := by
  rcases hs with ⟨a, b, c⟩ | ⟨a, b, c⟩
  · have h1 : 0 ≤ u * x := mul_nonneg hu.le a
    have h2 : 0 ≤ v * y := mul_nonneg hv.le b
    have h3 : 0 ≤ t * z := mul_nonneg ht.le c
    exact ⟨(mul_eq_zero.mp (by linarith : u * x = 0)).resolve_left hu.ne',
      (mul_eq_zero.mp (by linarith : v * y = 0)).resolve_left hv.ne',
      (mul_eq_zero.mp (by linarith : t * z = 0)).resolve_left ht.ne'⟩
  · have h1 : u * x ≤ 0 := by nlinarith
    have h2 : v * y ≤ 0 := by nlinarith
    have h3 : t * z ≤ 0 := by nlinarith
    exact ⟨(mul_eq_zero.mp (by linarith : u * x = 0)).resolve_left hu.ne',
      (mul_eq_zero.mp (by linarith : v * y = 0)).resolve_left hv.ne',
      (mul_eq_zero.mp (by linarith : t * z = 0)).resolve_left ht.ne'⟩

lemma sign_transfer {s e W : ℝ} (hW : W ≠ 0) (h : s = e * W ^ 2) :
    (0 ≤ s ↔ 0 ≤ e) ∧ (s ≤ 0 ↔ e ≤ 0) := by
  have hp : 0 < W ^ 2 := lt_of_le_of_ne (sq_nonneg W) (Ne.symm (pow_ne_zero 2 hW))
  subst h
  refine ⟨⟨fun h => ?_, fun h => mul_nonneg h hp.le⟩, ⟨fun h => ?_, fun h => ?_⟩⟩
  · by_contra hc; push Not at hc; nlinarith
  · by_contra hc; push Not at hc; nlinarith
  · nlinarith

/-! ### points on lines -/

lemma x_mul_w {p q : Line} {P : ℝ × ℝ} (hp : OnLine p P) (hq : OnLine q P) :
    P.1 * (w p q : ℝ) = (px p q : ℝ) := by
  simp only [OnLine, ev] at hp hq
  simp only [w, px]; push_cast
  linear_combination (q.b : ℝ) * hp - (p.b : ℝ) * hq

lemma y_mul_w {p q : Line} {P : ℝ × ℝ} (hp : OnLine p P) (hq : OnLine q P) :
    P.2 * (w p q : ℝ) = (py p q : ℝ) := by
  simp only [OnLine, ev] at hp hq
  simp only [w, py]; push_cast
  linear_combination (p.a : ℝ) * hq - (q.a : ℝ) * hp

lemma ev_mul_w (l : Line) {p q : Line} {P : ℝ × ℝ} (hp : OnLine p P) (hq : OnLine q P) :
    ev l P * (w p q : ℝ) = (det3 l p q : ℝ) := by
  have h1 := x_mul_w hp hq
  have h2 := y_mul_w hp hq
  simp only [det3, ev]; push_cast
  linear_combination (l.a : ℝ) * h1 + (l.b : ℝ) * h2

lemma sv_eq (l : Line) {p q : Line} {P : ℝ × ℝ} (hp : OnLine p P) (hq : OnLine q P) :
    (sv l p q : ℝ) = ev l P * (w p q : ℝ) ^ 2 := by
  rw [sv]; push_cast; rw [← ev_mul_w l hp hq]; ring

lemma ev_comb (l : Line) (A B C : ℝ × ℝ) {u v t : ℝ} (hs : u + v + t = 1) :
    ev l (u * A.1 + v * B.1 + t * C.1, u * A.2 + v * B.2 + t * C.2)
      = u * ev l A + v * ev l B + t * ev l C := by
  simp only [ev]
  linear_combination (-(l.c : ℝ)) * hs

lemma collinear_of_onLine {p : Line} {A B C : ℝ × ℝ} (hp : p.a ≠ 0 ∨ p.b ≠ 0)
    (hA : OnLine p A) (hB : OnLine p B) (hC : OnLine p C) : cross A B C = 0 := by
  simp only [OnLine, ev] at hA hB hC
  have h1 : (p.a : ℝ) * cross A B C = 0 := by
    simp only [cross]; linear_combination (C.2 - A.2) * (hB - hA) - (B.2 - A.2) * (hC - hA)
  have h2 : (p.b : ℝ) * cross A B C = 0 := by
    simp only [cross]; linear_combination (B.1 - A.1) * (hC - hA) - (C.1 - A.1) * (hB - hA)
  rcases hp with h | h
  · exact (mul_eq_zero.mp h1).resolve_left (by exact_mod_cast h)
  · exact (mul_eq_zero.mp h2).resolve_left (by exact_mod_cast h)

/-- If `p ∥ q` (as coefficient vectors), a common point `A`, and `C` on `q`, then `C` on `p`. -/
lemma onLine_of_parallel {p q : Line} {A C : ℝ × ℝ} (hq : q.a ≠ 0 ∨ q.b ≠ 0) (hw : w p q = 0)
    (hA : OnLine p A) (hAq : OnLine q A) (hC : OnLine q C) : OnLine p C := by
  have hw' : (p.a : ℝ) * q.b - p.b * q.a = 0 := by
    have : ((w p q : ℤ) : ℝ) = 0 := by rw [hw]; simp
    simpa [w] using this
  simp only [OnLine, ev] at hA hAq hC ⊢
  have h1 : (q.a : ℝ) * ((p.a : ℝ) * (C.1 - A.1) + p.b * (C.2 - A.2)) = 0 := by
    linear_combination (p.a : ℝ) * (hC - hAq) - (C.2 - A.2) * hw'
  have h2 : (q.b : ℝ) * ((p.a : ℝ) * (C.1 - A.1) + p.b * (C.2 - A.2)) = 0 := by
    linear_combination (p.b : ℝ) * (hC - hAq) + (C.1 - A.1) * hw'
  have hX : (p.a : ℝ) * (C.1 - A.1) + p.b * (C.2 - A.2) = 0 := by
    rcases hq with h | h
    · exact (mul_eq_zero.mp h1).resolve_left (by exact_mod_cast h)
    · exact (mul_eq_zero.mp h2).resolve_left (by exact_mod_cast h)
  linear_combination hX + hA

/-- the intersection point of two non-parallel lines -/
noncomputable def ipt (p q : Line) : ℝ × ℝ := ((px p q : ℝ) / (w p q : ℝ), (py p q : ℝ) / (w p q : ℝ))

lemma ipt_left {p q : Line} (h : w p q ≠ 0) : OnLine p (ipt p q) := by
  have hw : (w p q : ℝ) ≠ 0 := by exact_mod_cast h
  have e1 : (px p q : ℝ) / (w p q : ℝ) * (w p q : ℝ) = px p q := div_mul_cancel₀ _ hw
  have e2 : (py p q : ℝ) / (w p q : ℝ) * (w p q : ℝ) = py p q := div_mul_cancel₀ _ hw
  have e : ev p (ipt p q) * (w p q : ℝ)
      = (p.a : ℝ) * px p q + (p.b : ℝ) * py p q + (p.c : ℝ) * w p q := by
    simp only [ev, ipt]; linear_combination (p.a : ℝ) * e1 + (p.b : ℝ) * e2
  have z : (p.a : ℝ) * px p q + (p.b : ℝ) * py p q + (p.c : ℝ) * w p q = 0 := by
    simp only [w, px, py]; push_cast; ring
  rw [z] at e
  exact (mul_eq_zero.mp e).resolve_right hw

lemma ipt_right {p q : Line} (h : w p q ≠ 0) : OnLine q (ipt p q) := by
  have hw : (w p q : ℝ) ≠ 0 := by exact_mod_cast h
  have e1 : (px p q : ℝ) / (w p q : ℝ) * (w p q : ℝ) = px p q := div_mul_cancel₀ _ hw
  have e2 : (py p q : ℝ) / (w p q : ℝ) * (w p q : ℝ) = py p q := div_mul_cancel₀ _ hw
  have e : ev q (ipt p q) * (w p q : ℝ)
      = (q.a : ℝ) * px p q + (q.b : ℝ) * py p q + (q.c : ℝ) * w p q := by
    simp only [ev, ipt]; linear_combination (q.a : ℝ) * e1 + (q.b : ℝ) * e2
  have z : (q.a : ℝ) * px p q + (q.b : ℝ) * py p q + (q.c : ℝ) * w p q = 0 := by
    simp only [w, px, py]; push_cast; ring
  rw [z] at e
  exact (mul_eq_zero.mp e).resolve_right hw

/-- Three pairwise non-parallel, non-concurrent proper lines: the vertices are not collinear. -/
lemma cross_ne_zero {p q r : Line} {A B C : ℝ × ℝ} (hp : p.a ≠ 0 ∨ p.b ≠ 0)
    (hAp : OnLine p A) (hAq : OnLine q A) (hBp : OnLine p B) (hBr : OnLine r B)
    (hCq : OnLine q C) (hCr : OnLine r C)
    (h1 : w p q ≠ 0) (h2 : w p r ≠ 0) (h3 : w q r ≠ 0) (h4 : det3 p q r ≠ 0) :
    cross A B C ≠ 0 := by
  have w1 : (w p q : ℝ) ≠ 0 := by exact_mod_cast h1
  have w2 : (w p r : ℝ) ≠ 0 := by exact_mod_cast h2
  have w3 : (w q r : ℝ) ≠ 0 := by exact_mod_cast h3
  have d : (det3 p q r : ℝ) ≠ 0 := by exact_mod_cast h4
  have key : cross A B C * ((w p q : ℝ) * (w p r : ℝ) * (w q r : ℝ)) = (det3 p q r : ℝ) ^ 2 := by
    have xa := x_mul_w hAp hAq
    have ya := y_mul_w hAp hAq
    have xb := x_mul_w hBp hBr
    have yb := y_mul_w hBp hBr
    have xc := x_mul_w hCq hCr
    have yc := y_mul_w hCq hCr
    have ex : cross A B C * ((w p q : ℝ) * (w p r : ℝ) * (w q r : ℝ))
        = (B.1 * w p r) * (C.2 * w q r) * w p q - (B.1 * w p r) * (A.2 * w p q) * w q r
          - (A.1 * w p q) * (C.2 * w q r) * w p r - (B.2 * w p r) * (C.1 * w q r) * w p q
          + (B.2 * w p r) * (A.1 * w p q) * w q r + (A.2 * w p q) * (C.1 * w q r) * w p r := by
      simp only [cross]; ring
    rw [ex, xa, ya, xb, yb, xc, yc]
    simp only [det3, w, px, py]; push_cast; ring
  intro hc
  rw [hc, zero_mul] at key
  exact d ((pow_eq_zero_iff two_ne_zero).mp key.symm)

/-! ### the checker -/

lemma triCheck_eq_true {L : List Line} {p q r : Line} : triCheck L p q r = true ↔
    w p q ≠ 0 ∧ w p r ≠ 0 ∧ w q r ≠ 0 ∧ det3 p q r ≠ 0 ∧ ∀ l ∈ L, noCross l p q r = true := by
  simp only [triCheck, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true, and_assoc]

lemma noCross_eq_true {l p q r : Line} : noCross l p q r = true ↔
    (0 ≤ sv l p q ∧ 0 ≤ sv l p r ∧ 0 ≤ sv l q r) ∨
    (sv l p q ≤ 0 ∧ sv l p r ≤ 0 ∧ sv l q r ≤ 0) := by
  simp only [noCross, Bool.or_eq_true, Bool.and_eq_true, decide_eq_true_eq, and_assoc]

lemma noCross_iff_SS (l : Line) {p q r : Line} {A B C : ℝ × ℝ}
    (hAp : OnLine p A) (hAq : OnLine q A) (hBp : OnLine p B) (hBr : OnLine r B)
    (hCq : OnLine q C) (hCr : OnLine r C)
    (h1 : w p q ≠ 0) (h2 : w p r ≠ 0) (h3 : w q r ≠ 0) :
    noCross l p q r = true ↔ SS (ev l A) (ev l B) (ev l C) := by
  have w1 : (w p q : ℝ) ≠ 0 := by exact_mod_cast h1
  have w2 : (w p r : ℝ) ≠ 0 := by exact_mod_cast h2
  have w3 : (w q r : ℝ) ≠ 0 := by exact_mod_cast h3
  obtain ⟨a1, a2⟩ := sign_transfer w1 (sv_eq l hAp hAq)
  obtain ⟨b1, b2⟩ := sign_transfer w2 (sv_eq l hBp hBr)
  obtain ⟨c1, c2⟩ := sign_transfer w3 (sv_eq l hCq hCr)
  rw [noCross_eq_true, SS]
  constructor
  · rintro (⟨x, y, z⟩ | ⟨x, y, z⟩)
    · exact Or.inl ⟨a1.mp (by exact_mod_cast x), b1.mp (by exact_mod_cast y),
        c1.mp (by exact_mod_cast z)⟩
    · exact Or.inr ⟨a2.mp (by exact_mod_cast x), b2.mp (by exact_mod_cast y),
        c2.mp (by exact_mod_cast z)⟩
  · rintro (⟨x, y, z⟩ | ⟨x, y, z⟩)
    · exact Or.inl ⟨by exact_mod_cast a1.mpr x, by exact_mod_cast b1.mpr y,
        by exact_mod_cast c1.mpr z⟩
    · exact Or.inr ⟨by exact_mod_cast a2.mpr x, by exact_mod_cast b2.mpr y,
        by exact_mod_cast c2.mpr z⟩

/-- A proper line `l` misses the open triangle `ABC` (non-collinear) iff its affine form has
a weakly constant sign on the three vertices. -/
lemma misses_iff_SS {l : Line} (hl : l.a ≠ 0 ∨ l.b ≠ 0) {A B C : ℝ × ℝ} (hc : cross A B C ≠ 0) :
    (∀ P ∈ openTri A B C, ¬ OnLine l P) ↔ SS (ev l A) (ev l B) (ev l C) := by
  constructor
  · intro he
    apply same_sign_of_no_zero
    intro u v t hu hv ht hs h0
    apply he (u * A.1 + v * B.1 + t * C.1, u * A.2 + v * B.2 + t * C.2)
      ⟨u, v, t, hu, hv, ht, hs, rfl, rfl⟩
    show ev l _ = 0
    rw [ev_comb l A B C hs]; exact h0
  · rintro hs P ⟨u, v, t, hu, hv, ht, hsum, hP1, hP2⟩ hlP
    have hP : P = (u * A.1 + v * B.1 + t * C.1, u * A.2 + v * B.2 + t * C.2) :=
      Prod.ext hP1 hP2
    have h0 : u * ev l A + v * ev l B + t * ev l C = 0 := by
      rw [← ev_comb l A B C hsum, ← hP]; exact hlP
    obtain ⟨zA, zB, zC⟩ := zero_of_comb hu hv ht hs h0
    exact hc (collinear_of_onLine hl zA zB zC)

/-- **Main equivalence.** The integer determinant test is the geometric definition. -/
theorem triCheck_iff (L : List Line) (p q r : Line)
    (hL : ∀ l ∈ L, l.a ≠ 0 ∨ l.b ≠ 0) (hp : p.a ≠ 0 ∨ p.b ≠ 0) (hq : q.a ≠ 0 ∨ q.b ≠ 0)
    (hr : r.a ≠ 0 ∨ r.b ≠ 0) :
    triCheck L p q r = true ↔ IsTriFace L p q r := by
  rw [triCheck_eq_true]
  constructor
  · rintro ⟨h1, h2, h3, h4, h5⟩
    have hc : cross (ipt p q) (ipt p r) (ipt q r) ≠ 0 :=
      cross_ne_zero hp (ipt_left h1) (ipt_right h1) (ipt_left h2) (ipt_right h2)
        (ipt_left h3) (ipt_right h3) h1 h2 h3 h4
    refine ⟨ipt p q, ipt p r, ipt q r, ipt_left h1, ipt_right h1, ipt_left h2, ipt_right h2,
      ipt_left h3, ipt_right h3, hc, ?_⟩
    intro l hl
    exact (misses_iff_SS (hL l hl) hc).mpr
      ((noCross_iff_SS l (ipt_left h1) (ipt_right h1) (ipt_left h2) (ipt_right h2)
        (ipt_left h3) (ipt_right h3) h1 h2 h3).mp (h5 l hl))
  · rintro ⟨A, B, C, hAp, hAq, hBp, hBr, hCq, hCr, hc, he⟩
    have h1 : w p q ≠ 0 := fun h0 =>
      hc (collinear_of_onLine hp hAp hBp (onLine_of_parallel hq h0 hAp hAq hCq))
    have h2 : w p r ≠ 0 := fun h0 =>
      hc (collinear_of_onLine hp hAp hBp (onLine_of_parallel hr h0 hBp hBr hCr))
    have h3 : w q r ≠ 0 := fun h0 =>
      hc (collinear_of_onLine hq hAq (onLine_of_parallel hr h0 hCq hCr hBr) hCq)
    have h4 : det3 p q r ≠ 0 := by
      intro h0
      have e := ev_mul_w p hCq hCr
      rw [h0] at e
      have w3 : (w q r : ℝ) ≠ 0 := by exact_mod_cast h3
      have hCp : OnLine p C := (mul_eq_zero.mp (by simpa using e)).resolve_right w3
      exact hc (collinear_of_onLine hp hAp hBp hCp)
    refine ⟨h1, h2, h3, h4, fun l hl => ?_⟩
    exact (noCross_iff_SS l hAp hAq hBp hBr hCq hCr h1 h2 h3).mpr
      ((misses_iff_SS (hL l hl) hc).mp (he l hl))

/-! ### counting -/

lemma mem_idxTriples {n : ℕ} {t : ℕ × ℕ × ℕ} :
    t ∈ idxTriples n ↔ t.1 < t.2.1 ∧ t.2.1 < t.2.2 ∧ t.2.2 < n := by
  obtain ⟨i, j, k⟩ := t
  simp only [idxTriples, rowTriples, List.mem_filter, List.mem_flatMap, List.mem_map,
    List.mem_range, Prod.mk.injEq, Bool.and_eq_true, decide_eq_true_eq]
  constructor
  · rintro ⟨i', hi, ⟨j', hj, k', hk, rfl, rfl, rfl⟩, h1, h2⟩
    exact ⟨h1, h2, hk⟩
  · rintro ⟨h1, h2, h3⟩
    exact ⟨i, by omega, ⟨j, by omega, k, h3, rfl, rfl, rfl⟩, h1, h2⟩

lemma ltT_trans {a b c : ℕ × ℕ × ℕ} : ltT a b → ltT b c → ltT a c := by
  unfold ltT; omega

lemma ltT_of_incB : ∀ (l : List (ℕ × ℕ × ℕ)) (a : ℕ × ℕ × ℕ), incB (a :: l) = true →
    ∀ b ∈ l, ltT a b
  | [], _, _ => by simp
  | c :: l, a, h => by
    rw [incB, Bool.and_eq_true, decide_eq_true_eq] at h
    intro b hb
    rcases List.mem_cons.mp hb with rfl | hb
    · exact h.1
    · exact ltT_trans h.1 (ltT_of_incB l c h.2 b hb)

lemma nodup_of_incB : ∀ F : List (ℕ × ℕ × ℕ), incB F = true → F.Nodup
  | [], _ => List.nodup_nil
  | [a], _ => List.nodup_singleton a
  | a :: b :: l, h => by
    have h' := h
    rw [incB, Bool.and_eq_true] at h'
    refine List.nodup_cons.mpr ⟨fun hm => ?_, nodup_of_incB (b :: l) h'.2⟩
    have := ltT_of_incB (b :: l) a h a hm
    unfold ltT at this; omega

lemma proper_of_properB {l : Line} (h : properB l = true) : l.a ≠ 0 ∨ l.b ≠ 0 := by
  by_contra hc
  push Not at hc
  simp [properB, hc.1, hc.2] at h

lemma nth_mem {L : List Line} {i : ℕ} (h : i < L.length) : nth L i ∈ L := by
  have : nth L i = L[i] := by simp [nth, h]
  rw [this]; exact List.getElem_mem h

lemma proper_of_validB {n : ℕ} {L : List Line} (h : validB n L = true) :
    ∀ l ∈ L, l.a ≠ 0 ∨ l.b ≠ 0 := by
  simp only [validB, Bool.and_eq_true, List.all_eq_true] at h
  exact fun l hl => proper_of_properB (h.1.1.2 l hl)

/-- The set of index triples of triangular faces (geometric definition) is the list computed
by the checker; in particular its cardinality is the length of that list. -/
theorem ncard_triFaces (L : List Line) (hL : ∀ l ∈ L, l.a ≠ 0 ∨ l.b ≠ 0)
    (F : List (ℕ × ℕ × ℕ)) (hF : faces L = F) (hnd : incB F = true) :
    {t : ℕ × ℕ × ℕ | t.1 < t.2.1 ∧ t.2.1 < t.2.2 ∧ t.2.2 < L.length ∧
        IsTriFace L (nth L t.1) (nth L t.2.1) (nth L t.2.2)}.ncard = F.length := by
  have hset : {t : ℕ × ℕ × ℕ | t.1 < t.2.1 ∧ t.2.1 < t.2.2 ∧ t.2.2 < L.length ∧
        IsTriFace L (nth L t.1) (nth L t.2.1) (nth L t.2.2)} = (↑F.toFinset : Set (ℕ × ℕ × ℕ)) := by
    ext t
    simp only [Set.mem_setOf_eq, Finset.mem_coe, List.mem_toFinset]
    rw [← hF]
    simp only [faces, List.mem_filter, mem_idxTriples, faceB]
    constructor
    · rintro ⟨h1, h2, h3, h4⟩
      exact ⟨⟨h1, h2, h3⟩, (triCheck_iff L _ _ _ hL (hL _ (nth_mem (by omega)))
        (hL _ (nth_mem (by omega))) (hL _ (nth_mem h3))).mpr h4⟩
    · rintro ⟨⟨h1, h2, h3⟩, h4⟩
      exact ⟨h1, h2, h3, (triCheck_iff L _ _ _ hL (hL _ (nth_mem (by omega)))
        (hL _ (nth_mem (by omega))) (hL _ (nth_mem h3))).mp h4⟩
  rw [hset, Set.ncard_coe_finset, List.toFinset_card_of_nodup (nodup_of_incB F hnd)]

/-! ### distinct lines -/

lemma exists_two_points {p : Line} (hp : p.a ≠ 0 ∨ p.b ≠ 0) :
    ∃ P0 P1 : ℝ × ℝ, OnLine p P0 ∧ OnLine p P1 ∧ (P1.1 - P0.1 = 1 ∨ P1.2 - P0.2 = 1) := by
  rcases hp with h | h
  · have ha : (p.a : ℝ) ≠ 0 := by exact_mod_cast h
    refine ⟨(-(p.c : ℝ) / p.a, 0), (-((p.c : ℝ) + p.b) / p.a, 1), ?_, ?_, Or.inr (by norm_num)⟩
    · simp only [OnLine, ev]; rw [mul_div_cancel₀ _ ha]; ring
    · simp only [OnLine, ev]; rw [mul_div_cancel₀ _ ha]; ring
  · have hb : (p.b : ℝ) ≠ 0 := by exact_mod_cast h
    refine ⟨(0, -(p.c : ℝ) / p.b), (1, -((p.c : ℝ) + p.a) / p.b), ?_, ?_, Or.inl (by norm_num)⟩
    · simp only [OnLine, ev]; rw [mul_div_cancel₀ _ hb]; ring
    · simp only [OnLine, ev]; rw [mul_div_cancel₀ _ hb]; ring

lemma not_same_set {p q : Line} (hp : p.a ≠ 0 ∨ p.b ≠ 0) (h : sameLineB p q = false) :
    ¬ ∀ P : ℝ × ℝ, OnLine p P ↔ OnLine q P := by
  intro hall
  obtain ⟨P0, P1, h0, h1, hd⟩ := exists_two_points hp
  have q0 := (hall P0).mp h0
  have q1 := (hall P1).mp h1
  have x0 := x_mul_w h0 q0
  have x1 := x_mul_w h1 q1
  have y0 := y_mul_w h0 q0
  have y1 := y_mul_w h1 q1
  have hW : (w p q : ℝ) = 0 := by
    rcases hd with d | d
    · have e : (P1.1 - P0.1) * (w p q : ℝ) = 0 := by linear_combination x1 - x0
      rw [d, one_mul] at e; exact e
    · have e : (P1.2 - P0.2) * (w p q : ℝ) = 0 := by linear_combination y1 - y0
      rw [d, one_mul] at e; exact e
  have hX : (px p q : ℝ) = 0 := by rw [← x0, hW, mul_zero]
  have hY : (py p q : ℝ) = 0 := by rw [← y0, hW, mul_zero]
  have : sameLineB p q = true := by
    simp only [sameLineB, Bool.and_eq_true, decide_eq_true_eq]
    exact ⟨⟨by exact_mod_cast hW, by exact_mod_cast hX⟩, by exact_mod_cast hY⟩
  rw [this] at h
  exact Bool.noConfusion h

lemma allPairs_iff (f : Line → Line → Bool) (L : List Line) :
    allPairs f L = true ↔ L.Pairwise (fun p q => f p q = true) := by
  induction L with
  | nil => simp [allPairs]
  | cons p rest ih => simp [allPairs, ih, List.all_eq_true]

/-- A valid submission consists of pairwise distinct lines of the real plane. -/
lemma distinct_of_validB {n : ℕ} {L : List Line} (h : validB n L = true) :
    L.Pairwise (fun p q => ¬ ∀ P : ℝ × ℝ, OnLine p P ↔ OnLine q P) := by
  have hprop := proper_of_validB h
  simp only [validB, Bool.and_eq_true] at h
  have hp := (allPairs_iff _ L).mp h.2
  refine List.Pairwise.imp_of_mem (fun {p q} hpm _ hpq => ?_) hp
  apply not_same_set (hprop p hpm)
  simpa using hpq

end Kobon
