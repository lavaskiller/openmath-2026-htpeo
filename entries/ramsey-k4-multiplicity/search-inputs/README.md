# Inputs needed to re-run or extend the Ramsey search

The search code is in `../artifact/search/v2/` (current) and `../artifact/search/v1/` (2026-09-28/29).
These two input files were left out of the fixed artifact and are provided here so the search can be run:

| File | What it is | Used by |
|---|---|---|
| `seed_solution.json` | the 768-block Cayley seed supplied with the hill (`alejandrozu/clique-cluster-ramsey-multiplicity`) | `blocks.py`, `split*.py`, `cont.py` (expected as `seed/solution.json` next to the code on the search machine) |
| `aut_seed.json` | automorphism data of the seed computed by `../artifact/search/v1/autgroup.py` | `blocks.py`, `mk_soft.py` and the scripts that restrict flips to automorphism orbits |

Other inputs are already in the artifact: `soft*.npy` (the "soft" orbit pair lists) in `search/v2/`, the final solution `../artifact/solution.json`, and the hill evaluator `../artifact/hill/eval.py`.

## Starting points

- Best solution so far: `../artifact/solution.json` (density_ppt 30,139,933,996, 1024 blocks). To continue from it, see `cont.py` and `jobY.sh` (basin hopping: annealing phase, quench, L-BFGS weight refit). When the search stopped it was still improving by roughly 10k ppt per 20-minute cycle.
- Exact scoring of any candidate with the hill's own code: `python verify.py <file>`.
- Build the incremental evaluator: `gcc -O3 -march=native -shared -fPIC -o tabu.so tabu.c` (see the header of `tabu.c` / `core.py` for the exact flags used).
- What moved the bound and what did not: `../NOTES.md` and `../../../archive/findings/ramsey-search.md`. Not tried: other templates (smaller Cayley graphs, product constructions), other choices of which members to split.

The job scripts (`job*.sh`) contain paths of the machine the search ran on (`~/ramsey/...`); adjust them.
A changed solution needs a new Lean certificate (about 50 minutes on 6 cores): see `../artifact/lean/README.md`.
