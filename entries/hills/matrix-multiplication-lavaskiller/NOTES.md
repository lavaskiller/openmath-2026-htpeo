# matrix-multiplication-tensor-3x3

**Candidate** (`solution.json`, same as `cand139/solution.json`): rank 23, **support 139**, ternary coefficients.
Verified with the hill's own `_load` and `_check_brent` (all 729 Brent identities, exact `Fraction` arithmetic; the private replay fixtures are absent locally, so the full `eval()` cannot run). Script: `txt2sol.py`.

**Board (2026-10-02T16:23Z)**: leader 23 / 138 (one account), six accounts at 23 / 139, baseline Laderman 153.
This candidate **ties the 139 group (rank 2-7), below the leader**. No scheme with support <= 138 was found.

**Provenance (known, not new)**: scheme `i41w163c235e-000` (family 11a3b3d2j4n) of the Heule-Kauers-Seidl database of 17,376 rank-23 schemes (JKU Linz, http://www.algebra.uni-linz.ac.at/research/matrix-multiplication/ ; Heule, Kauers, Seidl, "New ways to multiply 3x3 matrices", arXiv:1905.10192). The database itself contains three schemes of support 139 (this one, `i41w163c367g-000`, and Smirnov's scheme in the `classic` family) and three of support 140; the database's weight w equals support + 24. So 139 is simply the minimum of the public database, which explains the six-way tie.

## What was tried for <= 138 (all negative)

Seeds: Laderman (153); Perminov's naive-addition-optimised scheme `3x3x3_m23_c88_ZT` (143); the public 139 scheme of another team; the 5,246 lowest-weight schemes of the HKS database (all with w <= ~210, fetched and Brent-checked: `hks.py`).

1. **Exhaustive sandwich optimisation** (`sandopt.py`, `sand.h`): U' = P U Q, V' = Q^-1 V R, W' = P^-T W R^-T over all invertible {-1,0,1} matrices modulo monomial factors (246 classes per side, 246^3 combinations via three pair tables), exact. All 139 schemes, the 140s and the 143 are already sandwich-minimal.
2. **Exhaustive flip-graph BFS** (`bfs.c`, canonical forms + hashing, complete enumeration):
   - ternary flips: the component of the 139 scheme is tiny (1 state at 139, 5 states up to 140, 3,600 states up to support 163) and contains nothing below 139;
   - coefficients up to 2: component complete up to support 169 (505,536 states), nothing below 139; coefficients up to 3, up to support 155 (684,232 states): nothing;
   - the same BFS from every one of the 5,246 database seeds (ternary, up to support 152) and from the 793 seeds with support <= 149 (coefficients up to 2, up to support 150): the flip components bottom out at 139, 141, 142, 143, 144, ...; none reaches 138. The 140 and 141 seeds fall into the same 139 well.
   - sandwich minimum of all 19,588 states of the 139 well (coefficients <= 2, support <= 151): minimum 139.
3. **One split ("plus") level, exhaustive** (`bfs2.c`): rank-24 states of support <= 144 reachable from the well (5,000,000 states expanded, state cap reached, about 10 million generated), with all reductions back to rank 23: 105 rank-23 states found, none below 139. The rank-24 level is far too large to finish.
4. **Stochastic search** (`flipsa*.c`): annealing on support with flips, group refactorings (terms sharing a factor refactored by unimodular 2x2 / 3x3 matrices), elementary sandwich moves, plus-excursions to rank 24 with Metropolis control and reductions, sandwich-minimum checks on low states; 6-9 cores for about two hours in total from the 139 / 140 / 143 seeds: best 139. (The excursion variant does cross wells: from the 143 well it reached 141 in 10 minutes.)

5. **Free walk at rank 24** (`walk24*.c`): Metropolis walk on rank-24 schemes started from random splits of the seed, evaluating at every accepted step all merge reductions and all "triangle" reductions (three terms sharing a factor with Y_m = +-Y_a +- Y_b). Observation: rank-24 schemes are much sparser (support down to 125 within seconds), but in that low-support region no reducible configuration was met; reductions only occurred close to the starting split. An energy term pulling towards reducibility (Hamming defect of the closest almost-mergeable pair) did not change that in short runs.

So within the flip graph, 138 needs at least one rank-24 excursion that an exhaustive search of five million rank-24 states did not find; the leader's 138 presumably comes from a long flip-graph run with plus transitions.

## Files
`solution.json`, `cand139/`, `seeds/` (text format: `R support`, then R lines of 27 integers u|v|w in the hill's coordinates), `sandopt.py`, `sand.h`, `sandscan.c`, `sandscan2.c`, `bfs.c`, `bfs2.c`, `flipsa.c` ... `flipsa7.c`, `hks.py`, `txt2sol.py`. Server working directory: `htpeo_ops:~/hills/mm/`.
