/-
Kobon triangle certificate: definitions (core Lean only, no Mathlib).

A line is an integer triple (a, b, c) standing for a*x + b*y + c = 0, exactly as in
the hill `kobon-triangles` (`solution.json`, field `lines`).

Two counting functions are defined, both in exact integer arithmetic:

* `kobonCount`  -- the "geometric" checker: a triple of lines p, q, r is a triangular
  face iff the three lines are pairwise non-parallel, not concurrent, and no line of
  the arrangement separates the three vertices (see `triCheck`).  `Geom.lean` proves
  that this is equivalent to the geometric definition over the reals
  (`Kobon.triCheck_iff`).
* `evalCount`   -- a transcription of the algorithm of the hill's `eval.py`
  (`count_triangles`): each of the three sides joins two CONSECUTIVE distinct
  arrangement vertices on its supporting line (see `evalTriB`).
-/

namespace Kobon

structure Line where
  a : Int
  b : Int
  c : Int
deriving DecidableEq, Repr

/-- Homogeneous coordinates of the intersection point of `p` and `q`:
the point is `(px p q / w p q, py p q / w p q)` when `w p q ≠ 0`
(same formulas as `_intersection` in `eval.py`). -/
def w (p q : Line) : Int := p.a * q.b - p.b * q.a
def px (p q : Line) : Int := p.b * q.c - p.c * q.b
def py (p q : Line) : Int := p.c * q.a - p.a * q.c

/-- 3x3 determinant of the coefficient rows `l, p, q`.
`det3 l p q / w p q` is the value of `l.a*x + l.b*y + l.c` at the point `p ∩ q`. -/
def det3 (l p q : Line) : Int := l.a * px p q + l.b * py p q + l.c * w p q

/-- Has the sign of the value of the affine form of `l` at the point `p ∩ q`
(it is that value times `(w p q)^2`). -/
def sv (l p q : Line) : Int := det3 l p q * w p q

/-- `l` does not separate the three vertices `p∩q`, `p∩r`, `q∩r`:
its affine form is `≥ 0` at all three or `≤ 0` at all three. -/
def noCross (l p q r : Line) : Bool :=
  (decide (0 ≤ sv l p q) && decide (0 ≤ sv l p r) && decide (0 ≤ sv l q r)) ||
  (decide (sv l p q ≤ 0) && decide (sv l p r ≤ 0) && decide (sv l q r ≤ 0))

/-- The lines `p, q, r` bound a triangular face of the arrangement `L`. -/
def triCheck (L : List Line) (p q r : Line) : Bool :=
  decide (w p q ≠ 0) && decide (w p r ≠ 0) && decide (w q r ≠ 0) &&
  decide (det3 p q r ≠ 0) && L.all (fun l => noCross l p q r)

/-- The index triples `(i, j, k)` with `i < j < k < n` and the given `i`. -/
def rowTriples (n i : Nat) : List (Nat × Nat × Nat) :=
  ((List.range n).flatMap fun j => (List.range n).map fun k => (i, j, k)).filter
      (fun t => decide (t.1 < t.2.1) && decide (t.2.1 < t.2.2))

/-- All index triples `(i, j, k)` with `i < j < k < n`. -/
def idxTriples (n : Nat) : List (Nat × Nat × Nat) :=
  (List.range n).flatMap (rowTriples n)

def zeroLine : Line := ⟨0, 0, 0⟩

/-- the `i`-th line (0-based) -/
def nth (L : List Line) (i : Nat) : Line := L.getD i zeroLine

def faceB (L : List Line) (t : Nat × Nat × Nat) : Bool :=
  triCheck L (nth L t.1) (nth L t.2.1) (nth L t.2.2)

/-- The triangular faces, as increasing 0-based index triples of their supporting lines. -/
def faces (L : List Line) : List (Nat × Nat × Nat) := (idxTriples L.length).filter (faceB L)

/-- Number of triangular faces of the arrangement `L`. -/
def kobonCount (L : List Line) : Nat := (faces L).length

/-! ### Validity (as in `_load` of `eval.py`) and general position -/

def properB (p : Line) : Bool := !(decide (p.a = 0) && decide (p.b = 0))

def boundB (p : Line) : Bool :=
  decide (p.a.natAbs ≤ 10 ^ 30) && decide (p.b.natAbs ≤ 10 ^ 30) && decide (p.c.natAbs ≤ 10 ^ 30)

/-- `p` and `q` are the same geometric line (proportional triples). -/
def sameLineB (p q : Line) : Bool :=
  decide (w p q = 0) && decide (px p q = 0) && decide (py p q = 0)

/-- every pair of positions `i < j` satisfies `f` -/
def allPairs (f : Line → Line → Bool) : List Line → Bool
  | [] => true
  | p :: rest => rest.all (f p) && allPairs f rest

/-- every triple of positions `i < j < k` satisfies `f` -/
def allTriples (f : Line → Line → Line → Bool) : List Line → Bool
  | [] => true
  | p :: rest => allPairs (f p) rest && allTriples f rest

/-- The submission is accepted by the hill for parameter `n`: `n` proper lines, coefficient
bound `10^30`, no two triples represent the same geometric line. -/
def validB (n : Nat) (L : List Line) : Bool :=
  decide (L.length = n) && L.all properB && L.all boundB &&
  allPairs (fun p q => !sameLineB p q) L

/-- Simple arrangement: no two lines parallel, no three lines concurrent. -/
def simpleB (L : List Line) : Bool :=
  allPairs (fun p q => decide (w p q ≠ 0)) L &&
  allTriples (fun p q r => decide (det3 p q r ≠ 0)) L

/-! ### Transcription of `count_triangles` of `eval.py`

On the line `p` the arrangement vertices are sorted by the coordinate `x` (if `p.b ≠ 0`)
or `y` (otherwise); equal points are merged; a side is accepted iff the ranks of its two
end points differ by exactly one, i.e. the two points are distinct and no arrangement
vertex on `p` lies strictly between them. -/

/-- numerator of the sorting key of the point `p ∩ q` on `p` (the denominator is `w p q`) -/
def keyNum (p q : Line) : Int := if p.b ≠ 0 then px p q else py p q

/-- key (p ∩ q) < key (p ∩ r), for `w p q ≠ 0`, `w p r ≠ 0` -/
def keyLt (p q r : Line) : Bool :=
  decide ((keyNum p q * w p r - keyNum p r * w p q) * (w p q * w p r) < 0)

def keyEq (p q r : Line) : Bool :=
  decide (keyNum p q * w p r = keyNum p r * w p q)

/-- the points `p ∩ q` and `p ∩ r` have consecutive ranks on `p` -/
def adjB (L : List Line) (p q r : Line) : Bool :=
  !keyEq p q r &&
  L.all (fun l => decide (w p l = 0) ||
    !((keyLt p q l && keyLt p l r) || (keyLt p r l && keyLt p l q)))

def evalTriB (L : List Line) (p q r : Line) : Bool :=
  decide (w p q ≠ 0) && decide (w p r ≠ 0) && decide (w q r ≠ 0) &&
  adjB L p q r && adjB L q p r && adjB L r p q

def evalFaceB (L : List Line) (t : Nat × Nat × Nat) : Bool :=
  evalTriB L (nth L t.1) (nth L t.2.1) (nth L t.2.2)

def evalFaces (L : List Line) : List (Nat × Nat × Nat) :=
  (idxTriples L.length).filter (evalFaceB L)

def evalCount (L : List Line) : Nat := (evalFaces L).length

/-- lexicographic order on index triples -/
def ltT (s t : Nat × Nat × Nat) : Prop :=
  s.1 < t.1 ∨ (s.1 = t.1 ∧ (s.2.1 < t.2.1 ∨ (s.2.1 = t.2.1 ∧ s.2.2 < t.2.2)))

instance (s t : Nat × Nat × Nat) : Decidable (ltT s t) := by unfold ltT; infer_instance

/-- Bool test that a list of index triples is strictly increasing (hence has no repetition). -/
def incB : List (Nat × Nat × Nat) → Bool
  | [] => true
  | [_] => true
  | a :: b :: l => decide (ltT a b) && incB (b :: l)

end Kobon
