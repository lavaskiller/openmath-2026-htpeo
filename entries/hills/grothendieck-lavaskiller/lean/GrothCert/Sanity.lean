/-
GrothCert.Sanity — the transcribed evaluator on other inputs: the README example (sign optimum 2,
objective 14/5, lower bound 7/5) and inputs the evaluator must reject.
-/
import GrothCert.Defs

namespace Groth

/-- the example of the hill README -/
def exL : List (List (Int × Int)) := [[(1, 1), (0, 1)], [(0, 1), (1, 1)]]
def exR : List (List (Int × Int)) := [[(3, 5), (4, 5)], [(3, 5), (-4, 5)]]

theorem readme_example :
    validB matrix exL exR = true ∧ signOpt matrix = 2 ∧ vectorObj matrix exL exR = 14 / 5 ∧
    ratio matrix exL exR = 7 / 5 ∧ gapPpm matrix exL exR = 1400000 ∧ certBits exL exR = 28 := by
  decide +kernel

/-- Python `bit_length` on a few values -/
theorem bitLen_values :
    [0, 1, 3, 4, 5, 28, 195, 197].map bitLen = [0, 1, 2, 3, 3, 5, 8, 8] := by decide +kernel

/-- sign optimum of other matrices: all-ones 2x3 is 6, a 3x3 example is 5 -/
theorem signOpt_values :
    signOpt [[1, 1, 1], [1, 1, 1]] = 6 ∧ signOpt [[1, 1, 1], [1, -1, 1], [1, 1, -1]] = 5 := by
  decide +kernel

/-- rejected: a vector that is not of norm one; a coordinate not in lowest terms; an entry 0 in the
matrix; a wrong number of vectors -/
theorem rejected :
    validB matrix [[(1, 1), (1, 1)], [(0, 1), (1, 1)]] exR = false ∧
    validB matrix [[(2, 2), (0, 1)], [(0, 1), (1, 1)]] exR = false ∧
    validB [[1, 0], [1, -1]] exL exR = false ∧
    validB matrix [[(1, 1), (0, 1)]] exR = false := by
  decide +kernel

end Groth

#print axioms Groth.readme_example
#print axioms Groth.rejected
