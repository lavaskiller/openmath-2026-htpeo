# K4 Ramsey multiplicity: 1024-block weighted blow-up with a Lean 4 certificate

Result: the K4 Ramsey multiplicity constant c_4 (limit of the minimum density of monochromatic K4 in
2-edge-colourings of K_n) satisfies

    c_4 <= 200080655744752337972227066537 / 6638390640717004439491700265361  (~ 0.030139933996)
        <  10486266368 / 768^4                                                (~ 0.030142273432)

The right-hand value is the reference of the AutoLab hill `alejandrozu/clique-cluster-ramsey-multiplicity`
(McKay's graph, final note of arXiv:2206.04036v3). Hill metric of `solution.json`: `density_ppt = 30139933996`,
`reference_beaten = 1`.

Status: candidate. Machine-checked (Lean 4.33.1 + Mathlib v4.33.1, axioms `propext`, `Classical.choice`,
`Quot.sound`); no human has checked the proofs or the statement correspondence yet. Submission packet:
`ramsey_packet.md`.

## What is where

| path | content |
|---|---|
| `ramsey_packet.md` | OpenMath 2026 submission packet (handbook section 8 structure), with operator TODOs |
| `solution.json` | the submitted hill solution (schema `weighted-two-color-blowup-v1`, 1024 blocks, weight sum 50759309); sha256 `b0eae3d4...da441`; identical to `lean/solution.json` |
| `runs/report_1ab2354d.json` | signed official evaluator report of the hill (experiment 1ab2354d, 2026-10-02T11:38:08Z) |
| `runs/ledger_server.tsv` | exact re-scores of all candidate solutions found by the search on 2026-10-02 (server local time) |
| `hill/eval.py` | copy of the hill evaluator, for reference (hill tree d30eba780f9526ad4b8c3b6c57c96632cb5b0311). The hill's `README`, `LIFTING.md` and `private/` fixtures are not in this copy |
| `lean/` | the Lean project `RamseyCert`: `README.md` (statements, design, reproduction), `CERT_STATUS.md` (build record), `RamseyCert/` (2103 Lean sources, of which 7 static and the rest generated from `solution.json`), `tools/` (generator, build script, data checker), `logs/` (`#check` / `#print axioms` output), `build_status.txt`, `SHA256SUMS` (of the server copy) |
| `search/v2/` | search code of 2026-10-02 (compound-move simulated annealing / tabu on the soft orbits, block splitting, weight optimisation, basin hopping), job scripts, soft-pair lists (`*.npy`) |
| `search/v1/` | earlier search code of 2026-09-28/29 (local search, weight refinement, symmetric search) |
| `SHA256SUMS` | sha256 of every file in this repository except itself |

Not included: build products (`.lake`, `.olean`), search outputs and logs, the 768-vertex seed and its
automorphism data (`seed/solution.json`, `aut_seed.json` in the working tree; needed only to re-run the search,
not to verify the result).

## Verify

1. Hill metric (exact integer arithmetic, pure Python 3, about 2-3 minutes). The full `eval()` entry point
   needs the hill's private audit fixtures, so the same counting code is called directly:

   ```bash
   python3 -c "
   import sys, json; sys.path.insert(0, 'hill'); import eval as E
   d = json.load(open('solution.json')); w, r = E._validate(d)
   R, B, D = E._density(w, r); print(R, B, D, E._metrics(R, B, D))"
   ```

   Expected: `99809658758227271141703184848 100270996986525066830523881689 6638390640717004439491700265361`,
   `reference_beaten = 1`, `density_ppt = 30139933996`. (Re-run on 2026-10-02 from this directory: matches.)

2. Lean certificate (Lean `leanprover/lean4:v4.33.1` via elan, Mathlib `v4.33.1`; about 50 minutes on
   6 cores, up to 3.3 GB per `lean` process):

   ```bash
   cd lean
   lake exe cache get
   python3 tools/check_data.py solution.json RamseyCert/Data/Base.lean   # JSON -> Lean transcription check
   bash tools/build.sh . RamseyCert 6        # layered per-module build; add "noscope" as 6th argument without systemd
   grep -v "rc=0" build_status.txt           # only "layer"/"done" lines expected
   grep "depends on axioms" logs/RamseyCert.Main.log logs/RamseyCert.Final.log
   ```

   Optional: `python3 tools/gen.py solution.json .` regenerates all generated Lean files from the solution
   (needs numpy; deterministic). See `lean/README.md` for the theorem statements and the trust discussion.

3. Integrity: `sha256sum -c SHA256SUMS`.

## Caveats (see the packet for details)

* The certificate was built module by module with `tools/build.sh`; a single full-size `lake build` was not run.
* `lean/RamseyCert/Native.lean` uses `native_decide` and is only a cross-check; nothing in the main chain imports it.
* The correspondence `solution.json` -> `RamseyCert/Data/Base.lean` is a script transcription, checkable with
  `tools/check_data.py`.
