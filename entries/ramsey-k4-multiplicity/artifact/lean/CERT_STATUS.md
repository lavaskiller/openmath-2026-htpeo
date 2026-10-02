# CERT_STATUS — Lean certificate for the K4 Ramsey-multiplicity blow-up (helper-ramsey-cert)

Last update: 2026-10-02 12:35 UTC — **MAIN CERTIFICATE COMPLETE** (kernel-checked, standard axioms only).

## Result (project `~/ramsey/lean/final`, solution `~/ramsey/cand/best_30139933996.json`)

Solution file sha256 `b0eae3d46cf41d2db1a9623568cbbf64d333a522ead6c6cd2899f0c4ad1da441`, n = 1024 blocks,
total weight Q = 50759309, hill `density_ppt` = 30,139,933,996 (reference B* = 30,142,273,432).

Kernel-certified theorems (Lean 4.33.1 + Mathlib v4.33.1; exact statements in `README.md`):

| theorem | statement |
|---|---|
| `RamseyCert.sol_numer` | `sol.numer = 200080655744752337972227066537` |
| `RamseyCert.sol_total` | `sol.total = 50759309` |
| `RamseyCert.sol_density` | `sol.density = 200080655744752337972227066537 / 6638390640717004439491700265361` |
| `RamseyCert.sol_lt_ref` | `sol.density < 10486266368 / 768 ^ 4` |
| `RamseyCert.sol_ppt` | `⌈(10 ^ 12 : ℚ) * sol.density⌉ = 30139933996` |
| `RamseyCert.sol_symm` | `sol.Symmetric` |
| `RamseyCert.K4R`, `K4Bneg` | red numerator 99809658758227271141703184848, blue numerator 100270996986525066830523881689 |
| `RamseyCert.ramseyMultK4_le_density` | general: `T.Symmetric → 0 < T.total → ramseyMultK4 ≤ T.density` |
| `RamseyCert.ramseyMultK4_le_sol` | `ramseyMultK4 ≤ 200080655744752337972227066537 / 6638390640717004439491700265361` |
| `RamseyCert.ramseyMultK4_lt_ref` | `ramseyMultK4 < 10486266368 / 768 ^ 4` |
| `RamseyCert.ramseyMultK4_tendsto` | the sequence `minMonoK4 m / C(m,4)` converges to `ramseyMultK4` (monotonicity proved) |
| `RamseyCert.minMonoK4_density_le_sol` | `∀ m ≥ 4, minMonoK4 m / C(m,4) ≤ 200080655744752337972227066537 / 6638390640717004439491700265361` |
| `RamseyCert.ramseyMultK4_limit_lt_ref` | `∃ L, Tendsto (fun m => minMonoK4 m / C(m,4)) atTop (nhds L) ∧ L < 10486266368 / 768 ^ 4` |

`#print axioms` output (from `final/logs/RamseyCert.Main.log`, `RamseyCert.Final.log`; all statements with
`#check` in `final/logs/Summary.log`):
```
'RamseyCert.sol_density' depends on axioms: [propext, Classical.choice, Quot.sound]
'RamseyCert.sol_lt_ref' depends on axioms: [propext, Classical.choice, Quot.sound]
'RamseyCert.sol_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'RamseyCert.sol_ppt' depends on axioms: [propext, Classical.choice, Quot.sound]
'RamseyCert.ramseyMultK4_le_sol' depends on axioms: [propext, Classical.choice, Quot.sound]
'RamseyCert.ramseyMultK4_lt_ref' depends on axioms: [propext, Classical.choice, Quot.sound]
'RamseyCert.minMonoK4_density_le_sol' depends on axioms: [propext, Classical.choice, Quot.sound]
'RamseyCert.ramseyMultK4_limit_lt_ref' depends on axioms: [propext, Classical.choice, Quot.sound]
```
No `sorry`, no `native_decide`, no `axiom` anywhere in the import closure of `Main.lean` / `Final.lean`.

Cross-checks outside Lean:
* the red/blue numerators and the denominator equal the output of the hill evaluator's `_density`
  (`~/ramsey/v2/hill/eval.py`) on the same file; the density equals the ledger fraction; gcd of weights = 1;
* `tools/check_data.py` confirms that `RamseyCert/Data/Base.lean` transcribes `solution.json`.

## Build record (server htpeobigdata, 16 cores, 14 GB RAM)
* 11:18–11:20 UTC data layers; 11:19:45–12:07:26 the 2048 per-block kernel checks (two jobs of 3 `lean`
  processes each, 6 G cap per job): sum of per-file wall times 16762 s (4.7 CPU-hours), mean 8.2 s, max
  11.1 s per file, max RSS 3.30 GB per process (≈ 1.6 GB of it shared mapped `.olean`s);
  12:07:40–12:08:10 Glue (19 s each), Main (4 s), Limit (4 s), Final (3 s). Total wall time 50 minutes.
  12:24 rebuilt SymChk/Glue/Main/Final after adding `Mono.lean` and two corollaries to `Final.lean`.
* `final/build_status.txt` has one line per module (`rc=0 TIME .. MAXRSS ..`); no module failed.
* Scaling (same design, sub-templates on the first n blocks, 8 blocks per file for n < 1024):
  n = 64: 16 files, ≈ 2 s each (mostly start-up); n = 192: 48 files, 113 s in total, max RSS 2.2 GB;
  n = 1024: 2048 files, 16762 s in total. This is the expected cubic growth (the number of inner loop
  iterations is ≈ 2·n·|N(a)|² ≈ n³/2, each with one wide `Nat.land` + `Nat.mod`): (1024/192)³ ≈ 152 and
  16762/113 ≈ 148. Roughly 10–25 µs per inner iteration depending on machine load.
* Memory: the kernel keeps every intermediate numeral of a declaration alive (≈ 1.5 GB private for one
  (block, colour) theorem at n = 1024), and the process does not shrink between declarations (192 blocks in
  one file exceed 5 GB), which is why each block/colour is its own file at n = 1024.
* The first design (plain structural recursion, tests over all blocks, `import Mathlib` in every file) ran at
  ≈ 45 µs and 5.7 KB per iteration; raw `List.rec`/`Bool.rec` recursion, neighbour lists as numerals and
  slim imports gave the factor ≈ 4 and removed the 6 GB Mathlib mapping from the chunk files.

## Reproduce
```bash
cd ~/ramsey/lean/final            # or any copy containing tools/, lakefile.toml, lean-toolchain, lake-manifest.json
python3 tools/gen.py solution.json .        # regenerates Data/Chunk/Glue/Main/Final (deterministic)
python3 tools/check_data.py solution.json RamseyCert/Data/Base.lean
bash tools/build.sh . RamseyCert 6          # ≈ 50 min on 6 idle cores; resumable; per-process cap MEM=4G
grep -v "rc=0" build_status.txt             # only "layer"/"done" lines expected
grep "depends on axioms" logs/RamseyCert.Main.log logs/RamseyCert.Final.log
```
On the server the heavy layers were run as memory-capped jobs:
`cd ~/m_harness/harness && ~/.venvs/mh/bin/python -m danus.ops.jobs star6 ramseycert5 6G -- timeout 7100 /bin/bash /home/lead/ramsey/lean/tools/build.sh /home/lead/ramsey/lean/final RamseyCert 3 5 5 noscope`
(and `... 3 6 6 noscope`), then `MEM=5G bash tools/build.sh final RamseyCert 2 7 10`.
For a NEWER solution: new directory, copy `tools/`, the three lake files and
`RamseyCert/{Defs,Fast,Limit,Mono,Sym,SymDefs}.lean`, then the same commands (see `README.md`).

## What is only native / evaluated (NOT standard axioms)
* `RamseyCert/Native.lean`: `native_fastK_R/B : fastK 32 1024 W rowsR/B = <numerator>` by `native_decide`
  (axiom `…native_decide.ax…`, i.e. trust in the compiler). Independent cross-check of the packed data
  (it rebuilds everything from the row masks). PASSED for the final solution: 679 s, log
  `final/logs/RamseyCert.Native.log` (and earlier for the superseded solution, 1045 s).

## What the general lemmas cover / do not cover
* `colour_total`, `Template.numer_eq`, `K4_blue`, `fastK_eq` (`Fast.lean`): the packed evaluation equals the
  literal ordered-4-tuple specification, for every `n`, field width `B` and weights with `Σ w < 2^B − 1`.
* `blowup_count`, `minMonoK4_le`, `ramseyMultK4_le_density` (`Limit.lean`): for every symmetric template
  and every `t` there is a colouring of the complete graph on `t·Q` vertices with
  `24 · #monoK4 ≤ t^4 · numer`; hence `liminf_m min#monoK4(m)/C(m,4) ≤ numer/Q^4`.
* `minMonoK4_density_mono`, `ramseyMultK4_tendsto`, `minMonoK4_density_le` (`Mono.lean`): the minimum density
  is nondecreasing in `m ≥ 4` (vertex-deletion averaging), so the liminf in the definition of `ramseyMultK4`
  is a limit and bounds every finite term. Hence the bound is formal for the classical constant c_4, given
  the reading of the definitions `monoK4`/`minMonoK4`/`ramseyMultK4` (colourings are symmetric Boolean
  functions on `Fin m`; only pairs of distinct vertices are used).
* NOT modelled: the hill evaluator's fast routine and its JSON validation (only its literal oracle is the
  Lean specification; equality of the numbers was checked by running the evaluator).

## Where things are
* Server: `~/ramsey/lean/final/` (project, build products in `.lake/build`, logs in `logs/`),
  `~/ramsey/lean/tools/` (generator, build script, static Lean sources, GPT prompts),
  `~/ramsey/lean/t64/` (64-block end-to-end test), `~/ramsey/lean/stub/` (glue test with sorry stubs),
  `~/ramsey/lean/full/` (superseded solution best_30139948096: 1136/2048 chunks done, stopped; its native
  cross-check passed), GPT work dirs `~/erdos-fc/work/{ramseyfast,ramseylimit,ramseymono}/`.
* Laptop: `climbs\ramsey\lean\` (sources, tools, README, this file, key logs; no build products).

## Open items
* None for the certificate. All GPT sessions (`ramseyfast`, `ramseylimit`, `ramseymono`) finished with rc=0;
  no job of this helper is running.
* Operator: decide the packet wording (below), submit the hill solution (not done by this helper), and
  double-check the literature paragraph.

---

# Draft packet section (for the operator; nothing was submitted)

**Target.** Upper bound for the K4 Ramsey multiplicity constant c_4 (the limiting minimum density of
monochromatic K4 in 2-edge-colourings of K_m), hill `alejandrozu/clique-cluster-ramsey-multiplicity`
(protocol `k4-weighted-blowup-v1`, reference `10486266368/768^4`).

**Exact claim (formal).** `RamseyCert.ramseyMultK4_lt_ref : ramseyMultK4 < 10486266368 / 768 ^ 4` and
`RamseyCert.ramseyMultK4_le_sol : ramseyMultK4 ≤ 200080655744752337972227066537 / 6638390640717004439491700265361`
(≈ 0.030139933996), where `ramseyMultK4 = liminf_m (min over symmetric 2-colourings of K_m of
#monochromatic K4) / C(m,4)`; plus `RamseyCert.sol_density`, the exact value of the hill metric for the
submitted `solution.json` (`density_ppt = 30139933996`, theorem `sol_ppt`).

**Claimed completeness.** A new explicit upper bound (improved constant), not a determination of c_4.
The statement is fully formal, including existence of the limit (`ramseyMultK4_tendsto`,
`ramseyMultK4_limit_lt_ref`); the computation is a kernel-checked certificate, not `native_decide`.

**Literature status (to be double-checked by the operator).** Parczyk, Pokutta, Spiegel, Szabó, "New Ramsey
multiplicity bounds and search heuristics", arXiv:2206.04036: c_4 ≤ 0.03014 from a weighted blow-up found
by search (earlier: Thomason's constructions ≈ 0.0303); the hill's reference value
10486266368/768^4 ≈ 0.030142273432 is, according to the hill source, McKay's improvement recorded in the
final note of arXiv:2206.04036v3. Best leaderboard value known to us at the time of the search (second-hand
snapshot, 27 Sep): 30,141,720,824 ppt. Our value: 30,139,933,996 ppt, i.e. 2.34·10^-6 below the reference.

**Artifact.** Lean project `RamseyCert` (Lean 4.33.1, Mathlib v4.33.1): static `Defs.lean`,
`Fast.lean`, `Limit.lean`, `Mono.lean`, `Sym.lean`, `SymDefs.lean`; generated data and 2048 per-block kernel checks;
`tools/gen.py`, `tools/build.sh`, `tools/check_data.py`; `solution.json`. Axioms: `propext`,
`Classical.choice`, `Quot.sound`. Trust: Lean kernel (with its GMP natural-number arithmetic), Mathlib, and
the transcription `solution.json` → `Data/Base.lean` (checkable with `tools/check_data.py`).
Reproduction: see "Reproduce"; ≈ 50 minutes on 6 cores, ≤ 3.3 GB per process.

**Statement-correspondence note.** `Template.numer` is the hill evaluator's literal oracle (`_oracle`):
ordered 4-tuples of block indices with repetition, a repeated index uses the diagonal entry of `red_rows`,
weight product `w_a w_b w_c w_d`, counted when all six pairs are red or all six are blue; `density =
numer / (Σ w)^4`. The blow-up lemma (`blowup_count`) explains the metric: blocks of sizes `t·w_i`, colour
between vertices = colour of their blocks (diagonal colour inside a block), every monochromatic K4 yields
24 ordered monochromatic tuples, so `24·#K4 ≤ t^4·numer`.

**Provenance.** The solution was found by our search on 2026-10-02 (final best verified 11:12 UTC with the
hill's own evaluator code; search lineage and log: `~/ramsey/STATUS.md`, `~/ramsey/ledger.tsv`; structure:
192 base blocks × near-twin parts, 1024 blocks after splitting). The certificate design, generator and all
Lean files were written on 2026-10-02 between 09:10 and 12:30 UTC (within the event window). No pre-existing
Lean code was used apart from Mathlib.

**AI/tool disclosure.** Search: custom tabu / simulated-annealing code with L-BFGS weight optimisation
(helper agent). Certificate design, `Defs.lean`, `Sym.lean`, the generator, build tooling and documentation:
Claude (Anthropic, model Opus 5.5, via Claude Code agent). Proofs in `Fast.lean` and all of `Limit.lean` and `Mono.lean`
(statements prescribed by the Claude agent): GPT (`gpt-6-sol` via codex CLI, xhigh reasoning), three sessions of
< 1 hour each; the resulting files were recompiled independently and their statements checked to be the
prescribed ones. Compute: one 16-core server, ≈ 5 CPU-hours for the certificate. Humans: operator
supervision only; no human checked the proofs line by line (the Lean kernel did).
