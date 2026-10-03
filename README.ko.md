<div align="center">
<h1>HTPeo — OpenMath 2026</h1>
<p>미해결 문제에 대한 Lean 4 검증 결과: K4 Ramsey 다중도 상수의 새 상계,<br/>
Dvořák–Mohar–Šámal 추측의 부분 결과, 에르되시 문제들의 알려진 결과 형식화.<br/>
그리고 무엇을 했고 자원을 얼마나 썼는지의 기록.</p>
</div>

<p align="center">
<a href="README.md">English</a> ·
<a href="#한눈에-보는-결과">결과</a> ·
<a href="#검증-범위">검증 범위</a> ·
<a href="#검증-방법">검증 방법</a> ·
<a href="#사용한-자원">자원</a> ·
<a href="#팀">팀</a> ·
<a href="archive/">아카이브</a>
</p>

심사자와 외부 독자를 위한 본문은 [README.md](README.md)(영어)입니다. 이 파일은 팀용 요약이고, 표와 그림은 같은 스크립트가 만듭니다.

## 대회

- **행사**: 패킷에서는 "OpenMath 2026"이라 부르며, 공식 규정집의 제목은 *Open Problems Hack at MIT*입니다([규정집](https://rsihouse.ai/openmath/handbook.pdf), [행사 페이지](https://luma.com/yzp9abvr)). 형식화된 결과만 점수가 됩니다.
- **기간**: 2026-09-27(일) 정오(미 동부) 개회·상태 동결, 제출 마감은 10-03(토) 00:00 EDT(13:00 KST) 전.
- **플랫폼**: [AutoLab](https://app.autolab.ai). Hill은 평가기가 붙은 과제이고, 규정집에 따르면 Hill 통과는 필요하지만 그 자체로 수학적 증명은 아닙니다.
- **우리 항목의 모드**: Ramsey와 DMS는 M3A(제안, 인정 여부는 주최 측 결정), 형식화 묶음은 M2(인정된 묶음 수로 따로 순위).

## 한눈에 보는 결과

팀이 가진 것 전부를 한곳에 모았습니다: 먼저 Lean으로 검증한 항목, 다음에 팀원이 대회 hill에서 가진 결과. hill 순위는 AutoLab 순위표를 2026-10-02T18:04Z (2026-10-03 03:04 KST)에 조회한 값이며 마감 전까지 바뀔 수 있습니다. 순위에는 항상 보드의 계정 수를 함께 적고, 지표가 같은 계정은 같은 순위입니다(플랫폼은 동률 계정을 알파벳 순으로 늘어놓고 번호를 차례로 매깁니다).

<!-- RESULTS:START -->
**Lean으로 검증한 항목**

| 항목 | 대상 문제 | 종류 | 결과 | 순위 | 검증 | 링크 |
|---|---|---|---|---|---|---|
| [`ramsey-k4-multiplicity`](entries/ramsey-k4-multiplicity/) | K4 Ramsey 다중도 상수 c_4 (상계) | 새 결과 | c_4 ≤ 0.030139911990 (hill 지표 `density_ppt` 30,139,911,990). 이전 최고: 10486266368/768^4 ≈ 0.030142273432 (30,142,273,432), McKay, hill 기준값. | 13계정 중 1위 (검증 보드, 단독 선두) | Lean 4.33.1, 표준 공리, 모듈별 빌드; hill 실험 통과 | [packet](entries/ramsey-k4-multiplicity/PACKET.md) · [theorem](entries/ramsey-k4-multiplicity/artifact/lean_v2/RamseyCert/Final.lean#L39) · [axioms](entries/ramsey-k4-multiplicity/artifact/lean_v2/logs/RamseyCert.Final.log) · [hill report](entries/ramsey-k4-multiplicity/artifact/runs/report_bc2c24e3.json) |
| [`dms-star6`](entries/dms-star6/) | Dvořák–Mohar–Šámal 추측: subcubic 그래프의 star chromatic index ≤ 6 (미해결; 알려진 최선의 상계 7) | 부분 결과 | 추측 자체는 증명하지 못함. 증명한 것: flower·Goldberg snark, GP(n,k) (k ≤ 15), Möbius 사다리는 5색; 14꼭짓점 이하의 모든 bridgeless 3정칙 다중그래프는 6색; 동치 `dms_iff_cubic16`; 이름 붙인 미해결 가설들로의 환원. | — | Lean 4.33.1, 표준 공리; `lake build`(pack3), 모듈별 빌드(pack4, pack5) | [packet](entries/dms-star6/PACKET.md) · [families](entries/dms-star6/artifact/lean/pack4/src/Families.lean#L68) · [≤ 14 vertices](entries/dms-star6/artifact/lean/pack5/src/Star6Corollaries.lean#L48) · [equivalence](entries/dms-star6/artifact/lean/pack5/src/Star6Equiv.lean#L174) · [axioms](entries/dms-star6/artifact/lean/pack3/build/axioms.log) |
| [`erdos-m2-formalizations`](entries/erdos-m2-formalizations/) | 에르되시 문제 16개에 딸린 알려진 결과(formal-conjectures 명제)와 bridgeless 3정칙 그래프의 완벽 매칭 | 알려진 결과의 형식화 | 17개 묶음, 정리 24개. Schönberger 정리와 Petersen 정리(연결된 경우) 포함. 패킷에 적은 검색에서 선행 형식 증명을 찾지 못함. | — | Lean 4.33.1, 표준 공리, 파일별 컴파일; 명제가 고정한 formal-conjectures 커밋과 동일 | [packet](entries/erdos-m2-formalizations/PACKET.md) · [files](entries/erdos-m2-formalizations/artifact/bundle/) · [Petersen](entries/erdos-m2-formalizations/artifact/bundle/Star6Simple.lean#L155) · [expected axioms](entries/erdos-m2-formalizations/artifact/VERIFY.md) |
| `erdos-1038` | 에르되시 문제 #1038 | 담당 팀원 보고 | 팀원의 Lean 풀이(Lean 4.34.1). 10-03 확인: 같은 결과의 형식 증명이 이미 공개돼 있었고(plby/lean-proofs, 09-15, S. Wang의 주장 기반), 우리 서버(Lean 4.33.1)에서는 상한과 고전적 하한만 재빌드됨. 팀 주장에서 제외. | — | 보고된 Lean 4.34.1; 4.33.1로 일부만 재빌드(정확한 하한값은 메모리 부족으로 미재빌드) | 주장하지 않음; 파일은 담당 팀원 보관 |

**팀원의 hill 결과** (AutoLab 보드의 계정별 최고 기록; 동률은 같은 순위)

| hill (보드) | 팀원 | 종류 | 결과 | 순위 | 검증 | 파일 |
|---|---|---|---|---|---|---|
| Kobon 삼각형 (n = 39) | @lavaskiller | hill 결과 | 39개 직선으로 삼각형 471개; n = 39 보드 선두; 고전적 구성의 468보다 큼; 알려진 최고값을 넘었을 가능성 — 문헌 확인은 사람이 검증하지 않음; 삼각형 471개의 Lean 인증서(존재 명제) | 3계정 중 1위 | hill 평가기(Python); 배치에 대한 Lean 4.33.1 + Mathlib 인증서, 표준 공리만 사용 | [`hills/kobon-n39-lavaskiller`](entries/hills/kobon-n39-lavaskiller/) — 해, 서명된 보고서, 기록, 코드, Lean 인증서 |
| Kobon 삼각형 (n = 18) | @thomasoh0408 | hill 결과 | triangles 93; 보드의 최고값을 재현한 것이며 새 수학으로 주장하지 않음 | 공동 1위 (15계정 중 12계정 동률) | hill 평가기(Python), Lean 산출물 없음 | [`hills/kobon-triangles-thomasoh0408`](entries/hills/kobon-triangles-thomasoh0408/) — 해, 서명된 보고서 |
| Grothendieck 상수 witness | @lavaskiller | hill 결과 | gap_ppm 1,414,213, matrix_area 4, certificate_bits 80; 알려진 구성(CHSH형 2x2 witness)이며 새 수학으로 주장하지 않음 | 공동 1위 (9계정 중 7계정 동률) | hill 평가기(Python); witness와 이 행렬의 상한에 대한 Lean 4.33.1 + Mathlib 인증서, 표준 공리만 사용 | [`hills/grothendieck-lavaskiller`](entries/hills/grothendieck-lavaskiller/) — 해, 서명된 보고서, 기록, 코드, Lean 인증서 |
| Busy Beaver 6 인증서 | @n0rang2 | hill 결과 | 249,881 스텝, 1의 개수 554, 테이프 폭 735; 보드 최고값 재현; 새로운 수학이라고 주장하지 않음; 정지 시각·상태 방문·폭·1의 개수는 Lean으로 증명; 비공개 예산 아래의 최대성은 증명되지 않음 | 공동 1위 (12계정 중 3계정 동률) | hill 평가기(Python); Mathlib 없는 Lean 4.34.1 인증서(보조정리 2개짜리 호환 파일을 더하면 Lean 4.33.1에서도 빌드), 공리 propext·Quot.sound | [`hills/busy-beaver-6-n0rang2`](entries/hills/busy-beaver-6-n0rang2/) — 해, 서명된 보고서, 방법, 코드, 자원 사용 기록, 재현 근거, Lean 인증서 |
| K4 Ramsey 다중도 | @hl728 | hill 결과 | reference_beaten 1, density_ppt 30,141,921,123 (최종 보드); reference_beaten 1, density_ppt 30,141,720,946 (검증 보드) | 최종 모드 순위표의 유일한 기록(1명); 13계정 중 6위 (검증 보드) | hill 평가기(Python), Lean 산출물 없음 | [`hills/ramsey-hl728`](entries/hills/ramsey-hl728/) — 해, 서명된 보고서 |
| 3x3 행렬곱 텐서 | @lavaskiller | hill 결과 | rank 23, support 139; 선두 점수가 아님(선두는 support 138); Heule-Kauers-Seidl 데이터베이스의 알려진 scheme이며 새 수학으로 주장하지 않음 | 공동 2위 (11계정 중 7계정 동률) | hill 평가기(Python), Lean 산출물 없음 | [`hills/matrix-multiplication-lavaskiller`](entries/hills/matrix-multiplication-lavaskiller/) — 해, 서명된 보고서, 기록, 코드 |
| Collatz modular descent | @lavaskiller | hill 결과 | coverage_ppm 1,000,000, min_descent_ppm 525,390, rule_count 234; 선두 점수가 아님(선두는 규칙 3개); 알려진 종류의 인증서이며 새 수학으로 주장하지 않음 | 8계정 중 5위 | hill 평가기(Python), Lean 산출물 없음 | [`hills/collatz-lavaskiller`](entries/hills/collatz-lavaskiller/) — 해, 서명된 보고서, 기록, 코드 |
| K4 Ramsey 다중도 | @n0rang2 | hill 결과 | reference_beaten 1, density_ppt 30,142,185,839 | 13계정 중 9위 | hill 평가기(Python), Lean 산출물 없음 | [`hills/ramsey-n0rang2`](entries/hills/ramsey-n0rang2/) — 순위표 기록만; 이 hill의 팀 결과는 항목 ramsey-k4-multiplicity |
<!-- RESULTS:END -->

두 표는 `entries/*/ENTRY.yaml`의 `readme:` 블록과 순위표 조회 원본에서 [`tools/make_results_table.py`](tools/make_results_table.py)가 만듭니다. 손으로 고치지 않습니다. hill 결과는 hill 평가기가 준 점수이고 Lean 산출물이 없습니다. 공동 1위인 결과들은 보드의 최고값을 재현한 것이며 새 수학으로 주장하지 않습니다. Kobon n = 39 결과는 그 보드의 선두이며, 알려진 최고값을 넘었는지는 AI의 문헌 검색으로만 확인했습니다.

### 대회 hill과 팀 순위

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/hills_overview_dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/hills_overview_light.svg">
  <img alt="대회 hill: 보드별 계정을 순위 순으로, 동률은 묶음으로, 팀원은 강조" src="assets/hills_overview_light.svg" width="720">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/ramsey_leaderboard_dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/ramsey_leaderboard_light.svg">
  <img alt="Ramsey 검증 보드: 계정별 hill 기준값 대비 개선폭" src="assets/ramsey_leaderboard_light.svg" width="720">
</picture>

<details>
<summary>모든 보드 표</summary>

<!-- HILLS:START -->
| hill (보드) | 계정 수 | 선두 기록 | 팀 순위 | 선두와 동률? | 파일 |
|---|---:|---|---|---|---|
| Kobon 삼각형 (n = 18) | 15 | triangles 93 (12계정 동률) | 공동 1위 (15계정 중 12계정 동률) — @thomasoh0408 | 예: @thomasoh0408 | [`hills/kobon-triangles-thomasoh0408`](entries/hills/kobon-triangles-thomasoh0408/) |
| Kobon 삼각형 (n = 39) | 3 | triangles 471 | 3계정 중 1위 — @lavaskiller | 단독 선두: @lavaskiller | [`hills/kobon-n39-lavaskiller`](entries/hills/kobon-n39-lavaskiller/) |
| K4 Ramsey 다중도 | 13 | reference_beaten 1, density_ppt 30,139,911,990 | 13계정 중 1위 — @lavaskiller<br/>13계정 중 6위 — @hl728<br/>13계정 중 9위 — @n0rang2<br/>최종 모드 순위표의 유일한 기록(1명) — @hl728 | 단독 선두: @lavaskiller | [`ramsey-k4-multiplicity`](entries/ramsey-k4-multiplicity/) · [`hills/ramsey-hl728`](entries/hills/ramsey-hl728/) · [`hills/ramsey-n0rang2`](entries/hills/ramsey-n0rang2/) |
| 3x3 행렬곱 텐서 | 11 | rank 23, support 138 | 공동 2위 (11계정 중 7계정 동률) — @lavaskiller | 아니오 | [`hills/matrix-multiplication-lavaskiller`](entries/hills/matrix-multiplication-lavaskiller/) |
| Grothendieck 상수 witness | 9 | gap_ppm 1,414,213, matrix_area 4, certificate_bits 80 (7계정 동률) | 공동 1위 (9계정 중 7계정 동률) — @lavaskiller | 예: @lavaskiller | [`hills/grothendieck-lavaskiller`](entries/hills/grothendieck-lavaskiller/) |
| Collatz modular descent | 8 | coverage_ppm 1,000,000, min_descent_ppm 525,390, rule_count 3 (2계정 동률) | 8계정 중 5위 — @lavaskiller | 아니오 | [`hills/collatz-lavaskiller`](entries/hills/collatz-lavaskiller/) |
| Busy Beaver 6 인증서 | 12 | steps 249,881, ones 554, tape_span 735 (3계정 동률) | 공동 1위 (12계정 중 3계정 동률) — @n0rang2 | 예: @n0rang2 | [`hills/busy-beaver-6-n0rang2`](entries/hills/busy-beaver-6-n0rang2/) |
| Erdős 3 | 0 | 보드에 기록 없음 | — | — | — |
<!-- HILLS:END -->

</details>

조회 원본: [`archive/leaderboards/`](archive/leaderboards/). 그림과 순위 계산: `python tools/make_leaderboard_charts.py`. hill 결과의 담당자는 [`entries/hills/`](entries/hills/)의 자기 폴더에 해와 서명된 보고서를 올립니다(폴더마다 체크리스트가 있습니다).

## 검증 범위

> **기계가 검증한 것.** 표와 아래 항목에 이름이 나온 정리는 모두 Lean 4 선언이고, 컴파일 종료 코드 0, `#print axioms` 출력은 `propext`, `Classical.choice`, `Quot.sound`뿐입니다.
>
> **빌드 경로.** `lake build`로 빌드한 것은 DMS pack3뿐입니다. Ramsey 인증서(2112개 모듈), DMS pack4·pack5는 스크립트로 모듈별 빌드, 에르되시 파일은 고정한 커밋의 `formal-conjectures` 안에서 파일별로 컴파일했습니다. 빌드는 모두 한 대의 기계에서만 했습니다.
>
> **예외.** 기준선 정리 `MGraph.k4subdiv_star6` 하나가 `native_decide`를 쓰며, 주장한 정리는 어느 것도 여기에 기대지 않습니다([감사 표](entries/dms-star6/artifact/lean/pack3/build/audit_all.tsv)). Ramsey의 `Native.lean`도 `native_decide`를 쓰지만 아무 파일도 import하지 않습니다.
>
> **기계가 검증하지 않은 것.** (1) DMS pack4의 그래프 족은 변 목록으로 정의했고, 교과서 정의와 같은지는 [Python 스크립트](entries/dms-star6/artifact/lean/pack4/sanity_check.py)로만 확인했습니다(동형 증명 없음). (2) Ramsey 데이터는 `solution.json`에서 Lean으로 [스크립트](entries/ramsey-k4-multiplicity/artifact/lean/tools/gen.py)가 옮겨 적고 [다른 스크립트](entries/ramsey-k4-multiplicity/artifact/lean/tools/check_data.py)로 다시 확인했습니다. (3) 형식 명제가 원래 문제와 같은 뜻인지는 각 패킷의 대응 설명을 보십시오.
>
> **사람 검토.** 팀은 주장 명제와 명제 대응 설명을 팀원이 검토했다고 보고했습니다. 검토자 이름·범위·날짜는 [TEAM.md](TEAM.md)에 채워야 합니다.

## 항목

- **1 · [`ramsey-k4-multiplicity`](entries/ramsey-k4-multiplicity/)** — 1024 블록 가중 2-색칠 틀. 단색 K4 밀도가 hill 기준값보다 낮음. hill 실험 `bc2c24e3` 통과(`reference_beaten = 1`; 10-03 개선된 틀, 이전 실험 `1ab2354d`). 대표 정리: [`ramseyMultK4_limit_lt_ref`](entries/ramsey-k4-multiplicity/artifact/lean_v2/RamseyCert/Final.lean#L39). 순위: 서명된 공식 보고서(2026-10-03T02:43:23Z, `density_ppt` 30,139,911,990)는 `passed: true`, `official: true`; 검증 보드 13계정 중 1위(위 표). 최종 모드(held-out) 평가는 없음(같은 해를 최종 모드로 평가하려던 실험 `217d0ba2`는 hill이 명령줄에서 "final" 매개변수를 받지 않아 실패). 한계: 상계일 뿐이며 c_4의 값을 정한 것이 아님.
- **2 · [`dms-star6`](entries/dms-star6/)** — **추측은 증명하지 못했습니다.** 무한 족(flower·Goldberg snark, GP(n,k) k ≤ 15, Möbius 사다리)의 5색, 14꼭짓점 이하 bridgeless 3정칙 다중그래프의 6색, 동치 [`dms_iff_cubic16`](entries/dms-star6/artifact/lean/pack5/src/Star6Equiv.lean#L174), 조건부 환원 사슬. 한계: 환원 사슬의 가설은 모두 미해결.
- **3 · [`erdos-m2-formalizations`](entries/erdos-m2-formalizations/)** — 17개 묶음, 정리 24개(10-03에 E477, E358, E619, E1148 추가). Schönberger 정리와 Petersen 정리(연결된 경우, [`Star6Simple.lean`](entries/erdos-m2-formalizations/artifact/bundle/Star6Simple.lean#L155)) 포함. 한계: "새것"은 패킷에 적은 검색에서 선행 형식 증명을 못 찾았다는 뜻뿐.
- **4 · `erdos-1038`** — 팀원의 에르되시 문제 #1038 Lean 풀이(Lean 4.34.1). **팀 주장에서 제외**: 10-03 확인 결과 같은 결과의 형식 증명이 09-15부터 공개돼 있었고(plby/lean-proofs, S. Wang의 증명 주장 기반), 우리 도구(Lean 4.33.1)로는 상한 2√2와 고전적 하한만 재빌드됨(정확한 하한값 모듈은 메모리 초과). 파일은 담당 팀원이 보관.

## 검증 방법

저장소 루트에는 Lean 프로젝트가 없습니다. 항목마다 따로 있고, 정확한 명령·예상 출력·시간·메모리는 각 artifact의 README에 있습니다: [Ramsey](entries/ramsey-k4-multiplicity/artifact/README.md) · [DMS](entries/dms-star6/artifact/README.md) · [에르되시](entries/erdos-m2-formalizations/artifact/VERIFY.md). 파일 무결성은 각 `artifact/`에서 `sha256sum -c SHA256SUMS`.

```bash
cd entries/ramsey-k4-multiplicity/artifact/lean && lake exe cache get && bash tools/build.sh . RamseyCert 6
cd entries/dms-star6/artifact/lean/pack3 && lake update && lake exe cache get && lake build
```

## 사용한 자원

2026-09-27~10-03(KST)에 기록된 AI 사용량은 출력 토큰 약 **8,150만**, 세션 2,145개입니다: 서버 하네스의 Claude 6,710만, 노트북 Claude Code 240만, codex CLI의 GPT 1,200만. 주의: 노트북 보조 세션의 출력은 하한이고, 하네스의 첫 몇 시간(노트북 WSL)과 `erdos-1038` 작업은 들어 있지 않습니다. 모두 구독 요금제였고, 비용 수치는 하네스에 대해 도구가 보고한 API 정가 환산 3,718달러 이상(하한, 토큰당 청구된 것은 없음)뿐입니다. CPU 시간은 대부분 기록이 없고 사람 시간은 기록하지 않았습니다.

### 토큰이 어디에 쓰였나

거의 전부가 DMS 항목입니다(일주일간 돌린 에이전트 하네스). 에르되시 형식화는 출력 86만, Ramsey 인증서는 12만 토큰입니다.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/tokens_by_entry_dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/tokens_by_entry_light.svg">
  <img alt="항목별 출력 토큰 (에이전트 계열별)" src="assets/tokens_by_entry_light.svg" width="720">
</picture>

### 언제 쓰였나

하네스는 09-28부터 10-01까지 전체 규모로 돌았고, 10-01에 Claude worker가 주간 한도에 닿은 뒤로는 GPT worker가 이어갔습니다.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/tokens_per_day_dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/tokens_per_day_light.svg">
  <img alt="날짜별 출력 토큰 (에이전트 계열별)" src="assets/tokens_per_day_light.svg" width="720">
</picture>

### 계산

서버 job의 용도별 기록된 wall 시간입니다. 감사·에이전트 job은 대부분 모델 응답을 기다리는 시간이라 CPU 시간이 아닙니다. Ramsey 인증서 자체는 4.7 CPU시간, 개선된 틀에 맞춰 다시 만든 인증서는 3.9 CPU시간입니다.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/compute_by_purpose_dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/compute_by_purpose_light.svg">
  <img alt="용도별 기록된 wall 시간" src="assets/compute_by_purpose_light.svg" width="720">
</picture>

### 수치와 주의

<details>
<summary>항목별 표 (토큰, 세션, 시간, Lean 줄 수, 정리 수)</summary>

<!-- RESOURCES:START -->
| 항목 | 출력 토큰 | 입력(캐시 제외) | 캐시 토큰 | 세션 수 | 기록된 wall 시간 | Lean 줄 수 | 주장 정리 수 |
|---|---:|---:|---:|---:|---:|---:|---:|
| `dms-star6` | 78,313,222 | 79,895,063 | 9,635,136,505 | 2,094 | 77.8 + | 81,622 | 45 |
| `erdos-m2-formalizations` | 860,456 | 3,716,184 | 244,039,536 | 26 | 9.6 | 2,791 | 24 |
| `ramsey-k4-multiplicity` | 115,493 | 459,889 | 91,122,328 | 6 | 16.1 + | 104,665 | 8 |
| shared/steering | 2,165,675 | 5,130 | 923,843,294 | 19 |  |  |  |
| **합계** | **81,454,846** | **84,076,266** | **10,894,141,663** | **2,145** | | **189,078** | **77** |
<!-- RESOURCES:END -->

"+"는 수치가 없는 계산 행이 있다는 뜻입니다. job들이 동시에 돌았으므로 wall 시간의 합은 경과 시간도 CPU 시간도 아닙니다. 원본과 출처: [archive/stats/SUMMARY.md](archive/stats/SUMMARY.md), [archive/stats/](archive/stats/). 그림은 `python tools/make_charts.py`, 표는 `python tools/make_results_table.py`로 다시 만듭니다.

</details>

## 팀

팀 **HTPeo**.

<table>
  <tr>
    <td align="center" width="170"><a href="https://github.com/lavaskiller"><img src="https://github.com/lavaskiller.png?size=96" width="96" height="96" alt="lavaskiller"/><br/><sub><b>@lavaskiller</b></sub></a><br/><sub>HTPeo, KyungHee Univ. CS&amp;E</sub><br/><sub>에이전트 하네스(DMS), Ramsey 탐색과 Lean 인증서, 에르되시 형식화, 패킷</sub></td>
    <td align="center" width="170"><a href="https://github.com/hl728"><img src="https://github.com/hl728.png?size=96" width="96" height="96" alt="hl728"/><br/><sub><b>@hl728</b></sub></a><br/><sub>K4 Ramsey hill (검증 보드와 최종 보드 평가)</sub></td>
    <td align="center" width="170"><a href="https://github.com/n0rang2"><img src="https://github.com/n0rang2.png?size=96" width="96" height="96" alt="n0rang2"/><br/><sub><b>@n0rang2</b></sub></a><br/><sub>Busy Beaver 6, K4 Ramsey hill</sub></td>
    <td align="center" width="170"><a href="https://github.com/thomasoh0408"><img src="https://github.com/thomasoh0408.png?size=96" width="96" height="96" alt="thomasoh0408"/><br/><sub><b>@thomasoh0408</b></sub></a><br/><sub>Kobon 삼각형 hill</sub></td>
  </tr>
</table>

@hl728, @n0rang2, @thomasoh0408의 역할은 hill 순위표에서 가져온 것이며 각자 [TEAM.md](TEAM.md)에서 완성합니다. 이름, 소속, 한 일, 검토한 부분도 각자 TEAM.md의 자기 칸에 적습니다.

팀원의 hill 순위는 [한눈에 보는 결과](#한눈에-보는-결과)에 있습니다.

## 아카이브와 그 밖

- [archive/REPORT.ko.md](archive/REPORT.ko.md) — 팀 보고서(결과, 발견점, 자원). 기준 문서는 영어 [REPORT.md](archive/REPORT.md).
- [archive/timeline.ko.md](archive/timeline.ko.md) — 날짜별 기록과 출처(영어: [timeline.md](archive/timeline.md)).
- [archive/findings/](archive/findings/) — 주제별 발견점과 실패한 시도(영어 본문과 `*.ko.md`).
- [archive/STATS_REQUEST.ko.md](archive/STATS_REQUEST.ko.md) — 팀원별 통계를 뽑는 방법(영어: [STATS_REQUEST.md](archive/STATS_REQUEST.md)).
- [CONTRIBUTING.ko.md](CONTRIBUTING.ko.md) — 올리는 규칙 요약(전문은 영어 [CONTRIBUTING.md](CONTRIBUTING.md)).
- 인용 정보는 [CITATION.cff](CITATION.cff). 라이선스는 팀이 정할 예정이며, 저장소는 마감까지 팀 비공개입니다.
