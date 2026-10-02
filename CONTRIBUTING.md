# Contributing

Guidelines for members of team HTPeo. Korean summary: [CONTRIBUTING.ko.md](CONTRIBUTING.ko.md).

## Scope

This repository holds two things: the team's **entries** to the competition (`entries/`: packets, formal sources, hill results) and the **archive** of what we did and what it cost (`archive/`). It is not a development workspace: put finished, checkable material here, not search outputs or work in progress.

## Quick start for a member

```bash
git clone https://github.com/lavaskiller/openmath-2026-htpeo && cd openmath-2026-htpeo
git switch -c entry/<name>                 # or hill/<hill>-<id>, team/<id>, archive/<topic>
# 1. fill in your block in TEAM.md
# 2. add your files (sections below)
python tools/make_results_table.py         # 3. regenerate tables ...
python tools/make_leaderboard_charts.py    #    ... leaderboard figures and table
python tools/make_charts.py                #    ... resource charts (only if stats changed)
git add -A && git diff --cached            # 4. read what you are about to publish
git commit -m "<name>: <what changed>" && git push -u origin HEAD   # 5. open a pull request
```

Python 3 standard library only; nothing to install.

## Add or update an entry

1. Copy `entries/_TEMPLATE/` to `entries/<name>/` (lower-case letters, digits and hyphens, e.g. `erdos-1038`).
2. Fill in `ENTRY.yaml`. Keep every key; where a value is unknown write `TODO` with the reason.
   - `claims`: the exact Lean names, one line of plain words each, and the file that contains them.
   - `verification`: toolchain, Mathlib revision, the axioms printed by `#print axioms`, exceptions, the build route.
   - `readme`: the row of the landing-page table — `problem`, `kind` (exactly one of `new result`, `partial results`, `formalization of known results`), `result` (one line, previous best next to ours), `verification`, `links` (`"text|path relative to the entry"`; the generator refuses a path that does not exist). Add `hill: "<leaderboard file stem>|<account>"` if the entry is on a hill. Optional `*_ko` fields feed `README.ko.md`.
3. Put the packet in `PACKET.md` exactly as submitted. **Do not edit it after submission**; see [Tags and immutability](#tags-and-immutability).
4. Put the material in `artifact/` and write `artifact/README.md` (what is where, exact verification commands, expected output, time and memory).
5. Fill in `STATS.yaml` (see [Statistics](#statistics)) and, if useful, `NOTES.md` (what worked, what did not).
6. If the entry had a row in `entries/PENDING.yaml`, delete that row.
7. Run the generators and open a pull request.

### What goes into `artifact/`

Include:

- formal sources (`.lean`), `lean-toolchain`, `lakefile`, `lake-manifest.json`;
- solution files, certificates, the signed hill report;
- verification scripts, and the logs that carry the **`#print axioms` output and build results**;
- search or generator code (sources only);
- `README.md` and `SHA256SUMS`.

Exclude:

- build products (`.lake/`, `.olean`), virtual environments, `__pycache__`;
- intermediate search output and logs larger than a few MB;
- other people's works in full (paper PDFs): cite and link instead;
- anything listed under [Secrets and privacy](#secrets-and-privacy).

Tell the team before adding a file over 50 MB.

## Add a hill result

A hill result is a score on an AutoLab hill without a Lean artifact. It lives in `entries/hills/<hill>-<github id>/`.

- [ ] `solution.json` (or the submitted directory) exactly as evaluated
- [ ] the signed hill report (`report.json`): it carries the hill hash, the metrics, the mode and the signature
- [ ] AutoLab project name and experiment id
- [ ] how the result was obtained; code in `code/`
- [ ] whether it is a known construction (with its source) or something new
- [ ] the mode: **validation** or **final (held-out)** — say which report belongs to which, and for a final-mode run the exact command or UI steps
- [ ] `STATS.yaml` and the date and time of the evaluation, with time zone

Then update the row in `entries/hills/README.md`, refresh the snapshot in `archive/leaderboards/` if the standing changed (note the read time in its README and in `SNAPSHOT` of `tools/make_leaderboard_charts.py`), and run the generators. To promote a hill result to a full entry, add an `ENTRY.yaml` and a packet as above.

## Generated content

Never edit by hand between marker comments or inside `assets/`. Change the data, run the script, commit the output together with the data.

| Markers / files | Script | Data |
|---|---|---|
| `<!-- RESULTS:START/END -->`, `<!-- RESOURCES:START/END -->` in `README.md`, `README.ko.md` | `python tools/make_results_table.py` | `entries/*/ENTRY.yaml` (`readme:`), `entries/PENDING.yaml`, `archive/leaderboards/`, stats files |
| `<!-- HILLS:START/END -->`, `assets/hills_overview_*.svg`, `assets/ramsey_leaderboard_*.svg`, `assets/leaderboard_data.json` | `python tools/make_leaderboard_charts.py` | `archive/leaderboards/lb_*.json` |
| `assets/tokens_*.svg`, `assets/compute_by_purpose_*.svg`, `assets/chart_data.json` | `python tools/make_charts.py` | `archive/stats/*.yaml`, `entries/*/STATS.yaml` |
| `archive/stats/SUMMARY.md` | `python tools/summarize_stats.py` | the same stats files |

Before pushing, both of these must report "unchanged":

```bash
python tools/make_results_table.py --check
python tools/make_leaderboard_charts.py --check
```

## Statistics

Each member adds `archive/stats/<github id>.yaml` (template: `entries/_TEMPLATE/STATS.yaml`). What to report and how to extract it: [archive/STATS_REQUEST.md](archive/STATS_REQUEST.md). Use the scripts in [`tools/`](tools/README.md) and never add numbers by hand. Give the source of every number, mark estimates as "estimate" and lower bounds as "lower bound", and count shared usage once (`counted_in:` marks a copy).

## Honesty rules

Use exactly one verification level per statement and do not blend them:

| Level | Meaning |
|---|---|
| **Lean kernel-checked** | a Lean declaration compiled with exit code 0, with its `#print axioms` output in a log in the repository |
| **computed** | checked by a program (exhaustive search, evaluator, script); say which program |
| **AI-checked** | checked only by a model (verifier agent, cross-check audit) |
| **human-reviewed** | read and confirmed by a named person, with scope and date in `TEAM.md` |

- No claim without a link to the file that supports it.
- Put the previous best next to ours; say "partial" when it is partial and "formalization of a known result" when it is that.
- Say what is **not** verified: `sorry`, new axioms, `native_decide` in the dependency cone of a claim, unproved transcription or correspondence steps, builds run on one machine only.
- Ranks: compute them with ties sharing a rank (the platform lists tied accounts alphabetically) and always print the board size — "1st of 12", "tied for 1st, 3 of 12 accounts", "only entry on the board (1 account)". Never a bare "1st". A leaderboard figure is a snapshot: give its read time.
- A passing hill is not a proof, and reproducing a board's best value is not new mathematics.
- Disclose AI and tool use and the state of human review truthfully in the packet and in `ENTRY.yaml`.

## Secrets and privacy

Do not commit API keys, tokens, passwords, `.env` files, server addresses or host names, or account e-mail addresses. The only personal data in the repository is what a member writes into their own block of `TEAM.md`. Usage scripts output numbers only; do not commit their `--files` / `--sessions` output or any transcript. Refer to machines as "server" and "laptop". Read `git diff --cached` before every commit.

## Checksums

```bash
bash tools/make_checksums.sh write entries/<name>     # after the artifact is complete
bash tools/make_checksums.sh verify entries/<name>    # reviewers run this
```

`.gitattributes` (`* -text`) keeps line endings untouched so that checksums stay valid; do not change it.

## Branches, commits, review

- Work on a branch (`entry/<name>`, `hill/<hill>-<id>`, `team/<id>`, `archive/<topic>`) and open a pull request; another member reviews before merging.
- Commit message: `<area>: <what changed>` in the imperative, e.g. `ramsey-k4-multiplicity: add Lean certificate sources`, `README: regenerate tables`.
- Dates as `2026-10-02`; times with a zone, `21:08 KST`.

Review checklist before merging:

- [ ] `ENTRY.yaml` is complete (each `TODO` has a reason) and its `readme:` links resolve.
- [ ] `artifact/SHA256SUMS` exists and `make_checksums.sh verify` passes.
- [ ] Every claimed theorem name exists in the sources, and the axioms in the logs match the packet.
- [ ] No `sorry`, new `axiom` or `native_decide` in the dependency cone of a claim, or it is disclosed.
- [ ] No secrets, personal data or build products.
- [ ] Generated content is up to date (both `--check` commands pass).
- [ ] AI use and human review are stated as they were.

## Tags and immutability

- Fix the submitted state of an entry with an annotated tag: `git tag -a <entry>-v1 -m "<entry> as submitted 2026-10-03"`, then `git push origin <entry>-v1`. The packet's "final commit" field quotes the commit of that tag.
- To change something after submission, add a new commit and tag `<entry>-v2`; record what changed and why in the entry's `NOTES.md`. Do not overwrite.
- Never move or delete a tag. Never force-push.

## Language

`README.md` and `CONTRIBUTING.md` are in English (judges and outside readers); `README.ko.md` and `CONTRIBUTING.ko.md` are the Korean companions and may be shorter. Packets and artifact READMEs are in English. Archive notes (`archive/`) may be in either language. When you change an English page, update its Korean companion in the same pull request.
