# erdos-m2-formalizations — Process notes

Written by: helper-team-repo (Claude Code agent), 2026-10-03 KST. Not human-reviewed. Sources are `PACKET.md`, `artifact/README.md`, `artifact/VERIFY.md`, `artifact/PRIOR_ART_FINAL.tsv`, and the project operations records (PLAN.md, hand-written notes).

## Contents of this folder

- `PACKET.md`: the packet FINAL DRAFT v2 (`erdos_m2_packet_final_v2.md`, the version written 2026-10-02T15:06Z) as is. It replaces v1 (`erdos_m2_packet_final.md`).
- `artifact/`: the 67 tracked files of the local repository `erdos_m2_artifact`, copied **exactly in their working-folder state** (0.6 MB). At the time of copying (around 2026-10-03 00:30 KST) the HEAD of that repository was `9b341528c6ea83a7199bf45051ac1db483f9ee13`, and 4 files (`PACKET_FINAL_v2.md`, `PRIOR_ART_FINAL.tsv`, `scripts/make_final_v2.py`, `scripts/mk_final_v2.py`) had uncommitted final modifications. The modified versions are the ones included here (`artifact/PACKET_FINAL_v2.md` and `PACKET.md` are identical, checked with `cmp`).
- `artifact/SHA256SUMS`: the original repository had no top-level list, so this one was **newly made in this repository** with `tools/make_checksums.sh write` (67 files). The `bundle/SHA256SUMS` (15 OK) and `bundle_optional/SHA256SUMS` (5 OK) that were in the original pass as they are.

## Scope of claims

- Claimed: 13 bundles = 9 substantive (G-PM, E942, E44, E123, E918, E292, E395, E698, E939) + 4 trivial / sanity-check ones (E295, E703, E748, E1136; whether to include them is a team decision). 19 theorems.
- Not claimed (optional): E757, E261, E36, E649, E508 — no formal proof of the FC statement was found, but the same mathematics has already been publicly formalized under a different definition (`artifact/bundle_optional/`).
- The main statement of each problem (mostly open problems) is not claimed.

## What worked

- GPT (codex, unattended sessions) filled in only the `sorry` of the target theorem in the formal-conjectures file, and `verify_all.py`, written by Claude, checked (1) that the statement is character-for-character identical to that of the pinned commit, (2) that the only line removed in the whole-file diff is the target's `sorry`, (3) that the axioms are the standard three, and (4) that there are no forbidden tokens. **Lean kernel-checked** + **computed** (script). Source: `PACKET.md` §6.
- In the first round of assignments, 3 GPT sessions finished 12 theorems in about 10 minutes. Source: PLAN.md (hand-written record, 2026-10-02 08:25 to 08:38 KST).
- G-PM (Schönberger, Petersen connected case): the multigraph theorem of the star6 library carried over into the Mathlib `SimpleGraph` vocabulary (115 lines, written by GPT, statement fixed in advance). No prior formal proof was found in the Lean ecosystem (an **AI-checked** survey). Source: `PACKET.md` §1.1.

## What did not work

- Most of the easy targets were duplicates that already had public formal proofs. The exclusion list is `PACKET.md` §4 (31 rows of duplicates and rejections). Of the 8 "advanced" results of 2026-10-02, only E942 was new (`PACKET.md` §0).
- Error in v1: E649 (`sampaio`) was called a new formalization, but it already existed in plby/lean-proofs. In v2 it was moved to the optional bundle (`PACKET.md` §0, §7.7).
- E1136 `mueller`: the file produced by the session was about 370 lines of code transcribed from a public repository, so it was excluded as a duplicate (`PACKET.md` §4).
- Third-round triage: 326 items skipped as too hard, 12 items failed. Source: PLAN.md (hand-written record).
- E617 `r_eq_3` was not finished by the time the packet was written and was left out.

## Limitations

- "New" means that no prior formal proof was found in the searches described in `PACKET.md` §7. Private repositories, Zulip, and forum attachments were not searched.
- `Star6Simple.lean` cannot be rebuilt without the star6 library (`artifact/bundle/STAR6_DEPENDENCY.md`; the library is at `entries/dms-star6/artifact/lean/`).
- `artifact/scripts/` uses absolute paths of the server, so it does not run as is (for audit purposes).
- Human-reviewed: none.

## For the operator to fill in

- Submission ID, public commit and tag, person in charge, whether to include the 4 trivial bundles, human review record, human time.
- Commit the 4 files with final modifications in the original repository `erdos_m2_artifact` (at present they exist only in the working folder).
- codex usage: the procedure in `archive/stats/server-codex.yaml`.
