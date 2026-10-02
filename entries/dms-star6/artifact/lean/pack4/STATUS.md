# pack4 STATUS (helper-snark-lean) — times UTC, 2026-10-02

| Time | Milestone |
|---|---|
| 13:07 | `BlockStar.lean` (generic window criterion `star_of_windows`) compiles |
| 13:10 | **(A)** `FlowerSnark.flower_star` (all odd n ≥ 5, 5 colours) |
| 13:12 | **(B)** `GoldbergSnark.goldberg_star` (all odd k ≥ 5, 5 colours) |
| 13:14 | **(C)** `GPetersen2.gp2_star`, `gp2_spokes` (GP(k,2), all k ≥ 5, 6 colours, spokes = colour class) |
| 13:17 | `GPFive`: GP(n,2), n ≥ 5 and GP(n,3), n ≥ 7, 5 colours (facts 2f8113cb, cab27123) |
| 13:22 | `BlockProps`, `Families`: Loopless, Subcubic, Colourable 5/6, `DMSfor`, `StarFamily` |
| 13:25 | `GPPeriodic`: GP(10m,4), GP(14m,6), GP(17m,8), GP(22m,10), GP(26m,12), GP(30m,14) |
| 13:28 | GPT session `erdos-inflate` launched for `Inflation.inflate_star5` (statement fixed in `InflationDefs`) |
| 13:31 | `GPn4`: GP(n,4), all n ≥ 9 (new colouring by SAT search); then k = 5, 6, 7 |
| 13:38 | INCIDENT (handled): the single-`decide` version of `GPn8` hit the 6 GB cap and swap; job stopped by hand after 4 min. Since then: checker optimised (`Wir.jumps`), window checks split into chunk modules, `c.sh` kills the compiler above 3.5 GB private memory |
| 13:53 | `sanity_check.py`: Lean's edge lists of J5, J7, G5 (later M5) = textbook lists; snarks; colourings re-checked by brute force |
| 13:56 | GPT delivered `Inflation.inflate_star5` (**(D)**, Petersen special case); statement unchanged, verified here |
| 13:56 | `Mobius`: Möbius ladders M_n, all n ≥ 4 |
| 14:13 | **Final full build** (`build_all.sh`): 125/125 modules rc=0, `axioms.log` 33 lines, all standard axioms |

## Current state: COMPLETE
- Proved (all `[propext, Classical.choice, Quot.sound]`, no sorry / axiom / native_decide): A flower snarks (odd n ≥ 5),
  B Goldberg snarks (odd k ≥ 5), C GP(k,2) spokes (k ≥ 5), D1 GP(n,2) (n ≥ 5), D2 GP(n,3) (n ≥ 7), D3 six periodic GP
  families (m ≥ 1), E GP(n,k) for 1 ≤ k ≤ 15 and all n ≥ 2k+1 except GP(3,1) (`gp_star5`), F Petersen-type inflation
  of every loopless multigraph with injective ports (`Inflation.inflate_star5`), G Möbius ladders (n ≥ 4).
- Not done: the general form of the inflation fact (arbitrary all-good pieces); "simple"/"cubic" and a `SimpleGraph`
  isomorphism for the families; GP(n,k) for k ≥ 16 (the search with the tried periods found nothing for k = 16);
  a lake project (the build is `c.sh`/`build_all.sh` on top of pack3's oleans).
- Files: README.md (statements, definitions, reproduce, provenance, novelty), axioms.log, build/summary.txt, SHA256SUMS.
