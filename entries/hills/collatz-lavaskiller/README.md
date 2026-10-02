# Collatz modular descent — result of @lavaskiller

## From the signed report (evaluated 2026-10-02T22:05:20Z = 2026-10-03 07:05 KST)

| | |
|---|---|
| Hill | `alejandrozu/collatz-modular-descent` (https://app.autolab.ai/hills/alejandrozu/collatz-modular-descent), tree hash `7414e19511b2b99954a3898beed545401b79a571` |
| Account / project | `lavaskiller` / `lavaskiller/collatz-modular-descent-htpeo` |
| Experiment | `dc5813da` (merged) |
| Mode | validation (`final: false`), `official: true`, `passed: true` |
| Result | coverage_ppm 1,000,000, min_descent_ppm 525,390, rule_count 234 |
| Standing | not a leading result: the first two metrics equal the board's best, the rule count (lower is better) does not — the leaders use 3 rules. On the 2026-10-02T16:23Z snapshot this would be 5th; the generated tables of the top-level README give the rank at their own snapshot time |

## What this is and is not

- A **known kind of certificate** (accelerated-Collatz residue descent rules); nothing new mathematically, and not a leading score.
- The 234 rules do not depend on the hidden targets: by the session's notes they cover every coverable odd residue class mod 2^8..2^12 and give margin ≥ 269/512 wherever some valid rule does. That property was computed by the scripts in `code/`; it was **not re-checked** independently and is not claimed as a theorem.
- Verification level: **computed** (the hill's evaluator). There is no Lean artifact.

## Files

| File | Content |
|---|---|
| [`solution.json`](solution.json) | the 234 rules exactly as evaluated |
| [`report.json`](report.json) | the signed hill report |
| [`NOTES.md`](NOTES.md) | working notes of the search session (written before the evaluation; its "expected" score is the one obtained) |
| [`code/`](code/) | rule construction (`build_rules.py`), cover selection (`cover_rules.py`), subset probe (`probe.py`, not used) |
