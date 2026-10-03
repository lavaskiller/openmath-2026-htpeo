# CERT_STATUS — Lean certificate final2 (helper-ramsey3)

Last update: 2026-10-03 UTC — **MAIN CERTIFICATE COMPLETE** (kernel-checked, standard axioms only).
Built in `~/ramsey/lean/final2/`; `~/ramsey/lean/final/` (certificate of the submitted solution
30,139,933,996) was not modified.

## Result

Solution `solution.json` = server `~/ramsey/cand/r3_R3d_911990.json` (= `~/ramsey/out/R3d/best.json` at 22:40 UTC,
lineage Y1 -> R3d basin hopping), sha256 `b440786f6f03e517c4bb4fe37ae5bd225d619b4f1c713d00cb78692d53da09e2`,
n = 1024 blocks, total weight Q = 50762939.

Hill `density_ppt` = **30,139,911,990** (previous certified/submitted: 30,139,933,996; reference B* = 30,142,273,432).
Exact density 200137750014677779172692777477 / 6640289795261907019148161833841 (= numer / Q^4).
Verified with the hill's own evaluator code (`_validate`, `_density`, `_metrics`) twice: on the server
(`v2/verify.py`, ledger line `10-03 07:41 30139911990 beaten=1 ...`, 92 s) and on the laptop
(`climbs/ramsey/hill/eval.py`, 157 s). Red/blue numerators (Lean `K4R`, `K4Bneg`):
99839872478310077417039516880 + 100297877536367701755653260597.

Kernel-certified theorems (namespace `RamseyCert`; output of `logs/Summary.log`):

```
sol_numer   : sol.numer = 200137750014677779172692777477
sol_total   : sol.total = 50762939
sol_density : sol.density = 200137750014677779172692777477 / 6640289795261907019148161833841
sol_lt_ref  : sol.density < 10486266368 / 768 ^ 4
sol_ppt     : ⌈10 ^ 12 * sol.density⌉ = 30139911990
sol_symm    : sol.Symmetric
ramseyMultK4_le_sol : ramseyMultK4 ≤ 200137750014677779172692777477 / 6640289795261907019148161833841
ramseyMultK4_lt_ref : ramseyMultK4 < 10486266368 / 768 ^ 4
minMonoK4_density_le_sol : ∀ m, 4 ≤ m → (minMonoK4 m) / (m.choose 4) ≤ 200137750014677779172692777477 / 6640289795261907019148161833841
ramseyMultK4_limit_lt_ref : ∃ L, Tendsto (fun m => minMonoK4 m / m.choose 4) atTop (nhds L) ∧ L < 10486266368 / 768 ^ 4
```

`#print axioms` for all of them (logs `RamseyCert.Main.log`, `RamseyCert.Final.log`, `Summary.log`):
`[propext, Classical.choice, Quot.sound]`. No `sorry`, no `native_decide`, no `axiom` in the import closure
of `Main.lean` / `Final.lean` (grep; `Defs.lean` mentions native_decide only in a comment; `Native.lean` is
not imported by anything).

## What changed relative to `final/`

* `solution.json` (new candidate) and everything `tools/gen.py` generates from it: `RamseyCert/Data/*`,
  `Chunk/*` (2048 files), `GlueR/B.lean`, `Main.lean`, `Final.lean`, `Native.lean`, `values.json`
  (`SymChk*.lean`, `layers.txt` are byte-identical). Only the numerals in the theorem statements changed.
* Static sources `Defs, Fast, Limit, Mono, Sym, SymDefs, Summary` and `tools/` are byte-identical to `final/`
  (`tools/gen.py` also identical to `~/ramsey/lean/tools/gen.py`).
* `README.md`: copy of `final/README.md` with the numbers/hash replaced.

## Build record (server htpeobigdata, Ryzen 7 7700 8C/16T, 14 GB)

* Pipeline tested 22:09–22:13 UTC on the previous best (30139913504): gen, check_data, layers 1–4, Limit,
  Mono all rc=0 (that trial is archived in `r3_trial/`, not part of the certificate; static module oleans
  Defs/Fast/SymDefs/Sym/Limit/Mono from it were reused, their sources are unchanged).
* 22:41 `gen.py solution.json .` + `check_data.py` (OK). Job `mh-job-ramseyR3cert-224123-r0` (MemoryMax 8G):
  `build.sh . RamseyCert 2 1 6 noscope` (2 parallel `lean`), then `build.sh . RamseyCert 1 7 11 noscope`.
* Layers 3–4 22:41–22:44; Chunk R 22:44:07–23:46, Chunk B 23:46–00:41:36: 2048 files, all rc=0,
  sum of per-file times 14077 s, mean 6.9 s (first ~40 files 10–15 s while search workers still ran), max 14.6 s,
  max RSS 3.31 GB per process. Glue 14 s / 5 s, Main 3.7 s, Final 3.3 s (max RSS 7.5 GB, mostly mapped Mathlib),
  done 00:42:03 UTC. `build_status.txt`: every module rc=0; no stale `.olean` (each newer than its source).
* `Summary.lean` (lean directly, 3.1 s) -> `logs/Summary.log`.
* At most 2 of our `lean` processes at any time. (A separate team job, `mh-job-e3-1038g`, ran its own lean in
  `~/erdos1038` concurrently for a while; not ours, not touched.)

## Native cross-check (not part of the certificate)

`RamseyCert/Native.lean` (`native_fastK_R/B` by `native_decide`, rebuilds all packed data from the row masks):
PASSED, 673 s, 00:42–00:54 UTC, `logs/RamseyCert.Native.log` (axioms include `native_decide.ax`, as expected;
independent evidence only, nothing imports it).

## Reproduce

```bash
cd ~/ramsey/lean/final2
python3 tools/gen.py solution.json .
python3 tools/check_data.py solution.json RamseyCert/Data/Base.lean
bash tools/build.sh . RamseyCert 2      # ≈ 2 h with 2 lean processes on an idle machine
grep rc= build_status.txt | grep -v rc=0   # empty
lean RamseyCert/Summary.lean           # with LEAN_PATH from `lake env`
```
