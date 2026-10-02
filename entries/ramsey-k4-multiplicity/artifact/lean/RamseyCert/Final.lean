import RamseyCert.Main
import RamseyCert.Limit
import RamseyCert.Mono

/-!
# Consequence for the K4 Ramsey multiplicity constant

`ramseyMultK4` (see `Limit.lean`) is the liminf of the minimum density of monochromatic K4 over all
2-colourings of the complete graph on m vertices.
-/

set_option maxRecDepth 1000000
namespace RamseyCert

/-- The K4 Ramsey multiplicity constant is at most the density of the solution. -/
theorem ramseyMultK4_le_sol :
    ramseyMultK4 ≤ 200080655744752337972227066537 / 6638390640717004439491700265361 := by
  have h := ramseyMultK4_le_density sol sol_symm (by rw [sol_total]; norm_num)
  rw [sol_density] at h
  exact h.trans (le_of_eq (by norm_num))

#print axioms ramseyMultK4_le_sol

/-- ... hence strictly below the reference value `10486266368 / 768^4`. -/
theorem ramseyMultK4_lt_ref : ramseyMultK4 < 10486266368 / 768 ^ 4 :=
  lt_of_le_of_lt ramseyMultK4_le_sol (by norm_num)

#print axioms ramseyMultK4_lt_ref

/-- Finite form: for every `m ≥ 4` the minimum number of monochromatic K4 over all 2-colourings of the
complete graph on `m` vertices is at most `P * C(m,4)` (uses the monotonicity proved in `Mono.lean`). -/
theorem minMonoK4_density_le_sol (m : ℕ) (hm : 4 ≤ m) :
    (minMonoK4 m : ℝ) / (m.choose 4 : ℝ) ≤ 200080655744752337972227066537 / 6638390640717004439491700265361 :=
  (minMonoK4_density_le m hm).trans ramseyMultK4_le_sol

#print axioms minMonoK4_density_le_sol

/-- The limit defining the K4 Ramsey multiplicity constant exists and is below the reference value. -/
theorem ramseyMultK4_limit_lt_ref :
    ∃ L : ℝ, Filter.Tendsto (fun m : ℕ => (minMonoK4 m : ℝ) / (m.choose 4 : ℝ)) Filter.atTop (nhds L) ∧
      L < 10486266368 / 768 ^ 4 :=
  ⟨ramseyMultK4, ramseyMultK4_tendsto, ramseyMultK4_lt_ref⟩

#print axioms ramseyMultK4_limit_lt_ref

end RamseyCert
