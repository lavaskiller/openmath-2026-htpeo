# Erdős problem #1038 — Lean solution package of @hl728 (not claimed by the team)

Worked on by @hl728 together with @n0rang2 (Sanghyeon Lee), as reported by @lavaskiller on 2026-10-03; the share of the work is not recorded here.

Added 2026-10-03 12:35 KST by @lavaskiller's session at the owner's request, in a hurry before the deadline; the owner could not upload it in time. Statements below are summarised from the package and from our partial rebuild; the owner's own description is pending.

## What the package is

- [`artifact/erdos1038-lean-20261001.zip`](artifact/erdos1038-lean-20261001.zip) (sha256 `c4eb54d3496bb654e54773801ac027b9360215018b83e29768e008c93194a502`), exactly as shared by @hl728: 315 Lean proof modules plus `Lean/Verify.lean` (Lean `v4.34.1`, Mathlib `d13f23b`, tag v4.34.1), with the informal paper `EP1038_paper.md`, `STATEMENT_CORRESPONDENCE.md`, `PROOF_GUIDE.md`, audits and third-party notices. Build: `sh scripts/build.sh` in the unpacked folder (needs network for the pinned dependencies).
- Main statements (`Lean/LeanProject/Submission.lean`), on the formal-conjectures statement of problem 1038 (`reference_statements/DeepMind_1038.lean` is byte-identical to formal-conjectures `ErdosProblems/1038.lean` at df3f12d): the infimum of |{x : |f(x)| < 1}| over non-constant monic real polynomials with all roots in [−1, 1] equals an explicit constant `Dval` (1.8344304757 ≤ Dval < 1.8344304757628) and is not attained; the supremum equals 2√2; plus the formal-conjectures variants `inf_upperBound` (< 1.835) and `inf_lowerBound` (≥ 2^{4/3} − 1). `Dval` is defined as an infimum over a one-parameter family (an explicit logarithmic potential), not as the polynomial infimum itself. The package's own log (Lean 4.34.1) records a full build with standard axioms; no `sorry`, `axiom`, `native_decide` in the sources (our scan).

## Relation to earlier work (why it is not claimed)

- A formal proof of the same result was public before: plby/lean-proofs at commit 8822f7d (2026-09-15), `src/latest/ErdosProblems/Erdos1038.lean`, imported from Shouqiao Wang's proof claim (informal proof with GPT-5.6 Sol, Lean by GPT; erdosproblems.com/forum/thread/1038, proof claim #8). Same constant (1.834430475762661 < L < 1.834430475762662).
- The owner's account (team Discord, 2026-10-03 11:51–11:55 KST): the solution was written after reading that paper; the proof idea and overall structure are the same, the implementation (the Lean development) differs. The owner's write-up of the exact differences is pending.
- So this is at most a second, independently implemented formalization of a known result. The team does not claim it as new and does not count it in the M2 entry.

## Our partial rebuild (Lean 4.33.1, team server)

Files: [`artifact/rebuild_lean_4.33.1/`](artifact/rebuild_lean_4.33.1/). Only Lean 4.33.1 + Mathlib v4.33.1 were available, so the package was compiled module by module after mechanical compatibility edits that change no statement (`compat.py`, `compat_manual.py`, full diff `compat.diff`: `ite_eq_left/right` → `if_pos/if_neg`; closing instance-equality side goals after `convert`; one extra Mathlib import in three modules).

- Rebuilt and axiom-checked (`VerifyBridge.log`, `VerifyStage9.log`; `[propext, Classical.choice, Quot.sound]`): the 89 modules of the statement bridge, `erdos_1038.parts.ii` (supremum 2√2), `varaints.inf_lowerBound`, the admissibility / official-statement bridge lemmas, and `EP1038.Stage9.sharpness`.
- Not rebuilt: `parts.i` (exact infimum) and `inf_nonattainment` (module `COVArcBounds` exceeded the 4 GB per-process budget), `inf_upperBound` and `D_enclosure` (the DLowerM closure; the final run stopped with `DWidthDerivatives` failing under 4.33.1, `build_status_final.txt`). These are checked only by the owner's 4.34.1 log, not by us.
