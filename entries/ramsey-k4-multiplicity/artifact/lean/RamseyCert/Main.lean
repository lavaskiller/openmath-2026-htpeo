import RamseyCert.GlueR
import RamseyCert.GlueB
import RamseyCert.Sym
import RamseyCert.SymChk0
import RamseyCert.SymChk1
import RamseyCert.SymChk2
import RamseyCert.SymChk3
import RamseyCert.SymChk4
import RamseyCert.SymChk5
import RamseyCert.SymChk6
import RamseyCert.SymChk7

/-!
# The certificate

`sol` is the solution file as a `Template`; `sol_density` and `sol_lt_ref` are the results.
-/

set_option maxRecDepth 1000000
namespace RamseyCert

/-- The solution: weights `wl`, red pairs given by the row masks `rowsR`. -/
def sol : Template := ⟨1024, fun i => wl.getD i 0, fun i j => adjOf rowsR i j⟩

theorem wl_ok : wl = (List.range 1024).map (wOf W 32) := by decide +kernel

theorem rowsB_ok : rowsB = rowsR.map (fun r => Nat.xor r (2 ^ 1024 - 1)) := by decide +kernel

theorem rowsR_len : rowsR.length = 1024 := by decide +kernel

theorem sol_w (i : Fin sol.n) : sol.w i = wOf W 32 i := by
  show wl.getD i 0 = wOf W 32 i
  rw [wl_ok]; exact getD_map_range _ _ _ i.isLt

theorem sol_red (i j : Fin sol.n) : sol.red i j = adjOf rowsR i j := rfl

theorem sol_split : sol.numer = K4 1024 (wOf W 32) (adjOf rowsR)
    + K4 1024 (wOf W 32) (fun a b => !adjOf rowsR a b) :=
  Template.numer_eq sol 1024 rfl (wOf W 32) (adjOf rowsR) sol_w sol_red

theorem K4Bneg : K4 1024 (wOf W 32) (fun a b => !adjOf rowsR a b) = 100270996986525066830523881689 :=
  (K4_blue 1024 (wOf W 32) rowsR rowsB rowsR_len rowsB_ok).trans K4B

theorem sol_numer_sum : sol.numer = 99809658758227271141703184848 + 100270996986525066830523881689 :=
  sol_split.trans (congrArg₂ HAdd.hAdd K4R K4Bneg)

/-- Monochromatic-K4 numerator of the solution. -/
theorem sol_numer : sol.numer = 200080655744752337972227066537 := sol_numer_sum.trans (by norm_num)

theorem sol_total_list : sol.total = ((List.range 1024).map (wOf W 32)).sum :=
  Template.total_eq sol 1024 rfl (wOf W 32) sol_w

theorem wl_sum : ((List.range 1024).map (wOf W 32)).sum = 50759309 := by decide +kernel

/-- Total weight of the solution. -/
theorem sol_total : sol.total = 50759309 := sol_total_list.trans wl_sum

/-- Exact density of the solution. -/
theorem sol_density : sol.density = 200080655744752337972227066537 / 6638390640717004439491700265361 := by
  unfold Template.density
  rw [sol_numer, sol_total]
  norm_num

#print axioms sol_density
/-- The density is below the reference value `10486266368 / 768^4` (arXiv:2206.04036v3). -/
theorem sol_lt_ref : sol.density < 10486266368 / 768 ^ 4 := by
  rw [sol_density]
  norm_num

#print axioms sol_lt_ref

theorem adjR_symm (i j : ℕ) (hi : i < 1024) (hj : j < 1024) : adjOf rowsR i j = adjOf rowsR j i := by
  have hl : rowsR.length = 1024 := rowsR_len
  rcases Nat.lt_or_ge i 128 with h0 | h0
  · exact adjOf_symm_of_check rowsR 0 128 symchk_0 i j (by omega) (by omega) (by omega) (by omega)
  rcases Nat.lt_or_ge i 256 with h1 | h1
  · exact adjOf_symm_of_check rowsR 128 128 symchk_1 i j (by omega) (by omega) (by omega) (by omega)
  rcases Nat.lt_or_ge i 384 with h2 | h2
  · exact adjOf_symm_of_check rowsR 256 128 symchk_2 i j (by omega) (by omega) (by omega) (by omega)
  rcases Nat.lt_or_ge i 512 with h3 | h3
  · exact adjOf_symm_of_check rowsR 384 128 symchk_3 i j (by omega) (by omega) (by omega) (by omega)
  rcases Nat.lt_or_ge i 640 with h4 | h4
  · exact adjOf_symm_of_check rowsR 512 128 symchk_4 i j (by omega) (by omega) (by omega) (by omega)
  rcases Nat.lt_or_ge i 768 with h5 | h5
  · exact adjOf_symm_of_check rowsR 640 128 symchk_5 i j (by omega) (by omega) (by omega) (by omega)
  rcases Nat.lt_or_ge i 896 with h6 | h6
  · exact adjOf_symm_of_check rowsR 768 128 symchk_6 i j (by omega) (by omega) (by omega) (by omega)
  exact adjOf_symm_of_check rowsR 896 128 symchk_7 i j (by omega) (by omega) (by omega) (by omega)

/-- The colour matrix of the solution is symmetric. -/
theorem sol_symm : sol.Symmetric := fun a b => adjR_symm a b a.isLt b.isLt

#print axioms sol_symm

/-- The hill metric `density_ppt` = ⌈10^12 · density⌉. -/
theorem sol_ppt : ⌈(10 ^ 12 : ℚ) * sol.density⌉ = 30139933996 := by
  rw [sol_density, Int.ceil_eq_iff]
  constructor <;> norm_num

#print axioms sol_ppt

end RamseyCert
