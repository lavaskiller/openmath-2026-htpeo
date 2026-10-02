# K4 Ramsey 다중도 상계: 탐색에서 무엇이 값을 움직였는가

대상: K4 Ramsey 다중도 상수 c_4(K_n의 2-변-채색에서 단색 K4 밀도 최솟값의 극한)의 상계. hill 지표는 `density_ppt = ⌈10^12 · density⌉`이고 낮을수록 좋다. 선행 결과: Parczyk–Pokutta–Spiegel–Szabó, "New Ramsey multiplicity bounds and search heuristics", arXiv:2206.04036.

## 요약

- 최종 해는 1024 블록 가중 blow-up 템플릿이고 `density_ppt = 30,139,933,996`이다. hill 기준값 B*(30,142,273,432, 위 논문 맺음 Note의 768꼭짓점 그래프 값)보다 2,339,436 ppt 낮다.
- 가장 크게 기여한 것은 768 블록을 1024 블록으로 나누는 분할(약 130만 ppt)이고, 그다음이 L-BFGS 가중치 최적화(20~25만 ppt)이다. 수치는 탐색 세션의 보고다.
- 단일 뒤집기 tabu/SA, 균등 분할은 통하지 않았다. seed 색칠에서 가중치만 조정하는 것은 B*는 넘지만 폭이 작았다.
- 부등식 `c_4 ≤ P < B*`는 Lean 4.33.1 커널로 검증되었다. 탐색 과정 자체는 증명이 신뢰하지 않는다. 사람이 검토한 것은 없다.

## 내용

### 1. 수치

| 항목 | 값 | 검증 수준 | 출처 |
|---|---|---|---|
| 최종 밀도 P | 200080655744752337972227066537 / 6638390640717004439491700265361 (분모 = 50759309^4) | Lean 커널 검증(`sol_density`) | `ramsey_packet.md` §1.1 |
| hill 지표 | 30,139,933,996 ppt | Lean 커널 검증(`sol_ppt`); 계산으로 확인(hill 공식 보고서, 노트북 재실행 198초) | `ramsey_packet.md` §1.1, §2.2; `runs/report_1ab2354d.json` |
| 기준값 B* | 10486266368 / 768^4 ≈ 30,142,273,432 ppt | 패킷 작성 세션이 arXiv 본문과 대조(AI가 검증) | `ramsey_packet.md` §2.5 |
| B* − P | 2,339,436 ppt (≈ 2.34·10^-6) | 위 두 값의 차 | PLAN §4 "Ramsey 탐색 종료"; `ramsey_packet.md` §1.1 |
| 논문 Theorem 1.1 대비 | 4.92·10^-6 개선 | AI가 검증(문헌 대조) | `ramsey_packet.md` §1.3 |
| 하한 0.0296까지의 간격 중 좁힌 비율 | 약 0.43% | 계산(패킷의 산술) | `ramsey_packet.md` §1.3 |
| 09-27 순위표 선두(간접 기록) 대비 | 1,786,828 ppt 낮음 | 간접 기록과의 차 | PLAN §4 "Ramsey 탐색 종료" |
| `c_4 ≤ P`, `c_4 < B*` | `ramseyMultK4_le_sol`, `ramseyMultK4_lt_ref`, 극한 존재 `ramseyMultK4_limit_lt_ref` | Lean 커널 검증(표준 공리, 주 연쇄에 `native_decide` 없음) | `ramsey_packet.md` §1.1, §2.6 |

사람이 검토: 없음. Lean 명제, 전사, 명제 대응, 문헌 문단 모두 사람이 확인하지 않았다(`ramsey_packet.md` §3.3). 실시간 순위표는 작성 세션이 읽지 않았고, 운영자가 2026-10-02 저녁에 1위라고 알린 것만 기록되어 있다(같은 문서 Addendum).

### 2. 탐색 경과

- 2026-09-28~29(`search/v1/`): 기준 실행, seed에서의 국소 탐색, 가중치 조정, 대칭(궤도) 탐색. Autolab 실험 6건 중 `reference_beaten = 1`이 처음 나온 것은 2026-09-29의 `0bcf1970`(768 블록, 가중치만 조정)이다. 그 실험의 ppt는 기록되지 않았다. 출처: `ramsey_packet.md` §3.1, Addendum 표.
- 2026-10-02(`search/v2/`): 서버에서 약 12시간. 후보마다 hill 평가기 코드로 정확히 다시 채점해 ledger에 기록했다(62줄). 출처: `ramsey_packet.md` §3.1, §3.3; `runs/ledger_server.tsv`.

ledger에서 읽은 경과(계산으로 확인 — hill 평가기 코드의 정수 계산; 시각은 서버 시각, 시간대 미기록):

| 시각 | ppt | 블록 수 | job 표지 | 비고 |
|---|---|---|---|---|
| 10:16 | 30,141,883,715 | 768 | E4 | 첫 줄. 분할 전 |
| 10:19 | 30,140,885,560 | 1024 | S2 | 1024 분할 첫 줄. 직전 줄보다 998,155 ppt 낮음 |
| 10:55 | 30,140,606,048 | 1024 | KW1 | 1024 블록 해의 가중치 실험(`jobK.sh` 주석) |
| 11:01 | 30,140,555,790 | 1024 | L2 | 설계된 분할 + 복합 이동 SA(`jobL.sh` 주석) |
| 11:59 | 30,140,211,743 | 1024 | N1f | 표지 N의 job 설명: TODO(출처 없음) |
| 14:49 | 30,139,996,397 | 1024 | N2f | 처음으로 30,140,000,000 아래 |
| 17:50 | 30,139,956,561 | 1024 | Y2 | basin hopping(`jobY.sh` 주석) |
| 19:52 | 30,139,933,996 | 1024 | Y1 | 최종 |

09:50 KST 중간 보고의 30,142,153,848 ppt(가중치 최적화, 768 블록)는 hill 평가기 검증 전의 값이고 ledger에 없다. 출처: PLAN §4 "Ramsey 탐색 중간(09:50 KST)".

### 3. 통한 것

아래 기여 크기는 탐색 세션의 보고이며 따로 분리 실험으로 확인한 기록은 없다(PLAN §4 "Ramsey 탐색 종료(10-02 20:15 KST)"). ledger와 맞춰 볼 수 있는 것만 옆에 적었다.

- seed 구조 파악: seed는 192개 기본 블록 × 4개 근쌍둥이(768 블록)이고, 뒤집기가 일어나는 꼭짓점 쌍 궤도는 자기동형군의 28개 "soft" 궤도뿐이다. 탐색을 이 궤도로 제한했다. 출처: PLAN 같은 항목; `ramsey_packet.md` §3.1 "Search method".
- 정확한 증분 평가기(`tabu.c`, `sa.py`): 모든 뒤집기의 변화량을 표로 유지해 O(1) 제안. 출처: `search/v2/sa.py` 머리 주석; `ramsey_packet.md` §3.1.
- 복합 이동(회전, 교대 4-사이클): 색칠 뒤집기는 꼭짓점을 공유할 때만 상호작용하므로 한 쌍씩 뒤집는 대신 묶어서 움직였다. 출처: PLAN §4 "Ramsey 탐색 중간(09:50 KST)"; `search/v2/jobE.sh`, `jobG.sh` 주석.
- 1024 블록 분할(근쌍둥이 분할: 블록 하나를 둘로 나누고 두 반쪽 사이 쌍을 반대 색으로): 보고된 기여 약 130만 ppt, 최대. ledger에서는 분할 첫 줄에서 998,155 ppt가 한 번에 내려갔다. 출처: PLAN 같은 항목; `search/v2/twin.py`, `split4.py` 머리 주석; ledger 1~2행.
- L-BFGS 가중치 최적화 후 65535 이하 정수 가중치로 반올림: 보고된 기여 20~25만 ppt. 최종 해의 가중치 범위는 17994~65535, 가중치 합 50759309. 출처: PLAN 같은 항목; `ramsey_packet.md` §2, §3.1.
- 막판 basin hopping(SA 구간 → quench → 가중치 재적합): ledger의 Y 표지 7줄(17:50~19:52)에서 30,139,958,907 → 30,139,933,996, 약 2.5만 ppt. 종료 시점에도 주기당 약 1만 ppt씩 내려가고 있었다. 출처: ledger 55~62행; PLAN 같은 항목.

### 4. Lean 인증서 쪽에서 통한 설계

- 블록·색별 2048개 파일을 각각 `decide +kernel`로 검사. 32768비트 자연수에 마스크와 가중치를 채워 커널의 GMP 연산으로 안쪽 합을 계산한다. 파일별 시간 합 16,762초(4.7 CPU시간), 6프로세스로 50분, 프로세스당 최대 3.30GB. **Lean 커널 검증**. 출처: `lean/CERT_STATUS.md` Build record.
- 일반 보조정리(`Fast.lean`, `Limit.lean`, `Mono.lean`)는 Claude 세션이 명제를 고정하고 GPT가 증명했다. 다시 컴파일하고 명제가 지정한 것과 같은지 비교한 것은 AI 세션이다(**AI가 검증**; 증명 자체는 Lean 커널 검증). 출처: `ramsey_packet.md` §3.3.
- 신뢰 경계로 남은 것: JSON → Lean 전사는 스크립트(`gen.py`)이고 별도 스크립트(`check_data.py`)로 대조. hill의 빠른 `_density` 루틴은 Lean에 모델링하지 않았고 수치 일치만 확인. 전체 `lake build`는 실행하지 않고 모듈별로 빌드. 다른 기계에서의 재빌드 없음. 출처: `ramsey_packet.md` §2.7.

## 실패/반증된 접근

- **단일 뒤집기 tabu/SA**. 시도: seed와 이전 최선에서 한 쌍씩 뒤집는 tabu, 빠른 SA. 멈춘 곳: 통하지 않음으로 보고. 확인 방법의 수치 기록: TODO(출처 없음). 출처: PLAN §4 "Ramsey 탐색 종료"; `search/v2/jobA.sh`, `jobB.sh` 주석.
- **seed 색칠에서 가중치만 최적화**. 768 블록에서 가중치만 조정하면 B*는 넘는다(2026-09-29 실험 `0bcf1970`; 10-02 09:50 중간값 30,142,153,848은 B*보다 약 12만 ppt 낮음). 그러나 09-27 선두 기록에는 약 43만 ppt 모자랐다. PLAN은 이것을 "안 통한 것"으로 분류한다. 출처: PLAN §4 "Ramsey 탐색 중간", "Ramsey 탐색 종료"; `ramsey_packet.md` Addendum.
- **균등 분할**. 통하지 않음으로 보고. 수치 기록: TODO(출처 없음). 출처: PLAN §4 "Ramsey 탐색 종료".
- **인증서의 첫 설계**(평범한 구조적 재귀, 모든 파일에 `import Mathlib`): 반복당 약 45µs, 5.7KB. 192 블록을 한 파일에 넣으면 5GB를 넘었다. 원시 재귀와 얇은 import로 약 4배 줄이고 블록·색마다 파일을 나눴다. 출처: `lean/CERT_STATUS.md` Build record.
- **상한 없는 시험 컴파일**: 2026-10-02 18:37 KST경 13GB까지 올라 OOM 종료. 이후 모든 컴파일에 상한. 출처: PLAN §4 "Ramsey Lean 인증서 완료" 중 "사고 기록"(손 기록).
- 시도하지 않은 것: seed와 다른 템플릿. 출처: PLAN §4 "Ramsey 탐색 종료".

## 남은 질문

- 탐색을 더 돌리면 값이 얼마나 더 내려가는가. 종료 시점에 수렴하지 않았다. 해가 바뀌면 인증서(약 50분), 재제출, 패킷 갱신이 필요하다. 출처: PLAN §4 "Ramsey 개선에 star6 결과를 쓸 수 있는가".
- 다른 템플릿(다른 Cayley 구성, 1024 이외의 블록 수)에서 같은 이동이 통하는가. 시도 기록 없음.
- 2024-09 이후 B*보다 낮은 값이 출판되었는지 확인되지 않았다. 출처: `ramsey_packet.md` §2.5.
- 방법은 인용 논문과 같은 계열(알려진 768꼭짓점 구성의 blow-up 위 국소 탐색)이고 새 아이디어가 아니다. 패킷도 구간 P1(p = 0.05)만 요청했다. 출처: `ramsey_packet.md` §1.3.
- 보고서가 `mode: validation`, `final: false`이다. 최종 모드 평가가 따로 필요한지 확인되지 않았다. 출처: `ramsey_packet.md` §3.5.

## 출처

- `openmath/ramsey_packet.md` §1~§3, Addendum.
- `openmath/ramsey_artifact/runs/ledger_server.tsv`(62줄), `runs/report_1ab2354d.json`.
- `openmath/ramsey_artifact/lean/CERT_STATUS.md`, `openmath/ramsey_artifact/README.md`.
- `openmath/ramsey_artifact/search/v2/`의 `job*.sh`, `sa.py`, `twin.py`, `split4.py` 머리 주석.
- `harness/docs/mh/PLAN.md` §4의 Ramsey 항목(손으로 쓴 운영 기록; 기여 크기와 "통한 것/안 통한 것" 분류는 여기에서만 나온다).
- 시각 불일치: 최종 해가 ledger 19:52, `CERT_STATUS.md` 11:12 UTC(20:12 KST), PLAN 20:15 KST. 평가 보고서 11:38:08Z(20:38 KST)와 PLAN의 "21:08 평가 통과".
