# tools

Scripts shared by all entries: checksum generation/verification, usage summation (`sum_claude_usage.py`, `sum_codex_usage.py`), stats summary. Add scripts here, not inside entries. Python 3 standard library only; no installation.

| Script | Use |
|---|---|
| `make_checksums.sh write\|verify entries/<name>` | writes or verifies `artifact/SHA256SUMS` (refuses to overwrite an existing list unless `FORCE=1`) |
| `sum_claude_usage.py <dir> [--since ISO] [--until ISO] [--rules rules.json] [--json out.json] [--files]` | sums `usage` per model over Claude Code transcripts (`*.jsonl`, including `subagents/`), de-duplicates message ids, splits by date (KST by default) and by group |
| `sum_codex_usage.py [<dir>] [--since ISO] [--until ISO] [--rules rules.json] [--json out.json] [--sessions]` | sums codex rollouts (`~/.codex/sessions/**/*.jsonl`) from the cumulative `token_count` records, per model, date and cwd group |
| `sum_harness_usage.py <project_dir> [--verify-runs DIR] [--json out.json]` | sums Claude usage of a harness run from its stream-json run logs (`result` records: tokens per model and API-equivalent cost), per role, model and date; reports runs without a result record as partial (lower bound) |
| `summarize_stats.py [repo_root]` | reads `entries/*/STATS.yaml` and `archive/stats/*.yaml`, writes `archive/stats/SUMMARY.md` |
| `make_results_table.py [repo_root] [--check]` | rewrites the results table (`<!-- RESULTS:START/END -->`) and the resources table (`<!-- RESOURCES:START/END -->`) of `README.md` and `README.ko.md` from the `readme:` block of each `entries/*/ENTRY.yaml`, `entries/PENDING.yaml` and the stats files; stops if a link target is missing |
| `make_charts.py [repo_root]` | writes the light/dark SVG charts of the README and `chart_data.json` into `assets/` from the stats files (output tokens by entry and by day, recorded wall hours by purpose) |

Notes:

- The scripts write numbers, file names and (with `--files` / `--sessions`) session descriptions or working directories. They never copy prompt or reply text. Do not commit `--files` / `--sessions` output.
- `sum_claude_usage.py`: Claude Code stores only a stream-start `usage` record for many subagent messages; those are reported in the `nofinal` column and their output tokens are a lower bound.
- `sum_codex_usage.py`: codex `input_tokens` includes cached input; the script reports uncached and cached input separately.
- `summarize_stats.py`: rows with `counted_in:` are copies and are not added; a non-numeric value (e.g. `TODO`) is shown as `TODO`. It reads a simple YAML subset (see its docstring) or JSON.
- Tested 2026-10-03: `sum_claude_usage.py` on the laptop transcripts of this project; `sum_codex_usage.py` on six unrelated local rollouts (format check only, not on the server data); `make_checksums.sh` on the three entries; `summarize_stats.py` on this repository.
- Run on the server 2026-10-03 01:04 KST: `sum_codex_usage.py` (972 rollouts), `sum_harness_usage.py` (2,816 log files), `sum_claude_usage.py` (39 project folders).
