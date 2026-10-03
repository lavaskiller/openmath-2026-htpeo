import RamseyCert.Final

/-! Prints the main statements and their axioms (not part of the library; run with lean directly). -/

open RamseyCert

#check @sol_numer
#check @sol_total
#check @sol_density
#check @sol_lt_ref
#check @sol_ppt
#check @sol_symm
#check @K4R
#check @K4Bneg
#check @colour_total
#check @Template.numer_eq
#check @blowup_count
#check @ramseyMultK4_le_density
#check @ramseyMultK4_tendsto
#check @ramseyMultK4_le_sol
#check @ramseyMultK4_lt_ref
#check @minMonoK4_density_le_sol
#check @ramseyMultK4_limit_lt_ref
#print axioms sol_numer
#print axioms sol_density
#print axioms sol_lt_ref
#print axioms sol_ppt
#print axioms sol_symm
#print axioms ramseyMultK4_le_sol
#print axioms ramseyMultK4_lt_ref
#print axioms minMonoK4_density_le_sol
#print axioms ramseyMultK4_limit_lt_ref
