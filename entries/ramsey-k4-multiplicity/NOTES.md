# ramsey-k4-multiplicity — Process notes

Written by: helper-team-repo (Claude Code agent), 2026-10-03 KST. Not human-reviewed. Sources are `PACKET.md`, `artifact/README.md`, `artifact/lean/CERT_STATUS.md`, `artifact/runs/ledger_server.tsv`, and the project operations records (PLAN.md, hand-written notes). The detailed course of the search is in `archive/findings/ramsey-search.md`.

## Contents of this folder

- `PACKET.md`: `ramsey_packet.md` as is (byte-for-byte identical to `ramsey_packet.md` in the original repository, checked with `cmp`).
- `artifact/`: the 2,179 tracked files copied with `git archive` from commit `1151e0c91381ff78c38d91419ce1d1a0e613b27c` of the local repository `ramsey_artifact` (47.6 MB). `sha256sum -c SHA256SUMS`: all 2,178 OK (2026-10-03).
- `artifact/lean/SHA256SUMS` is a separate list made on the server. Of its 29 lines, 28 files are OK; 1 line is the hash not of a file but of "the Data/Chunk files concatenated", so `sha256sum -c` reports it as a failure (packet §3.5: the top-level `SHA256SUMS` is the reference).

## What worked

- **Computed**: Splitting the 768-block seed into 1024 blocks (near-twin split) and then re-optimizing the weights lowered the value the most. In the ledger: 768 blocks 30,141,883,715 ppt (10:16) → 1024 blocks 30,140,885,560 ppt (10:19) → final 30,139,933,996 ppt (19:52, server time). Source: `artifact/runs/ledger_server.tsv`.
- **Computed**: Experiment `0bcf1970` of 2026-09-29 (768 blocks, weights only adjusted) was the first with `reference_beaten = 1`. Source: `PACKET.md` Addendum.
- **Lean kernel-checked**: A `decide +kernel` certificate split into 2,048 files, one per color and block. Total 16,762 seconds (4.7 CPU hours), 50 minutes wall-clock, at most 3.30 GB per process. Source: `artifact/lean/CERT_STATUS.md`.
- For the three general lemma files (`Fast.lean`, `Limit.lean`, `Mono.lean`), Claude fixed the statements first and GPT proved them; afterwards a Claude agent recompiled them and compared the statements (**AI-checked**; the final verdict is the Lean kernel). Source: `PACKET.md` §3.3.

## What did not work

- Experiment `2b482245` (2026-09-28): failed in Autolab. Source: `PACKET.md` Addendum.
- A certificate with several blocks in one declaration: a single file exceeded 5 GB, so it was split into one file per block and color. Source: `CERT_STATUS.md`.
- A test compile run without a memory cap rose to 13 GB and was terminated by OOM (around 2026-10-02 18:37 KST). After that a cap was applied to every compile. Source: PLAN.md (hand-written record).
- The search is randomized and time-limited, so rerunning it does not produce the same template (not needed for the proof).

## Inconsistencies between records

- Time of the final solution: ledger 19:52 (server time, time zone not recorded), `CERT_STATUS.md` 11:12 UTC, signed report 11:38:08 UTC. The order is the same and the minutes differ (`PACKET.md` §3.5).
- The `submission_hash` in the report differs from the sha256 of `solution.json`. That the sha256 of the submitted file is the same is recorded in the Addendum.
- `artifact/lean/CERT_STATUS.md` contains the server host name, and `artifact/runs/ledger_server.tsv` contains the server's home directory path. This is not secret information, but the operator should check it before publication (modifying the files changes `SHA256SUMS`).

## For the operator to fill in

- Submission ID, public commit and tag, person in charge, human review record, human time (`STATS.yaml`).
- Server-side usage (codex sessions ramseyfast, ramseylimit, ramseymono) and the CPU time of the search: the procedure in `archive/stats/server-codex.yaml`.
