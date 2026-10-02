# Busy Beaver 6 certificates — result of @n0rang2

Created from the leaderboard; the solution and the Lean certificate are in. **@n0rang2: please fill in the remaining blanks.**

## Known from the leaderboard (read 2026-10-02T16:23Z (2026-10-03 01:23 KST))

| | |
|---|---|
| Hill | `alejandrozu/busy-beaver-6-certificates` (https://app.autolab.ai/hills/alejandrozu/busy-beaver-6-certificates) |
| Account | `n0rang2` |
| Mode | validation |
| Standing | tied for 1st, 3 of 12 accounts (validation; the platform lists tied accounts alphabetically) |
| Result | 249,881 steps, 554 ones, tape span 735 (2026-09-28) — reproduces the board's best value; not claimed as new mathematics |

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

## To add (checklist)

- [x] `solution.json` (or the submitted directory) exactly as evaluated
- [ ] the hill report (`report.json`) of the evaluation — it carries the hill hash, the metrics and the signature
- [ ] AutoLab project name and experiment id: ____
- [ ] how the result was obtained (method, code if any — put code in `code/`): ____
- [ ] is this a known construction or something new? Source if known: ____
- [ ] for a final-mode (held-out) evaluation: the exact command or UI steps used, so the team can repeat it: ____
- [ ] AI tools used and rough resources (fill `STATS.yaml`, template in `../../_TEMPLATE/STATS.yaml`)
- [ ] date and time of the evaluation (with time zone): ____

When the files are in, update the row in [`../README.md`](../README.md) and, if the result should be listed on the landing page, add an `ENTRY.yaml` (template in `../../_TEMPLATE/`).
