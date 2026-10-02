/-
Sanity checks of the definitions on small arrangements whose value is known from the hill
(README example, hill baseline, and two degenerate arrangements with parallel lines and triple
points; expected lists = output of the hill's eval.py `count_triangles`, computed on 2026-10-03).
These guard against vacuous or mis-transcribed definitions; they are not used by the main theorems.
-/
import KobonCert.Defs

namespace Kobon

/-- README example: x = 0, y = 0, x + y = 1: one triangle. -/
def ex3 : List Line := [⟨1, 0, 0⟩, ⟨0, 1, 0⟩, ⟨1, 1, -1⟩]

theorem ex3_ok : validB 3 ex3 = true ∧ faces ex3 = [(0, 1, 2)] ∧ evalFaces ex3 = [(0, 1, 2)] := by
  decide +kernel

/-- hill baseline `examples/baseline/solution.json`: 2*i*x - y - i*i = 0, i = 0..17 (16 triangles). -/
def baseline : List Line := (List.range 18).map fun (i : Nat) => ⟨2 * Int.ofNat i, -1, -(Int.ofNat i * Int.ofNat i)⟩

/- `kobonCount baseline = 16` and `evalCount baseline = 16`: modules SanityB1, SanityB2
(separate modules to keep the memory of each Lean process small). -/
theorem baseline_valid : validB 18 baseline = true := by decide +kernel

/-- degenerate: triple point at the origin (lines 0, 1, 3), parallels (0 ∥ 5, 1 ∥ 4) -/
def deg1 : List Line :=
  [⟨1, 0, 0⟩, ⟨0, 1, 0⟩, ⟨1, 1, -2⟩, ⟨1, -1, 0⟩, ⟨0, 1, -1⟩, ⟨1, 0, -3⟩, ⟨2, 1, -2⟩]

theorem deg1_ok : validB 7 deg1 = true ∧ simpleB deg1 = false ∧
    faces deg1 = [(0, 4, 6), (1, 2, 5), (1, 3, 6), (2, 4, 6), (3, 4, 5), (3, 4, 6)] ∧
    evalFaces deg1 = faces deg1 := by
  decide +kernel

def deg2 : List Line :=
  [⟨1, 0, 0⟩, ⟨1, 0, -1⟩, ⟨0, 1, 0⟩, ⟨0, 1, -1⟩, ⟨1, 1, -3⟩, ⟨1, -1, 0⟩, ⟨1, 1, -1⟩, ⟨3, -1, -1⟩]

theorem deg2_ok : validB 8 deg2 = true ∧ simpleB deg2 = false ∧
    faces deg2 = [(0, 2, 7), (0, 5, 6), (1, 3, 7), (1, 4, 5), (1, 5, 6), (2, 5, 7), (2, 6, 7),
      (3, 4, 5), (3, 5, 7), (3, 6, 7)] ∧
    evalFaces deg2 = faces deg2 := by
  decide +kernel

/-- a duplicated line (proportional triple) is rejected, as by the hill -/
theorem dup_rejected : validB 3 [⟨1, 0, 0⟩, ⟨0, 1, 0⟩, ⟨-2, 0, 0⟩] = false := by decide +kernel

end Kobon
