# kobon-triangles, board n = 39

**Candidate** (`solution.json`): 39 lines, integer coefficients (|coef| <= 10^12), simple arrangement (no parallel lines, no triple points). **Submit with the hill parameter n = 39** (the hill's default n is 18; the n = 39 board is a separate comparison group).

**Metric** (hill's own `eval.eval(Path(dir), n=39)`, full evaluator, exact rational arithmetic, no private data needed): `passed: True`, **triangles = 471**.

**Board (2026-10-02T16:23Z), n = 39**: rohith18p 470, octavianboji 468. This candidate **beats the board: 1st alone**.

**How obtained**
1. Start: Furedi-Palasti arrangement for n = 39: line i joins the points P(a_i) and P(pi - 2 a_i) of the unit circle, a_i = (2i+1) pi / n (`fp.py gen 39 1`). Exactly 468 = n(n-3)/3 triangles (this is evidently the board's 468 entry).
2. Simulated annealing on the 78 real parameters (angle, offset of each line), objective = number of triangular faces, one line perturbed per move with a log-uniform step size, degeneracy guard (no two intersection points on a line closer than 1e-7, no near-parallel pair) so that the result is a robust simple arrangement (`kobon_sa.c`). 468 -> 469 -> 470 -> 471 in about three minutes on one core, in two independent runs; no further improvement in about 10 more minutes on three cores.
3. Rationalisation: (cos t, sin t, -d) * 10^12 rounded to integers, then exact recount with the hill evaluator (`fp.py check`): 471.

**Other things tried (all worse)**: deleting lines from the public perfect arrangements of Parpalak and Utkin (gallery ud1/kobon-solutions: n = 41 with 533, 42 with 553, 43 with 587): best 39-line sub-arrangement has 459 (exhaustive over all pairs for n = 41, greedy for 42 and 43) and annealing from it did not move; Furedi-Palasti for n = 40, 41, 42 with greedy deletions: 458, 448, 439.

**Known vs new**: upper bound floor(39*37/3) = 481 (Tamura). The OEIS A006066 comment table and the Parpalak-Utkin gallery have no entry for n = 39 (the gallery has perfect arrangements for 33, 35, 37, 41, 43, 45, none for 39); the classical general construction gives 468. I found no published arrangement with more than 468 for n = 39, so 471 appears to be a new lower bound K(39) >= 471 relative to what is public, but I did not do an exhaustive literature search (the board's 470 shows others get similar values by local search). Not a perfect arrangement; 10 below the upper bound.

**Files**: `solution.json`, `cand471/solution.json` (same), `fp.py`, `kobon_sa.c`, `kob_remove.py`.
