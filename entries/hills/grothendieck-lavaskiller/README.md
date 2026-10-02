# Grothendieck constant witnesses — result of @lavaskiller

## From the signed report and the leaderboard (read 2026-10-02T18:04Z (2026-10-03 03:04 KST))

| | |
|---|---|
| Hill | `alejandrozu/grothendieck-constant-witnesses` (https://app.autolab.ai/hills/alejandrozu/grothendieck-constant-witnesses), tree hash `14a20a4674b3262fd4b93e935da7f660afbd2c11` |
| Account / project | `lavaskiller` / `lavaskiller/grothendieck-constant-witnesses-htpeo` |
| Experiment | `2552e287` |
| Mode | validation (`final: false`), `official: true`, `passed: true` |
| Result | gap_ppm 1,414,213, matrix_area 4, certificate_bits 80 (report of 2026-10-02T17:31:54Z, 02:32 KST on 10-03) |
| Standing | tied for 1st, 7 of 9 accounts |

## What this is and is not

- A **known construction**: the CHSH matrix `[[1,1],[1,-1]]` with rotations from the Pythagorean triples 3-4-5 and 28-195-197. It reproduces the board's best value and is not claimed as new mathematics.
- Verification level: **computed** (the hill's evaluator). No Lean artifact.
- `code/search_bits.py` is an exhaustive search over rational unit vectors with denominator ≤ 65536; the helper session's notes say it shows that no 2x2 certificate with 79 bits or fewer reaches this gap. That claim was **not re-checked** and is not claimed here.

## Files

| File | Content |
|---|---|
| [`solution.json`](solution.json) | the witness exactly as evaluated |
| [`report.json`](report.json) | the signed hill report |
| [`NOTES.md`](NOTES.md) | the working notes of the session. Its board line refers to the earlier snapshot of 16:23Z |
| [`code/search_bits.py`](code/search_bits.py) | the bit-cost search, with its output [`search_65536_le79.json`](code/search_65536_le79.json) and [log](code/search_65536_le79.log) |

## Still to add

- [ ] `STATS.yaml` (template in `../../_TEMPLATE/STATS.yaml`)
