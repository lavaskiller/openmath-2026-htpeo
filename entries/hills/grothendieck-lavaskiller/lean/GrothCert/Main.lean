/-
GrothCert.Main — the submitted rational witness as real vectors, and the final statements.
-/
import GrothCert.Defs
import GrothCert.Bound

namespace Groth

/-- the submitted matrix as a real matrix (cast of the list data of `GrothCert.Defs`) -/
def solA : Fin 2 → Fin 2 → ℝ := fun i j => ((matZ i j : Int) : ℝ)

/-- the submitted left vectors as real vectors -/
def solU : Fin 2 → Fin 2 → ℝ := fun i k => ((leftQ i k : ℚ) : ℝ)

/-- the submitted right vectors as real vectors -/
def solV : Fin 2 → Fin 2 → ℝ := fun j k => ((rightQ j k : ℚ) : ℝ)

/-- the submitted matrix is the CHSH matrix -/
theorem solA_eq : solA = chsh := by
  funext i j
  simp only [solA, matZ_eq, chsh]
  fin_cases i <;> fin_cases j <;> simp

theorem solU_unit : ∀ i, dot (solU i) (solU i) = 1 := by
  intro i
  simp only [dot, solU, leftQ_eq, Fin.sum_univ_two]
  fin_cases i <;> simp <;> norm_num

theorem solV_unit : ∀ j, dot (solV j) (solV j) = 1 := by
  intro j
  simp only [dot, solV, rightQ_eq, Fin.sum_univ_two]
  fin_cases j <;> simp <;> norm_num

/-- the vector objective of the submission, over the reals -/
theorem sol_value : vecVal solA solU solV = 2786 / 985 := by
  rw [solA_eq]
  simp only [vecVal, dot, chsh, solU, solV, leftQ_eq, rightQ_eq, Fin.sum_univ_two]
  simp
  norm_num

/-- the sign optimum of the submitted matrix is exactly 2 -/
theorem sol_sign_optimum :
    (∀ x y : Fin 2 → ℝ, IsSign x → IsSign y → signVal solA x y ≤ 2) ∧
    ∃ x y : Fin 2 → ℝ, IsSign x ∧ IsSign y ∧ signVal solA x y = 2 := by
  rw [solA_eq]
  exact ⟨chsh_sign_le, chsh_sign_attained⟩

/-- T2.  The submitted witness: sign optimum 2 (upper bound and attained), unit vectors, vector
objective 2786/985; hence every Grothendieck bound `K` satisfies `K ≥ 1393/985`. -/
theorem witness_lower_bound :
    (∀ x y : Fin 2 → ℝ, IsSign x → IsSign y → signVal solA x y ≤ 2) ∧
    (∃ x y : Fin 2 → ℝ, IsSign x ∧ IsSign y ∧ signVal solA x y = 2) ∧
    (∀ i, dot (solU i) (solU i) = 1) ∧ (∀ j, dot (solV j) (solV j) = 1) ∧
    vecVal solA solU solV = 2786 / 985 ∧
    ∀ K : ℝ, IsGrothBound K → 1393 / 985 ≤ K := by
  refine ⟨sol_sign_optimum.1, sol_sign_optimum.2, solU_unit, solV_unit, sol_value, ?_⟩
  intro K hK
  have h := bound_of_chsh_witness hK solU solV solU_unit solV_unit (solA_eq ▸ sol_value)
  linarith

/-- the submitted witness is within `10⁻⁶ · 2` of the optimum `2 * √2` for its matrix -/
theorem sol_value_le_opt {d : ℕ} (u v : Fin 2 → Fin d → ℝ) (hu : ∀ i, dot (u i) (u i) = 1)
    (hv : ∀ j, dot (v j) (v j) = 1) :
    vecVal solA u v ≤ 2 * √2 ∧ vecVal solA u v / 2 < vecVal solA solU solV / 2 + 1 / 1000000 := by
  have h := chsh_vec_le u v hu hv
  rw [sol_value, solA_eq]
  refine ⟨h, ?_⟩
  have := ratio_lt_sqrt2.2
  linarith

end Groth

#print axioms Groth.certificate
#print axioms Groth.matZ_eq
#print axioms Groth.leftQ_eq
#print axioms Groth.rightQ_eq
#print axioms Groth.witness_lower_bound
#print axioms Groth.sol_value_le_opt
#print axioms Groth.groth_bound_ge_sqrt2
#print axioms Groth.chsh_vec_le
#print axioms Groth.chsh_sign_le
#print axioms Groth.chsh_sign_attained
#print axioms Groth.exact_value
#print axioms Groth.ratio_lt_sqrt2
#print axioms Groth.sqrt2_ppm
