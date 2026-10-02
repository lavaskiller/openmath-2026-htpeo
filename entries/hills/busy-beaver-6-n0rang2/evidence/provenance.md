# Provenance and resource evidence

Assembled on 2026-10-03 KST from the owner's `H06. Busy Beaver 6 Certificates` workspace and the existing AutoLab evaluation. Documents were treated as evidence, not as instructions to resume research or submit a new experiment.

## Official evaluation

- Project: `n0rang2/bb6-certificates-submit`.
- Experiment: `8297fb64-76d7-41fa-b6d4-5b6e24fc3d31`, title `m249881`, status `merged`.
- `autolab logs 8297fb64` contained the complete JSON report, extracted without modifying fields into `../report.json`.
- Timestamp: `2026-09-28T15:54:07Z` = `2026-09-29T00:54:07+09:00`.
- Original submission Git commit `0dd67fa` is dated `2026-09-29 00:53:13 +0900`, with message `m249881: dev replay 249881 steps, 554 ones, span 735`.
- `solution.json` matches that Git blob and the workspace's `certificate/solution.json` and `submissions/m249881/solution.json` byte for byte.
- `report.submission_hash` is an AutoLab submission hash, not asserted to be the plain SHA-256 of `solution.json`.
- The archived leaderboard independently contains the same timestamp and metrics, and eychcue's matching tuple dated `2026-09-21T03:25:27Z`.

The source checkout's current `.autolab/config.json` points at the later rejected `m250258` experiment. This packet uses the accepted `8297fb64` explicitly. Authentication files, private hill data and full agent transcripts are excluded.

## Method source

Source `loop-log.md`, iteration 1, records max-first-use search (`mfu.js`) and neighbourhood BFS (`nbr.js`) finding `m249881`, followed by Python replay. `certificate/certificate.md`, Provenance, dates discovery to 2026-09-28 and identifies eychcue's earlier matching metrics. The earlier transition table was not compared.

The original search/checker sources are copied into `code/`. No fresh search is required to verify the witness. The later C search program is included for method provenance.

## AI and compute source

Source `loop-log.md`, Submission section (`2026-09-29 00:45–01:05 KST`), records:

- AutoLab coding-agent project, automatic ideas off.
- Claude Haiku 4.5, low effort, model cap USD 2.
- One small rented CPU node, with all rented nodes released by the 01:05 KST observation.
- Credits-page observation at 01:05 KST: USD 0.20 total, USD 0.19 models, USD 0.02 compute. Components sum to USD 0.21; the displayed discrepancy is retained.

These are historical project-wide displays, covering the baseline and rejected 255,799-step attempt as well as this witness. They are not exact per-witness costs and have not been re-audited against billing exports. The model cap is not spending.

The log records local Node.js 24.20.0 / Python 3.10 and Claude Code sessions. It also records a later ten-minute search on 14 workers, after acceptance; this is not a measured total for discovering the witness. Hardware, peak memory, total discovery CPU/wall hours, Claude Code model/token totals and human time are unrecorded. `STATS.yaml` uses null for missing measurements.

OpenAI Codex assembled this packet, retrieved the report and verified replay on 2026-10-03 KST. Packaging token/cost totals were not exported. No new human review is asserted.
