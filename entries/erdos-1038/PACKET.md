# OpenMath 2026 — Erdős #1038 reusable formalization candidate packet v1

## 1. Identity, status and requested scope

- Entrant: HTPeo, team class. Author/operator for this entry: Hyunjin Lee (@hl728), University of Cambridge; contact and full roster are in the repository TEAM.md. Team accountable AutoLab owner: lavaskiller; hl728 operated the local formalization and separate Ramsey account.
- Local target identifier: `htpeo-ep1038-reusable-v1` (a proposed label, not an official registration ID). Parent/source problem: Erdős #1038. Requested modality: M2, known mathematics with potentially new reusable formal development. Requested p/difficulty: not applicable to M2.
- Status: GitHub candidate packet for team/organiser review. Admission, accepted family count and official submission ID are not established. We propose one related formalization target pending deduplication; we do not count declarations or implementation differences as accepted families.
- No new-solution, first-main-formalization, stronger-extrema or duplicate full-credit claim is made. The existing team decision excluding the previously known #1038 main result remains applicable. This packet supplies the missing full owner artifact and asks separately about the precisely listed reusable formal contributions.

## 2. Exact formal claims and completeness

The eight declarations in ENTRY.yaml and artifact/CONTRIBUTIONS.md are the candidate reusable contribution. Their full elaborated types, including inherited variables and geometric/positivity hypotheses, are in artifact/EXACT_STATEMENTS.md. They are compiled statements, not claims that their explicit assumptions hold for arbitrary functions without restriction. The supporting inequalities retain separation/contact hypotheses; scalar positivity retains every finite partition margin.

The complete #1038 implementation is also supplied as context: the exact polynomial-domain infimum D, supremum 2sqrt(2), strict lower bound/nonattainment, upper equality cases, and 1.8344304757 <= D < 1.8344304757628. The imported domain bridges connect the reference root-filter/cardinality conditions and ENNReal measure to the local polynomial class. The answer is the independently defined D, not a rounded decimal. artifact/STATEMENT_CORRESPONDENCE.md and Submission.lean describe this. No numerical input from an external unverified computation is an assumption in the final Lean theorem; required arithmetic certificates are included as proof sources.

This establishes the exported formal statements. It does not certify every auxiliary assertion of the long informal paper, novel mathematical priority, independence of authorship, or competition acceptance.

## 3. Artifact, checker and reproduction

The full reproducible source package is artifact/erdos1038-openmath-20261003.zip; the earlier compiled archive is retained unchanged. Loose claim modules are provided for review. artifact/README.md contains exact build commands; package environment: Lean 4.34.1, Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, all dependency pins in lake-manifest.json. Axioms: propext, Classical.choice, Quot.sound; no extra axioms, proof holes or native_decide in the scanned closure.

Recorded checks: 315 project proof modules rebuilt from the extracted archive on 2026-10-01, 18 final/reference/bridge axiom checks. On 2026-10-03 the unchanged cached project again passed 26 declaration/axiom checks, including all 8 candidate declarations. This latest run is not a second clean build. The original verification record has inconsistent elapsed-seconds versus start/end timestamps; memory/CPU time was not recorded, and no performance advantage is claimed.

## 4. Prior work, comparison and source overlap

Wang’s mathematical architecture was known and used as a source; Tao’s earlier supremum/reduction ideas are attributed in the informal exposition. Wang’s final formal source at d28713ac8245ca86a686b8c67370a8d19d81b242 was independently rebuilt in this workspace. A July 19 source commit precedes the event status freeze. plby/lean-proofs also publicly imports/ports the Wang source. Therefore the main theorem is known formally as well as mathematically.

The differences actually supported by source comparison are generic cyclic/circle rearrangement, partition-based scalar certificates, Bernstein/ramp adjoint identities, and direct measurable-function supporting interfaces. artifact/CONTRIBUTIONS.md maps each to Wang’s checked modules and describes use outside the specialized platform path. This is a candidate formal-library contribution, not a claim of new classical mathematics. Prior-library checking is limited: the pinned Mathlib textual searches and detailed Wang comparison are documented; plby’s provenance was checked, but its complete port and all other libraries were not exhaustively audited. A qualified reviewer must establish whether an equivalent reusable formalization already exists.

The bounded overlap screening found no substantial distinctive proof-body/certificate-function clone among inspected candidates; it did find an identical short log_q_neg Mathlib wrapper and shared mathematical hypotheses/formulas. The scanner cannot establish independent authorship or rule out transformed copies. Mathematical dependence remains disclosed. Other HTPeo Erdős packets do not list #1038 as a claimed family in the downloaded baseline; any shared developments require organiser deduplication, not another automatic count.

## 5. Baseline and event work

The initial informal proof and partial Lean project were supplied by @n0rang2 (as declared by the owner); Hyunjin Lee continued them with AI assistance. Exact initial authorship/time allocation and a signed September 27 baseline commit were not recorded. We do not attribute the whole starting project to Hyunjin or assume all 315 modules are new event work.

Local records dated September 30–October 1 document physical/model bridges, adjoint and coverage/certificate completion, the actual T/M/S numerical lower bound, final assembly and reference-statement wrappers. October 2 records the checked-source comparison and overlap screening; October 3 updates presentation/metadata without changing any compiled mathematical proof/configuration bytes. The entry’s downloaded team baseline is e8b587a89ec8bd16f860d3fb1c1aa4166042341f. The original compiled ZIP hash and unchanged-source verification give an immutable artifact boundary. A complete signed pre-event/event Git delta remains a provenance limitation for scoring; organiser review is requested rather than fabricated timestamps.

## 6. People, AI, resources and human review

Hyunjin Lee selected the task, directed continuation/completion, compared provenance, and authorised this publication. @n0rang2 supplied the initial proof/project; its exact earlier human/AI contribution breakdown is not recorded here. No unnamed human review or permission is inferred from passing Lean checks. Human mathematical review for Hyunjin: none, explicitly declared on 2026-10-03. The team roster and other contributors’ release approvals remain in TEAM.md; no approval is manufactured on their behalf.

Material tools: personal OpenAI ChatGPT web (model/version and tokens not recorded), Codex desktop/agent/CLI with gpt-6-astra and gpt-6.1-sol recorded in the relevant workspace, Lean/Mathlib, Python exact Fraction/interval and scientific/symbolic tools. AI wrote/refined the proofs and exposition, generated certificates and performed comparison/audit work under human direction; Lean and scripts performed formal/computational checks. STATS.yaml distinguishes recorded artifact counts from unavailable AI counts/CPU/memory/cost. The owner’s estimate is approximately 20 hours or more across OpenMath work including ChatGPT web; there is no reliable per-entry allocation, so it is not counted again as 20 hours just for #1038. No dedicated private model, corpus, funding or credits are recorded; that is not a verified assertion of absence.

## 7. Publication and official submission fields

Hyunjin Lee authorised attribution/release of his contribution and explicitly requested this GitHub upload on 2026-10-03. This records author consent, not a new overall repository license or another contributor’s consent. Existing third-party notices remain in the source package; the team chooses the final project license and confirms roster publication authority.

Repository path: entries/erdos-1038. GitHub immutable commits and the PR will identify this version after upload; no SHA is guessed inside the self-referential packet. Any submission tag must be attached to the reviewed final commit, never moved. Official AutoLab target/Hill, tree hash, Climb, report, submission ID and server timestamp are not available for this entry; the packet does not substitute this GitHub commit for an official evaluation/submission receipt. The team’s accountable owner must use the designated admitted-target route or documented organiser fallback and fill those administrative fields with actual records. No official acceptance is asserted.

## 8. Review checklist and sources

- Reproduce pinned build and final/candidate checks; verify SHA256SUMS.
- Check the exact candidate types against the informal exposition and source theorem.
- Search other formal libraries, including the complete plby port; decide genuine reusable delta and family grouping.
- Resolve initial authorship, event-window baseline and roster permissions; assign qualified human reviewers.
- Record official admission/submission identity and immutable commit/tag before claiming scoring status.

Rules consulted: [official handbook](https://rsihouse.ai/openmath/handbook.pdf), accessed 2026-10-03, §§3.2, 4.1, 6–10. M2 is for useful new formalizations of known mathematics; families are deduplicated. The packet gives exact statements, reproducible proof material, provenance/tool disclosures and attribution authority. Formal checking, novelty/admission and qualified review are separate. Official routing fields remain unresolved rather than being invented.

Primary sources: [Wang pinned source](https://github.com/ShouqiaoW/erdos/tree/d28713ac8245ca86a686b8c67370a8d19d81b242/1038), [plby provenance](https://github.com/plby/lean-proofs/blob/main/ErdosProblems/Erdos1038.md), [Formal Conjectures statement](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/1038.lean). The unchanged reference and dependency notices are included in the archives.

Resource update: [member statistics](../../archive/stats/hl728.yaml) and [aggregate counter evidence](../../archive/stats/hl728-usage-summary.json) hold the once-counted owner totals and methodology. Scoped Erdős records: 344,422,221 inclusive input (329,726,976 cached), 1,976,196 output, 8 session streams. Shared human time is >=20h, not allocated per entry. Web/hosted counters, billed cost, effective price and CPU/memory measurements remain unknown.
