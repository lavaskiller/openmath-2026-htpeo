# OpenMath 2026 — HTPeo 제출물과 아카이브

이 저장소는 두 가지를 담습니다.

1. **제출물(`entries/`)** — 대회에 낸 결과물 그 자체. 항목마다 패킷, 형식 증명 소스, 검증 방법이 들어 있고, 제출 시점의 내용은 태그로 고정합니다.
2. **아카이브(`archive/`)** — 대회에서 무엇을 했고 무엇을 배웠는지 팀이 함께 쓰는 기록. 결과, 실패한 시도, 사용한 자원 통계.

올리는 방법은 [CONTRIBUTING.md](CONTRIBUTING.md), 팀원에게 요청하는 정보는 [archive/STATS_REQUEST.md](archive/STATS_REQUEST.md)에 있습니다.

## 제출 항목

| 항목 | 대상 문제 | 모드 | 형식 검증 | 상태 | 담당 | 고정 태그 |
|---|---|---|---|---|---|---|
| [ramsey-k4-multiplicity](entries/ramsey-k4-multiplicity/) | K4 Ramsey 다중도 상수의 상계 | M3A(제안) | Lean 4.33.1, 표준 공리 | hill 통과·패킷 완성 | TODO | `ramsey-v1` |
| [dms-star6](entries/dms-star6/) | Dvořák–Mohar–Šámal 추측(star chromatic index ≤ 6) — 부분 결과 | M3A(제안) | Lean 4.33.1, 표준 공리 | 패킷 완성 | TODO | `dms-v1` |
| [erdos-1038](entries/erdos-1038/) | 에르되시 문제 #1038 | | Lean 4.34.1, 표준 공리 | | | |
| [erdos-m2-formalizations](entries/erdos-m2-formalizations/) | 에르되시 문제들의 알려진 결과 형식화(13개 묶음) | M2 | Lean 4.33.1, 표준 공리 | 패킷 완성(v2) | TODO | `erdos-m2-v1` |

(표의 빈칸은 담당자가 채웁니다. 상태는 `작업 중 / 패킷 완성 / 제출됨 / 심사 결과` 중 하나.)

## 폴더 구조

```
README.md               이 파일 (항목 표)
CONTRIBUTING.md         올리는 규칙
entries/
  _TEMPLATE/            새 항목을 만들 때 복사하는 틀
  <항목 이름>/
    ENTRY.yaml          항목 메타데이터 (기계가 읽는 요약)
    PACKET.md           대회에 낸 패킷 (규정집 §8 구조)
    artifact/           형식 증명 소스, 해, 평가 보고서, 재현 스크립트, SHA256SUMS
    STATS.yaml          이 항목에 쓴 자원 (토큰, 계산 시간 등)
    NOTES.md            (선택) 과정 기록: 통한 것, 안 통한 것
archive/
  REPORT.md             팀 공유 문서 본문 (결과와 발견점)
  timeline.md           날짜별 진행
  findings/             주제별 발견점 (항목과 무관한 것 포함)
  stats/                팀원별 통계 원본과 합산표
  STATS_REQUEST.md      통계 요청서 (무엇을 어떻게 뽑는지)
tools/                  체크섬·검증·합산 스크립트
```

## 재현

항목마다 `entries/<이름>/artifact/README.md`에 정확한 명령이 있습니다. 공통 사항:

- Lean 툴체인과 Mathlib 버전은 항목의 `ENTRY.yaml`에 적혀 있습니다.
- `sha256sum -c SHA256SUMS`로 파일이 제출 당시와 같은지 확인합니다.
- 빌드 산출물(`.lake`, `.olean`)은 저장소에 없습니다.
