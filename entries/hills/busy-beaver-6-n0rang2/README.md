# Submission packet: BB6 witness 249,881 (Lean 4 certificate)

Fields marked **TODO (entrant)** can only be filled in by the entrant. Everything else was checked against the files in this folder on 2026-10-03.

For a plain-language account of the search, the budget probes and the unfinished maximality attempt, see [`REPORT.md`](REPORT.md).

## 1. Identity and target

| Field | Value |
|---|---|
| Hill | AutoLab `alejandrozu/busy-beaver-6-certificates`, v0.1.0, tree `86931c1b2f99d69c7bb19598f36739670768fe95` |
| Autolab owner / climb | `n0rang2` / `n0rang2/bb6-certificates-submit` |
| Accepted experiment | `8297fb64-76d7-41fa-b6d4-5b6e24fc3d31` (`m249881`), status merged, validation split, evaluated 2026-09-28 15:54:07 UTC. The signed hill report is [`report.json`](report.json) |
| Submitted commit | `0dd67fa12a0e530cc0fcee66ea77234f27715fcd` (its `solution.json` has the same content as `solution.json` here) |
| Problem / family ID, modality | **TODO (entrant)** |
| Roster, class, affiliations, contributions | **TODO (entrant)** |
| Claimed completeness | Complete for the exact claim in §2. No claim is made that 249,881 is the maximum (see §5). |

## 2. Exact claim

The machine `0LE1LA_1LC1RH_1RA1RF_0RF0RD_1RD1LB_1LC1RD` (`solution.json`) is started in state A at cell 0 on an all-zero bi-infinite tape. Then:

1. it halts after exactly **249,881** steps (the transition into H counts as a step);
2. it reaches all six working states A–F before halting;
3. the head range over times 0..249,881 spans **735** cells;
4. **554** cells in that range hold 1, and every cell outside it holds 0;
5. for every budget B, the evaluator's `_run` accepts it iff 249,881 ≤ B.

Lean statement: `BB6.Certificate` and `BB6.Accepts` in `LeanProject/LeanProject/Witness249881.lean` and `Model.lean`.

## 3. Formal artifact

- Prover: core Lean 4 `leanprover/lean4:v4.34.1` (pinned in `LeanProject/lean-toolchain`). No Mathlib, no other dependencies (`lake-manifest.json` lists no packages).
- No `sorry`, `admit`, `native_decide`, `implemented_by`, `extern`, `unsafe` or `axiom` declarations. Kernel computations use `decide +kernel` only.
- Axioms: every main theorem depends only on `[propext, Quot.sound]`. `AxiomCheck.lean` prints them during the build.

Main declarations (namespace `BB6`):

| Declaration | File | What it proves |
|---|---|---|
| `bb6_certificate`, `bb6_accepts` | `Direct.lean` | §2, by kernel evaluation of the 249,880-step run |
| `bb6_certificate_structural`, `bb6_accepts_structural` | `Structural.lean` | §2, from sweep rules proved for every block count k |
| `bb6_certificate_counter`, `bb6_accepts_counter` | `Counter.lean` | §2, from the base-3 counter law for arbitrary counter states |
| `bb6_certificate_phase` | `Phase.lean` | §2, from the closed-form cycle law (20 phases) |
| `Counter.halting_family` | `Phase.lean` | exact first halting time `Tfam ms` from start configuration `zfam ms`, for every run list `ms` |
| `Counter.big_halting` | `Phase.lean` | a family member that halts at step 317,933,687,064,137,791,756,643,725,923 |
| `Counter.blank_hits_family` | `Phase.lean` | the blank run reaches `zfam [1,6,21,66]` at step 77,730, and 77,730 + 172,151 = 249,881 |

### Reproduce

```powershell
cd LeanProject
lake build
```

```powershell
python scripts/check.py solution.json 2000000
```

```powershell
cd scripts
python gen_witness_data.py 0LE1LA_1LC1RH_1RA1RF_0RF0RD_1RD1LB_1LC1RD 249880 249881 ../LeanProject/LeanProject/WitnessData.lean
```

Results actually obtained from this folder on 2026-10-03 (Windows 11, Lean 4.34.1, Python 3.10):

- `lake build` from a clean copy (no `.lake`): `Build completed successfully (13 jobs)`, exit 0, 189 s (run 10:31 KST; log in `LeanProject/logs/build.log`). Every `#print axioms` line reports `[propext, Quot.sound]`, `[propext]` or no axioms.
- `check.py`: `halted: true, steps: 249881, ones: 554, tape_span_incl_final_move: 735, all_states_visited: true`.
- `gen_witness_data.py`: the regenerated `WitnessData.lean` is byte-identical to the shipped file. This file is hint data only; wrong data would make the Lean checks fail, not pass.

### Statement correspondence

`Model.lean` restates the public `eval.py` semantics: start state A at head 0 on a zero tape; each step writes, moves and changes state; the transition into H also writes and moves and is counted; `tape_span` is the head range including the final move. Two parts stay in prose (`proof.md`, "Definitions and assumptions used"): JSON loading of `solution.json` and the evaluator's range check 10 ≤ B ≤ 2,000,000.

## 4. Derivation

`proof.md` contains the mathematical proof of each Lean route: Stage 4 (zipper simulation lemmas), Stage 5 (sweep rules), Stage 6 (counter law), and Stage 7 (cycle law and halting family). The `search/…` analysis scripts that `proof.md` mentions are empirical cross-checks only. They are not part of the proof and are not included here; `scripts/search/` holds only the search programs.

## 5. Provenance and limits

- **Prior identical result.** The AutoLab validation board lists an entry with identical metrics (249,881 / 554 / 735) by `eychcue`, dated 2026-09-21, before the event opened. This machine was found independently on 2026-09-28 by our own search, but the 249,881 lower bound itself was already public. The new contribution made during the event is the Lean formalization (all four certificate routes, the counter law, and the infinite halting family).
- **Not claimed.** That 249,881 is the largest halting time under the hill budget. A computer-assisted attempt (REPORT.md §5) excluded 31 of 32 structural classes, but it was stopped on 2026-10-03 at 09:54 KST with 634 + 113 subtrees still open. It is not in Lean, has not been reviewed by a person, and is not part of this submission. Its status files are in `evidence/maximality/`.
- **Budget facts (platform results).** Validation budget: 249,881 ≤ B_val < 250,258 (experiment `10b5bbca`, 250,258 steps, rejected). The test split has not been evaluated for this machine.
- **AI/tool disclosure.** Search, proofs, Lean code and reviews were produced with Claude (Anthropic) in Claude Code. Other tools: Lean 4.34.1, Python 3.10, Node.js, gcc (WSL). Compute: one local Windows PC. Autolab cost: $0.20 as of 2026-09-29 01:05 KST (later submissions not re-checked). Per the workspace records, OpenAI Codex ran the maximality attempt (C#, CUDA on one GPU). Its status files are included as evidence only and carry no claim. **TODO (entrant):** confirm this list, list what the humans checked themselves, and add other models or outside help, if any.
- **Publication authority.** **TODO (entrant):** attribution approval and permission to release under the competition terms.

## Files

| Path | Purpose |
|---|---|
| `REPORT.md` | Plain-language report: search, budget probes, maximality attempt |
| `solution.json` | Accepted hill submission |
| `LeanProject/` | Lean 4 package (source only; `lake build` creates `.lake/`); `logs/build.log` holds the clean build with `#print axioms` output |
| `proof.md` | Mathematical derivation |
| `scripts/check.py`, `scripts/verify_lines.py`, `scripts/firstuse.py` | Independent replay, batch replay, first-use times |
| `scripts/gen_witness_data.py`, `scripts/zipper_lit.py` | Generates `WitnessData.lean` |
| `scripts/search/` | Search code (`mfu.js`, `nbr.js`, `hunt.c`) |
| `evidence/search/` | 24 replayed witnesses; the rejected 250,258 and 255,799 submissions |
| `evidence/maximality/` | Status and audit files of the unfinished maximality attempt |
| `SHA256SUMS` | Checksums of every other file in this folder |

Files added earlier by the team (kept unchanged):

| Path | Purpose |
|---|---|
| `report.json` | Signed hill report of experiment `8297fb64`, recovered with `autolab logs 8297fb64` |
| `HILL.yaml`, `STATS.yaml` | Row text for the repository's hill table; AI-tool and resource disclosure |
| `code/` | Same search and replay sources as `scripts/` (`check.py`, `firstuse.py`, `mfu.js`, `nbr.js`, `hunt.c` are byte-identical), plus `cert.py` |
| `evidence/certificate.json`, `evidence/provenance.md`, `evidence/verification.json` | First-use data, provenance record, packaging-time checks |
| `lean/` | The same Lean sources ported to Lean 4.33.1 by the team server: `Compat.lean` adds `ite_eq_left`/`ite_eq_right`, imported by `Zipper.lean`. The root module `LeanProject.lean` and `lake-manifest.json` were missing, so `lake build` stopped with "some modules have bad imports"; both were added on 2026-10-03 from `LeanProject/`. Build logs: `lean/logs/build.log` (team server) and `lean/logs/build-v4.33.1-windows.log` (clean build after the fix: exit 0, 14 jobs, axioms `[propext, Quot.sound]`, `[propext]` or none). The original package, pinned to Lean 4.34.1 and needing no shim, is `LeanProject/` |
