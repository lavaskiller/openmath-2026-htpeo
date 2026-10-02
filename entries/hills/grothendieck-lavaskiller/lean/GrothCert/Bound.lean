/-
GrothCert.Bound — real-number definitions (sign value, vector value, "K is a Grothendieck
bound") and the facts about the CHSH matrix [[1,1],[1,-1]].

DEFINITIONS to be read by a human: `IsSign`, `signVal`, `dot`, `vecVal`, `IsGrothBound`, `chsh`,
`exU`, `exV`.  Everything else is proved.
-/
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Order.Chebyshev
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FinCases

namespace Groth

open Finset

/-- a sign vector: every entry is `1` or `-1` -/
def IsSign {m : ℕ} (x : Fin m → ℝ) : Prop := ∀ i, x i = 1 ∨ x i = -1

/-- the bilinear form `sum_ij A_ij x_i y_j` -/
def signVal {m n : ℕ} (A : Fin m → Fin n → ℝ) (x : Fin m → ℝ) (y : Fin n → ℝ) : ℝ :=
  ∑ i, ∑ j, A i j * x i * y j

/-- the Euclidean inner product on `ℝ^d` -/
def dot {d : ℕ} (a b : Fin d → ℝ) : ℝ := ∑ k, a k * b k

/-- the vector objective `sum_ij A_ij <u_i, v_j>` -/
def vecVal {m n d : ℕ} (A : Fin m → Fin n → ℝ) (u : Fin m → Fin d → ℝ) (v : Fin n → Fin d → ℝ) :
    ℝ :=
  ∑ i, ∑ j, A i j * dot (u i) (v j)

/-- `K` satisfies Grothendieck's inequality for all finite real matrices and all finite-dimensional
unit vectors: whenever `B` bounds the sign values of `A`, the vector value is at most `K * B`.
The real Grothendieck constant `K_G` is the least such `K`. -/
def IsGrothBound (K : ℝ) : Prop :=
  ∀ (m n d : ℕ) (A : Fin m → Fin n → ℝ) (u : Fin m → Fin d → ℝ) (v : Fin n → Fin d → ℝ) (B : ℝ),
    (∀ i, dot (u i) (u i) = 1) → (∀ j, dot (v j) (v j) = 1) →
    (∀ x y, IsSign x → IsSign y → signVal A x y ≤ B) → vecVal A u v ≤ K * B

/-- the CHSH matrix -/
def chsh : Fin 2 → Fin 2 → ℝ := ![![1, 1], ![1, -1]]

/-! ## Sign optimum of the CHSH matrix -/

/-- every sign value of the CHSH matrix is at most 2 -/
theorem chsh_sign_le (x y : Fin 2 → ℝ) (hx : IsSign x) (hy : IsSign y) :
    signVal chsh x y ≤ 2 := by
  have e : signVal chsh x y = x 0 * y 0 + x 0 * y 1 + x 1 * y 0 - x 1 * y 1 := by
    simp [signVal, chsh, Fin.sum_univ_two]; ring
  rw [e]
  rcases hx 0 with h1 | h1 <;> rcases hx 1 with h2 | h2 <;> rcases hy 0 with h3 | h3 <;>
    rcases hy 1 with h4 | h4 <;> rw [h1, h2, h3, h4] <;> norm_num

/-- the value 2 is attained (by `x = y = (1, 1)`) -/
theorem chsh_sign_attained :
    ∃ x y : Fin 2 → ℝ, IsSign x ∧ IsSign y ∧ signVal chsh x y = 2 := by
  refine ⟨fun _ => 1, fun _ => 1, fun _ => Or.inl rfl, fun _ => Or.inl rfl, ?_⟩
  simp [signVal, chsh, Fin.sum_univ_two]; norm_num

/-! ## Lower bounds for a Grothendieck bound from a CHSH witness -/

/-- a CHSH witness of vector value `V` forces `K ≥ V / 2` -/
theorem bound_of_chsh_witness {K V : ℝ} (hK : IsGrothBound K) {d : ℕ}
    (u v : Fin 2 → Fin d → ℝ) (hu : ∀ i, dot (u i) (u i) = 1) (hv : ∀ j, dot (v j) (v j) = 1)
    (hV : vecVal chsh u v = V) : V / 2 ≤ K := by
  have h := hK 2 2 d chsh u v 2 hu hv chsh_sign_le
  rw [hV] at h
  linarith

/-! ## The exact optimum: value `2 * √2` -/

/-- exact left vectors `(1,0)`, `(0,1)` -/
noncomputable def exU : Fin 2 → Fin 2 → ℝ := ![![1, 0], ![0, 1]]

/-- exact right vectors `(√2/2, √2/2)`, `(√2/2, -√2/2)` -/
noncomputable def exV : Fin 2 → Fin 2 → ℝ :=
  ![![√2 / 2, √2 / 2], ![√2 / 2, -(√2 / 2)]]

theorem exU_unit : ∀ i, dot (exU i) (exU i) = 1 := by
  intro i; fin_cases i <;> simp [dot, exU, Fin.sum_univ_two]

theorem exV_unit : ∀ j, dot (exV j) (exV j) = 1 := by
  have h2 : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  intro j; fin_cases j <;> simp [dot, exV, Fin.sum_univ_two] <;> nlinarith

theorem exact_value : vecVal chsh exU exV = 2 * √2 := by
  simp [vecVal, dot, chsh, exU, exV, Fin.sum_univ_two]; ring

/-- T3.  Any Grothendieck bound is at least `√2`. -/
theorem groth_bound_ge_sqrt2 {K : ℝ} (hK : IsGrothBound K) : √2 ≤ K := by
  have h := bound_of_chsh_witness hK exU exV exU_unit exV_unit exact_value
  linarith

/-- Cauchy–Schwarz for `dot` -/
theorem dot_sq_le {d : ℕ} (a b : Fin d → ℝ) : dot a b ^ 2 ≤ dot a a * dot b b := by
  have h := Finset.sum_mul_sq_le_sq_mul_sq (Finset.univ : Finset (Fin d)) a b
  simpa [dot, sq] using h

/-- T4 (Tsirelson's bound).  For the CHSH matrix no unit vectors, in any dimension, give a vector
value above `2 * √2`; so `√2` is the best ratio this matrix can certify. -/
theorem chsh_vec_le {d : ℕ} (u v : Fin 2 → Fin d → ℝ) (hu : ∀ i, dot (u i) (u i) = 1)
    (hv : ∀ j, dot (v j) (v j) = 1) : vecVal chsh u v ≤ 2 * √2 := by
  let a : Fin d → ℝ := fun k => v 0 k + v 1 k
  let b : Fin d → ℝ := fun k => v 0 k - v 1 k
  have e : vecVal chsh u v = dot (u 0) a + dot (u 1) b := by
    simp only [vecVal, dot, chsh, Fin.sum_univ_two, a, b, mul_add, mul_sub,
      Finset.sum_add_distrib, Finset.sum_sub_distrib]
    simp
    ring
  have hab : dot a a + dot b b = 4 := by
    have h0 := hv 0
    have h1 := hv 1
    simp only [dot, a, b] at *
    rw [← Finset.sum_add_distrib]
    have : ∀ k ∈ (Finset.univ : Finset (Fin d)),
        (v 0 k + v 1 k) * (v 0 k + v 1 k) + (v 0 k - v 1 k) * (v 0 k - v 1 k)
          = 2 * (v 0 k * v 0 k) + 2 * (v 1 k * v 1 k) := fun k _ => by ring
    rw [Finset.sum_congr rfl this, Finset.sum_add_distrib, ← Finset.mul_sum, ← Finset.mul_sum,
      h0, h1]
    norm_num
  have hp := dot_sq_le (u 0) a
  have hq := dot_sq_le (u 1) b
  rw [hu 0, one_mul] at hp
  rw [hu 1, one_mul] at hq
  rw [e]
  have h2 : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  have h0 : 0 ≤ √2 := Real.sqrt_nonneg 2
  by_contra hc
  rw [not_le] at hc
  nlinarith [sq_nonneg (dot (u 0) a - dot (u 1) b)]

/-- the submitted rational ratio is below `√2`, by less than `10⁻⁶` -/
theorem ratio_lt_sqrt2 : (1393 / 985 : ℝ) < √2 ∧ √2 - 1393 / 985 < 1 / 1000000 := by
  have h2 : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  have h0 : 0 ≤ √2 := Real.sqrt_nonneg 2
  constructor
  · by_contra hc
    rw [not_lt] at hc
    nlinarith
  · by_contra hc
    rw [not_lt] at hc
    nlinarith

/-- `floor(10⁶ · √2) = 1414213`: no witness on the CHSH matrix can score `gap_ppm` above 1414213 -/
theorem sqrt2_ppm : (1414213 : ℝ) ≤ 1000000 * √2 ∧ 1000000 * √2 < 1414214 := by
  have h2 : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  have h0 : 0 ≤ √2 := Real.sqrt_nonneg 2
  constructor
  · by_contra hc
    rw [not_le] at hc
    nlinarith
  · by_contra hc
    rw [not_lt] at hc
    nlinarith

end Groth
