/-
GrothCert.Defs — the submitted witness and a transcription of the hill evaluator
(`hill/eval.py` of `grothendieck-constant-witnesses`) in exact rational arithmetic.

Everything in this file is DEFINITION (to be read by a human against `eval.py`) except
`Groth.certificate`, `Groth.matZ_eq`, `Groth.leftQ_eq`, `Groth.rightQ_eq`, which are kernel
computations.
-/
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Fin.VecNotation

namespace Groth

/-! ## The submission (`solution.json`), verbatim -/

/-- `"matrix"` -/
def matrix : List (List Int) := [[1, 1], [1, -1]]

/-- `"left_vectors"`; a coordinate is the pair `[numerator, denominator]` -/
def leftV : List (List (Int × Int)) := [[(4, 5), (3, 5)], [(-3, 5), (4, 5)]]

/-- `"right_vectors"` -/
def rightV : List (List (Int × Int)) := [[(28, 197), (195, 197)], [(195, 197), (-28, 197)]]

/-! ## Transcription of `eval.py` -/

/-- `_rational`: positive denominator, both entries bounded by 10^6, lowest terms -/
def canonB (p : Int × Int) : Bool :=
  decide (0 < p.2) && decide (p.2 ≤ 1000000) && decide (p.1.natAbs ≤ 1000000) &&
    (Nat.gcd p.1.natAbs p.2.natAbs == 1)

/-- the rational number `numerator / denominator` -/
def toQ (p : Int × Int) : ℚ := (p.1 : ℚ) / (p.2 : ℚ)

/-- exact dot product of two coordinate lists -/
def dotQ (a b : List ℚ) : ℚ := ((a.zip b).map (fun t => t.1 * t.2)).sum

/-- a submitted vector: canonical coordinates and squared Euclidean norm exactly one -/
def unitB (v : List (Int × Int)) : Bool :=
  v.all canonB && decide (dotQ (v.map toQ) (v.map toQ) = 1)

/-- `_parse_witness`: shape, entry and norm checks -/
def validB (A : List (List Int)) (L R : List (List (Int × Int))) : Bool :=
  let m := A.length
  let n := (A.headD []).length
  let d := (L.headD []).length
  decide (2 ≤ m ∧ m ≤ 8) && decide (2 ≤ n ∧ n ≤ 8) && A.all (fun r => r.length == n) &&
    A.all (fun r => r.all (fun e => e == 1 || e == -1)) &&
    (L.length == m) && (R.length == n) &&
    decide (2 ≤ d ∧ d ≤ 16) && (L ++ R).all (fun v => v.length == d) &&
    (L ++ R).all unitB

/-- sign of row `row` under the bit mask `mask` (`1 if (mask >> row) & 1 else -1`) -/
def sgn (mask row : Nat) : Int := if mask.testBit row then 1 else -1

/-- column sum `sum_row sgn * A[row][column]` -/
def colSum (A : List (List Int)) (mask col : Nat) : Int :=
  ((List.range A.length).map (fun r => sgn mask r * ((A.getD r []).getD col 0))).sum

/-- `_sign_optimum`: enumerate the left signs, each right sign has a closed form -/
def signOpt (A : List (List Int)) : Int :=
  ((List.range (2 ^ A.length)).map (fun mask =>
    ((List.range (A.headD []).length).map (fun c => ((colSum A mask c).natAbs : Int))).sum)).foldl
    max 0

/-- `_vector_objective` -/
def vectorObj (A : List (List Int)) (L R : List (List (Int × Int))) : ℚ :=
  ((List.range A.length).map (fun r =>
    ((List.range (A.headD []).length).map (fun c =>
      (((A.getD r []).getD c 0 : Int) : ℚ) *
        dotQ ((L.getD r []).map toQ) ((R.getD c []).map toQ))).sum)).sum

/-- Python `int.bit_length` of a natural number -/
def bitLen (n : Nat) : Nat := if n = 0 then 0 else Nat.log2 n + 1

/-- `_certificate_bits` (the bit length ignores the sign of the numerator) -/
def certBits (L R : List (List (Int × Int))) : Nat :=
  ((L ++ R).map (fun v => (v.map (fun p => bitLen p.1.natAbs + bitLen p.2.natAbs)).sum)).sum

/-- `ratio = objective / sign_optimum` -/
def ratio (A : List (List Int)) (L R : List (List (Int × Int))) : ℚ :=
  vectorObj A L R / (signOpt A : ℚ)

/-- metric `gap_ppm = int(ratio * 1_000_000)` (the ratio is positive, so `int` is the floor) -/
def gapPpm (A : List (List Int)) (L R : List (List (Int × Int))) : Int :=
  (ratio A L R * 1000000).floor

/-- metric `matrix_area` -/
def area (A : List (List Int)) : Nat := A.length * (A.headD []).length

/-! ## Kernel computation: the evaluator's values on the submission -/

/-- T1.  The submission is valid for the hill and the transcribed evaluator returns exactly the
values of the signed report: sign optimum 2, vector objective 2786/985, lower bound 1393/985,
gap_ppm 1414213, matrix_area 4, certificate_bits 80. -/
theorem certificate :
    validB matrix leftV rightV = true ∧ signOpt matrix = 2 ∧
    vectorObj matrix leftV rightV = 2786 / 985 ∧ 0 < vectorObj matrix leftV rightV ∧
    ratio matrix leftV rightV = 1393 / 985 ∧
    gapPpm matrix leftV rightV = 1414213 ∧ area matrix = 4 ∧ certBits leftV rightV = 80 := by
  decide +kernel

/-! ## The same data as functions on `Fin 2` (used by `GrothCert.Main`) -/

/-- matrix entry `(i, j)` read from the submitted list -/
def matZ (i j : Fin 2) : Int := (matrix.getD i []).getD j 0

/-- coordinate `k` of the left vector `i`, read from the submitted list -/
def leftQ (i k : Fin 2) : ℚ := toQ ((leftV.getD i []).getD k (0, 1))

/-- coordinate `k` of the right vector `j`, read from the submitted list -/
def rightQ (j k : Fin 2) : ℚ := toQ ((rightV.getD j []).getD k (0, 1))

theorem matZ_eq : ∀ i j : Fin 2, matZ i j = (![![1, 1], ![1, -1]] : Fin 2 → Fin 2 → Int) i j := by
  decide +kernel

theorem leftQ_eq : ∀ i k : Fin 2,
    leftQ i k = (![![4 / 5, 3 / 5], ![-3 / 5, 4 / 5]] : Fin 2 → Fin 2 → ℚ) i k := by
  decide +kernel

theorem rightQ_eq : ∀ j k : Fin 2,
    rightQ j k = (![![28 / 197, 195 / 197], ![195 / 197, -28 / 197]] : Fin 2 → Fin 2 → ℚ) j k := by
  decide +kernel

end Groth
