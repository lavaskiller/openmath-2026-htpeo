# Statistics request

Korean original: [STATS_REQUEST.ko.md](STATS_REQUEST.ko.md).

To say "what was spent on what" in the archive, we need the same figures in the same format from every member. Please add the items below as `archive/stats/<name>.yaml` (template: `entries/_TEMPLATE/STATS.yaml`). Split by entry where you can; where that is hard, give the total and a rough share per entry.

## 1. Figures requested

| Group | Figures | Why |
|---|---|---|
| AI usage | input, output and cache tokens per model; number of sessions (agent runs); cost if the tool reports one; change of subscription usage | total token use, share per model, cost per result |
| Compute | machine specification; run time per purpose (wall-clock and CPU); peak memory | compute spent on search and builds |
| Human time | hours and activity per person (steering, review, writing, submission) | what people did and what AI did |
| Outputs | Lean lines and files, number of claimed theorems, build time, number of verified intermediate results | scale |
| Attempts | approaches that worked and approaches that failed (one line each) | basis of the findings section |
| Dates | start and end of the work, main milestones | timeline; evidence that the work lies inside the event window |

## 2. How to extract the figures

**Claude Code**

- Session records are in `~/.claude/projects/<project folder>/*.jsonl`. Each reply has a `usage` field with `input_tokens`, `output_tokens`, `cache_read_input_tokens`, `cache_creation_input_tokens`.
- Sum them with `tools/sum_claude_usage.py <folder>`. Subagent records are under `subagents/` in the same folder and are included.
- For a subscription plan, note the figures of the usage screen (five-hour window, weekly window) and the number of resets.

**codex (GPT)**

- Session records are in `~/.codex/sessions/**/*.jsonl`. The `token_count` events carry cumulative tokens. Sum them with `tools/sum_codex_usage.py`.
- For a subscription plan, note the change of weekly usage (for example 0% → 12%) and the number of resets.

**Agent harness (star6 run)**

- On the server, `scripts/mh-export-usage.sh star6 [out.tar.gz] [--since YYYY-MM-DD]` bundles the prompts and replies of every agent run with an `INDEX.json` (role, model, tokens and cost per run). The summary is made from `INDEX.json`; `tools/sum_harness_usage.py` sums the run logs directly.
- The bundle is large and contains internal records: do not commit it. Commit only the sums and the checksum of the bundle.

**Web chat and other tools**

- If token counts are not available, give the number of conversations and a rough volume, marked "estimate".

**Compute**

- Use scheduler or systemd records (`systemctl --user show <unit> -p CPUUsageNSec -p ExecMainStartTimestamp -p ExecMainExitTimestamp`), the time and memory lines of build logs, and the time stamps of search records.
- Where there is no record, estimate from start and end times and the number of processes, and write "estimate".

**Outputs**

- Lines: `find artifact -name '*.lean' | xargs wc -l`. Theorems: the list of claimed theorems in the packet.

## 3. When you commit

- Do not write account e-mail addresses, keys, tokens or server addresses. Distinguish accounts only as "server account", "personal account".
- Give the source (command or file) of every figure.
- Count usage that spans several entries once; say in `notes` which file holds it.
- Statistics may be corrected after the deadline. They are managed separately from the submissions (the tags under `entries/`).

## 4. Columns of the summary

`archive/stats/SUMMARY.md` is written by `tools/summarize_stats.py`. Columns: entry, model, input tokens, output tokens, cache tokens, sessions, cost (if any), compute CPU hours, human time, Lean lines, claimed theorems.
