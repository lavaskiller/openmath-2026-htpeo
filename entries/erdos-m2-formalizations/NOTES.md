# erdos-m2-formalizations — 과정 기록

작성: helper-team-repo(Claude Code 에이전트), 2026-10-03 KST. 사람이 검토하지 않았습니다. 출처는 `PACKET.md`, `artifact/README.md`, `artifact/VERIFY.md`, `artifact/PRIOR_ART_FINAL.tsv`, 프로젝트 운영 기록(PLAN.md, 손으로 쓴 기록)입니다.

## 이 폴더의 내용

- `PACKET.md`: 패킷 FINAL DRAFT v2(`erdos_m2_packet_final_v2.md`, 2026-10-02T15:06Z 작성본) 그대로. v1(`erdos_m2_packet_final.md`)을 대체합니다.
- `artifact/`: 로컬 저장소 `erdos_m2_artifact`의 추적 파일 67개를 **작업 폴더 상태 그대로** 복사(0.6 MB). 복사 시점(2026-10-03 00:30 KST경)에 그 저장소의 HEAD는 `9b341528c6ea83a7199bf45051ac1db483f9ee13`이었고, 4개 파일(`PACKET_FINAL_v2.md`, `PRIOR_ART_FINAL.tsv`, `scripts/make_final_v2.py`, `scripts/mk_final_v2.py`)에 커밋되지 않은 최종 수정이 있었습니다. 여기에는 수정된 쪽을 넣었습니다(`artifact/PACKET_FINAL_v2.md`와 `PACKET.md`가 같음, `cmp`로 확인).
- `artifact/SHA256SUMS`: 원본 저장소에는 최상위 목록이 없어서 `tools/make_checksums.sh write`로 **이 저장소에서 새로 만든 것**입니다(67개). 원본에 있던 `bundle/SHA256SUMS`(15개 OK), `bundle_optional/SHA256SUMS`(5개 OK)는 그대로 통과합니다.

## 주장 범위

- 주장: 13개 묶음 = 실질 9개(G-PM, E942, E44, E123, E918, E292, E395, E698, E939) + 사소·점검용 4개(E295, E703, E748, E1136; 포함 여부는 팀 결정). 정리 19개.
- 주장하지 않음(선택): E757, E261, E36, E649, E508 — FC 명제의 형식 증명은 찾지 못했지만 같은 수학이 다른 정의로 이미 공개 형식화되어 있습니다(`artifact/bundle_optional/`).
- 각 문제의 주 명제(대부분 열린 문제)는 주장하지 않습니다.

## 통한 것

- GPT(codex, 무인 세션)가 formal-conjectures 파일의 대상 정리 `sorry`만 채우고, Claude가 쓴 `verify_all.py`가 (1) 고정 커밋의 명제와 글자 단위로 같은지, (2) 파일 전체 diff에서 지워진 줄이 대상의 `sorry`뿐인지, (3) 공리가 표준 세 개인지, (4) 금지 토큰이 없는지 확인했습니다. **Lean 커널 검증** + **계산으로 확인**(스크립트). 출처: `PACKET.md` §6.
- 1차 배정은 GPT 세션 3개가 약 10분 만에 정리 12개를 끝냈습니다. 출처: PLAN.md(손 기록, 2026-10-02 08:25~08:38 KST).
- G-PM(Schönberger, Petersen 연결된 경우): star6 라이브러리의 다중그래프 정리를 Mathlib `SimpleGraph` 어휘로 옮긴 것(115줄, GPT 작성, 명제는 미리 고정). Lean 생태계에서 선행 형식 증명을 찾지 못했습니다(**AI가 검증**한 조사). 출처: `PACKET.md` §1.1.

## 안 통한 것

- 쉬운 대상의 대부분이 이미 공개 형식 증명이 있는 중복이었습니다. 제외 목록은 `PACKET.md` §4(중복·거절 31행). 2026-10-02의 "고급" 결과 8개 중 새것은 E942뿐이었습니다(`PACKET.md` §0).
- v1의 오류: E649(`sampaio`)를 새 형식화라고 했으나 plby/lean-proofs에 이미 있었습니다. v2에서 선택 묶음으로 옮겼습니다(`PACKET.md` §0, §7.7).
- E1136 `mueller`: 세션이 낸 파일이 공개 저장소 코드 약 370줄을 옮겨 쓴 것이어서 중복으로 제외(`PACKET.md` §4).
- 3차 트리아지: 326건은 어려워서 건너뜀, 12건 실패. 출처: PLAN.md(손 기록).
- E617 `r_eq_3`은 패킷 작성 때까지 끝나지 않아 빠졌습니다.

## 한계

- "새것"은 `PACKET.md` §7에 적힌 검색에서 선행 형식 증명을 찾지 못했다는 뜻입니다. 비공개 저장소, Zulip, 포럼 첨부는 검색하지 않았습니다.
- `Star6Simple.lean`은 star6 라이브러리 없이는 다시 빌드할 수 없습니다(`artifact/bundle/STAR6_DEPENDENCY.md`; 라이브러리는 `entries/dms-star6/artifact/lean/`).
- `artifact/scripts/`는 서버의 절대 경로를 쓰므로 그대로는 돌지 않습니다(감사용).
- 사람이 검토: 없음.

## 운영자가 채울 것

- 제출 ID, 공개 커밋과 태그, 담당자, 사소한 4개 묶음 포함 여부, 사람 검토 기록, 사람 시간.
- 원본 저장소 `erdos_m2_artifact`의 최종 수정 4개 파일을 커밋할 것(지금은 작업 폴더에만 있음).
- codex 사용량: `archive/stats/server-codex.yaml`의 절차.
