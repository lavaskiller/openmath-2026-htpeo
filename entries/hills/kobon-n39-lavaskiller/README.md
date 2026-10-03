# Kobon triangles, board n = 39 — result of @lavaskiller

## From the signed report and the leaderboard (read 2026-10-02T18:04Z (2026-10-03 03:04 KST))

| | |
|---|---|
| Hill | `alejandrozu/kobon-triangles` (https://app.autolab.ai/hills/alejandrozu/kobon-triangles), tree hash `7d3f1d91dcb8be8d0eef20be763557bd6d876707` |
| Board | n = 39 (the hill's default is n = 18; n = 39 is a separate comparison group) |
| Account / project | `lavaskiller` / `lavaskiller/kobon-triangles-n39-htpeo` |
| Experiment | `38b81af6` (merged), evaluated with the hill parameter n = 39 |
| Mode | validation (`final: false`), `official: true`, `passed: true` |
| Result | **471 triangles** with 39 lines (report of 2026-10-02T17:58:19Z, 02:58 KST on 10-03) |
| Standing | 1st of 3 on the n = 39 board, alone (471; the other two accounts have 470 and 468) |

## What this is and is not

- 471 is above the 468 = n(n−3)/3 of the classical Füredi–Palásti arrangement, from which the search started. The upper bound is ⌊39·37/3⌋ = 481, so this is not a perfect arrangement.
- **Possibly a new best known value** for 39 lines: no arrangement with more than 468 was found in OEIS A006066 or in the Parpalak–Utkin gallery. That literature check was done by an AI helper, is not exhaustive and is **not human-verified**. The board's 470 shows that others reach similar values by local search.
- Verification level: **Lean-checked** (Lean 4.33.1 + Mathlib v4.33.1, standard axioms only). `Kobon.kobon_nonoverlapping` in [`lean/KobonCert/Main.lean`](lean/KobonCert/Main.lean) states that there are 39 pairwise distinct lines and 471 index triples, each bounding a nondegenerate triangle whose open interior meets none of the 39 lines, with the 471 open triangles pairwise disjoint. `Kobon.certificate` checks that the count and the face list equal those of the signed report.
- Not proved: the hill's `eval.py` is transcribed by hand, not formalised; K(39) as a maximum is not formalised (the certificate is an existence statement); no external checker was run. The full list is in [`lean/CERT_STATUS.md`](lean/CERT_STATUS.md).
- A search for more triangles was still running when this folder was written; the entry may be superseded.

## Files

| File | Content |
|---|---|
| [`solution.json`](solution.json) | the 39 lines with integer coefficients, exactly as evaluated |
| [`report.json`](report.json) | the signed hill report (hill hash, metric, mode, signature) |
| [`NOTES.md`](NOTES.md) | the working notes of the search session: method, what else was tried, known vs new. Its board lines refer to the earlier snapshot of 16:23Z |
| [`lean/`](lean/) | Lean certificate project: sources, build logs with `#print axioms`, generator and data check, `SHA256SUMS` |
| [`code/fp.py`](code/fp.py) | Füredi–Palásti generator and exact recount with the hill evaluator |
| [`code/kobon_sa.c`](code/kobon_sa.c) | simulated annealing on the 78 line parameters |
| [`code/kob_remove.py`](code/kob_remove.py) | line-deletion experiments on public arrangements (worse; see the notes) |

## Still to add

- [x] `STATS.yaml` (AI tools and resources used; template in `../../_TEMPLATE/STATS.yaml`)
- [x] a human check of the literature statement: **not done** — no team member checked the literature before the deadline; the statement "possibly a new best known value" rests only on an AI helper's search (OEIS A006066, Parpalak–Utkin gallery) and is not claimed
