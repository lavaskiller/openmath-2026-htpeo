# dms-star6 — 과정 기록

작성: helper-team-repo(Claude Code 에이전트), 2026-10-03 KST. 사람이 검토하지 않았습니다. 출처는 `PACKET.md`, `artifact/README.md`, `artifact/lean/pack*/README.md`·`STATUS.md`, `artifact/informal/*_REPORT.md`, 프로젝트 운영 기록(PLAN.md, 손으로 쓴 기록)입니다. c4c 핵심에 대한 조사는 `archive/findings/dms-c4c-core.md`에 따로 있습니다.

**추측은 증명되지 않았습니다.** Lean으로 확인된 것은 특수한 경우, 작은 크기, 동치 재서술, 그리고 "이름 붙은 열린 가설 ⇒ 추측" 형태의 정리입니다.

## 이 폴더의 내용

- `PACKET.md`: `star6_packet_final.md` 그대로(원본 저장소의 사본과 `cmp`로 같음).
- `artifact/`: 로컬 저장소 `star6_artifact`의 커밋 `0240e123d187ea3d86e0a3a675a4ae6346e0929c`에서 추적 파일 672개를 `git archive`로 복사(21.1 MB). `sha256sum -c SHA256SUMS`: 671개 전부 OK(2026-10-03).
- 안쪽 목록: `lean/pack4/SHA256SUMS` 311개 OK, `lean/pack5/SHA256SUMS` 6개 OK. `lean/pack3/SHA256SUMS`는 `lean/pack3/src/`를 기준으로 쓴 목록이라 `src/` 안에서 실행해야 하며 그렇게 하면 100개 OK입니다(`pack3/`에서 실행하면 전부 실패로 나옵니다).

## 통한 것

- **Lean 커널 검증**: 환원 사슬(98개 모듈, `RH2F.layer37`). 2-변 절단, 3-변 절단, digon 제거를 따라 순환 4-변연결 단순 3정칙 그래프의 가설들로 내려갑니다. 유한 기저(10~16꼭짓점)는 생성한 표를 `decide +kernel`로 확인. 출처: `PACKET.md` §1.4, §2.5.
- **Lean 커널 검증**: 무한 족(flower snark, Goldberg snark, GP(n,k) k ≤ 15, Möbius ladder, Petersen형 팽창). "주기 부분 + 이음매" 채색과 유한 창 검사(`BlockStar.star_of_windows`). GP(n,k)와 Möbius ladder의 채색은 SAT 탐색으로 찾았고 비형식 증명이 없습니다. 출처: `PACKET.md` §1.2, §2.5.
- **Lean 커널 검증**: 사슬의 귀납을 가설을 크기 N 이하로 제한해 다시 돌린 `bounded_reduction`에서 14꼭짓점 이하 정리와 동치 `dms_iff_cubic16`이 나왔습니다. 출처: `PACKET.md` §1.3.
- Lean 4.20 → 4.33.1 이식: 8개 모듈의 증명 15군데 수정과 호환 옵션. 선언 머리 6,124개가 바뀌지 않았음을 스크립트로 확인(**계산으로 확인**). 같은 98개 모듈의 빌드가 4,248초·6.3 GB(4.20)에서 1,422초·3.2 GB(4.33.1)로 줄었습니다. 출처: `artifact/lean/pack3/README.md`, `pack2/README.md`.
- 하네스 운용: worker(Claude, 나중에 GPT 3명 추가)가 fact를 내고, LLM 검증기와 다른 모델 계열(GPT)의 교차 감사, Lean 게이트가 받아들입니다. fact 786개 중 732개가 검증기 + GPT 감사를 통과했고 그중 141개는 Lean 4.20 게이트도 통과(**AI가 검증**, 일부 Lean). GPT 감사는 627회 "맞음", 37회 "틀림", 10회 "오류"를 냈습니다. 출처: `PACKET.md` §3.1.

## 안 통한 것

- 다섯 조각(P18, P16, P14, P23, P19)이 모두 c4c 핵심의 무한 명제에서 멈췄습니다. 출처: `archive/findings/dms-c4c-core.md`.
- 고정 반경 국소 수선: 반지름 2에서 8개 모양 전부, 반지름 3에서 8개 중 6개가 명시적 그래프(n = 258~574)로 반증(**계산으로 확인**, 한 번 실행). 출처: `artifact/informal/c4c-ball_REPORT.md`.
- (FE-ALLPM-D)는 20꼭짓점에서 반증, TD-RED-POLE은 문턱 10에서 거짓. 출처: `artifact/informal/p16_REPORT.md`, `p23-pole_REPORT.md`.
- 기준선 기록에 반증되거나 버린 접근 49개. 출처: `PACKET.md` §3.3.
- GP 창 검사를 `decide` 하나로 한 버전이 6 GB 상한과 swap에 걸려 수동 중지(2026-10-02 13:38 UTC). 창 검사를 조각 모듈로 나눴습니다. 출처: `artifact/lean/pack4/STATUS.md`.
- 서버 Claude 계정의 주간 사용량이 2026-10-01에 99%에 이르러 Claude worker 4명이 15:49부터 마감까지 정지했습니다. 출처: PLAN.md(손 기록).

## 검증 수준 요약

- Lean 커널 검증: `PACKET.md` §1.2~1.4의 정리.
- 계산으로 확인(스크립트 한 번 실행, 독립 재실행 없음): `PACKET.md` §3.2~3.3의 전수 조사와 반례.
- AI가 검증: fact 그래프의 비형식 보조정리, 문헌 조사(`artifact/docs/NOVELTY.md`).
- 사람이 검토: 없음.

## 공개 전 확인할 점

- `artifact/` 안의 빌드 로그와 문서에 서버의 홈 디렉터리 경로가 들어 있습니다(패킷 §4.4에 밝혀져 있음). 비밀 정보는 아닙니다.
- `artifact/paper/`의 논문 초안은 2026-09-30 상태이고 패킷과 맞지 않는 부분이 있습니다(패킷 §3.4).

## 운영자가 채울 것

- 제출 ID, 공개 커밋과 태그, 담당자, 기준선 커밋, 사람 검토 기록, 사람 시간.
- 서버 쪽 사용량과 계산 시간: `archive/stats/server-harness.yaml`, `server-codex.yaml`의 절차.
