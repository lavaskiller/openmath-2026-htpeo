# ramsey-k4-multiplicity — 과정 기록

작성: helper-team-repo(Claude Code 에이전트), 2026-10-03 KST. 사람이 검토하지 않았습니다. 출처는 `PACKET.md`, `artifact/README.md`, `artifact/lean/CERT_STATUS.md`, `artifact/runs/ledger_server.tsv`, 프로젝트 운영 기록(PLAN.md, 손으로 쓴 기록)입니다. 탐색의 자세한 경과는 `archive/findings/ramsey-search.md`에 있습니다.

## 이 폴더의 내용

- `PACKET.md`: `ramsey_packet.md` 그대로(원본 저장소의 `ramsey_packet.md`와 바이트 단위로 같음, `cmp`로 확인).
- `artifact/`: 로컬 저장소 `ramsey_artifact`의 커밋 `1151e0c91381ff78c38d91419ce1d1a0e613b27c`에서 추적 파일 2,179개를 `git archive`로 복사(47.6 MB). `sha256sum -c SHA256SUMS`: 2,178개 전부 OK(2026-10-03).
- `artifact/lean/SHA256SUMS`는 서버에서 만든 별도 목록입니다. 29줄 중 28개 파일 OK, 1줄은 파일이 아니라 "Data/Chunk 파일을 이어 붙인 것"의 해시라서 `sha256sum -c`가 실패로 표시합니다(패킷 §3.5: 최상위 `SHA256SUMS`가 기준).

## 통한 것

- **계산으로 확인**: 768 블록 seed를 1024 블록으로 나눈 뒤(near-twin 분할) 가중치를 다시 최적화한 것이 값을 가장 많이 내렸습니다. ledger에서 768 블록 30,141,883,715 ppt(10:16) → 1024 블록 30,140,885,560 ppt(10:19) → 최종 30,139,933,996 ppt(19:52, 서버 시각). 출처: `artifact/runs/ledger_server.tsv`.
- **계산으로 확인**: 2026-09-29 실험 `0bcf1970`(768 블록, 가중치만 조정)이 처음으로 `reference_beaten = 1`. 출처: `PACKET.md` Addendum.
- **Lean 커널 검증**: 색·블록별 2,048개 파일로 나눈 `decide +kernel` 인증서. 합계 16,762초(4.7 CPU시간), 벽시계 50분, 프로세스당 최대 3.30 GB. 출처: `artifact/lean/CERT_STATUS.md`.
- 일반 보조정리 세 파일(`Fast.lean`, `Limit.lean`, `Mono.lean`)은 Claude가 명제를 먼저 고정하고 GPT가 증명, 그 뒤 Claude 에이전트가 다시 컴파일하고 명제를 대조했습니다(**AI가 검증**; 최종 판정은 Lean 커널). 출처: `PACKET.md` §3.3.

## 안 통한 것

- 실험 `2b482245`(2026-09-28): Autolab에서 failed. 출처: `PACKET.md` Addendum.
- 한 선언에 여러 블록을 넣은 인증서: 파일 하나가 5 GB를 넘어, 블록·색마다 파일 하나로 나눴습니다. 출처: `CERT_STATUS.md`.
- 메모리 상한 없이 돌린 시험 컴파일이 13 GB까지 올라 OOM으로 종료(2026-10-02 18:37 KST경). 이후 모든 컴파일에 상한을 걸었습니다. 출처: PLAN.md(손 기록).
- 탐색은 무작위·시간 제한이라 다시 돌려도 같은 템플릿이 나오지 않습니다(증명에는 필요 없음).

## 기록 사이에서 맞지 않는 점

- 최종 해의 시각: ledger 19:52(서버 시각, 시간대 미기록), `CERT_STATUS.md` 11:12 UTC, 서명 보고서 11:38:08 UTC. 순서는 같고 분 단위가 다릅니다(`PACKET.md` §3.5).
- 보고서의 `submission_hash`는 `solution.json`의 sha256과 다릅니다. 제출한 파일의 sha256이 같다는 것은 Addendum에 기록되어 있습니다.
- `artifact/lean/CERT_STATUS.md`에는 서버 호스트 이름이, `artifact/runs/ledger_server.tsv`에는 서버의 홈 디렉터리 경로가 들어 있습니다. 비밀 정보는 아니지만 공개 전에 운영자가 확인할 것(파일을 고치면 `SHA256SUMS`가 달라집니다).

## 운영자가 채울 것

- 제출 ID, 공개 커밋과 태그, 담당자, 사람 검토 기록, 사람 시간(`STATS.yaml`).
- 서버 쪽 사용량(codex 세션 ramseyfast·ramseylimit·ramseymono)과 탐색의 CPU 시간: `archive/stats/server-codex.yaml`의 절차.
