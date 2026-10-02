# Timeline

English: [timeline.md](timeline.md)

시각은 KST입니다. 원본이 UTC인 것은 +9시간으로 환산하고 Source 칸에 원래 값을 적었습니다. `PLAN.md`는 `harness/docs/mh/PLAN.md`(손으로 쓴 운영 기록)입니다. 시각이 PLAN의 손 기록에서만 나온 행은 Source 칸에 "PLAN 손 기록"이라고 적었습니다. 09-28·09-29의 일부 PLAN 절은 제목에 시각만 있고 날짜가 없어, 앞뒤 절의 날짜로 정했습니다("날짜는 문맥").

대회 기준 시각: 상태 동결 2026-09-27 12:00 EDT(2026-09-28 01:00 KST), 마감 2026-10-03 00:00 EDT(13:00 KST). erdos-1038(팀원 항목)은 이 표에 넣지 않았습니다.

| Date (KST) | What happened | Entry | Source |
|---|---|---|---|
| 2026-09-27 | 대회 전 기준선으로 Lean 라이브러리(`Star*.lean` 20개 모듈, Lean 4.20)와 인계 기록(`reference/handoff.md` 718줄)을 가져옴. 기준선에는 약 3,070만 그래프의 계산 조사(반례 없음)가 들어 있음 | dms-star6 | `star6_packet_final.md` §4.1, §3.2 |
| 2026-09-28 01:00 KST | 상태 동결 시각(2026-09-27 16:00 UTC). 이 시각의 hill 순위표 선두는 30,141,720,824 ppt(간접 기록) | shared | `ramsey_packet.md` §3.1, §3.2 |
| 2026-09-28 07:35~13:35 KST | 노트북 WSL에서 machine check로 커널 패닉 10회. fact 파일 0바이트, 기록에 NUL 구멍이 생겨 라운드 로그의 해시로 복원 | shared | PLAN §6 사고 표(PLAN 손 기록; 날짜는 PLAN §0) |
| 2026-09-28 | star6 실행을 노트북에서 서버로 이전. 서버 서비스의 메모리 상한 11G | shared | PLAN §0 결정 요약(시각 기록 없음) |
| 2026-09-28 14:25 KST | Ramsey 작업 폴더의 가장 이른 파일(hill 사본과 seed). 이 날 Autolab 실험 `f13f7e00`(기준 실행), `4c734185`(국소 탐색) 병합, 둘 다 `reference_beaten = 0`; `2b482245` 실패 | ramsey-k4-multiplicity | `ramsey_packet.md` §3.1("local time"), Addendum 표 |
| 2026-09-28 15:50 KST | worker lean이 Lean 라이브러리의 4.33.1 이식을 시작(36/36 모듈 완료는 19:40 기록) | dms-star6 | PLAN "이전 기록 (16:15)", "(19:40)"(PLAN 손 기록; 날짜는 문맥) |
| 2026-09-28 16:08 KST | 서버 가상환경에 하네스 패키지가 설치되지 않아 worker 도구 연결이 실패하던 것을 수정 | shared | PLAN §6 사고 표(PLAN 손 기록) |
| 2026-09-28 16:11 KST | 과제 P08(CubicSharp5_s) 신설. T5-BORROW 경로는 반례(prism ⊔ K4, fact `2db8c214`)로 폐기 | dms-star6 | PLAN "이전 기록 (16:15)"(PLAN 손 기록; 날짜는 문맥) |
| 2026-09-28 17:55~19:20 KST | Claude 5시간 창 94%로 worker 전원 정지, 19:20 초기화 뒤 재개 | shared | PLAN "이전 기록 (19:40)"(PLAN 손 기록; 날짜는 문맥) |
| 2026-09-28 19:40 KST | CubicSharp5_s ⇒ DMS를 Lean으로 형식화(fact `d1ef48fd`, 표준 공리). 두 경로의 의존 fact 18개가 GPT 사후 감사 통과 | dms-star6 | PLAN "이전 기록 (19:40)"; `star6_packet_final.md` §4.1(09-28 모듈) |
| 2026-09-28 22:33 KST | 감독자 판단(gm `94ba34e5`): 세 경로가 모두 순환 4-변연결(c4c) 그래프에서 막힘 | dms-star6 | PLAN "이전 기록 (22:33)"(PLAN 손 기록; 날짜는 문맥) |
| 2026-09-28 22:45 KST | 과제 T3c-RED-EXM, T3c-EXM-MC 신설. T3c-EXM-MC는 23:31에 운영자 승인 | dms-star6 | PLAN "이전 기록 (22:33)", "(04:40)", §5 1f |
| 2026-09-28 23:36 KST | Claude 5시간 창 95%로 전원 정지. 23:40에 모드를 `max`로 바꿔 주간 창을 다 쓰고 초기화권을 쓰기로 결정 | shared | PLAN "이전 기록 (23:40)"(PLAN 손 기록; 날짜는 문맥) |
| 2026-09-29 04:25 KST | 주간 초기화권 사용 뒤에도 조절기가 오래된 "100% 거부" 기록을 읽어 2시간 넘게 정지해 있던 것을 probe로 풀고 4명 재개 | shared | PLAN "이전 기록 (04:40)", §6 사고 표(PLAN 손 기록; 날짜는 문맥) |
| 2026-09-29 04:30 KST | decomposer가 전선을 c4c 핵심으로 정하고 far-exchange 집합 도구와 과제 P09·P10을 제안. "교환 1번이면 충분" 등 4개 가설 반증 | dms-star6 | PLAN "이전 기록 (05:20)"(PLAN 손 기록; 날짜는 문맥) |
| 2026-09-29 09:10 KST | RH2(fact `6bfcd4d5`: (H) ∧ (II) ⇒ 루트)를 계획으로 채택. 10:05 GPT 교차검증 15개 중 14개 통과(Lemma 2P만 이의) | dms-star6 | PLAN "이전 기록 (09:15)", "(09-29 13:35~09-30 02:20)" |
| 2026-09-29 | Autolab 실험 `a3e68347`(`reference_beaten = 0`), `0bcf1970`(768 블록, 가중치만 조정, 처음으로 `reference_beaten = 1`) 병합. `0bcf1970`의 ppt 값은 기록되지 않음 | ramsey-k4-multiplicity | `ramsey_packet.md` Addendum 표 |
| 2026-09-29 13:30 KST | 모델 변경: compute → Opus, opar·core → Fable. 13:39 GPT 요금제 변경(주간 창 하나), 13:48 상시 GPT 감사 도입(감사 job 최대 3개 동시) | shared | PLAN "이전 기록 (09:15)"의 13:30·13:39·13:48 항목(PLAN 손 기록) |
| 2026-09-29 14:20~17:55 KST | 서버 메모리 사고: Lean 모듈이 있는 fact의 감사 job이 4GB 상한에서 OOM 반복. 밀린 실패 유닛 11개가 8GB로 한꺼번에 재실행되어 부하 61, ssh 일시 불통. Lean 라이브러리 전체 재빌드가 11GB 한도 안에서 죽어 lean의 제출 2건 거부. 17:50 상시 감사 끔, 게이트를 증분 빌드로 변경 | shared | PLAN "이전 기록 (09:15)" 중 "오후 사고(14:20~17:55)와 조치"(PLAN 손 기록) |
| 2026-09-29 17:34 KST | Claude 5시간 창 100%로 전원 정지(19:20 초기화). 주간 창 47%(아침 9%) | shared | 같은 절(PLAN 손 기록) |
| 2026-09-29 18:25 KST | Lean 게이트에 Mathlib v4.20.0 적용 | dms-star6 | PLAN "Mathlib 도입(18:25 적용 완료)" |
| 2026-09-30 01:49~05:20 KST | Claude 5시간 창 101%로 전원 정지(3.5시간) | shared | PLAN "이전 기록 (09-30 02:55)" |
| 2026-09-30 02:55 KST | RH2가 Lean으로 완성됨: fact `3e79907c` `RH2F.layer9`(`Hyp → II → DMS`, 표준 공리). 시각은 기록 절의 제목 시각 | dms-star6 | PLAN "이전 기록 (09-30 02:55)" |
| 2026-09-30 03:00 KST | 상시 감사 재개. Lean fact는 한 번에 하나씩 8GB job, 나머지는 4GB job | shared | 같은 절 "운영자 결정(03:00)" 5번 |
| 2026-09-30 16:45 KST | 루트 조합 ROOT-CS4(fact `6010cb59`, 감사 통과): P18 ∧ P16 ∧ P14 ∧ P23 ∧ P19 ⇒ DMS. NE 경로는 18꼭짓점 반례(evidence `49724d73`)로 폐기. 교차검증·감사 모델을 gpt-6-sol로 변경 | dms-star6 | PLAN "이전 기록 (09-30 16:45~17:30)" |
| 2026-09-30 22:05 KST | 감사 이의 방침을 코드로 강제(열린 이의가 있는 fact에 기대는 과제 종결 제출 거부). 22:18 Claude 5시간 창 108%로 전원 정지(01:20 초기화) | shared | PLAN §4 "감사 이의 방침을 코드로 강제(22:05)", "22:55 정정과 점검" |
| 2026-09-30 22:20 KST | 부분 결과 논문 초안(10쪽) 완료. 검증 fact 375개 | dms-star6 | PLAN §4 "22:20"; `star6_packet_final.md` §3.4 |
| 2026-09-30 23:55 KST | P19 증명 세션: Theorem O1(손 증명) — 반지름 2 이하 국소 증명(LEAF-LOCAL)은 원리적으로 불가능. 10-01 00:10에 LEAF-LOCAL(1)의 44꼭짓점 반례(evidence `b44b4c3cf72cbb37`) | dms-star6 | PLAN §4 "P19 증명 세션 완료(23:55)", "P19 국소 검사 세션 완료(10-01 00:10)" |
| 2026-10-01 01:05 KST | Lean 명제 대조 세션: 층 28의 가설 FEEXTD10=P18, FEEXISTD10=P16, POLE=P14, TDTRI=P23, IID=P19가 계약 문장과 같은 뜻(계산 비교 불일치 0) | dms-star6 | PLAN §4 "Lean 명제 대조 세션 완료(01:05)" |
| 2026-10-01 01:15 KST | 승인된 과제 P25가 문장 그대로는 거짓(크기 20, evidence `977968d5`). 01:40에 조건 (d★)로 고친 P27~P29로 대체, P19 대비 경로 P30·P31 신설 | dms-star6 | PLAN §4 "P14 사전 조사 세션 완료(01:15)", "운영자 결정 3건 적용(01:40)" |
| 2026-10-01 07:10 KST | 감사 이의 30건 전부 해소. 검증 fact 428개 | dms-star6 | PLAN §4 "10-01 07:10" |
| 2026-10-01 07:35 KST | opar를 Opus로 되돌려 Fable 사용 중단. GPT worker 3명(gpt-core, gpt-compute, gpt-joker) 추가, worker 7명. PLAN에는 추가 결정이 07:50, 가동이 "07:35~"로 적혀 있어 순서가 맞지 않음 | shared | PLAN §4 "opar도 Opus로 복귀(07:35)", "GPT worker 3명 추가 결정(07:50)", "GPT worker 3명 가동(07:35~)"(PLAN 손 기록) |
| 2026-10-01 08:05 KST | "다섯 중 하나라도 닫자" 보조 세션 5개 가동. 결과: TD-RED는 맞음, (TD-CORE)는 유한 검사로 줄지 않음, (FE-ALLPM-D)₂₀ 반증, TD-RED-POLE(문턱 10) 거짓, (KR)은 k=1 일부만. 다섯 조각 모두 c4c 핵심에서 막힘 | dms-star6 | PLAN §4 "보조 세션 5개(08:05)"와 결과 (1)~(5), "공통 병목 진단"; `star6_artifact/informal/p23-check_REPORT.md`, `p16_REPORT.md`, `p23-pole_REPORT.md` |
| 2026-10-01 09:20 KST | 보조 세션 계산으로 서버 부하 27 안팎(코어 16개). 다음 세션부터 "프로세스 합계 6개 이하" 규칙 추가 | shared | PLAN §4 "서버 부하 27 안팎"(PLAN 손 기록) |
| 2026-10-01 10:40 KST | c4c-ext 최종: 명제 후보 PMU(n=10~18 전수 완벽 매칭 193,521개 실패 0). 반지름 1 수선은 n=40 반례로 거짓 | dms-star6 | PLAN §4 "c4c-ext 최종(10:40)"; `informal/c4c-ext_REPORT.md` |
| 2026-10-01 10:55 KST | c4c-4cut 최종: 장치 K2가 8·10·12꼭짓점 허용 면을 대체, 4-사이클 면은 환원 불가 | dms-star6 | PLAN §4 "c4c-4cut 최종(10:55)"; `informal/c4c-4cut_REPORT.md` |
| 2026-10-01 15:49 KST | Claude worker 4명 정지(5시간 창 93%, 이후 주간 99%). 23:50에 마감까지 정지 확정, GPT worker 3명만 가동. 23:25 기준 검증 fact 761개 | shared | PLAN §4 "전체 상황(10-01 23:25)", "23:50 재확인·방향 전환"(PLAN 손 기록) |
| 2026-10-01 23:55 KST | helper-lean-pack 가동(Lean 결과 포장, 4.33.1 이식). c4c-ball·c4c-norem 세션은 23:19 시작 | dms-star6 | PLAN §4 "남은 1.5일 우선순위", "전체 상황(10-01 23:25)" |
| 2026-10-02 00:10~00:40 KST | API 과부하(529)로 보조 세션 3개가 여러 번 끊김. 서버 job은 영향 없음 | shared | PLAN §4 "10-02 00:10~00:40" |
| 2026-10-02 00:45 KST | c4c-norem 완료: Lemma NR, 제거 가능한 변 없는 쌍 727개(n≤18), 둘째 환원이 n=16·18의 678쌍을 모두 덮음 | dms-star6 | PLAN §4 "c4c-norem 완료(10-02 00:45)"; `informal/c4c-norem_REPORT.md` |
| 2026-10-02 01:10 KST | Lean 포장 완료(pack2): Lean 4.20 + Mathlib에서 층 37 폐포 98/98 모듈, Lean 4.33.1 단일 파일 20,180줄 | dms-star6 | PLAN §4 "Lean 포장 완료(10-02 01:10)" |
| 2026-10-02 01:25 KST | c4c-ball 완료: PMU 귀납 단계의 "모든 c′" 형태(고정 반경 수선)가 r=2·3에서 반증됨 | dms-star6 | PLAN §4 "c4c-ball 완료(10-02 01:25)"; `informal/c4c-ball_REPORT.md` |
| 2026-10-02 01:44~03:07 KST | Lean 4.33.1 이식(pack3): 01:44 Mathlib 캐시, 02:45 `RH2F.layer37`까지 98/98 모듈, 03:07 `lake build` 종료(rc=0, 20분). PLAN은 완료를 03:10으로 적음 | dms-star6 | `star6_artifact/lean/pack3/STATUS.md`(KST); PLAN §4 "Lean 4.33.1 이식 완료(10-02 03:10)" |
| 2026-10-02 02:30 KST | 전략 재검토: "풀렸지만 Lean 없음" 에르되시 문제 263개 중 258개가 이미 공개 저장소에 있음. 대상은 formal-conjectures의 미증명 변형 정리로 정함 | erdos-m2-formalizations | PLAN §4 "전략 재검토(10-02 02:30)"(PLAN 손 기록) |
| 2026-10-02 08:25 KST | GPT 주간 창 초기화 확인(100% → 0%). star6 실행을 pause로 정지하고 GPT 사용량을 형식화로 돌림. 서버에 에르되시 작업 환경 준비 | shared | PLAN §4 "쉬운 에르되시 후보 진행(10-02 08:25)" |
| 2026-10-02 08:25~08:37 KST | 팀 결론 "hill에 집중", 규정집 확인(형식화된 결과만 점수), Ramsey 탐색 세션 가동. PLAN의 원래 표기는 09:10·09:40·09:45였고 PLAN이 스스로 "실제로는 08:25~08:37 사이"로 정정 | shared | PLAN §4 "방향 조정(10-02 09:10)", "hill 조사 완료(10-02 09:40)", "전체 상황(10-02 08:40 KST)"의 정정 문구 |
| 2026-10-02 08:40 KST | 에르되시 1차: 정리 12개(문제 7개)를 GPT 세션 3개가 약 10분에 증명. 독립 검증 스크립트로 컴파일·명제 동일·공리 확인 | erdos-m2-formalizations | PLAN §4 "전체 상황(10-02 08:40 KST)" |
| 2026-10-02 09:50 KST | Ramsey 탐색 중간: 가중치 최적화로 30,142,153,848 ppt(기준 B* 아래, 09-27 선두에는 약 43만 ppt 부족, hill 평가기 검증 전) | ramsey-k4-multiplicity | PLAN §4 "Ramsey 탐색 중간(09:50 KST)"(PLAN 손 기록) |
| 2026-10-02 10:16 KST | ledger 첫 줄: 30,141,883,715 ppt(n=768). 10:19에 1024 블록 분할 첫 줄 30,140,885,560 ppt로 09-27 선두 기록보다 낮아짐 | ramsey-k4-multiplicity | `ramsey_artifact/runs/ledger_server.tsv` 1~2행(서버 시각, 시간대 미기록; PLAN의 18:10·18:32 KST 수치와 맞아 KST로 봄) |
| 2026-10-02 10:17 KST | 에르되시 결산: 검증 통과 46개 정리/29개 문제 묶음, 탈락 2건. 공개 저장소의 09-16/17 PR과 겹치는 9개 묶음 발견 | erdos-m2-formalizations | PLAN §4 "에르되시 형식화 결산(10-02 10:17)" |
| 2026-10-02 18:37 KST경 | 서버 메모리 사고: 상한 없는 Lean 시험 컴파일이 13GB까지 올라 OOM 종료(페이지 캐시 소거, 서비스 생존). 이후 모든 컴파일에 상한 | shared | PLAN §4 "Ramsey Lean 인증서 완료" 중 "사고 기록"(PLAN 손 기록) |
| 2026-10-02 18:40 KST | M2 패킷 v1: 전수 중복 확인(PR 4,155개 머리 등) 뒤 주장 묶음이 20개에서 12개로 감소 | erdos-m2-formalizations | PLAN §4 "M2 최종 패킷 완료(10-02 18:40 KST)" |
| 2026-10-02 19:52 KST | ledger 마지막 줄: 최종 해 30,139,933,996 ppt(n=1024). `CERT_STATUS.md`는 최종 해 검증을 11:12 UTC(20:12 KST)로, PLAN은 탐색 종료를 20:15 KST로 적음 | ramsey-k4-multiplicity | `ledger_server.tsv` 62행; `ramsey_artifact/lean/CERT_STATUS.md` Provenance; `ramsey_packet.md` §3.5 |
| 2026-10-02 20:35 KST | hill에 해 제출(Autolab 실험 `1ab2354d`). 서명된 평가 보고서의 시각은 2026-10-02T11:38:08Z(20:38 KST), `passed: true`, `reference_beaten = 1`. PLAN은 평가 통과를 21:08 KST로 적음 | ramsey-k4-multiplicity | PLAN §4 "Ramsey hill 제출(10-02 20:35 KST)", "Ramsey hill 평가 통과(10-02 21:08 KST)"(PLAN 손 기록); `ramsey_packet.md` §2 보고서 행 |
| 2026-10-02 20:18~21:08 KST | Lean 인증서 빌드: 블록·색별 2048개 커널 검사(11:19~12:07 UTC)와 조립(12:08 UTC). 21:24 KST 부분 재빌드, 상태 문서 최종 갱신 21:35 KST(12:35 UTC) | ramsey-k4-multiplicity | `ramsey_artifact/lean/CERT_STATUS.md` 머리줄, Build record(UTC) |
| 2026-10-02 22:06 KST | 에르되시 고급 대상용 GPT 세션 5개(adv1~adv5) 가동. 컴파일 동시 슬롯 5 → 3(메모리 보호) | erdos-m2-formalizations | PLAN §4 "에르되시 M2 수준 보강(10-02 22:06 KST)" |
| 2026-10-02 22:20 KST | Ramsey 패킷 완성(부록 추가 시각). 구간 P1, p = 0.05 요청, 사람 검토 없음 명시 | ramsey-k4-multiplicity | `ramsey_packet.md` Addendum 제목, §1.3, §3.3 |
| 2026-10-02 22:21 KST | DMS 따름정리 pack5 완료(13:21 UTC): 14꼭짓점 이하 다리 없는 3정칙 다중그래프, `dms_iff_cubic16`, Schönberger·Petersen | dms-star6 | `star6_artifact/lean/pack5/STATUS.md`(UTC) |
| 2026-10-02 22:38 KST | 서버 메모리 사고 2: `GPn8` 단일 `decide` 컴파일이 6GB 상한과 swap에 도달, 4분 뒤 수동 중지. 이후 3.5GB 초과 시 컴파일러 강제 종료, 검사를 조각 모듈로 분할 | shared | `star6_artifact/lean/pack4/STATUS.md` 13:38 UTC 행; PLAN §4 "서버 메모리 사고 2" |
| 2026-10-02 23:13 KST | 무한 족 pack4 완료(14:13 UTC): 125/125 모듈 rc=0, 공리 33줄 모두 표준(flower·Goldberg snark, GP(n,k) k≤15, Möbius 사다리 등) | dms-star6 | `star6_artifact/lean/pack4/STATUS.md`(UTC) |
| 2026-10-02 23:34 KST | M2 패킷 v2 작성(14:34Z). 검증 풀 63행 중 61행 통과(검증 재실행 14:16 UTC). 주장 13개 묶음. 고급 결과 8개 중 E942만 새 형식화, E649는 선택으로 정정 | erdos-m2-formalizations | `erdos_m2_packet_final_v2.md` 머리줄, §0 |
| 2026-10-02 23:45 KST | DMS 최종 패킷과 산출물 저장소(로컬 git) 완성. 요청 구간 p = 0.15 | dms-star6 | PLAN §4 "DMS 최종 패킷 완성(10-02 23:45 KST)"(PLAN 손 기록); `star6_packet_final.md` §1.6 |
| 2026-10-03 00:10 KST | 팀 공용 저장소 틀 작성, 00:20에 세 항목 이관과 통계 추출 착수 | shared | PLAN §4 "팀 공용 저장소·아카이브 틀(10-03 00:10 KST)", "팀 저장소 틀에 세 항목 이관(10-03 00:20 KST)"(PLAN 손 기록) |
| 2026-10-03 02:32 KST | Grothendieck constant witnesses hill: 실험 `2552e287`(계정 lavaskiller) 공식 평가, gap_ppm 1,414,213 / matrix_area 4 / certificate_bits 80. 알려진 CHSH형 2x2 witness이며 새것으로 주장하지 않음 | hills | `entries/hills/grothendieck-lavaskiller/report.json`(2026-10-02T17:31:54Z) |
| 2026-10-03 02:58 KST | Kobon 삼각형 hill, n = 39 보드: 실험 `38b81af6`(계정 lavaskiller) 공식 평가, 삼각형 471개. 고전적 구성의 468보다 큼. 문헌 확인은 AI 보조 세션이 했고 사람이 검증하지 않음 | hills | `entries/hills/kobon-n39-lavaskiller/report.json`(2026-10-02T17:58:19Z), `NOTES.md` |
| 2026-10-03 03:04 KST | 순위표 재조회(2026-10-02T18:04Z): Kobon n = 39 보드 471 / 470 / 468, lavaskiller 3명 중 1위; Grothendieck 공동 1위(9명 중 7명); Ramsey는 변동 없이 검증 보드 12명 중 1위. Ramsey 해를 최종(held-out) 보드에 올리려던 시도(실험 `217d0ba2`)는 hill이 "final" 매개변수를 받지 않아 실패. 계속된 탐색에서 나온 더 나은 Ramsey 값(30,139,923,154 ppt)은 제출하지 않음 | hills, ramsey-k4-multiplicity | `archive/leaderboards/`; 운영자 보고(실험 `217d0ba2`와 미제출 값은 이 저장소에 파일 없음) |
| 2026-10-03 13:00 KST | 대회 마감(00:00 EDT). 세 패킷의 실제 제출 여부와 시각: TODO(출처 없음) — 세 패킷 모두 "작성자는 제출하지 않음"이라고만 적혀 있음 | shared | `CONTRIBUTING.md` §5; `ramsey_packet.md` §5 9번; `star6_packet_final.md` §6; `erdos_m2_packet_final_v2.md` 머리줄 |

## 날짜 없는 사건

- 주최 측 답변(2026-10-02, 시각 기록 없음): 부분 진전의 모든 주장이 개별 형식화될 필요는 "꼭 그렇지는 않지만 강력히 권장", 제안 문제의 인정 여부는 주말에 함께 심사. 출처: PLAN §4 "주최 측 답변(10-02 …)".
- 운영자가 hill 순위표 1위를 확인했다고 알림(2026-10-02 저녁, 순위표 화면 기록 없음). 출처: `ramsey_packet.md` Addendum "Leaderboard". 순위표는 그 뒤 2026-10-02T16:23Z(2026-10-03 01:23 KST)에 조회했습니다: `archive/leaderboards/`.

## 출처 사이에서 맞지 않는 점

- Ramsey 평가 시각: 서명 보고서 11:38:08Z(20:38 KST)와 PLAN의 "21:08 평가 통과"가 30분 다름. PLAN의 21:08은 확인한 시각일 수 있으나 기록으로는 구분되지 않음.
- Ramsey 최종 해 시각: ledger 19:52, `CERT_STATUS.md` 11:12 UTC(20:12 KST), PLAN 20:15 KST. 순서는 같고 분 단위가 다름(`ramsey_packet.md` §3.5에도 기록).
- 대회 기간 시작: `star6_packet_final.md`는 동결을 2026-09-27 16:00 UTC로, PLAN(DMS 최종 패킷 항목)은 "대회 기간 시작 09-27 23:24 UTC"로 적음. 패킷 §4.1에서 23:24 UTC는 가장 이른 Lean 모듈의 날짜로 쓰임.
- PLAN 머리줄의 "최종 갱신: 2026-10-01 08:05 KST"는 본문(10-03 00:20 KST 항목까지 있음)과 맞지 않음.
