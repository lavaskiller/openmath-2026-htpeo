# Team HTPeo — roster

Fill in your own block: replace every `____`. It takes two minutes. The packets in `entries/*/PACKET.md` and the Team section of the README refer to this file.
After filling in, update the role line under your avatar in `README.md` and `README.ko.md` if it should say something else. Lines already filled in for you come from the repository and the leaderboards; correct them if wrong.

"Already known" lines were read from the AutoLab leaderboard API at 2026-10-02T18:04Z (2026-10-03 03:04 KST) (raw responses in `archive/leaderboards/`) or from this repository; correct them if wrong.

## @lavaskiller

<img src="https://github.com/lavaskiller.png?size=64" width="64" height="64" alt="lavaskiller"/>

| Field | Value |
|---|---|
| GitHub | [@lavaskiller](https://github.com/lavaskiller) |
| Name | Woohyuk Kang |
| Affiliation | HTPeo, KyungHee Univ. CS&E |
| E-mail | lead@htpeo.com |
| Entries worked on | `ramsey-k4-multiplicity`, `dms-star6`, `erdos-m2-formalizations` |
| Role / contribution | Operated the multi-agent harness that produced the DMS fact graph and Lean chain; ran the K4 Ramsey search, its hill submission and the Lean certificate; ran the Erdős formalization sessions, their verification and prior-art checks; assembled the packets and this repository. |
| Human review done | Not performed, as declared by Woohyuk Kang on 2026-10-03. The checks are the Lean kernel, the build and axiom logs, scripts, and cross-checks by AI models; none of them is a human review. |
| AI tools and accounts used | Claude Code sessions (claude-opus-5-5); agent harness with Claude workers (claude-opus-5-5, claude-sonnet-5, claude-fable-5-1) and GPT workers through the codex CLI (gpt-5.6-sol until 2026-09-30, gpt-6-sol after); subscription plans |
| Time spent (hours, rough) | about 52 (estimate: active time over the 492 operator messages of the Claude Code sessions on the team laptop, 2026-09-27 to 2026-10-03 KST, gaps over 30 minutes counted as 30 minutes; Discord, server and offline time not included) |
| Approves attribution and release | Woohyuk Kang, 2026-10-03 (entered at the member's instruction) |

Already known:

- AutoLab account `lavaskiller` (owner of the Ramsey project `clique-cluster-ramsey-multiplicity-attempt-16`)
- K4 Ramsey multiplicity hill: 1st of 13 (validation board, no ties), 30,139,911,990 ppt, 2026-10-03 (earlier 30,139,933,996 on 2026-10-02)
- Kobon triangles hill, board n = 39: 1st of 3, alone, 471 triangles, 2026-10-03 (experiment `38b81af6`); possibly a new best known value, literature check not human-verified. Files: [`entries/hills/kobon-n39-lavaskiller/`](entries/hills/kobon-n39-lavaskiller/)
- Grothendieck constant witnesses hill: tied for 1st, 7 of 9 accounts, gap_ppm 1,414,213 / matrix_area 4 / certificate_bits 80, 2026-10-03 (experiment `2552e287`); known construction, not claimed as new. Files: [`entries/hills/grothendieck-lavaskiller/`](entries/hills/grothendieck-lavaskiller/)
- Commit author of this repository

## @hl728

<img src="https://github.com/hl728.png?size=64" width="64" height="64" alt="hl728"/>

| Field | Value |
|---|---|
| GitHub | [@hl728](https://github.com/hl728) |
| Name | Hyunjin Lee |
| Affiliation | University of Cambridge |
| E-mail | hl728@cam.ac.uk |
| Entries worked on | `entries/hills/ramsey-hl728/` (submitted); separate local research on Erdős problem #1038 and the 3×3 matrix-multiplication hill |
| Role / contribution | Directed AI-assisted literature research and local K4 Ramsey template refinement; selected and submitted validation/final hill reports; preserved the evaluated certificates, signed reports and receipts, and documented provenance and limits. Separately directed Erdős #1038 Lean formalization, numerical certification and audits, and public-seed 3×3 matrix-multiplication search; these are separate from the submitted Ramsey hill record. |
| Human review done | Not performed, as declared by Hyunjin Lee on 2026-10-03. The computed and AI-assisted checks in the Ramsey [README](entries/hills/ramsey-hl728/README.md) and [NOTES](entries/hills/ramsey-hl728/NOTES.md) are not human review. |
| AI tools and accounts used | Personal OpenAI account via ChatGPT on the web (model identifiers not recorded) and Codex desktop/agent/CLI sessions (`gpt-6-astra`, `gpt-6.1-sol`, confirmed in local session metadata); Codex worker agents assisted research, implementation and audits. AutoLab account `hl728`, hosted seed climb and `autolab`/`hills` CLI for evaluations/submissions; the hosted seed agent model is not recorded here. Python exact arithmetic and scientific/symbolic tools; Lean 4 and Mathlib for the separate Erdős work. Local session metadata confirms the model identifiers; no account e-mails, keys or raw conversations are included. |
| Time spent (hours, rough) | Approximately 20 hours or more (member-reported rough estimate, confirmed by Hyunjin Lee on 2026-10-03), including work using ChatGPT on the web and directing, checking and documenting the OpenMath work. This is human time; unattended agent/search/build time is excluded. |
| Approves attribution and release | Yes — Hyunjin Lee, 2026-10-03; personally confirmed attribution and release of this profile and the current Ramsey hill submission records. |

Already known:

- K4 Ramsey multiplicity hill: only entry on the final (held-out) board (1 account), 30,141,921,123 ppt, 2026-09-29
- K4 Ramsey multiplicity hill: 5th of 12 (validation board), 30,141,720,946 ppt, 2026-09-30
- Uploaded: the exact final-board `solution.json` and signed `report.json`, the later validation pair, submission receipts and provenance notes in [`entries/hills/ramsey-hl728/`](entries/hills/ramsey-hl728/); [PR #5](https://github.com/lavaskiller/openmath-2026-htpeo/pull/5) merged on 2026-10-03.

## @n0rang2

<img src="https://github.com/n0rang2.png?size=64" width="64" height="64" alt="n0rang2"/>

| Field | Value |
|---|---|
| GitHub | [@n0rang2](https://github.com/n0rang2) |
| Name | Sanghyeon Lee |
| Affiliation | Korea Univ. Security |
| E-mail | ymhlsh4065@korea.ac.kr |
| Entries worked on | `entries/hills/busy-beaver-6-n0rang2/`, `entries/hills/ramsey-n0rang2/`, `entries/erdos-1038/` (with @hl728) |
| Role / contribution | Busy Beaver 6 hill: the 249,881-step machine, its Lean certificates, the replay evidence and the structural maximality computation; K4 Ramsey hill (validation board); Erdős #1038 with @hl728 (from the uploaded files and the team chat) |
| Human review done | not stated by the member (left blank at the deadline) |
| AI tools and accounts used | AutoLab coding agent (Claude Haiku 4.5), Codex desktop (see `entries/hills/busy-beaver-6-n0rang2/STATS.yaml`); Claude Code sessions (claude-opus-5-5); GPT workers through the codex CLI (gpt-6-Sol, gpt-6-Astra, gpt-6.1-Sol); subscription plans |
| Time spent (hours, rough) | not stated by the member |
| Approves attribution and release | Sanghyeon Lee, 2026-10-03 — recorded by the team lead @lavaskiller on the member's behalf, not entered by the member personally |

Already known:

- Busy Beaver 6 certificates hill: tied for 1st, 3 of 12 accounts (validation; the platform lists tied accounts alphabetically), 249,881 steps; reproduces the board's best value; not claimed as new mathematics, 2026-09-28
- K4 Ramsey multiplicity hill: 8th of 12 (validation board), 30,142,185,839 ppt, 2026-09-30
- [`entries/hills/ramsey-n0rang2/`](entries/hills/ramsey-n0rang2/) is a leaderboard record only: nothing to upload there (the team's result on that hill is `ramsey-k4-multiplicity`)
- Uploaded: [`entries/hills/busy-beaver-6-n0rang2/`](entries/hills/busy-beaver-6-n0rang2/) (checklist complete, Lean certificate included)

## @thomasoh0408

<img src="https://github.com/thomasoh0408.png?size=64" width="64" height="64" alt="thomasoh0408"/>

| Field | Value |
|---|---|
| GitHub | [@thomasoh0408](https://github.com/thomasoh0408) |
| Name | Youchan Oh |
| Affiliation | Seoul National Univ. TI |
| E-mail | thomasoh0408@snu.ac.kr |
| Entries worked on | `entries/hills/kobon-triangles-thomasoh0408/` |
| Role / contribution | Kobon triangles hill, board n = 18: 93 triangles (tied for 1st), with an AutoLab coding agent; report, code and STATS uploaded |
| Human review done | not stated by the member (left blank at the deadline) |
| AI tools and accounts used | AutoLab coding-agent project with Claude Opus 5.5 (see `entries/hills/kobon-triangles-thomasoh0408/STATS.yaml`); Claude Code sessions (claude-opus-5-5); GPT workers through the codex CLI (gpt-6-Sol, gpt-6-Astra); subscription plans |
| Time spent (hours, rough) | not stated by the member |
| Approves attribution and release | Youchan Oh, 2026-10-03 — recorded by the team lead @lavaskiller on the member's behalf, not entered by the member personally |

Already known:

- Kobon triangles hill: tied for 1st, 12 of 15 accounts (validation, board n = 18; the platform lists tied accounts alphabetically), 93 triangles; reproduces the board's best value; not claimed as new mathematics, 2026-09-28
- GitHub id confirmed by the team (2026-10-03)
- To upload: your hill files in [`entries/hills/kobon-triangles-thomasoh0408/`](entries/hills/kobon-triangles-thomasoh0408/) (checklist inside)

## Team-level fields

| Field | Value |
|---|---|
| Team name | HTPeo |
| Entrant class | Team |
| Contact e-mail | lead@htpeo.com |
| Owner of each entry | ramsey-k4-multiplicity: @lavaskiller · dms-star6: @lavaskiller · erdos-m2-formalizations: @lavaskiller · erdos-1038: @hl728 with @n0rang2, not claimed (a formal proof was already public; see `entries/erdos-1038/`) |
| Usage statistics | each member adds `archive/stats/<github id>.yaml` (see `archive/STATS_REQUEST.md`) |
