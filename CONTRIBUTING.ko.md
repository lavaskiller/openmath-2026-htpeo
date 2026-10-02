# 올리는 규칙 (요약)

전문은 영어 [CONTRIBUTING.md](CONTRIBUTING.md)입니다. 이 파일은 한 쪽 요약입니다.

## 빠른 순서

1. 브랜치를 만듭니다: `git switch -c entry/<이름>` (또는 `hill/<hill>-<id>`, `team/<id>`, `archive/<주제>`).
2. [TEAM.md](TEAM.md)의 자기 칸을 채웁니다.
3. 파일을 올립니다(아래).
4. 생성 스크립트를 돌리고 결과를 같이 커밋합니다.
   ```bash
   python tools/make_results_table.py
   python tools/make_leaderboard_charts.py
   python tools/make_charts.py          # 통계가 바뀐 경우만
   ```
5. `git diff --cached`를 읽어 본 뒤 커밋하고 PR을 엽니다. 다른 팀원 한 명이 점검표를 확인하고 병합합니다.

## 항목 추가

- `entries/_TEMPLATE/`를 `entries/<이름>/`으로 복사하고 `ENTRY.yaml`을 채웁니다. 모르는 칸은 지우지 말고 사유와 함께 `TODO`.
- `ENTRY.yaml`의 `readme:` 블록이 첫 화면 표의 한 줄입니다: `kind`는 `new result` / `partial results` / `formalization of known results` 중 하나, `result`는 한 줄(이전 최고 기록을 옆에), `links`는 실제로 있는 파일만.
- `PACKET.md`는 제출한 그대로. **제출 뒤에는 고치지 않습니다.**
- `artifact/`에는 Lean 소스, toolchain·manifest, 해·인증서·서명된 보고서, 공리 출력과 빌드 결과가 담긴 로그, 재현 스크립트, `README.md`, `SHA256SUMS`. 빌드 산출물(`.lake`, `.olean`), 큰 로그, 남의 논문 전문은 넣지 않습니다.
- `STATS.yaml`은 [archive/STATS_REQUEST.ko.md](archive/STATS_REQUEST.ko.md)를 보고 채웁니다.

## hill 결과 추가

`entries/hills/<hill>-<github id>/`에 올립니다: 평가받은 그대로의 `solution.json`, 서명된 보고서, 프로젝트·실험 id, 방법과 코드, 알려진 구성인지 여부, **validation인지 final(held-out)인지**, 평가 일시. 폴더마다 체크리스트가 있습니다.

## 손으로 고치지 않는 것

README의 `<!-- RESULTS -->`, `<!-- RESOURCES -->`, `<!-- HILLS -->` 표식 사이, `assets/`의 그림, `archive/stats/SUMMARY.md`. 데이터를 고치고 스크립트를 돌립니다. 올리기 전에 `python tools/make_results_table.py --check`와 `python tools/make_leaderboard_charts.py --check`가 "unchanged"여야 합니다.

## 정직하게 쓰기

- 검증 수준을 섞지 않습니다: **Lean 커널 검증 / 계산으로 확인 / AI가 검증 / 사람이 검토**.
- 근거 파일 링크 없는 주장은 쓰지 않습니다. 검증하지 않은 것(`sorry`, 새 공리, `native_decide`, 증명 없는 옮겨 적기)을 밝힙니다.
- 순위는 동률이면 같은 순위로 계산하고(플랫폼은 동률 계정을 알파벳 순으로 늘어놓습니다) 항상 보드 크기를 함께 적습니다: "12계정 중 1위", "공동 1위(12계정 중 3계정 동률)", "유일한 기록(1명)". "1위"만 쓰지 않습니다. 순위표는 조회 시각을 적습니다.
- hill 통과는 증명이 아니고, 보드의 최고값을 재현한 것은 새 수학이 아닙니다.

## 비밀 정보

API 키, 토큰, 비밀번호, `.env`, 서버 주소, 계정 이메일은 올리지 않습니다. 개인 정보는 각자 `TEAM.md`의 자기 칸에 직접 적은 것뿐입니다.

## 체크섬, 태그

- `bash tools/make_checksums.sh write entries/<이름>` / `verify`.
- 제출 시점은 태그로 고정: `git tag -a <항목>-v1 -m "..."`. 고칠 일이 있으면 새 커밋과 `-v2`. 태그를 옮기거나 지우지 않고, 강제 push를 하지 않습니다.

## 언어

`README.md`와 `CONTRIBUTING.md`는 영어, `README.ko.md`와 이 파일은 한국어 동반 문서입니다. 아카이브 기록은 어느 언어든 됩니다. 영어 문서를 고치면 한국어 문서도 같은 PR에서 고칩니다.
