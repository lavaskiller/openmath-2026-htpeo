# Busy Beaver 6 certificates — result of @n0rang2

An independently found, exactly replayable 6-state, 2-symbol machine that halts after **249,881 steps**, with **554 ones** and **tape span 735**. This reproduces the validation board's best metric tuple; it is not claimed as new mathematics or as a maximum over all machines.

| Field | Value |
|---|---|
| Hill | [`alejandrozu/busy-beaver-6-certificates`](https://app.autolab.ai/hills/alejandrozu/busy-beaver-6-certificates) |
| Account | `n0rang2` |
| AutoLab project | `n0rang2/bb6-certificates-submit` |
| Experiment | `8297fb64-76d7-41fa-b6d4-5b6e24fc3d31` (`m249881`, merged) |
| Evaluation | validation; `official: true`, `passed: true`, `final: false` |
| Evaluation time | **2026-09-28 15:54:07 UTC = 2026-09-29 00:54:07 KST (UTC+09:00)** |
| Hill tree hash | `86931c1b2f99d69c7bb19598f36739670768fe95` |
| Standing | tied for 1st, 3 of 12 accounts, in the repository's 2026-10-03 03:04 KST snapshot |

The leaderboard's UTC date is September 28; the evaluation occurred on September 29 in Korea. The standing uses ties over all three metrics, not consecutive display numbers. See the [archived leaderboard](../../../archive/leaderboards/lb_busy-beaver-6-certificates.json).

## Completed checklist

- [x] [`solution.json`](solution.json) exactly as evaluated; matches the original submission Git blob `0dd67fa:solution.json` and the source certificate/submission copies byte for byte.
- [x] Original signed hill [`report.json`](report.json), recovered from `autolab logs 8297fb64`; includes hill hash, metrics, mode, timestamp and signature. The signature is preserved; no independent HMAC verification is claimed.
- [x] AutoLab project and experiment ID: listed above and in [`evidence/provenance.md`](evidence/provenance.md).
- [x] Method and code: max-first-use search plus neighbourhood exploration; sources in [`code/`](code/) and commands below.
- [x] Novelty/source: independently found, but reproduces eychcue's earlier 2026-09-21 leaderboard metric tuple; no new-mathematics claim. Equality up to state relabelling was not established.
- [x] Final-mode reproduction: **not applicable**; no final/held-out evaluation was performed for this entry. This is a validation report, not a final result.
- [x] AI tools and rough resources: [`STATS.yaml`](STATS.yaml), with unknown quantities marked as unrecorded rather than zero.
- [x] Evaluation date, time and time zone: signed report timestamp and UTC/KST conversion above.

The row in [`../README.md`](../README.md) and the generated English/Korean landing-page hill rows are updated. A separate `ENTRY.yaml` is not needed: the generator already lists this hill result from the archived leaderboard and signed report. This packet does not promote it to a full Lean entry.

## Method and prior result

```text
0LE1LA_1LC1RH_1RA1RF_0RF0RD_1RD1LB_1LC1RD
```

Start in A at cell 0 on an all-zero bi-infinite tape. Each transition writes, moves one cell and changes state. The transition into H counts as a step, and the final landing cell counts toward tape span. All six states A–F are reached; the final span is cells -7 through 727 inclusive.

[`code/mfu.js`](code/mfu.js) searches halt-free machines for a transition first used very late. Changing that entry to H preserves the preceding run: first use after T transitions yields a halt at T+1. Local single/double mutations optimize this time; [`code/nbr.js`](code/nbr.js) explores neighbours. Heuristic stopping rules mean this is not an exhaustive maximality proof.

Here B1 is first used after 249,880 transitions; replacing it with `[1, "R", "H"]` gives 249,881 steps. All other entries are first used by step 33. [`evidence/certificate.json`](evidence/certificate.json) records exact metrics and first-use times. [`code/hunt.c`](code/hunt.c) is the subsequent C search/checker, not the original discovery program.

The workspace records independent discovery on 2026-09-28 using the JS search. The [archived leaderboard](../../../archive/leaderboards/lb_busy-beaver-6-certificates.json) shows eychcue with the same tuple at `2026-09-21T03:25:27Z`. Matching metrics do not establish identical transition tables. No literature novelty check or global maximality is claimed. See [provenance and resource evidence](evidence/provenance.md).

## Reproduce the exact result

From this entry directory, with Python 3 (standard library only):

```bash
python code/check.py solution.json 2000000
python code/firstuse.py solution.json
python code/cert.py solution.json replay-output
```

The first command must print:

```json
{"halted": true, "steps": 249881, "ones": 554, "tape_span_incl_final_move": 735, "all_states_visited": true, "visited": "ABCDEF"}
```

The generator also produces space-time PNGs. Its certificate should match the committed certificate as JSON. [`evidence/verification.json`](evidence/verification.json) records packaging-time checks.

For exploratory search (Node.js, no packages):

```bash
node code/mfu.js 60 1 240000 250000 262144 candidates.jsonl
node code/nbr.js 60 1 240000 250000 200000 249881 1000 candidates.jsonl neighbours.jsonl seeds.jsonl
```

These illustrate the original code; they do not guarantee rediscovery in 60 seconds. Workers use fresh random seeds, and the original discovery seed/invocation was not preserved. The replay commands are deterministic.

In an AutoLab checkout of `n0rang2/bb6-certificates-submit`, retrieve the original validation evidence with:

```bash
autolab logs 8297fb64
```

This reads an existing run. The recorded submission command was `autolab submit --name m249881`; the source log says the accepted submission was completed outside that agent's blocked attempt. No `--final` command is claimed.

## Lean certificate (added 2026-10-03 04:10 KST)

The Lean project sent by @n0rang2 (`LeanProject.zip`, sha256 `5542151549f2a0f7e205116ee2f9ae9554d8f86faf78b2166ff54788d2fe7171`) is in [`lean/`](lean/). It was built by @lavaskiller's session on the team server with Lean 4.33.1 (core only, no Mathlib): all 12 modules built, exit code 0, 47 s, log in [`lean/logs/build.log`](lean/logs/build.log).

- `BB6.bb6_certificate` ([`Direct.lean`](lean/LeanProject/Direct.lean), statement `Certificate` in [`Witness249881.lean`](lean/LeanProject/Witness249881.lean)): the machine halts after exactly 249,881 steps, reaches all six working states, the head positions span 735 cells, 554 cells of the span hold 1 and every cell outside holds 0.
- `BB6.bb6_accepts`: for every budget B, the machine is accepted with budget B if and only if 249,881 ≤ B.
- The same two statements are proved three more ways (`_structural`, `_counter`, `_phase`).
- Axioms reported by `#print axioms`: `propext`, `Quot.sound` (56 of the 65 audited statements; one uses `propext` only; eight use none). No `sorry`, `native_decide` or added axioms in the sources.

Limits:

- **One change was needed to build**: the sources use `ite_eq_left` / `ite_eq_right`, which Lean 4.33.1 does not provide. [`lean/LeanProject/Compat.lean`](lean/LeanProject/Compat.lean) defines them (two one-line lemmas from `if_pos` / `if_neg`) and `Zipper.lean` imports it. The toolchain the project was written with is not recorded: ____
- [`Model.lean`](lean/LeanProject/Model.lean) is a hand-written model of the hill's `eval.py`; the evaluator itself is not formalised. The model refers to a `proof.md`, which is not in this folder.
- **Maximality is not proved.** The validation budget is hidden (249,881 ≤ B ≤ 250,257 from accepted and rejected runs). A separate computation by @n0rang2's session reports that 31 of 32 structural classes contain no machine halting in 249,882–249,999 steps and that the last class was unfinished when stopped (20,322 open sub-ranges, no hit); that computation is not in this repository and is not Lean-checked.

## Verification scope

The official evaluator accepted the run, and the included independent Python replay checks its metrics. The server signature is retained verbatim; SHA-256 checks prove file identity/integrity, not HMAC authenticity.

The Lean proofs of the halting time, state coverage, span and ones count are in [`lean/`](lean/) (section "Lean certificate" above; added after this checklist was written). The unfinished maximality research in the source folder is outside this packet, and no maximality is claimed. Unknown AI usage and resource totals are disclosed in `STATS.yaml`.
