# 3x3 matrix-multiplication tensor — result of @lavaskiller

## From the signed report (evaluated 2026-10-02T22:21:48Z = 2026-10-03 07:21 KST)

| | |
|---|---|
| Hill | `alejandrozu/matrix-multiplication-tensor-3x3` (https://app.autolab.ai/hills/alejandrozu/matrix-multiplication-tensor-3x3), tree hash `526770e74b465dbd444049d169e2f373eeb0339d` |
| Account / project | `lavaskiller` / `lavaskiller/matrix-multiplication-tensor-3x3-htpeo-b` |
| Experiment | `91a4874c` (merged) |
| Mode | validation (`final: false`), `official: true`, `passed: true` |
| Result | rank 23, support 139 |
| Standing | not the leading result: the leader has rank 23 with support 138. On the 2026-10-02T16:23Z snapshot six accounts had 23 / 139; the generated tables of the top-level README give the rank at their own snapshot time |

## What this is and is not

- A **known scheme**: `i41w163c235e-000` of the Heule–Kauers–Seidl database of rank-23 schemes (Heule, Kauers, Seidl, "New ways to multiply 3x3 matrices", arXiv:1905.10192), converted to the hill's format. Not new mathematics and not a leading score.
- The search for support 138 or less was negative. The session's notes describe exhaustive searches (changes of basis over {−1,0,1}, the flip-graph component of the 139 scheme, the 5,246 lowest-weight database schemes); those negative results were **not re-checked** independently and are not claimed as theorems.
- Verification level: **computed** (the hill's evaluator checks all 729 Brent identities exactly). There is no Lean artifact.

## Files

| File | Content |
|---|---|
| [`solution.json`](solution.json) | the factor matrices U, V, W exactly as evaluated |
| [`report.json`](report.json) | the signed hill report |
| [`NOTES.md`](NOTES.md) | working notes of the search session: provenance, what was tried for 138 or less |
| [`code/`](code/) | conversion from the database format (`txt2sol.py`, `hks_i41w163c235e.txt`), database fetch and check (`hks.py`), change-of-basis search (`sandopt.py`, `sand.h`), flip-graph enumeration (`bfs.c`, `bfs2.c`). The annealing programs are not included |
