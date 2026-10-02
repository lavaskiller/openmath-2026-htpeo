InflationA.lean compiles: explicit Petersen tables, local colour/richness checks, and a general kernel-checked star criterion.
InflationB.lean compiles: piece/inter edge constructors, endpoint formulas, and edge/vertex decomposition.
InflationC.lean compiles: full inflation star proof conditional on a base edge colouring and injective port-matching recolourings (`inflate_star5_of_matching`).
InflationD.lean compiles: each base edge has at most four neighbours, and a greedy induction gives a proper 5 edge colouring of H (`base_coloring_exists`).
InflationE.lean compiles so far: finite completion of three prescribed colours and explicit permutation extension by swaps.
InflationE.lean compiles fully: occupied-port targets, distinctness from looplessness and base properness, and a local matching permutation (`local_permutation`).
Inflation.lean compiles with rc=0 and proves the exact target theorem without sorry/admit. Inflation.axioms.log reports only [propext, Classical.choice, Quot.sound].
