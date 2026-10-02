# 형식화 작업 방식: GPT와 Claude의 분담, 명제 고정, 중복 확인, 서버 메모리

English: [formalization-workflow.md](formalization-workflow.md)

기간: 2026-09-28 ~ 2026-10-02(KST). 작성: helper-team-repo(Claude Code 에이전트), 2026-10-03. 사람이 검토하지 않았습니다.

## 요약

- 세 항목 모두에서 같은 분담이 쓰였다: Claude가 명제(정리의 머리)를 먼저 고정하고, GPT(codex)가 증명을 쓰고, Claude 쪽 스크립트나 에이전트가 다시 컴파일해 명제가 바뀌지 않았는지와 공리를 확인했다. 최종 판정은 Lean 커널이다.
- 이 "확인"은 AI와 스크립트가 한 것이다. 사람이 명제나 증명을 읽은 기록은 없다.
- 에르되시 문제의 쉬운 대상은 대부분 이미 공개 형식 증명이 있었다. 중복 검사를 뒤에 한 탓에 증명을 먼저 만들고 나서 버린 것이 많다.
- 공용 서버(14 GB)에서 Lean 컴파일이 메모리 사고를 세 번 냈고, 그때마다 상한을 추가했다.

## 내용

### 1. 분담

| 일 | 맡은 쪽 | 근거 |
|---|---|---|
| Ramsey: 명세 `Defs.lean`, 생성기, 빌드 도구, 조립, 패킷 | Claude(Claude Code, 노트북 세션이 서버를 조작) | `entries/ramsey-k4-multiplicity/PACKET.md` §3.3 |
| Ramsey: 일반 보조정리 `Fast.lean`, `Limit.lean`, `Mono.lean` | GPT(codex) — 명제는 Claude가 미리 고정 | 같은 곳 |
| DMS: 환원 사슬, 족(pack4, 팽창 제외), `Star6Corollaries` | Claude(하네스 worker와 보조 세션) | `entries/dms-star6/PACKET.md` §4.3 |
| DMS: `InflationA–E`, `Inflation`, `Star6Equiv`, `Star6Simple` | GPT(codex) — 명제는 Claude가 미리 고정 | 같은 곳, §2.7 항목 7 |
| DMS 비형식 fact의 검증 | LLM 검증기(Claude Opus) + 다른 모델 계열(GPT)의 교차 감사 + Lean 게이트 | 같은 곳, §3.1, §4.3 |
| 에르되시: 모든 증명 | GPT(codex 무인 세션) | `entries/erdos-m2-formalizations/PACKET.md` §5, §7 |
| 에르되시: 대상 선정, 검증 스크립트, 선행 형식화 조사, 패킷 | Claude | 같은 곳 |

검증 수준: 위 표의 Lean 결과물은 모두 **Lean 커널 검증**(표준 공리, 각 패킷의 공리 절). 분담 자체에 대한 서술은 패킷의 공개(disclosure) 문단에서 가져온 것이다.

### 2. 명제 고정과 독립 확인

- Ramsey: GPT가 낸 세 파일을 Claude 에이전트가 독립적으로 다시 컴파일하고, 명제가 미리 정한 것과 같은지 비교했다(**AI가 검증**). 출처: Ramsey 패킷 §3.3.
- DMS 이식: Lean 4.20 원본과 4.33.1 이식본의 선언 머리 6,124개를 스크립트로 비교, 바뀐 것 없음(**계산으로 확인**, `artifact/lean/pack3/check_headers.out`). 98개 모듈의 정리 4,924개에 대해 `collectAxioms` 전수 감사(`build/audit_all.tsv`); 표준이 아닌 공리는 기준선 정리 하나(`MGraph.k4subdiv_star6`, `native_decide`)뿐이고 주장 정리가 쓰지 않는다. 출처: DMS 패킷 §2.3, §2.7.
- 에르되시: `verify_all.py`가 대상마다 속성 줄부터 `:=`까지의 글자를 고정 커밋(formal-conjectures `df3f12d7`)의 파일과 비교하고(주석 제거, 공백 정규화), 파일 전체 diff에서 지워진 줄이 대상의 `sorry` 증명뿐인지 확인하고, `#print axioms`와 금지 토큰(`native_decide`, `axiom`, `unsafe`, `implemented_by`, `admit`)을 검사한다(**계산으로 확인**). 63행 중 61행 통과, 2행은 FC에 이미 증명이 있어 거절. 출처: 에르되시 패킷 §0, §6.
- DMS fact 그래프: GPT 감사 결과는 "맞음" 627회, "틀림" 37회, "오류" 10회. 이의가 나온 fact는 고치거나 대체했고 일부 이의는 열려 있다(**AI가 검증**; 패킷은 "모델 간 일치는 증명이 아니다"라고 적는다). 출처: DMS 패킷 §3.1.
- 명제 대응(Lean 정의가 문헌의 대상과 같은가)은 각 패킷의 statement-correspondence 절에 적혀 있으나 **사람이 검토하지 않았다**. 족 그래프가 교과서 정의와 같다는 것은 Python 점검(`sanity_check.py`)뿐이고 형식 동형은 없다(DMS 패킷 §2.7 항목 4).

### 3. 중복·선행 형식화 확인이 쉬운 에르되시 대상을 대부분 지웠다

- 검색 범위(2026-10-02): `TheJustinSunPrize/awards`의 풀 리퀘스트 4,155개 전부의 head, `plby/lean-proofs`, formal-conjectures main, GitHub 코드 검색으로 받은 328개 파일, 고정 Mathlib. 출처: 에르되시 패킷 §7.
- 결과: 제외 표(패킷 §4)에 31행. 기계 검증을 통과한 61행 가운데 주장에 남은 것은 Erdős 묶음 12개(정리 17개)와 G-PM이다. 2026-10-02에 만든 "고급" 결과 8개 중 새것은 E942 하나였다(패킷 §0).
- 잘못 분류했던 것: v1 패킷은 E649 `sampaio`를 새 형식화로 적었으나 plby 파일에 이미 있었다. v2에서 고쳤다(패킷 §7 항목 7).
- 베껴 쓴 것: E1136 `mueller` 파일은 공개 저장소 코드 약 370줄을 옮긴 뒤 70줄쯤의 연결만 더한 것이어서 중복으로 제외(패킷 §4).
- 한계: "새것"은 위 검색에서 찾지 못했다는 뜻뿐이다. 비공개 저장소, Zulip, erdosproblems.com 포럼 첨부는 보지 않았고 GitHub 코드 검색은 전수가 아니다(패킷 §7).

### 4. 공용 서버의 메모리 사고와 상한

서버는 16코어, 14 GB이고 회사 운영 서비스와 함께 쓴다. 아래 시각과 수치는 프로젝트 운영 기록(PLAN.md)의 손 기록과 `artifact`의 STATUS 파일에서 온 것이다.

| 때(KST) | 일어난 일 | 조치 | 출처 |
|---|---|---|---|
| 2026-09-29 오후 | Lean 모듈이 있는 fact의 상시 GPT 감사 job이 프로젝트 Lean 라이브러리를 빌드하다 4 GB 상한에서 OOM, 재실행도 OOM. 밀린 실패 유닛이 한꺼번에 다시 돌아 부하 61, ssh 일시 불통 | 17:50 상시 감사를 끔. Lean 게이트는 증분 빌드(바뀌지 않은 모듈의 olean 재사용)로 바꿈 | PLAN.md(손 기록); `archive/timeline.md` |
| 2026-10-02 18:37경 | 메모리 상한 없이 돌린 시험 컴파일(Ramsey 인증서)이 13 GB까지 올라 OOM 종료. 서버 페이지 캐시 소거, 서비스는 살아 있었음. `lake build` 시험 중 부하 약 25 | 이후 모든 컴파일에 상한 적용. 인증서는 job당 6 GB, 프로세스당 4 GB(`MEM=4G`) | PLAN.md(손 기록); `entries/ramsey-k4-multiplicity/artifact/lean/CERT_STATUS.md` |
| 2026-10-02 22:38 (13:38 UTC) | GP 창 검사를 `decide` 하나로 한 컴파일이 6 GB 상한에 닿고 swap을 거의 다 씀. 세션이 4분 뒤 수동 중지 | 3.5 GB를 넘으면 강제 종료하는 장치, 검사를 조각 모듈로 분할 | `entries/dms-star6/artifact/lean/pack4/STATUS.md`; PLAN.md(손 기록) |

운용 중이던 상한(출처: PLAN.md 손 기록, 각 artifact의 README):

- star6 서비스 전체 11 GB(운영 서비스 보호).
- 별도 계산은 작업 실행기(job)로만 실행하고 job마다 메모리 상한을 준다. 메모리 부족으로 죽으면 상한을 두 배로 올려 다시 실행(최대 8 GB, 2회).
- 에르되시 작업 환경: `leancheck.sh`가 동시 컴파일 3개, 컴파일당 20분으로 제한. codex 세션 하나당 3.5시간 상한.
- Ramsey 인증서: `lean` 프로세스 3개짜리 job 두 개, job당 6 GB.

### 5. 사용량 한도가 일정에 준 영향

- 서버 Claude 계정: 5시간 창이 차서 worker 전원이 멈춘 일이 2026-09-28(두 번), 09-29, 09-30에 있었고, 2026-10-01에는 주간 창 99%로 Claude worker 4명이 15:49부터 마감까지 정지했다. 그 뒤 star6 run은 GPT worker 3명만 돌았다. 출처: PLAN.md(손 기록), `archive/timeline.md`.
- GPT: 2026-10-02 08:20 KST까지 한도에 걸려 있다가 초기화 뒤 0%에서 시작, 18:10에 주간 12%. 출처: PLAN.md(손 기록).
- 토큰 수치는 `archive/stats/`에 있다. 서버 쪽 수치는 아직 수집하지 못했다.

## 실패/반증된 접근

- 중복 검사를 증명 뒤에 한 것: 무엇을 — 쉬운 FC 대상부터 증명. 어디서 막혔나 — 사후 검색에서 31행이 중복·거절. 무엇으로 확인 — 풀 리퀘스트 head 전수 검색과 공개 저장소 대조(에르되시 패킷 §4, §7).
- 상한 없는 컴파일: 13 GB OOM(위 표).
- 큰 유한 검사를 `decide` 하나로: 6 GB 상한과 swap(위 표). 조각으로 나눈 뒤 프로세스당 2.05 GB(pack4), 3.3 GB(Ramsey)로 끝났다.
- 한 계열 모델만으로 검증: DMS fact에서 GPT 감사가 37회 "틀림"을 냈다는 것은 LLM 검증기 단독 통과가 충분하지 않았다는 근거다(DMS 패킷 §3.1). 다만 감사의 "틀림"이 모두 옳았는지는 기록에서 확인하지 못했다. TODO(출처 없음).

## 남은 질문

- 사람이 명제 대응을 읽는 절차를 어디에 넣을 것인가(지금은 없음).
- 중복 검사를 대상 선정 단계로 옮기면 얼마나 줄일 수 있었는가. 측정값 없음.
- `decide +kernel`과 GMP 커널 산술, 모듈별 빌드가 검증 책임자의 신뢰 경계 안인지(주최 측 확인 필요, Ramsey 패킷 §2.7).
- GPT 모델 이름의 기록이 두 가지다(`gpt-6-sol`, "GPT-5.6-sol"). 운영자 확인 필요(DMS 패킷 §4.3).

## 출처

- `entries/ramsey-k4-multiplicity/PACKET.md` §2.7, §3.3; `artifact/lean/CERT_STATUS.md`
- `entries/dms-star6/PACKET.md` §2.3, §2.7, §3.1, §4.3; `artifact/lean/pack3/README.md`, `pack4/STATUS.md`
- `entries/erdos-m2-formalizations/PACKET.md` §0, §4, §6, §7; `artifact/PRIOR_ART_FINAL.tsv`
- 프로젝트 운영 기록 PLAN.md(저장소 밖, 손으로 쓴 기록; 시각 일부는 나중에 고쳐졌음), `archive/timeline.md`
