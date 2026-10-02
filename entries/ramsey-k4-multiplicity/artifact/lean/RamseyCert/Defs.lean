import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Rat.Defs

/-!
# Weighted two-colour blow-up templates and their monochromatic-K4 numerator

`Template`, `Template.numer`, `Template.density` mirror the literal ordered-tuple oracle of the
hill evaluator (`eval.py`, `_oracle`): a 4-tuple `(a,b,c,d)` of block indices (repetitions
allowed; a repeated index uses the diagonal colour) contributes `w a * w b * w c * w d` when all
six pairs `ab ac ad bc bd cd` are red or all six are blue.

The second half defines a kernel-friendly evaluation scheme (bit masks and 2^B-packed weight
vectors as natural numbers) used by the certificate; `Fast.lean` proves it equal to the
specification.
-/

open Finset

namespace RamseyCert

/-! ## Specification -/

/-- A finite weighted two-colour template: `n` blocks, positive integer weights, and a colour
(`true` = red, `false` = blue) for every ordered pair of blocks, including the diagonal. -/
structure Template where
  n : ℕ
  w : Fin n → ℕ
  red : Fin n → Fin n → Bool

namespace Template

variable (T : Template)

/-- All six pairs red, or all six pairs blue. -/
def mono (a b c d : Fin T.n) : Bool :=
  (T.red a b && T.red a c && T.red a d && T.red b c && T.red b d && T.red c d) ||
  (!T.red a b && !T.red a c && !T.red a d && !T.red b c && !T.red b d && !T.red c d)

/-- Weighted number of monochromatic ordered 4-tuples of blocks. -/
def numer : ℕ :=
  ∑ a, ∑ b, ∑ c, ∑ d, if T.mono a b c d = true then T.w a * T.w b * T.w c * T.w d else 0

/-- Total weight. -/
def total : ℕ := ∑ a, T.w a

/-- The hill metric: limiting monochromatic-K4 density of the blow-up colourings. -/
def density : ℚ := (T.numer : ℚ) / (T.total : ℚ) ^ 4

/-- The colour matrix is symmetric. -/
def Symmetric : Prop := ∀ a b, T.red a b = T.red b a

end Template

/-- One-colour count on `ℕ`-indexed data: ordered 4-tuples below `n`, all six pairs in `adj`. -/
def K4 (n : ℕ) (w : ℕ → ℕ) (adj : ℕ → ℕ → Bool) : ℕ :=
  ∑ a ∈ range n, ∑ b ∈ range n, ∑ c ∈ range n, ∑ d ∈ range n,
    if (adj a b && adj a c && adj a d && adj b c && adj b d && adj c d) = true
    then w a * w b * w c * w d else 0

/-! ## Kernel-friendly evaluation -/

/-- A block for one colour class: index, weight, neighbourhood bit mask `r` (bit `j` set iff the
pair `(i,j)` has the colour), `M` = the mask with every bit expanded to a full `B`-bit field,
`E` = the weight vector packed in `B`-bit fields and restricted to the neighbourhood. -/
structure Ent where
  i : ℕ
  w : ℕ
  r : ℕ
  M : ℕ
  E : ℕ
deriving DecidableEq, Repr

/-- Bit `i` of `m`. -/
def tb (m i : ℕ) : Bool := Nat.beq (Nat.mod (Nat.shiftRight m i) 2) 1

/-- Adjacency of a colour class given by a list of row masks: bit `b` of the `a`-th mask. -/
def adjOf (rs : List ℕ) (a b : ℕ) : Bool := tb (rs.getD a 0) b

/-- Field `d` (width `B`) of the packed number `W`. -/
def wOf (W B d : ℕ) : ℕ := Nat.mod (Nat.shiftRight W (Nat.mul B d)) (Nat.pow 2 B)

/-- `∑ d < n, f d * 2^(B*d)`. -/
def pack (B : ℕ) (f : ℕ → ℕ) : ℕ → ℕ
  | 0 => 0
  | n + 1 => Nat.add (pack B f n) (Nat.mul (f n) (Nat.pow 2 (Nat.mul B n)))

/-- The block with index `i` and neighbourhood mask `r`, for packed weights `W`. -/
def mkEnt (B n W r i : ℕ) : Ent :=
  ⟨i, wOf W B i, r,
   pack B (fun d => bif tb r d then Nat.pow 2 B - 1 else 0) n,
   pack B (fun d => bif tb r d then wOf W B d else 0) n⟩

/-- `∑ c ∈ La, [bit c of rb] w_c * ((Mab &&& E_c) % md)` (raw recursors: fast in the kernel). -/
noncomputable def kInnerC (md rb Mab : ℕ) (La : List Ent) : ℕ :=
  @List.rec Ent (fun _ => ℕ) 0
    (fun e _ ih =>
      Nat.add (@Bool.rec (fun _ => ℕ) 0 (Nat.mul e.w (Nat.mod (Nat.land Mab e.E) md)) (tb rb e.i)) ih)
    La

/-- `∑ b ∈ es, w_b * kInnerC md r_b (Ma &&& M_b) La`. -/
noncomputable def kInnerB (md Ma : ℕ) (La : List Ent) (es : List Ent) : ℕ :=
  @List.rec Ent (fun _ => ℕ) 0
    (fun e _ ih => Nat.add (Nat.mul e.w (kInnerC md e.r (Nat.land Ma e.M) La)) ih)
    es

/-- Contribution of the block `ea` whose neighbourhood list is `La`. -/
noncomputable def kTermA (md : ℕ) (ea : Ent) (La : List Ent) : ℕ :=
  Nat.mul ea.w (kInnerB md ea.M La La)

/-! Computable twins of the above (for `#eval` / `native_decide` cross-checks). -/

def innerC (md rb Mab : ℕ) : List Ent → ℕ
  | [] => 0
  | e :: t => (bif tb rb e.i then e.w * ((Mab &&& e.E) % md) else 0) + innerC md rb Mab t

def innerB (md Ma : ℕ) (La : List Ent) : List Ent → ℕ
  | [] => 0
  | e :: t => e.w * innerC md e.r (Ma &&& e.M) La + innerB md Ma La t

def termA (md : ℕ) (ea : Ent) (La : List Ent) : ℕ := ea.w * innerB md ea.M La La

/-- Neighbourhood list of `ea` inside `all`. -/
def nbhd (all : List Ent) (ea : Ent) : List Ent := all.filter (fun e => tb ea.r e.i)

/-- The blocks of one colour class given its list of row masks. -/
def mkAll (B n W : ℕ) (rs : List ℕ) : List Ent :=
  List.zipWith (fun r i => mkEnt B n W r i) rs (List.range n)

/-- Computable one-colour count. -/
def fastK (B n W : ℕ) (rs : List ℕ) : ℕ :=
  let all := mkAll B n W rs
  (all.map (fun ea => termA (2 ^ B - 1) ea (nbhd all ea))).sum

end RamseyCert
