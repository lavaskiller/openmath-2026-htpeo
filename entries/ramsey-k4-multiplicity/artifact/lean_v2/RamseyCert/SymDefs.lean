import RamseyCert.Defs

/-! Kernel-friendly symmetry check for a list of row masks (definitions). -/

namespace RamseyCert

/-- `ri` is row `i`; `l` are the rows `j0, j0+1, ...`: bit `j` of `ri` equals bit `i` of row `j`. -/
def symRow (i ri : ℕ) : List ℕ → ℕ → Bool
  | [], _ => true
  | rj :: t, j => (tb ri j == tb rj i) && symRow i ri t (j + 1)

/-- Symmetry check of the rows `l` (indices `i0, i0+1, ...`) against all rows `rs`. -/
def symRows (rs : List ℕ) : List ℕ → ℕ → Bool
  | [], _ => true
  | ri :: t, i => symRow i ri rs 0 && symRows rs t (i + 1)

end RamseyCert
