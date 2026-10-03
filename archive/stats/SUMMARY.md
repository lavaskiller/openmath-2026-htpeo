# Statistics summary

This file is written by `tools/summarize_stats.py`. Do not edit it by hand. Sources: `entries/*/STATS.yaml`, `archive/stats/*.yaml`.

- `TODO` means the source has no number yet; `+TODO` means a term is missing from the sum.
- Cache tokens = cache read + cache write. Sources, and whether a figure is an estimate, are in the `source` and `notes` fields of each source file.
- 7 rows marked `counted_in` (copies of figures held in another file) were not counted.

## 1. AI usage (entry × model)

| Entry | Model | Interface | Input tokens | Output tokens | Cache tokens | Sessions | Cost (USD) |
|---|---|---|---:|---:|---:|---:|---:|
| dms-star6 | claude-fable-5-1 | agent harness (Claude Code headless sessions) | 27,596 | 6,242,202 | 346,370,128 |  | 704.2 |
| dms-star6 | claude-haiku-4-5-20251001 | agent harness (side model of the tool) | 424 | 3,634 | 1,047,629 |  | 3.0 |
| dms-star6 | claude-opus-5-5 | Claude Code | 3,550 | 192,179 | 306,190,650 | 39 |  |
| dms-star6 | claude-opus-5-5 | agent harness (Claude Code headless sessions) | 53,814 | 52,673,273 | 6,197,608,863 | 1,151 | 2,819.7 |
| dms-star6 | claude-sonnet-5 | agent harness (Claude Code headless sessions) | 8,974 | 8,214,758 | 756,520,579 |  | 191.0 |
| dms-star6 | gpt-5.5 | codex CLI | 7,795 | 17 | 4,480 | 1 |  |
| dms-star6 | gpt-5.6-sol | codex CLI | 33,208,951 | 3,276,308 | 490,652,544 | 386 |  |
| dms-star6 | gpt-6-astra | codex CLI | 137,341 | 7,010 | 675,072 | 7 |  |
| dms-star6 | gpt-6-sol | codex CLI | 46,446,618 | 7,703,841 | 1,536,066,560 | 510 |  |
| erdos-m2-formalizations | claude-opus-5-5 | Claude Code | 456 | 5,602 | 41,565,680 | 5 |  |
| erdos-m2-formalizations | gpt-6-sol | codex CLI | 3,715,728 | 854,854 | 202,473,856 | 21 |  |
| ramsey-k4-multiplicity | claude-opus-5-5 | Claude Code | 612 | 3,107 | 71,994,392 | 3 |  |
| ramsey-k4-multiplicity | gpt-6-sol | codex CLI | 459,277 | 112,386 | 19,127,936 | 3 |  |
| shared/steering | claude-opus-5-5 | Claude Code | 5,130 | 2,165,675 | 923,843,294 | 19 |  |

## 2. Totals per model

| Model | Input tokens | Output tokens | Cache read | Cache write | Sessions | Cost (USD) |
|---|---:|---:|---:|---:|---:|---:|
| claude-fable-5-1 | 27,596 | 6,242,202 | 326,183,572 | 20,186,556 |  | 704.2 |
| claude-haiku-4-5-20251001 | 424 | 3,634 | 966,566 | 81,063 |  | 3.0 |
| claude-opus-5-5 | 63,562 | 55,039,836 | 7,330,657,792 | 210,545,087 | 1,217 | 2,819.7 |
| claude-sonnet-5 | 8,974 | 8,214,758 | 738,979,565 | 17,541,014 |  | 191.0 |
| gpt-5.5 | 7,795 | 17 | 4,480 |  | 1 |  |
| gpt-5.6-sol | 33,208,951 | 3,276,308 | 490,652,544 |  | 386 |  |
| gpt-6-astra | 137,341 | 7,010 | 675,072 |  | 7 |  |
| gpt-6-sol | 50,621,623 | 8,671,081 | 1,757,668,352 |  | 534 |  |

## 3. Totals per entry

| Entry | Input tokens | Output tokens | Cache tokens | Sessions | Cost (USD) | Compute CPU hours | Human time | Lean lines | Claimed theorems |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| dms-star6 | 79,895,063 | 78,313,222 | 9,635,136,505 | 2,094 | 3,718.0 | 2.2 +TODO | TODO | 81,622 | 45 |
| erdos-m2-formalizations | 3,716,184 | 860,456 | 244,039,536 | 26 |  | TODO | TODO | 2,791 | 24 |
| ramsey-k4-multiplicity | 459,889 | 115,493 | 91,122,328 | 6 |  | 17.1 +TODO | TODO | 104,665 | 8 |
| shared/steering | 5,130 | 2,165,675 | 923,843,294 | 19 |  |  |  |  |  |

## 4. Files read

- `entries/dms-star6/STATS.yaml`
- `entries/erdos-m2-formalizations/STATS.yaml`
- `entries/ramsey-k4-multiplicity/STATS.yaml`
- `archive/stats/claude-laptop.yaml`
- `archive/stats/server-codex.yaml`
- `archive/stats/server-harness.yaml`

## 5. Notes of the source files

- `entries/dms-star6/STATS.yaml`: The usage rows here are copies (counted_in) of rows in archive/stats/. Laptop subagent attribution is by description regex; harness-development subagents are under shared/steering. The Lean gate rebuilds inside worker rounds are not separately recorded.
- `entries/erdos-m2-formalizations/STATS.yaml`: The usage rows here are copies (counted_in) of rows in archive/stats/. All proofs were produced by the codex sessions on the server; the laptop numbers cover only the Claude helper sessions that verified, searched prior art and wrote the packet.
- `entries/ramsey-k4-multiplicity/STATS.yaml`: The usage rows here are copies (counted_in) of rows in archive/stats/. Claude usage of the steering session is under shared/steering. Search wall time on the server: logs from 2026-10-01 23:55 UTC to 2026-10-02 11:12 UTC (11.3 h), consistent with the packet's 12 h; CPU time not recorded. Human time is left for the operator.
- `archive/stats/claude-laptop.yaml`: Snapshot 2026-10-03 00:10 KST; the sessions were still running (this repository was being written), so a later run gives slightly larger numbers. Output tokens of subagent transcripts are a lower bound: Claude Code stored only the stream-start usage record for 2343 of their 2660 messages (the main sessions have final records for all messages). Hidden reasoning is not stored, so no reliable estimate is given; the visible content length is recorded instead. Attribution to entries is by regular expressions on the subagent descriptions (claude_laptop_attribution_rules.json); everything else is shared/steering. One model only (claude-opus-5-5). cost_usd is not reported by the tool.
- `archive/stats/server-codex.yaml`: All 928 sessions with usage matched a cwd rule (archive/stats/codex_server_attribution_rules.json); none unattributed. 44 rollouts carry no token_count record. Verify/audit cross-check runs and the three GPT workers of the star6 run are counted under dms-star6. Session wall times are first-to-last record of a rollout. No cost is reported by codex for subscription use. The weekly-window percentages are the tool's own snapshots, not a billing statement.
- `archive/stats/server-harness.yaml`: Why two sources: 60 runs have no result record (killed or timed out), and falsifier and reviewer runs have no stream-json run log, so source B is incomplete (53.7M output tokens against 67.1M in the transcripts). The transcripts have a final usage record for all but 1 of 32267 messages. cost_usd is therefore a lower bound: it covers the 1103 runs with a result record only. The star6 run started on the laptop (WSL) on 2026-09-27/28 before it moved to the server; Claude sessions of that first part are not on the server and are NOT included here (not collected; whether they still exist in the laptop WSL home was not checked). GPT usage of the harness is in server-codex.yaml.
