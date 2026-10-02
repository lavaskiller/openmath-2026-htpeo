# 통계 합산표 (SUMMARY)

이 파일은 `tools/summarize_stats.py`가 만듭니다. 손으로 고치지 않습니다. 원본: `entries/*/STATS.yaml`, `archive/stats/*.yaml`.

- `TODO`는 원본에 수치가 아직 없다는 뜻이고, `+TODO`는 합에 빠진 항이 있다는 뜻입니다.
- 캐시 토큰 = 캐시 읽기 + 캐시 쓰기. 출처와 추정 여부는 각 원본 파일의 `source`, `notes`에 있습니다.
- `counted_in`이 붙은 행(다른 파일 수치의 사본) 7개는 세지 않았습니다.

## 1. AI 사용량 (항목 × 모델)

| 항목 | 모델 | 인터페이스 | 입력 토큰 | 출력 토큰 | 캐시 토큰 | 세션 수 | 비용(USD) |
|---|---|---|---:|---:|---:|---:|---:|
| dms-star6 | TODO (Claude Opus / Sonnet; exact ids from INDEX.json) | agent harness (Claude Code headless workers, verifier, supervisor) | TODO | TODO | TODO | TODO | TODO |
| dms-star6 | claude-opus-5-5 | Claude Code | 3,550 | 192,179 | 306,190,650 | 39 |  |
| dms-star6 | TODO (recorded as gpt-6-sol in the pack READMEs, GPT-5.6-sol in packet v3) | codex CLI | TODO | TODO | TODO | TODO |  |
| erdos-m2-formalizations | claude-opus-5-5 | Claude Code | 456 | 5,602 | 41,565,680 | 5 |  |
| erdos-m2-formalizations | TODO (recorded as gpt-6-sol in the packet) | codex CLI | TODO | TODO | TODO | TODO |  |
| ramsey-k4-multiplicity | claude-opus-5-5 | Claude Code | 612 | 3,107 | 71,994,392 | 3 |  |
| ramsey-k4-multiplicity | TODO (recorded as gpt-6-sol in the packet) | codex CLI | TODO | TODO | TODO | TODO |  |
| shared/steering | claude-opus-5-5 | Claude Code | 5,130 | 2,165,675 | 923,843,294 | 19 |  |

## 2. 모델별 합계

| 모델 | 입력 토큰 | 출력 토큰 | 캐시 읽기 | 캐시 쓰기 | 세션 수 | 비용(USD) |
|---|---:|---:|---:|---:|---:|---:|
| TODO (Claude Opus / Sonnet; exact ids from INDEX.json) | TODO | TODO | TODO | TODO | TODO | TODO |
| TODO (recorded as gpt-6-sol in the pack READMEs, GPT-5.6-sol in packet v3) | TODO | TODO | TODO |  | TODO |  |
| TODO (recorded as gpt-6-sol in the packet) | TODO | TODO | TODO |  | TODO |  |
| claude-opus-5-5 | 9,748 | 2,366,563 | 1,273,633,924 | 69,960,092 | 66 |  |

## 3. 항목별 합계

| 항목 | 입력 토큰 | 출력 토큰 | 캐시 토큰 | 세션 수 | 비용(USD) | 계산 CPU시간 | 사람 시간 | Lean 줄 수 | 주장 정리 수 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| dms-star6 | 3,550 +TODO | 192,179 +TODO | 306,190,650 +TODO | 39 +TODO | TODO | 2.2 +TODO | TODO | 81,622 | 45 |
| erdos-m2-formalizations | 456 +TODO | 5,602 +TODO | 41,565,680 +TODO | 5 +TODO |  | TODO | TODO | 2,791 | 19 |
| ramsey-k4-multiplicity | 612 +TODO | 3,107 +TODO | 71,994,392 +TODO | 3 +TODO |  | 4.9 +TODO | TODO | 104,665 | 8 |
| shared/steering | 5,130 | 2,165,675 | 923,843,294 | 19 |  |  |  |  |  |

## 4. 읽은 파일

- `entries/dms-star6/STATS.yaml`
- `entries/erdos-m2-formalizations/STATS.yaml`
- `entries/ramsey-k4-multiplicity/STATS.yaml`
- `archive/stats/claude-laptop.yaml`
- `archive/stats/server-codex.yaml`
- `archive/stats/server-harness.yaml`

## 5. 원본의 notes

- `entries/dms-star6/STATS.yaml`: Server-side usage (harness workers, verifier, audits, codex sessions) is not collected yet: archive/stats/server-harness.yaml and server-codex.yaml are TODO stubs. Laptop subagent attribution is by description regex; harness-development subagents are under shared/steering.
- `entries/erdos-m2-formalizations/STATS.yaml`: All proofs were produced by codex sessions on the server; their token usage is not collected yet (archive/stats/server-codex.yaml is a TODO stub). The laptop numbers cover only the Claude helper sessions that verified, searched prior art and wrote the packet.
- `entries/ramsey-k4-multiplicity/STATS.yaml`: Claude usage of the steering session and all server-side usage are not in this file's counted rows; see archive/stats/. Human time is left for the operator.
- `archive/stats/claude-laptop.yaml`: Snapshot 2026-10-03 00:10 KST; the sessions were still running (this repository was being written), so a later run gives slightly larger numbers. Output tokens of subagent transcripts are a lower bound: Claude Code stored only the stream-start usage record for 2343 of their 2660 messages (the main sessions have final records for all messages). Hidden reasoning is not stored, so no reliable estimate is given; the visible content length is recorded instead. Attribution to entries is by regular expressions on the subagent descriptions (claude_laptop_attribution_rules.json); everything else is shared/steering. One model only (claude-opus-5-5). cost_usd is not reported by the tool.
- `archive/stats/server-codex.yaml`: Stub. tools/sum_codex_usage.py was tested only on six unrelated local codex rollouts on the laptop (format check: session totals equal the last cumulative token_count record); it has not been run on the server data.
- `archive/stats/server-harness.yaml`: Stub. GPT usage of the harness (GPT workers and audits run through codex) belongs to archive/stats/server-codex.yaml, not here, so that it is counted once.
