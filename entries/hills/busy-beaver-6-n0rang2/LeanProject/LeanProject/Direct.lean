import LeanProject.Witness249881

/-!
# (Z) by direct kernel evaluation (Stage 4)

The kernel evaluates the zipper run for all 249,880 steps (about a minute). This is kept as an
independent cross-check of the structural proof in `LeanProject.Structural`.
-/

namespace BB6

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- (Z), evaluated step by step by the kernel. -/
theorem runZ_249880 : runZ bb6 249880 z0 = Witness.zA := by decide +kernel

/-- **Certificate** (Stage 4 proof). -/
theorem bb6_certificate : Certificate := certificate_of_run runZ_249880

/-- **Acceptance** (Stage 4 proof). -/
theorem bb6_accepts (B : Nat) : Accepts bb6 B ↔ 249881 ≤ B :=
  accepts_of_certificate bb6_certificate B

end BB6
