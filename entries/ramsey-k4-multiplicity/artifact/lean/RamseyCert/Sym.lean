import Mathlib
import RamseyCert.SymDefs

/-!
# A kernel-friendly symmetry check for a list of row masks

`symRows rs l i0 = true` checks, for the rows `l` (a segment of `rs` starting at index `i0`), that
bit `j` of row `i` equals bit `i` of row `j` for every row `j` of `rs`.
-/

namespace RamseyCert

theorem symRow_spec (i ri : ℕ) : ∀ (l : List ℕ) (j0 : ℕ), symRow i ri l j0 = true →
    ∀ k, k < l.length → tb ri (j0 + k) = tb (l.getD k 0) i := by
  intro l
  induction l with
  | nil => intro j0 _ k hk; simp at hk
  | cons rj t ih =>
    intro j0 h k hk
    simp only [symRow, Bool.and_eq_true, beq_iff_eq] at h
    cases k with
    | zero => simpa using h.1
    | succ k =>
      have h2 := ih (j0 + 1) h.2 k (by simpa using hk)
      have e : j0 + 1 + k = j0 + (k + 1) := by omega
      rw [e] at h2
      simpa using h2

theorem symRows_spec (rs : List ℕ) : ∀ (l : List ℕ) (i0 : ℕ), symRows rs l i0 = true →
    ∀ k, k < l.length → ∀ j, j < rs.length →
      tb (l.getD k 0) j = tb (rs.getD j 0) (i0 + k) := by
  intro l
  induction l with
  | nil => intro i0 _ k hk; simp at hk
  | cons ri t ih =>
    intro i0 h k hk j hj
    simp only [symRows, Bool.and_eq_true] at h
    cases k with
    | zero =>
      have h1 := symRow_spec i0 ri rs 0 h.1 j hj
      simpa using h1
    | succ k =>
      have h2 := ih (i0 + 1) h.2 k (by simpa using hk) j hj
      have e : i0 + 1 + k = i0 + (k + 1) := by omega
      rw [e] at h2
      simpa using h2

/-- A passed check on the segment `[s, s+len)` gives symmetry of `adjOf rs` for rows in the segment. -/
theorem adjOf_symm_of_check (rs : List ℕ) (s len : ℕ)
    (h : symRows rs ((rs.drop s).take len) s = true) (i j : ℕ)
    (hi : s ≤ i) (hi2 : i < s + len) (hil : i < rs.length) (hj : j < rs.length) :
    adjOf rs i j = adjOf rs j i := by
  obtain ⟨k, rfl⟩ : ∃ k, i = s + k := ⟨i - s, by omega⟩
  have hk : k < ((rs.drop s).take len).length := by
    simp only [List.length_take, List.length_drop]; omega
  have h1 := symRows_spec rs _ s h k hk j hj
  have e : ((rs.drop s).take len).getD k 0 = rs.getD (s + k) 0 := by
    have hk' : k < len := by omega
    simp [List.getD_eq_getElem?_getD, hk', List.getElem?_drop]
  rw [e] at h1
  exact h1

end RamseyCert
