# dms-star6 — Process notes

Written by: helper-team-repo (Claude Code agent), 2026-10-03 KST. Not human-reviewed. Sources are `PACKET.md`, `artifact/README.md`, `artifact/lean/pack*/README.md` and `STATUS.md`, `artifact/informal/*_REPORT.md`, and the project operations records (PLAN.md, manually kept log). The investigation of the c4c core is separately in `archive/findings/dms-c4c-core.md`.

**The conjecture has not been proved.** What has been confirmed in Lean are special cases, small sizes, equivalent restatements, and theorems of the form "named open hypothesis ⇒ conjecture".

## Contents of this folder

- `PACKET.md`: `star6_packet_final.md` as is (identical to the copy in the original repository, by `cmp`).
- `artifact/`: the 672 tracked files copied with `git archive` from commit `0240e123d187ea3d86e0a3a675a4ae6346e0929c` of the local repository `star6_artifact` (21.1 MB). `sha256sum -c SHA256SUMS`: all 671 OK (2026-10-03).
- Inner lists: `lean/pack4/SHA256SUMS` 311 OK, `lean/pack5/SHA256SUMS` 6 OK. `lean/pack3/SHA256SUMS` is a list written relative to `lean/pack3/src/`, so it must be run inside `src/`, and when run that way 100 are OK (run from `pack3/`, everything is reported as failed).

## What worked

- **Lean kernel-checked**: The reduction chain (98 modules, `RH2F.layer37`). Following 2-edge cuts, 3-edge cuts, and digon removal, it descends to hypotheses about cyclically 4-edge-connected simple cubic graphs. The finite base (10 to 16 vertices) is checked by `decide +kernel` on generated tables. Source: `PACKET.md` §1.4, §2.5.
- **Lean kernel-checked**: Infinite families (flower snarks, Goldberg snarks, GP(n,k) with k ≤ 15, Möbius ladders, Petersen-type inflations). "Periodic part + seam" colorings and a finite window check (`BlockStar.star_of_windows`). The colorings of GP(n,k) and the Möbius ladders were found by SAT search and have no informal proof. Source: `PACKET.md` §1.2, §2.5.
- **Lean kernel-checked**: `bounded_reduction`, which reruns the induction of the chain with the hypotheses restricted to size at most N, yielded the theorem for at most 14 vertices and the equivalence `dms_iff_cubic16`. Source: `PACKET.md` §1.3.
- Port from Lean 4.20 to 4.33.1: fixes at 15 places in the proofs of 8 modules, plus compatibility options. A script confirmed that the 6,124 declaration headers did not change (**computed**). The build of the same 98 modules went down from 4,248 seconds and 6.3 GB (4.20) to 1,422 seconds and 3.2 GB (4.33.1). Source: `artifact/lean/pack3/README.md`, `pack2/README.md`.
- Harness operation: workers (Claude, later 3 GPT workers added) produce facts, which are accepted by an LLM verifier, a cross-audit by a different model family (GPT), and a Lean gate. Of 786 facts, 732 passed the verifier + GPT audit, and 141 of those also passed the Lean 4.20 gate (**AI-checked**, partly Lean). The GPT audit returned "correct" 627 times, "wrong" 37 times, and "error" 10 times. Source: `PACKET.md` §3.1.

## What did not work

- All five pieces (P18, P16, P14, P23, P19) stopped at the infinite statement of the c4c core. Source: `archive/findings/dms-c4c-core.md`.
- Fixed-radius local repair: at radius 2 all 8 shapes, and at radius 3 6 of the 8, were refuted by explicit graphs (n = 258 to 574) (**computed**, run once). Source: `artifact/informal/c4c-ball_REPORT.md`.
- (FE-ALLPM-D) is refuted at 20 vertices, and TD-RED-POLE is false at threshold 10. Source: `artifact/informal/p16_REPORT.md`, `p23-pole_REPORT.md`.
- 49 refuted or abandoned approaches in the baseline record. Source: `PACKET.md` §3.3.
- The version that did the GP window check with a single `decide` hit the 6 GB cap and swap and was stopped manually (2026-10-02 13:38 UTC). The window check was split into piece modules. Source: `artifact/lean/pack4/STATUS.md`.
- The weekly usage of the server's Claude account reached 99% on 2026-10-01, and the 4 Claude workers were halted from 15:49 until the deadline. Source: PLAN.md (manually kept log).

## Summary of verification levels

- Lean kernel-checked: the theorems of `PACKET.md` §1.2 to 1.4.
- Computed (script run once, no independent rerun): the exhaustive checks and counterexamples of `PACKET.md` §3.2 to 3.3.
- AI-checked: the informal lemmas of the fact graph, the literature survey (`artifact/docs/NOVELTY.md`).
- Human-reviewed: the team reports that the claimed statements and the statement-correspondence notes of the packet were reviewed by a human team member (details in `TEAM.md`); the informal material was not reviewed by a human.

## Points to check before publication

- The build logs and documents inside `artifact/` contain the server's home directory path (disclosed in packet §4.4). This is not secret information.
- The paper draft in `artifact/paper/` is in its 2026-09-30 state and has parts that do not match the packet (packet §3.4).

## For the operator to fill in

- Submission ID, public commit and tag, person in charge, baseline commit, human review record, human time.
- Server-side usage and compute time: the procedures in `archive/stats/server-harness.yaml` and `server-codex.yaml`.
