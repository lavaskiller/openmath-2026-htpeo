# Formalization workflow: division of labour between GPT and Claude, statement fixing, duplicate checking, server memory

한국어: [formalization-workflow.ko.md](formalization-workflow.ko.md)

Period: 2026-09-28 ~ 2026-10-02 (KST). Written by: helper-team-repo (Claude Code agent), 2026-10-03. Not human-reviewed.

## Summary

- The same division of labour was used in all three entries: Claude first fixed the statements (the theorem heads), GPT (codex) wrote the proofs, and a script or agent on the Claude side recompiled them to check that the statements had not changed and to check the axioms. The final verdict is the Lean kernel.
- This "checking" was done by AI and scripts. For the claimed statements and the statement-correspondence notes, the team reports a review by a human team member (details in `TEAM.md`); there is no record of a human reading the proofs.
- Most of the easy Erdős-problem targets already had public formal proofs. Because the duplicate check was done afterwards, many proofs were produced first and then discarded.
- On the shared server (14 GB), Lean compilation caused three memory incidents, and a cap was added each time.

## Details

### 1. Division of labour

| Work | Done by | Basis |
|---|---|---|
| Ramsey: specification `Defs.lean`, generator, build tooling, assembly, packet | Claude (Claude Code, a laptop session operating the server) | `entries/ramsey-k4-multiplicity/PACKET.md` §3.3 |
| Ramsey: general lemmas `Fast.lean`, `Limit.lean`, `Mono.lean` | GPT (codex) — statements fixed in advance by Claude | same place |
| DMS: reduction chain, families (pack4, excluding inflation), `Star6Corollaries` | Claude (harness workers and auxiliary sessions) | `entries/dms-star6/PACKET.md` §4.3 |
| DMS: `InflationA–E`, `Inflation`, `Star6Equiv`, `Star6Simple` | GPT (codex) — statements fixed in advance by Claude | same place, §2.7 item 7 |
| Verification of DMS informal facts | LLM verifier (Claude Opus) + cross-audit by a different model family (GPT) + Lean gate | same place, §3.1, §4.3 |
| Erdős: all proofs | GPT (unattended codex sessions) | `entries/erdos-m2-formalizations/PACKET.md` §5, §7 |
| Erdős: target selection, verification script, survey of prior formalizations, packet | Claude | same place |

Verification level: the Lean deliverables in the table above are all **Lean kernel-checked** (standard axioms; see the axioms section of each packet). The description of the division of labour itself is taken from the disclosure paragraphs of the packets.

### 2. Statement fixing and independent checking

- Ramsey: a Claude agent independently recompiled the three files produced by GPT and compared whether the statements were the same as those fixed in advance (**AI-checked**). Source: Ramsey packet §3.3.
- DMS port: the 6,124 declaration heads of the Lean 4.20 original and the 4.33.1 port were compared by script, with nothing changed (**computed**, `artifact/lean/pack3/check_headers.out`). An exhaustive `collectAxioms` audit over the 4,924 theorems of the 98 modules (`build/audit_all.tsv`); the only non-standard axiom is in a single baseline theorem (`MGraph.k4subdiv_star6`, `native_decide`), and the claimed theorems do not use it. Source: DMS packet §2.3, §2.7.
- Erdős: for each target, `verify_all.py` compares the characters from the attribute line up to `:=` against the file at the pinned commit (formal-conjectures `df3f12d7`) (comments stripped, whitespace normalized), checks that the only lines deleted in the whole-file diff are the target's `sorry` proof, and checks `#print axioms` and forbidden tokens (`native_decide`, `axiom`, `unsafe`, `implemented_by`, `admit`) (**computed**). 61 of 63 rows pass; 2 rows were rejected because FC already had a proof. Source: Erdős packet §0, §6.
- DMS fact graph: the GPT audit results were "correct" 627 times, "wrong" 37 times, "error" 10 times. Facts that drew an objection were fixed or replaced, and some objections remain open (**AI-checked**; the packet states that "agreement between models is not a proof"). Source: DMS packet §3.1.
- Statement correspondence (whether the Lean definitions are the same as the objects in the literature) is written up in the statement-correspondence section of each packet; the team reports that these notes were reviewed by a human team member (details in `TEAM.md`). That the family graphs are the same as the textbook definitions rests only on a Python check (`sanity_check.py`); there is no formal isomorphism (DMS packet §2.7 item 4).

### 3. The duplicate/prior-formalization check eliminated most of the easy Erdős targets

- Search scope (2026-10-02): the heads of all 4,155 pull requests of `TheJustinSunPrize/awards`, `plby/lean-proofs`, formal-conjectures main, 328 files obtained through GitHub code search, and the pinned Mathlib. Source: Erdős packet §7.
- Result: 31 rows in the exclusion table (packet §4). Of the 61 rows that passed machine verification, what remains in the claim is 12 Erdős families (17 theorems) and G-PM. Of the 8 "advanced" results produced on 2026-10-02, only one, E942, was new (packet §0).
- Misclassified: the v1 packet listed E649 `sampaio` as a new formalization, but it was already in a plby file. Corrected in v2 (packet §7 item 7).
- Copied: the E1136 `mueller` file carried over about 370 lines of code from a public repository and then added only about 70 lines of glue, so it was excluded as a duplicate (packet §4).
- Limitation: "new" means only that it was not found in the search above. Private repositories, Zulip and attachments on the erdosproblems.com forum were not examined, and GitHub code search is not exhaustive (packet §7).

### 4. Memory incidents on the shared server, and caps

The server has 16 cores and 14 GB and is shared with the company's production services. The times and figures below come from the manually kept log in the project operations record (PLAN.md) and from the STATUS files under `artifact`.

| When (KST) | What happened | Action | Source |
|---|---|---|---|
| 2026-09-29 afternoon | The always-on GPT audit job for facts with a Lean module hit OOM at the 4 GB cap while building the project Lean library, and the re-run also hit OOM. The backlog of failed units all re-ran at once, load 61, ssh temporarily unreachable | Always-on audit turned off at 17:50. The Lean gate was changed to an incremental build (reusing the oleans of unchanged modules) | PLAN.md (manually kept log); `archive/timeline.md` |
| 2026-10-02 around 18:37 | A test compilation (Ramsey certificate) run without a memory cap rose to 13 GB and was OOM-killed. The server page cache was flushed; the services stayed up. Load about 25 during the `lake build` test | Cap applied to every compilation afterwards. The certificate: 6 GB per job, 4 GB per process (`MEM=4G`) | PLAN.md (manually kept log); `entries/ramsey-k4-multiplicity/artifact/lean/CERT_STATUS.md` |
| 2026-10-02 22:38 (13:38 UTC) | A compilation that did the GP window check with a single `decide` reached the 6 GB cap and used up almost all swap. The session stopped it manually 4 minutes later | A mechanism that force-kills above 3.5 GB; the check split into piece modules | `entries/dms-star6/artifact/lean/pack4/STATUS.md`; PLAN.md (manually kept log) |

Caps that were in operation (source: PLAN.md manually kept log, the README of each artifact):

- 11 GB for the star6 service as a whole (protecting the production services).
- Separate computations are run only through the job runner (job), and each job is given a memory cap. If it dies from lack of memory, the cap is doubled and it is run again (maximum 8 GB, 2 times).
- Erdős work environment: `leancheck.sh` limits to 3 concurrent compilations and 20 minutes per compilation. A cap of 3.5 hours per codex session.
- Ramsey certificate: two jobs of 3 `lean` processes each, 6 GB per job.

### 5. Effect of usage limits on the schedule

- Server Claude account: the 5-hour window filled up and all workers stopped on 2026-09-28 (twice), 09-29 and 09-30, and on 2026-10-01, with the weekly window at 99%, the 4 Claude workers were halted from 15:49 until the deadline. After that the star6 run had only 3 GPT workers running. Source: PLAN.md (manually kept log), `archive/timeline.md`.
- GPT: it was held at the limit until 2026-10-02 08:20 KST, then started from 0% after the reset, and was at 12% weekly at 18:10. Source: PLAN.md (manually kept log).
- The token figures are in `archive/stats/`. The server-side figures have not yet been collected.

## Failed/refuted approaches

- Doing the duplicate check after the proofs: what — proving starting from the easy FC targets. Where it got stuck — 31 rows were duplicates or rejected in the after-the-fact search. Confirmed by — exhaustive search of pull-request heads and comparison against public repositories (Erdős packet §4, §7).
- Compilation without a cap: 13 GB OOM (table above).
- A large finite check as a single `decide`: the 6 GB cap and swap (table above). After splitting into pieces it finished at 2.05 GB per process (pack4) and 3.3 GB (Ramsey).
- Verification by a single model family only: the fact that the GPT audit returned "wrong" 37 times on DMS facts is evidence that passing the LLM verifier alone was not sufficient (DMS packet §3.1). However, whether the audit's "wrong" verdicts were all correct could not be confirmed from the records. TODO (no source).

## Open questions

- Where to insert a procedure in which a human reads the statement correspondence (during the event the workflow had none; the review reported by the team took place at the end, see `TEAM.md`).
- How much could have been saved by moving the duplicate check to the target-selection stage. No measurement.
- Whether `decide +kernel` with GMP kernel arithmetic, and module-by-module builds, are within the trust boundary of the person responsible for verification (needs confirmation from the organizers, Ramsey packet §2.7).
- The GPT model name is recorded in two ways (`gpt-6-sol`, "GPT-5.6-sol"). Needs operator confirmation (DMS packet §4.3).

## Sources

- `entries/ramsey-k4-multiplicity/PACKET.md` §2.7, §3.3; `artifact/lean/CERT_STATUS.md`
- `entries/dms-star6/PACKET.md` §2.3, §2.7, §3.1, §4.3; `artifact/lean/pack3/README.md`, `pack4/STATUS.md`
- `entries/erdos-m2-formalizations/PACKET.md` §0, §4, §6, §7; `artifact/PRIOR_ART_FINAL.tsv`
- Project operations record PLAN.md (outside the repository, manually kept log; some of the times were corrected later), `archive/timeline.md`
