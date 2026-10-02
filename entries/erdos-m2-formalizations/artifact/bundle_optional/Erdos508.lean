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
# Erdős Problem 508

*Reference:* [erdosproblems.com/508](https://www.erdosproblems.com/508)

proven by considering the [Moser-Spindel graph]
or the [Golomb graph]
*At least 4 colors are required:* [Moser-Spindel graph](https://de.wikipedia.org/wiki/Moser-Spindel)
*At least 4 colors are required:* [Golomb graph](https://en.wikipedia.org/wiki/Golomb_graph)
*At least 5 colors are required:* [de Grey 2018](https://arxiv.org/abs/1804.02385)
-/

@[expose] public section

open SimpleGraph
open scoped EuclideanGeometry

namespace Erdos508

scoped notation "χ(ℝ²)" => SimpleGraph.chromaticNumber (UnitDistancePlaneGraph Set.univ)

/--
The Hadwiger–Nelson problem asks: How many colors are required to color the plane
such that no two points at distance 1 from each other have the same color?
-/
@[category research open, AMS 52]
theorem HadwigerNelsonProblem :
    χ(ℝ²) = answer(sorry) := by
  sorry

/--
Aubrey de Grey improved the lower bound for the chromatic number of the plane
to 5 in 2018 using a graph that has >1000 nodes.

"The chromatic number of the plane is at least 5" Aubrey D. N. J. de Grey, 2018
(https://doi.org/10.48550/arXiv.1804.02385)
-/
@[category research solved, AMS 52]
theorem HadwigerNelsonAtLeastFive :
    5 ≤ χ(ℝ²) := by
  sorry

private def spindlePoint (x y : ℝ) : ↥(Set.univ : Set (EuclideanSpace ℝ (Fin 2))) :=
  ⟨!₂[x, y], Set.mem_univ _⟩

private lemma spindle_adj_iff (x y x' y' : ℝ) :
    (UnitDistancePlaneGraph Set.univ).Adj (spindlePoint x y) (spindlePoint x' y') ↔
      (x - x') ^ 2 + (y - y') ^ 2 = 1 := by
  simp only [UnitDistancePlaneGraph, spindlePoint, Subtype.dist_eq,
    PiLp.dist_eq_of_L2, Fin.sum_univ_two, Matrix.cons_val_zero,
    Matrix.cons_val_one, Real.dist_eq]
  have hnonneg : 0 ≤ |x - x'| ^ 2 + |y - y'| ^ 2 := by positivity
  have hnonneg' : 0 ≤ (x - x') ^ 2 + (y - y') ^ 2 := by positivity
  constructor
  · intro h
    have hh := congrArg (fun z : ℝ => z ^ 2) h
    simpa only [sq_abs, Real.sq_sqrt hnonneg', one_pow] using hh
  · intro h
    rw [← Real.sqrt_one]
    congr 1
    simpa [sq_abs] using h

private lemma spindle_diamond (G : SimpleGraph α) (C : G.Coloring (Fin 3))
    (u v a b : α) (hua : G.Adj u a) (hub : G.Adj u b)
    (hva : G.Adj v a) (hvb : G.Adj v b) (hab : G.Adj a b) : C u = C v := by
  have h₁ := C.valid hua
  have h₂ := C.valid hub
  have h₃ := C.valid hva
  have h₄ := C.valid hvb
  have h₅ := C.valid hab
  have hfinite : ∀ p q r s : Fin 3,
      p ≠ r → p ≠ s → q ≠ r → q ≠ s → r ≠ s → p = q := by decide
  exact hfinite (C u) (C v) (C a) (C b) h₁ h₂ h₃ h₄ h₅

private lemma spindle_geometry :
    ∃ u v w a b c d : ↥(Set.univ : Set (EuclideanSpace ℝ (Fin 2))),
      (UnitDistancePlaneGraph Set.univ).Adj u a ∧
      (UnitDistancePlaneGraph Set.univ).Adj u b ∧
      (UnitDistancePlaneGraph Set.univ).Adj v a ∧
      (UnitDistancePlaneGraph Set.univ).Adj v b ∧
      (UnitDistancePlaneGraph Set.univ).Adj a b ∧
      (UnitDistancePlaneGraph Set.univ).Adj u c ∧
      (UnitDistancePlaneGraph Set.univ).Adj u d ∧
      (UnitDistancePlaneGraph Set.univ).Adj w c ∧
      (UnitDistancePlaneGraph Set.univ).Adj w d ∧
      (UnitDistancePlaneGraph Set.univ).Adj c d ∧
      (UnitDistancePlaneGraph Set.univ).Adj v w := by
  let r : ℝ := Real.sqrt 3
  let s : ℝ := Real.sqrt 11
  have hr : r ^ 2 = 3 := by dsimp [r]; norm_num
  have hs : s ^ 2 = 11 := by dsimp [s]; norm_num
  have hrs : (r * s) ^ 2 = 33 := by rw [mul_pow, hr, hs]; norm_num
  have hrs2 : r * s ^ 2 = 11 * r := by rw [hs]; ring
  have hr2s : r ^ 2 * s = 3 * s := by rw [hr]
  refine ⟨spindlePoint 0 0,
    spindlePoint r 0,
    spindlePoint (5 * r / 6) (r * s / 6),
    spindlePoint (r / 2) (1 / 2),
    spindlePoint (r / 2) (-(1 / 2)),
    spindlePoint ((5 * r - s) / 12) ((r * s + 5) / 12),
    spindlePoint ((5 * r + s) / 12) ((r * s - 5) / 12),
    ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  all_goals
    apply (spindle_adj_iff _ _ _ _).2
    nlinarith [hr, hs, hrs, hrs2, hr2s]

/--
The "chromatic number of the plane" is at least 4. This can be
proven by considering the [Moser-Spindel graph](https://de.wikipedia.org/wiki/Moser-Spindel)
or the [Golomb graph](https://en.wikipedia.org/wiki/Golomb_graph) graph.
-/

@[category research solved, AMS 5]
theorem HadwigerNelsonAtLeast4 : 4 ≤ χ(ℝ²) := by
  let G := UnitDistancePlaneGraph Set.univ
  obtain ⟨u, v, w, a, b, c, d, hua, hub, hva, hvb, hab,
    huc, hud, hwc, hwd, hcd, hvw⟩ := spindle_geometry
  have hnot : ¬ G.Colorable 3 := by
    rintro ⟨C⟩
    have huv := spindle_diamond G C u v a b hua hub hva hvb hab
    have huw := spindle_diamond G C u w c d huc hud hwc hwd hcd
    exact (C.valid hvw) (huv.symm.trans huw)
  apply le_chromaticNumber_iff_colorable.mpr
  intro m hm
  by_contra hlt
  have hm4 : m < 4 := by exact_mod_cast (lt_of_not_ge hlt)
  have hm3 : m ≤ 3 := by omega
  exact hnot (SimpleGraph.Colorable.mono hm3 hm)

private def hexQ (a b : ℝ) : ℝ := a ^ 2 + a * b + b ^ 2

private lemma hexQ_nonneg (a b : ℝ) : 0 ≤ hexQ a b := by
  dsimp [hexQ]
  nlinarith [sq_nonneg (a + b), sq_nonneg a, sq_nonneg b]

private lemma hex_triangle_cover (a b : ℝ)
    (ha : 0 ≤ a) (hb : 0 ≤ b) (hab : a + b ≤ 1) :
    hexQ a b ≤ 1 / 3 ∨
      hexQ (a - 1) b ≤ 1 / 3 ∨
      hexQ a (b - 1) ≤ 1 / 3 := by
  have hupper : a + b - hexQ a b ≤ 1 / 3 := by
    have hq := hexQ_nonneg (a - 1 / 3) (b - 1 / 3)
    dsimp [hexQ] at hq ⊢
    nlinarith
  by_contra h
  push Not at h
  obtain ⟨h0, h1, h2⟩ := h
  have hw0 : 0 ≤ 1 - a - b := by linarith
  have hp0 : 0 ≤ (1 - a - b) * (hexQ a b - 1 / 3) :=
    mul_nonneg hw0 (by linarith)
  have hp1 : 0 ≤ a * (hexQ (a - 1) b - 1 / 3) :=
    mul_nonneg ha (by linarith)
  have hp2 : 0 ≤ b * (hexQ a (b - 1) - 1 / 3) :=
    mul_nonneg hb (by linarith)
  have hsome : 0 < 1 - a - b ∨ 0 < a ∨ 0 < b := by
    by_contra hh
    push Not at hh
    rcases hh with ⟨hh0, hh1, hh2⟩
    linarith
  rcases hsome with hsome | hsome | hsome
  · have hp : 0 < (1 - a - b) * (hexQ a b - 1 / 3) :=
      mul_pos hsome (by linarith)
    dsimp [hexQ] at *
    nlinarith
  · have hp : 0 < a * (hexQ (a - 1) b - 1 / 3) :=
      mul_pos hsome (by linarith)
    dsimp [hexQ] at *
    nlinarith
  · have hp : 0 < b * (hexQ a (b - 1) - 1 / 3) :=
      mul_pos hsome (by linarith)
    dsimp [hexQ] at *
    nlinarith

private lemma hex_square_cover (a b : ℝ)
    (ha : 0 ≤ a) (ha' : a ≤ 1) (hb : 0 ≤ b) (hb' : b ≤ 1) :
    hexQ a b ≤ 1 / 3 ∨ hexQ (a - 1) b ≤ 1 / 3 ∨
      hexQ a (b - 1) ≤ 1 / 3 ∨ hexQ (a - 1) (b - 1) ≤ 1 / 3 := by
  by_cases hab : a + b ≤ 1
  · rcases hex_triangle_cover a b ha hb hab with h | h | h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inl h))
  · have hsum : (1 - a) + (1 - b) ≤ 1 := by linarith
    rcases hex_triangle_cover (1 - a) (1 - b) (by linarith) (by linarith)
      hsum with h | h | h
    · right; right; right
      convert h using 1 <;> dsimp [hexQ] <;> ring
    · right; right; left
      convert h using 1 <;> dsimp [hexQ] <;> ring
    · right; left
      convert h using 1 <;> dsimp [hexQ] <;> ring

private lemma spindle_dist_sq (x y x' y' : ℝ) :
    dist (spindlePoint x y) (spindlePoint x' y') ^ 2 =
      (x - x') ^ 2 + (y - y') ^ 2 := by
  simp only [spindlePoint, Subtype.dist_eq, PiLp.dist_eq_of_L2,
    Fin.sum_univ_two, Matrix.cons_val_zero, Matrix.cons_val_one, Real.dist_eq]
  rw [Real.sq_sqrt (by positivity)]
  simp only [sq_abs]

private noncomputable def hexCenter (i j : ℤ) : ↥(Set.univ : Set (EuclideanSpace ℝ (Fin 2))) :=
  spindlePoint ((4 / 5 : ℝ) * ((i : ℝ) + (j : ℝ) / 2))
    ((2 * Real.sqrt 3 / 5 : ℝ) * (j : ℝ))

private def hexColor (i j : ℤ) : ZMod 7 := (i : ZMod 7) + 5 * (j : ZMod 7)

private lemma hexQ_int_ge (i j : ℤ)
    (hcolor : ((i + 5 * j : ℤ) : ZMod 7) = 0) (hne : i ≠ 0 ∨ j ≠ 0) :
    7 ≤ i ^ 2 + i * j + j ^ 2 := by
  have hdiv : (7 : ℤ) ∣ i + 5 * j :=
    (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp hcolor
  obtain ⟨k, hk⟩ := hdiv
  have hi : i = 7 * k - 5 * j := by omega
  let Q : ℤ := i ^ 2 + i * j + j ^ 2
  have hq_nonneg : 0 ≤ Q := by
    dsimp [Q]
    nlinarith [sq_nonneg (i + j), sq_nonneg i, sq_nonneg j]
  have hq_ne : Q ≠ 0 := by
    intro hz
    have hi2 : i ^ 2 = 0 := by
      dsimp [Q] at hz
      nlinarith [sq_nonneg (i + j), sq_nonneg j]
    have hj2 : j ^ 2 = 0 := by
      dsimp [Q] at hz
      nlinarith [sq_nonneg (i + j), sq_nonneg i]
    have hi0 : i = 0 := sq_eq_zero_iff.mp hi2
    have hj0 : j = 0 := sq_eq_zero_iff.mp hj2
    exact hne.elim (fun h => h hi0) (fun h => h hj0)
  have hqpos : 0 < Q := lt_of_le_of_ne hq_nonneg (Ne.symm hq_ne)
  have hqdiv : Q = 7 * (7 * k ^ 2 - 9 * k * j + 3 * j ^ 2) := by
    dsimp [Q]
    rw [hi]
    ring
  omega

private lemma hex_color_eq_mod (i j k l : ℤ) (h : hexColor i j = hexColor k l) :
    (((i - k) + 5 * (j - l) : ℤ) : ZMod 7) = 0 := by
  have hh : hexColor i j - hexColor k l = 0 := sub_eq_zero.mpr h
  convert hh using 1 <;> simp only [hexColor, Int.cast_add, Int.cast_sub,
    Int.cast_mul, Int.cast_ofNat] <;> ring

private lemma hex_center_sq (i j k l : ℤ) :
    dist (hexCenter i j) (hexCenter k l) ^ 2 =
      (16 / 25 : ℝ) * hexQ (((i - k : ℤ) : ℝ)) (((j - l : ℤ) : ℝ)) := by
  have hr : (Real.sqrt 3) ^ 2 = 3 := by norm_num
  rw [hexCenter, hexCenter, spindle_dist_sq]
  dsimp [hexQ]
  push_cast
  calc
    ((4 / 5 : ℝ) * ((i : ℝ) + (j : ℝ) / 2) -
      (4 / 5 : ℝ) * ((k : ℝ) + (l : ℝ) / 2)) ^ 2 +
      ((2 * Real.sqrt 3 / 5 : ℝ) * (j : ℝ) -
      (2 * Real.sqrt 3 / 5 : ℝ) * (l : ℝ)) ^ 2 =
      (16 / 25 : ℝ) * ((i - k) ^ 2 + (i - k) * (j - l) + (j - l) ^ 2) := by
        nlinarith [hr]
    _ = _ := by ring

private lemma hex_center_far (i j k l : ℤ)
    (hc : hexColor i j = hexColor k l) (hne : i ≠ k ∨ j ≠ l) :
    2 < dist (hexCenter i j) (hexCenter k l) := by
  have hd : 7 ≤ (i - k) ^ 2 + (i - k) * (j - l) + (j - l) ^ 2 :=
    hexQ_int_ge (i - k) (j - l) (hex_color_eq_mod i j k l hc) (by
      rcases hne with hi | hj
      · left; omega
      · right; omega)
  have hdr : (7 : ℝ) ≤ hexQ (((i - k : ℤ) : ℝ)) (((j - l : ℤ) : ℝ)) := by
    dsimp [hexQ]
    exact_mod_cast hd
  have hsq := hex_center_sq i j k l
  have hnonneg : 0 ≤ dist (hexCenter i j) (hexCenter k l) := dist_nonneg
  nlinarith

private lemma hex_cover_xy (x y : ℝ) :
    ∃ i j : ℤ, dist (spindlePoint x y) (hexCenter i j) < 1 / 2 := by
  let r : ℝ := Real.sqrt 3
  have hr : r ^ 2 = 3 := by dsimp [r]; norm_num
  let u : ℝ := 5 * y * r / 6
  let t : ℝ := 5 * x / 4 - u / 2
  have hx : x = (4 / 5 : ℝ) * (t + u / 2) := by dsimp [t]; ring
  have hy : y = (2 * r / 5 : ℝ) * u := by
    dsimp [u]
    calc
      y = y * r ^ 2 / 3 := by rw [hr]; ring
      _ = (2 * r / 5) * (5 * y * r / 6) := by ring
  let m : ℤ := ⌊t⌋
  let n : ℤ := ⌊u⌋
  let a : ℝ := t - (m : ℝ)
  let b : ℝ := u - (n : ℝ)
  have ha : 0 ≤ a := by
    change 0 ≤ Int.fract t
    exact Int.fract_nonneg t
  have ha' : a ≤ 1 := by
    change Int.fract t ≤ 1
    exact (Int.fract_lt_one t).le
  have hb : 0 ≤ b := by
    change 0 ≤ Int.fract u
    exact Int.fract_nonneg u
  have hb' : b ≤ 1 := by
    change Int.fract u ≤ 1
    exact (Int.fract_lt_one u).le
  have hsq (i j : ℤ) :
      dist (spindlePoint x y) (hexCenter i j) ^ 2 =
        (16 / 25 : ℝ) * hexQ (t - (i : ℝ)) (u - (j : ℝ)) := by
    rw [hexCenter, spindle_dist_sq]
    dsimp [hexQ]
    rw [hx, hy]
    dsimp [r] at *
    nlinarith [hr]
  have near (i j : ℤ)
      (hq : hexQ (t - (i : ℝ)) (u - (j : ℝ)) ≤ 1 / 3) :
      dist (spindlePoint x y) (hexCenter i j) < 1 / 2 := by
    have hdist := hsq i j
    have hnonneg : 0 ≤ dist (spindlePoint x y) (hexCenter i j) := dist_nonneg
    nlinarith
  rcases hex_square_cover a b ha ha' hb hb' with h | h | h | h
  · refine ⟨m, n, near m n ?_⟩
    simpa only [a, b] using h
  · refine ⟨m + 1, n, near (m + 1) n ?_⟩
    convert h using 1 <;> dsimp [a, b] <;> push_cast <;> ring
  · refine ⟨m, n + 1, near m (n + 1) ?_⟩
    convert h using 1 <;> dsimp [a, b] <;> push_cast <;> ring
  · refine ⟨m + 1, n + 1, near (m + 1) (n + 1) ?_⟩
    convert h using 1 <;> dsimp [a, b] <;> push_cast <;> ring

private lemma hex_cover_pair
    (p : ↥(Set.univ : Set (EuclideanSpace ℝ (Fin 2)))) :
    ∃ z : ℤ × ℤ, dist p (hexCenter z.1 z.2) < 1 / 2 := by
  have hp : p = spindlePoint (p.1 0) (p.1 1) := by
    apply Subtype.ext
    apply PiLp.ext
    exact Fin.forall_fin_two.mpr ⟨rfl, rfl⟩
  rw [hp]
  obtain ⟨i, j, hij⟩ := hex_cover_xy (p.1 0) (p.1 1)
  exact ⟨(i, j), hij⟩

/--
This upper bound for the chromatic number of the plane was
observed by John R. Isbell. His approach was dividing the
plane into hexagons of uniform size and coloring them with a repeating
pattern. A proof can probably be found in:

Soifer, Alexander (2008), The Mathematical Coloring Book: Mathematics of Coloring and the Colorful Life of its Creators, New York: Springer, ISBN 978-0-387-74640-1

An alternative approach that uses square tiling was highlighted by László Székely.
-/
@[category textbook, AMS 52]
theorem HadwigerNelsonAtMostSeven :
    χ(ℝ²) ≤ 7 := by
  let G := UnitDistancePlaneGraph Set.univ
  let index : ↥(Set.univ : Set (EuclideanSpace ℝ (Fin 2))) → ℤ × ℤ :=
    fun p => Classical.choose (hex_cover_pair p)
  have hnear (p : ↥(Set.univ : Set (EuclideanSpace ℝ (Fin 2)))) :
      dist p (hexCenter (index p).1 (index p).2) < 1 / 2 := by
    exact Classical.choose_spec (hex_cover_pair p)
  let C : G.Coloring (ZMod 7) := .mk
    (fun p => hexColor (index p).1 (index p).2) (by
      intro p q hadj hsame
      change dist p q = 1 at hadj
      let cp := hexCenter (index p).1 (index p).2
      let cq := hexCenter (index q).1 (index q).2
      have hp : dist p cp < 1 / 2 := hnear p
      have hq : dist q cq < 1 / 2 := hnear q
      by_cases heq : index p = index q
      · have hc : cp = cq := by dsimp [cp, cq]; rw [heq]
        have hqc : dist cp q < 1 / 2 := by
          simpa only [hc, _root_.dist_comm cq q] using hq
        have htri : dist p q ≤ dist p cp + dist cp q := dist_triangle _ _ _
        linarith
      · have hne : (index p).1 ≠ (index q).1 ∨ (index p).2 ≠ (index q).2 := by
          by_contra hh
          push Not at hh
          exact heq (Prod.ext hh.1 hh.2)
        have hfar : 2 < dist cp cq :=
          hex_center_far _ _ _ _ hsame hne
        have hcp : dist cp p < 1 / 2 := by
          simpa only [_root_.dist_comm cp p] using hp
        have htri1 : dist cp cq ≤ dist cp p + dist p cq := dist_triangle _ _ _
        have htri2 : dist p cq ≤ dist p q + dist q cq := dist_triangle _ _ _
        linarith)
  have hcolor : G.Colorable 7 := by simpa using C.colorable
  exact hcolor.chromaticNumber_le

/-- The chromatic number of the plane is at least 3.

This is proven by considering an equilateral triangle in the plane. -/
@[category textbook, AMS 5]
theorem HadwigerNelsonAtLeastThree : 3 ≤ χ(ℝ²) :=
  le_chromaticNumber_of_pairwise_adj (by simp)
    ![(⟨!₂[0, 0], Set.mem_univ _⟩ : ↥(Set.univ : Set (EuclideanSpace ℝ (Fin 2)))),
      (⟨!₂[1, 0], Set.mem_univ _⟩ : ↥(Set.univ : Set (EuclideanSpace ℝ (Fin 2)))),
      (⟨!₂[0.5, Real.sqrt 3 / 2], Set.mem_univ _⟩ : ↥(Set.univ : Set (EuclideanSpace ℝ (Fin 2))))] <| by
    simp [pairwise_fin_succ_iff_of_isSymm, Fin.forall_fin_succ]
    simp [UnitDistancePlaneGraph, PiLp.dist_eq_of_L2, Real.dist_eq, div_pow, Subtype.dist_eq]
    norm_num

#print axioms Erdos508.HadwigerNelsonAtLeast4
#print axioms Erdos508.HadwigerNelsonAtMostSeven
