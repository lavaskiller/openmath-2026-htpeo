# OpenMath 2026 — 결과와 발견점 (<팀 이름>)

> 초안(2026-10-03 KST). 2.1~2.3절, 3절, 4절은 helper-team-repo(Claude Code 에이전트)가 패킷·artifact·운영 기록에서 옮겨 적은 것이고 **사람이 검토하지 않았습니다**. erdos-1038과 팀 단위 항목은 TODO입니다. 검증 수준은 문장마다 **Lean 커널 검증 / 계산으로 확인 / AI가 검증 / 사람이 검토** 중 하나로 표시합니다. 지금까지 "사람이 검토"에 해당하는 것은 없습니다.

## 1. 요약

- 무엇을 냈는가:
  - ramsey-k4-multiplicity: K4 Ramsey 다중도 상수의 상계 c_4 ≤ 0.030139933996…(hill 기준값보다 2.34·10^-6 낮음). **Lean 커널 검증**.
  - dms-star6: Dvořák–Mohar–Šámal 추측의 부분 결과(무한 족, 14꼭짓점 이하, 동치 재서술, 조건부 환원). **Lean 커널 검증**. 추측 자체는 증명하지 못함.
  - erdos-m2-formalizations: 알려진 결과의 형식화 13개 묶음(M2). **Lean 커널 검증**.
  - erdos-1038: TODO(담당 팀원).
- 심사 결과: TODO(나오면 추가).
- 가장 중요한 발견점 세 가지: TODO(팀 논의). 후보는 3절.

## 2. 제출 항목

### 2.1 ramsey-k4-multiplicity

- **대상과 대회 전 상태**: c_4 = K_n의 2-변-채색에서 단색 K4 밀도 최솟값의 극한. 열린 문제. 알려진 상계는 Parczyk–Pokutta–Spiegel–Szabó(arXiv:2206.04036) Theorem 1.1의 4551721·2^-24·3^-2 ≈ 0.0301449와 그 논문 맺음 Note의 10486266368/768^4 ≈ 0.0301422734(hill 기준값), 하계는 0.0296(같은 논문의 인용). 문헌 문단은 **AI가 검증**(패킷 작성 세션이 arXiv 본문과 대조).
- **결과**: 1024 블록 가중 템플릿으로 c_4 ≤ 200080655744752337972227066537 / 6638390640717004439491700265361, hill 지표 30,139,933,996 ppt. Lean 이름: `sol_density`, `sol_lt_ref`, `sol_ppt`, `sol_symm`, `ramseyMultK4_le_sol`, `ramseyMultK4_lt_ref`, `minMonoK4_density_le_sol`, `ramseyMultK4_limit_lt_ref`(이름공간 `RamseyCert`). **Lean 커널 검증**. hill 공식 평가 `passed: true`, `reference_beaten = 1`(실험 `1ab2354d`, 보고서 2026-10-02T11:38:08Z) — **계산으로 확인**.
- **어떻게 했는가**: hill의 768꼭짓점 seed에서 출발해 자기동형 궤도로 뒤집기를 제한한 SA/tabu, 768 → 1024 블록 분할, 가중치 최적화, basin hopping. 값을 움직인 것은 `findings/ramsey-search.md`. 인증서는 블록·색별 2,048개 파일의 `decide +kernel`.
- **검증**: Lean 4.33.1, Mathlib v4.33.1, 공리 `[propext, Classical.choice, Quot.sound]`. 모듈별 빌드(2,112개, `lake build` 전체 실행은 하지 않음), 50분·4.7 CPU시간. 신뢰 경계: 커널의 GMP 산술, JSON → Lean 전사(별도 스크립트로 재확인, Lean 증명 아님), hill의 빠른 계산 루틴과 `_oracle`의 일치는 모델링하지 않음. 두 번째 기계에서의 재빌드 없음. **사람이 검토: 없음**.
- **한계**: 상계의 개선일 뿐 c_4를 결정하지 않음(하계와의 간격의 약 0.43%). 방법은 선행 논문의 방법(알려진 구성의 blow-up에서 국소 탐색). 2024년 9월 이후 문헌은 확인하지 않음. 보고서가 `final: false`.
- **자료**: `entries/ramsey-k4-multiplicity/`, 태그 TODO(운영자, 예정 `ramsey-v1`).

### 2.2 dms-star6

- **대상과 대회 전 상태**: 모든 subcubic 그래프의 star chromatic index가 6 이하인가(Dvořák–Mohar–Šámal 2013, arXiv:1011.3376; Open Problem Garden, OPG-37271). 열린 문제, 알려진 상계 7. 대회 전 기준선: Lean 4.20 라이브러리 20개 모듈과 사전 조사 기록(패킷 §4.1).
- **결과**(모두 **Lean 커널 검증**, 유한 loopless 다중그래프 Δ ≤ 3 범위):
  - T1 무한 족: flower snark J_n(홀수 n ≥ 5), Goldberg snark(홀수 k ≥ 5), GP(n,k)(1 ≤ k ≤ 15, n ≥ 2k+1, GP(3,1) 제외), Möbius ladder(n ≥ 4), Petersen형 팽창 — 5색. GP(k,2)는 spoke를 한 색 클래스로 하는 6색. Lean 이름: `flower_family`, `goldberg_family`, `gp_family`, `Mobius.mobius_family`, `Inflation.inflate_star5`, `gp2_star`.
  - T2: bridgeless 3정칙 다중그래프 14꼭짓점 이하와 그 leaf 그래프, subcubic 7꼭짓점 이하에서 성립(`star6_cubic_bridgeless_le14`, `star6_leaf_le14`, `star6_subcubic_le7`); 동치 `dms_iff_cubic16`(DMS ⇔ 16꼭짓점 이상의 연결 bridgeless 3정칙 다중그래프와 그 leaf 그래프가 star 6-채색 가능).
  - T3 조건부: `RH2F.layer37` — 이름 붙은 가설(FEEXTD10, FEEXISTD18, POLE, TDTRI, FEEXTTNE16, FEEXIST0NE16 등) ⇒ DMS. **가설은 하나도 증명되지 않음.**
  - T4 유한 인증서: `base12`, `simple14`, `b14d`, `feexist16`, `cls16c`(16꼭짓점 c4c 그래프 607개).
- **어떻게 했는가**: 다중 에이전트 하네스(worker → LLM 검증기 → GPT 교차 감사 → Lean 게이트)로 비형식 fact 786개와 Lean 모듈을 쌓고, 마감 이틀 전부터 보조 세션이 4.33.1 이식, 족의 Lean 증명, 따름정리를 만들었다. GP(n,k)와 Möbius ladder의 채색은 SAT 탐색으로 찾았다.
- **검증**: Lean 4.33.1, Mathlib v4.33.1, 표준 공리(pack3 18줄, pack4 36줄, pack5 39줄의 `#print axioms`). pack3은 `lake build`(20분)와 모듈별 빌드 둘 다 실행, pack4·pack5는 모듈별 빌드만. 기준선 정리 하나가 `native_decide`를 쓰지만 주장 정리의 의존 범위 밖. 족 그래프가 교과서 정의와 같다는 것은 Python 점검뿐. 비형식 자료(fact 그래프, 전수 계산, PMU 근거)는 **AI가 검증** 또는 **계산으로 확인**(한 번 실행)이고 점수를 청구하지 않음. **사람이 검토: 없음**.
- **한계**: 추측은 열려 있음. 족들은 일반 추측의 장애물을 없애지 않음. 일반 subcubic 그래프의 유한 범위는 7꼭짓점. 일부 족(GP의 일부, 덮개 정리)은 문헌에 있음(패킷 §2.6).
- **자료**: `entries/dms-star6/`, 태그 TODO(운영자, 예정 `dms-v1`). 조사 기록: `findings/dms-c4c-core.md`.

### 2.3 erdos-m2-formalizations

- **대상과 대회 전 상태**: 에르되시 문제들에 딸린 알려진 결과(formal-conjectures 커밋 `df3f12d7`에서 `sorry`로 남아 있던 명제)와 Schönberger 정리·Petersen 정리(연결된 경우). 수학은 알려져 있고, 패킷 §7의 검색에서 선행 형식 증명을 찾지 못한 것들.
- **결과**: 13개 묶음, 정리 19개 — 실질 9개(G-PM, E942, E44, E123, E918, E292, E395, E698, E939), 사소·점검용 4개(E295, E703, E748, E1136). 선택 5개 묶음(E757, E261, E36, E649, E508)은 주장하지 않음. **Lean 커널 검증**.
- **어떻게 했는가**: GPT(codex 무인 세션)가 증명, Claude가 대상 선정·검증 스크립트·선행 형식화 조사·패킷. `findings/formalization-workflow.md`.
- **검증**: Lean 4.33.1, FC가 고정한 Mathlib, 표준 공리. 명제가 고정 커밋과 글자 단위로 같은지 스크립트로 확인(**계산으로 확인**). 선행 형식화 조사는 **AI가 검증**. **사람이 검토: 없음**.
- **한계**: "새것"은 검색에서 못 찾았다는 뜻뿐. 각 문제의 주 명제는 주장하지 않음. Petersen 정리는 연결 그래프만. `Star6Simple.lean`은 star6 라이브러리가 있어야 빌드됨.
- **자료**: `entries/erdos-m2-formalizations/`, 태그 TODO(운영자).

### 2.4 erdos-1038

TODO(담당 팀원).

## 3. 발견점

### 3.1 수학

- 새로 알게 된 것 — 증명된 것(**Lean 커널 검증**): 2.1~2.3절의 정리. 특히 DMS가 16꼭짓점 이상의 bridgeless 3정칙 다중그래프와 그 leaf 그래프의 문제와 동치라는 것, 위 족들이 5색으로 충분하다는 것, c_4의 새 상계.
- 새로 알게 된 것 — 근거만 있는 것(**계산으로 확인**, 증명 없음, 독립 재실행 없음): PMU(순환 4-변연결 단순 3정칙 그래프, 10꼭짓점 이상에서 모든 완벽 매칭이 어떤 star 6-채색의 색 클래스가 된다)는 n = 10~18의 완벽 매칭 193,521개 전수와 n = 20/24/30/40의 표본 88,144개에서 실패 0. K₃,₃과 n = 8에서는 실패. 출처: DMS 패킷 §3.2, `findings/dms-c4c-core.md`.
- 반증된 접근과 그 반례(**계산으로 확인**): 고정 반경 국소 수선은 반지름 2(8개 모양 전부), 반지름 3(8개 중 6개)에서 명시적 c4c 그래프(n = 258~574)로 반증. 발견된 경우는 모두 Kempe 교환 한 번으로 구제됨. (FE-ALLPM-D)는 20꼭짓점에서 반증. TD-RED-POLE은 문턱 10에서 거짓. 출처: DMS 패킷 §3.3.
- Ramsey: 768 블록 seed의 가중치만 조정해도 기준값을 넘지만 폭이 작고, 1024 블록 분할이 가장 크게 기여(`findings/ramsey-search.md`; 기여 크기는 탐색 세션의 보고).
- 남은 열린 질문: DMS 환원의 가설 전부(c4c 핵심의 무한 명제), PMU, 순환 4-변 절단의 4-사이클 면 환원; c_4의 값.

### 3.2 방법

- AI 에이전트 운용: 명제를 한 모델이 고정하고 다른 모델이 증명한 뒤 독립적으로 다시 컴파일·대조하는 분담이 세 항목에서 모두 쓰였다. 비형식 fact는 LLM 검증기에 더해 다른 모델 계열의 감사를 거쳤고 감사는 627회 "맞음", 37회 "틀림"을 냈다. 상세: `findings/formalization-workflow.md`.
- 형식화: 유한 검사는 생성한 표 + `decide +kernel`, 큰 검사는 파일을 잘게 나누는 것이 통했다(파일당 메모리 2~3.3 GB). `decide` 하나로 한 큰 검사는 메모리 상한에 걸렸다. Lean 4.20 → 4.33.1 이식은 8개 모듈 15군데 수정과 호환 옵션으로 끝났고 빌드 시간이 4,248초에서 1,422초로 줄었다(`entries/dms-star6/artifact/lean/pack3/README.md`).
- 탐색·계산: `findings/ramsey-search.md`.
- 사고와 조치: 서버 메모리 사고 3건과 상한, 사용량 한도로 인한 worker 정지(`findings/formalization-workflow.md` §4~5), 노트북 WSL 커널 패닉 10회와 서버 이전(`timeline.md`).
- 쉬운 에르되시 대상은 대부분 공개 형식 증명과 중복이었다(제외 31행). 중복 검사를 대상 선정 앞에 두는 편이 낫다.

### 3.3 대회 운영에서 배운 것

TODO(팀 논의). 기록에 있는 것: 부분 진전의 모든 주장이 개별 형식화될 필요는 "꼭 그렇지는 않지만 강력히 권장"이라는 주최 측 답변(2026-10-02, `timeline.md`); 제안 문제(M3A)의 인정 여부는 심사 때 결정.

## 4. 자원과 통계

- 합산표: `archive/stats/SUMMARY.md`(스크립트 생성). 원본: `entries/*/STATS.yaml`, `archive/stats/*.yaml`.
- 지금 들어 있는 것: 노트북 Claude Code 사용량(2026-09-27 23:35 ~ 2026-10-03 00:10 KST 스냅숏, 모델 `claude-opus-5-5` 하나) — 입력 9,748, 출력 2,366,563, 캐시 읽기 1,273,633,924, 캐시 쓰기 69,960,092 토큰, 기록 66개(주 세션 6 + 보조 에이전트 60). 보조 에이전트의 출력 토큰은 **하한**이다(기록 2,660개 중 2,343개에 스트림 시작 시점의 값만 남아 있음). 출처: `archive/stats/claude-laptop.yaml`.
- 항목별(보조 에이전트만 나눌 수 있음): dms-star6 39개 세션, ramsey 3개, erdos-m2 5개, 나머지(주 세션 포함)는 shared/steering. 주 세션은 항목별로 나눌 수 없다.
- **아직 없는 것**: 서버의 하네스 사용량(Claude worker·검증·감독)과 codex(GPT) 사용량, 서버 job의 CPU 시간. 2026-10-03에 서버에 접속할 수 없었다. 절차는 `archive/stats/server-harness.yaml`, `server-codex.yaml`에 있다. DMS와 에르되시의 증명 작업 대부분이 서버에서 이루어졌으므로 지금의 합산표는 전체의 일부다.
- 계산(artifact의 기록에서): Ramsey 인증서 4.7 CPU시간·50분, Ramsey 탐색 약 12시간 벽시계(추정, CPU 시간 미기록); DMS pack3 1,422초(모듈별)·20분(`lake build`), 4.20에서 4,248초, pack4 930초.
- 산출물: Lean 줄 수(주장 소스) Ramsey 104,665(대부분 생성된 수치), DMS 81,622, 에르되시 2,791; 주장 정리 8 / 45(패킷의 이름 목록을 손으로 센 것) / 19; DMS 비형식 fact 786개.
- 결과당 비용: TODO(서버 수치와 구독 플랜 정보가 있어야 함).
- 사람 시간: TODO(운영자).
- 사용량 한도가 일정에 준 영향: `findings/formalization-workflow.md` §5.

## 5. 타임라인

`archive/timeline.md`. 요약: TODO(팀).

## 6. 다음 단계

TODO(팀): 대회 이후 이어갈 연구, 공개 계획.

## 부록

- A. 팀원과 역할: TODO
- B. 도구와 모델 목록: 각 `entries/<이름>/ENTRY.yaml`의 `ai_and_tools`; 팀 전체 목록은 TODO
- C. 참고 문헌: 각 패킷의 문헌 절; 팀 전체 목록은 TODO
