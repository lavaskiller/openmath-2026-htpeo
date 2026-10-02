# tools

Scripts shared by all entries: checksum generation/verification, usage summation (`sum_claude_usage.py`, `sum_codex_usage.py`), stats summary. Add scripts here, not inside entries. Python 3 standard library only; no installation.

| Script | Use |
|---|---|
| `make_checksums.sh write\|verify entries/<name>` | writes or verifies `artifact/SHA256SUMS` (refuses to overwrite an existing list unless `FORCE=1`) |
| `sum_claude_usage.py <dir> [--since ISO] [--until ISO] [--rules rules.json] [--json out.json] [--files]` | sums `usage` per model over Claude Code transcripts (`*.jsonl`, including `subagents/`), de-duplicates message ids, splits by date (KST by default) and by group |
| `sum_codex_usage.py [<dir>] [--since ISO] [--until ISO] [--rules rules.json] [--json out.json] [--sessions]` | sums codex rollouts (`~/.codex/sessions/**/*.jsonl`) from the cumulative `token_count` records, per model, date and cwd group |
| `summarize_stats.py [repo_root]` | reads `entries/*/STATS.yaml` and `archive/stats/*.yaml`, writes `archive/stats/SUMMARY.md` |

Notes:

- The scripts write numbers, file names and (with `--files` / `--sessions`) session descriptions or working directories. They never copy prompt or reply text. Do not commit `--files` / `--sessions` output.
- `sum_claude_usage.py`: Claude Code stores only a stream-start `usage` record for many subagent messages; those are reported in the `nofinal` column and their output tokens are a lower bound.
- `sum_codex_usage.py`: codex `input_tokens` includes cached input; the script reports uncached and cached input separately.
- `summarize_stats.py`: rows with `counted_in:` are copies and are not added; a non-numeric value (e.g. `TODO`) is shown as `TODO`. It reads a simple YAML subset (see its docstring) or JSON.
- Tested 2026-10-03: `sum_claude_usage.py` on the laptop transcripts of this project; `sum_codex_usage.py` on six unrelated local rollouts (format check only, not on the server data); `make_checksums.sh` on the three entries; `summarize_stats.py` on this repository.
