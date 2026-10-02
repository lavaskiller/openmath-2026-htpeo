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

심사자와 외부 독자를 위한 본문은 [README.md](README.md)(영어)입니다. 이 파일은 팀용 요약이고, 표 두 개는 같은 스크립트가 만듭니다.

## 대회

- **행사**: 패킷에서는 "OpenMath 2026"이라 부르며, 공식 규정집의 제목은 *Open Problems Hack at MIT*입니다([규정집](https://rsihouse.ai/openmath/handbook.pdf), [행사 페이지](https://luma.com/yzp9abvr)). 형식화된 결과만 점수가 됩니다.
- **기간**: 2026-09-27(일) 정오(미 동부) 개회·상태 동결, 제출 마감은 10-03(토) 00:00 EDT(13:00 KST) 전.
- **플랫폼**: [AutoLab](https://app.autolab.ai). Hill은 평가기가 붙은 과제이고, 규정집에 따르면 Hill 통과는 필요하지만 그 자체로 수학적 증명은 아닙니다.
- **우리 항목의 모드**: Ramsey와 DMS는 M3A(제안, 인정 여부는 주최 측 결정), 형식화 묶음은 M2(인정된 묶음 수로 따로 순위).

## 한눈에 보는 결과

<!-- RESULTS:START -->
| 항목 | 대상 문제 | 종류 | 결과 | 검증 | 링크 |
|---|---|---|---|---|---|
| [`ramsey-k4-multiplicity`](entries/ramsey-k4-multiplicity/) | K4 Ramsey 다중도 상수 c_4 (상계) | 새 결과 | c_4 ≤ 0.030139933996 (hill 지표 `density_ppt` 30,139,933,996). 이전 최고: 10486266368/768^4 ≈ 0.030142273432 (30,142,273,432), McKay, hill 기준값. | Lean 4.33.1, 표준 공리, 모듈별 빌드; hill 실험 통과 | [packet](entries/ramsey-k4-multiplicity/PACKET.md) · [theorem](entries/ramsey-k4-multiplicity/artifact/lean/RamseyCert/Final.lean#L39) · [axioms](entries/ramsey-k4-multiplicity/artifact/lean/logs/RamseyCert.Final.log) · [hill report](entries/ramsey-k4-multiplicity/artifact/runs/report_1ab2354d.json) |
| [`dms-star6`](entries/dms-star6/) | Dvořák–Mohar–Šámal 추측: subcubic 그래프의 star chromatic index ≤ 6 (미해결; 알려진 최선의 상계 7) | 부분 결과 | 추측 자체는 증명하지 못함. 증명한 것: flower·Goldberg snark, GP(n,k) (k ≤ 15), Möbius 사다리는 5색; 14꼭짓점 이하의 모든 bridgeless 3정칙 다중그래프는 6색; 동치 `dms_iff_cubic16`; 이름 붙인 미해결 가설들로의 환원. | Lean 4.33.1, 표준 공리; `lake build`(pack3), 모듈별 빌드(pack4, pack5) | [packet](entries/dms-star6/PACKET.md) · [families](entries/dms-star6/artifact/lean/pack4/src/Families.lean#L68) · [≤ 14 vertices](entries/dms-star6/artifact/lean/pack5/src/Star6Corollaries.lean#L48) · [equivalence](entries/dms-star6/artifact/lean/pack5/src/Star6Equiv.lean#L174) · [axioms](entries/dms-star6/artifact/lean/pack3/build/axioms.log) |
| [`erdos-m2-formalizations`](entries/erdos-m2-formalizations/) | 에르되시 문제 12개에 딸린 알려진 결과(formal-conjectures 명제)와 bridgeless 3정칙 그래프의 완벽 매칭 | 알려진 결과의 형식화 | 13개 묶음, 정리 19개. Schönberger 정리와 Petersen 정리(연결된 경우) 포함. 패킷에 적은 검색에서 선행 형식 증명을 찾지 못함. | Lean 4.33.1, 표준 공리, 파일별 컴파일; 명제가 고정한 formal-conjectures 커밋과 동일 | [packet](entries/erdos-m2-formalizations/PACKET.md) · [files](entries/erdos-m2-formalizations/artifact/bundle/) · [Petersen](entries/erdos-m2-formalizations/artifact/bundle/Star6Simple.lean#L155) · [expected axioms](entries/erdos-m2-formalizations/artifact/VERIFY.md) |
| `erdos-1038` | 에르되시 문제 #1038 | 담당 팀원 보고 | 팀원이 완전한 Lean 풀이를 보고함. 아직 이 저장소에 없음. | Lean 4.34.1 (보고된 값, 여기서 재확인하지 않음) | 담당 팀원이 추가 예정 |
<!-- RESULTS:END -->

표는 `entries/*/ENTRY.yaml`의 `readme:` 블록에서 [`tools/make_results_table.py`](tools/make_results_table.py)가 만듭니다. 손으로 고치지 않습니다. "종류"는 *새 결과 / 부분 결과 / 알려진 결과의 형식화* 셋 중 하나입니다.

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

- **1 · [`ramsey-k4-multiplicity`](entries/ramsey-k4-multiplicity/)** — 1024 블록 가중 2-색칠 틀. 단색 K4 밀도가 hill 기준값보다 낮음. hill 실험 `1ab2354d` 통과(`reference_beaten = 1`). 대표 정리: [`ramseyMultK4_limit_lt_ref`](entries/ramsey-k4-multiplicity/artifact/lean/RamseyCert/Final.lean#L39). 순위: 서명된 공식 보고서(2026-10-02T11:38:08Z)는 `passed: true`, `official: true`, `density_ppt` 30,139,933,996. 상태 동결 시점(09-27) 선두는 간접 기록으로 30,141,720,824. 팀은 2026-10-02(KST)에 hill 순위표 1위였다고 보고했으며, 순위표 화면은 추가 예정입니다(`assets/leaderboard_<date>.png`). 한계: 상계일 뿐이며 c_4의 값을 정한 것이 아님. hill 순위표(검증 모드, 사용자별 최고 기록) 2026-10-03 01:18 KST 조회 기준 **12명 중 1위**, 2위 30,140,425,027(49만 ppt 차). 최종 모드(held-out) 평가는 아직 없음. [조회 원본](entries/ramsey-k4-multiplicity/leaderboard/leaderboard_2026-10-02T161850Z.json)
- **2 · [`dms-star6`](entries/dms-star6/)** — **추측은 증명하지 못했습니다.** 무한 족(flower·Goldberg snark, GP(n,k) k ≤ 15, Möbius 사다리)의 5색, 14꼭짓점 이하 bridgeless 3정칙 다중그래프의 6색, 동치 [`dms_iff_cubic16`](entries/dms-star6/artifact/lean/pack5/src/Star6Equiv.lean#L174), 조건부 환원 사슬. 한계: 환원 사슬의 가설은 모두 미해결.
- **3 · [`erdos-m2-formalizations`](entries/erdos-m2-formalizations/)** — 13개 묶음, 정리 19개. Schönberger 정리와 Petersen 정리(연결된 경우, [`Star6Simple.lean`](entries/erdos-m2-formalizations/artifact/bundle/Star6Simple.lean#L155)) 포함. 한계: "새것"은 패킷에 적은 검색에서 선행 형식 증명을 못 찾았다는 뜻뿐.
- **4 · `erdos-1038`** — 팀원이 보고한 에르되시 문제 #1038의 완전한 Lean 풀이(Lean 4.34.1). 폴더와 검증 기록은 담당 팀원이 추가합니다. 추가 방법은 [CONTRIBUTING.md](CONTRIBUTING.md), 추가한 뒤 [`entries/PENDING.yaml`](entries/PENDING.yaml)의 행을 지우고 표를 다시 만듭니다.

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

서버 job의 용도별 기록된 wall 시간입니다. 감사·에이전트 job은 대부분 모델 응답을 기다리는 시간이라 CPU 시간이 아닙니다. Ramsey 인증서 자체는 4.7 CPU시간.

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
| `erdos-m2-formalizations` | 860,456 | 3,716,184 | 244,039,536 | 26 | 9.6 | 2,791 | 19 |
| `ramsey-k4-multiplicity` | 115,493 | 459,889 | 91,122,328 | 6 | 13.1 + | 104,665 | 8 |
| shared/steering | 2,165,675 | 5,130 | 923,843,294 | 19 |  |  |  |
| **합계** | **81,454,846** | **84,076,266** | **10,894,141,663** | **2,145** | | **189,078** | **72** |
<!-- RESOURCES:END -->

"+"는 수치가 없는 계산 행이 있다는 뜻입니다. job들이 동시에 돌았으므로 wall 시간의 합은 경과 시간도 CPU 시간도 아닙니다. 원본과 출처: [archive/stats/SUMMARY.md](archive/stats/SUMMARY.md), [archive/stats/](archive/stats/). 그림은 `python tools/make_charts.py`, 표는 `python tools/make_results_table.py`로 다시 만듭니다.

</details>

## 팀

팀 **HTPeo**.

<table>
  <tr>
    <td align="center" width="170"><a href="https://github.com/lavaskiller"><img src="https://github.com/lavaskiller.png?size=96" width="96" height="96" alt="lavaskiller"/><br/><sub><b>@lavaskiller</b></sub></a><br/><sub><i>역할 — 각자 기입</i></sub></td>
    <td align="center" width="170"><a href="https://github.com/hl728"><img src="https://github.com/hl728.png?size=96" width="96" height="96" alt="hl728"/><br/><sub><b>@hl728</b></sub></a><br/><sub><i>역할 — 각자 기입</i></sub></td>
    <td align="center" width="170"><a href="https://github.com/n0rang2"><img src="https://github.com/n0rang2.png?size=96" width="96" height="96" alt="n0rang2"/><br/><sub><b>@n0rang2</b></sub></a><br/><sub><i>역할 — 각자 기입</i></sub></td>
    <td align="center" width="170"><a href="https://github.com/thomasoh0408"><img src="https://github.com/thomasoh0408.png?size=96" width="96" height="96" alt="thomasoh0408"/><br/><sub><b>@thomasoh0408</b></sub></a><br/><sub><i>역할 — 각자 기입</i></sub></td>
  </tr>
</table>

각자 [TEAM.md](TEAM.md)의 자기 칸(이름, 소속, 이메일, 한 일, 검토한 부분)을 채우고, 아바타 아래 줄을 자기 역할 한 줄로 바꿉니다.

### 팀원의 hill 순위

AutoLab 순위표 API 조회 2026-10-02T16:23Z (2026-10-03 01:23 KST) 기준, 계정별 최고 기록. 마감 전까지 바뀔 수 있습니다. 원본: [`archive/leaderboards/`](archive/leaderboards/).

| 팀원 | hill | 모드 | 순위 | 기록 |
|---|---|---|---:|---|
| @lavaskiller | K4 Ramsey 다중도 | 검증 | 12명 중 1 | 밀도 30,139,933,996 ppt |
| @hl728 | K4 Ramsey 다중도 | 최종(held-out) | 1명 중 1 | 밀도 30,141,921,123 ppt |
| @hl728 | K4 Ramsey 다중도 | 검증 | 12명 중 5 | 밀도 30,141,720,946 ppt |
| @n0rang2 | K4 Ramsey 다중도 | 검증 | 12명 중 8 | 밀도 30,142,185,839 ppt |
| @n0rang2 | Busy Beaver 6 | 검증 | 12명 중 3 | 249,881 스텝(1위와 같은 값) |
| @thomasoh0408 | Kobon 삼각형 | 검증 | 15명 중 11 | 삼각형 93개(1위와 같은 값) |

## 아카이브와 그 밖

- [archive/REPORT.md](archive/REPORT.md) — 팀 보고서(결과, 발견점, 자원).
- [archive/timeline.md](archive/timeline.md) — 날짜별 기록과 출처.
- [archive/findings/](archive/findings/) — 주제별 발견점과 실패한 시도.
- [archive/STATS_REQUEST.md](archive/STATS_REQUEST.md) — 팀원별 통계를 뽑는 방법.
- 인용 정보는 [CITATION.cff](CITATION.cff). 라이선스는 팀이 정할 예정이며, 저장소는 마감까지 팀 비공개입니다.
