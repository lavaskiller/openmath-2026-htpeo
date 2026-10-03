# OpenMath 2026 — results and findings (team HTPeo)

한국어: [REPORT.ko.md](REPORT.ko.md)

> Draft (2026-10-03 KST). Sections 2.1–2.3, 3 and 4 were transcribed by helper-team-repo (a Claude Code agent) from the packets, the artifacts and the operations log; **the text of this document has not been reviewed by a human**. erdos-1038 and the team-level items are TODO. Every statement carries one verification level: **Lean kernel-checked / computed / AI-checked / human-reviewed**. Human review: the team reports that the claimed statements and the statement-correspondence notes of the three packets were reviewed by a human team member; reviewer names, scope and dates are recorded in [`TEAM.md`](../TEAM.md) (still to be filled in). Where a specific item was never reviewed according to the sources, this document says so.

## 1. Summary

- What we submitted:
  - ramsey-k4-multiplicity: an upper bound for the K4 Ramsey multiplicity constant, c_4 ≤ 0.030139933996… (2.34·10^-6 below the hill reference). **Lean kernel-checked**. Hill standing at the snapshot of 2026-10-02T16:23Z: 1st of 12 on the validation board, no ties (**computed** from `archive/leaderboards/`; a snapshot, not a final ranking).
  - dms-star6: partial results on the Dvořák–Mohar–Šámal conjecture (infinite families, at most 14 vertices, an equivalent reformulation, a conditional reduction). **Lean kernel-checked**. The conjecture itself is not proved.
  - erdos-m2-formalizations: 17 families of formalizations (13 until 2026-10-03, when E477, E358, E619, E1148 were added) of known results (M2; packet v2). **Lean kernel-checked**.
  - erdos-1038: not claimed. A team member's Lean solution was checked on 2026-10-03; a formal proof of the same result had been public since 2026-09-15 (plby/lean-proofs), and only part of the package could be rebuilt with our toolchain.
  - Hill results of team members without a Lean artifact (same snapshot, **computed**): Busy Beaver 6 certificates, @n0rang2, tied for 1st, 3 of 12 accounts; Kobon triangles (board n = 18), @thomasoh0408, tied for 1st, 12 of 15 accounts; K4 Ramsey, @hl728, only entry on the final (held-out) board (1 account) and 5th of 12 on the validation board; K4 Ramsey, @n0rang2, 8th of 12. The two tied results reproduce the best value on their board and are not claimed as new mathematics. Files: `entries/hills/` (to be added by the owners).
- Judging results: TODO (to be added when available).
- The three most important findings: TODO (team discussion). Candidates are in section 3.

## 2. Entries

### 2.1 ramsey-k4-multiplicity

- **Target and state before the event**: c_4 = the limit of the minimum density of monochromatic K4 in 2-edge-colourings of K_n. Open. Known upper bounds: 4551721·2^-24·3^-2 ≈ 0.0301449 from Theorem 1.1 of Parczyk–Pokutta–Spiegel–Szabó (arXiv:2206.04036), and 10486266368/768^4 ≈ 0.0301422734 from the closing Note of that paper (the hill reference); lower bound 0.0296 (as cited in the same paper). The literature paragraph is **AI-checked** (the packet-writing session compared it with the arXiv text).
- **Result**: with a 1024-block weighted template, c_4 ≤ 200080655744752337972227066537 / 6638390640717004439491700265361; hill metric 30,139,933,996 ppt. Lean names: `sol_density`, `sol_lt_ref`, `sol_ppt`, `sol_symm`, `ramseyMultK4_le_sol`, `ramseyMultK4_lt_ref`, `minMonoK4_density_le_sol`, `ramseyMultK4_limit_lt_ref` (namespace `RamseyCert`). **Lean kernel-checked**. Official hill evaluation `passed: true`, `reference_beaten = 1` (experiment `1ab2354d`, report of 2026-10-02T11:38:08Z) — **computed**.
- **How**: starting from the hill's 768-vertex seed: SA/tabu with flips restricted to automorphism orbits, splitting 768 → 1024 blocks, weight optimisation, basin hopping. What moved the value: `findings/ramsey-search.md`. The certificate is `decide +kernel` in 2,048 files, one per block and colour.
- **Verification**: Lean 4.33.1, Mathlib v4.33.1, axioms `[propext, Classical.choice, Quot.sound]`. Per-module build (2,112 modules; a full `lake build` was not run), 50 minutes, 4.7 CPU-hours. Trust boundary: the kernel's GMP arithmetic; the JSON → Lean transcription (re-checked by a separate script, not a Lean proof); the agreement of the hill's fast counting routine with `_oracle` is not modelled. No rebuild on a second machine. **Human-reviewed**: reported by the team for the claimed statements and the correspondence notes (details in `TEAM.md`); the proofs and the build were not reviewed by a human according to the sources.
- **Limitations**: an improvement of the upper bound only; c_4 is not determined (about 0.43% of the gap to the lower bound). The method is that of the earlier paper (local search in a blow-up of a known construction). Literature after September 2024 was not checked. The hill evaluation has `final: false`.
- **Material**: `entries/ramsey-k4-multiplicity/`; tag TODO (operator, planned `ramsey-v1`).

### 2.2 dms-star6

- **Target and state before the event**: is the star chromatic index of every subcubic graph at most 6 (Dvořák–Mohar–Šámal 2013, arXiv:1011.3376; Open Problem Garden, OPG-37271)? Open; known upper bound 7. Baseline before the event: a Lean 4.20 library of 20 modules and the records of a preliminary investigation (packet §4.1).
- **Results** (all **Lean kernel-checked**, for finite loopless multigraphs with Δ ≤ 3):
  - T1, infinite families: flower snarks J_n (odd n ≥ 5), Goldberg snarks (odd k ≥ 5), GP(n,k) (1 ≤ k ≤ 15, n ≥ 2k+1, except GP(3,1)), Möbius ladders (n ≥ 4), Petersen-type inflation — 5 colours. GP(k,2): 6 colours with the spokes as one colour class. Lean names: `flower_family`, `goldberg_family`, `gp_family`, `Mobius.mobius_family`, `Inflation.inflate_star5`, `gp2_star`.
  - T2: holds for bridgeless cubic multigraphs on at most 14 vertices and their leaf graphs, and for subcubic multigraphs on at most 7 vertices (`star6_cubic_bridgeless_le14`, `star6_leaf_le14`, `star6_subcubic_le7`); the equivalence `dms_iff_cubic16` (DMS ⇔ connected bridgeless cubic multigraphs on at least 16 vertices and their leaf graphs are star 6-colourable).
  - T3, conditional: `RH2F.layer37` — named hypotheses (FEEXTD10, FEEXISTD18, POLE, TDTRI, FEEXTTNE16, FEEXIST0NE16 and others) ⇒ DMS. **None of the hypotheses is proved.**
  - T4, finite certificates: `base12`, `simple14`, `b14d`, `feexist16`, `cls16c` (607 c4c graphs on 16 vertices).
- **How**: a multi-agent harness (worker → LLM verifier → GPT cross-check audit → Lean gate) accumulated 786 informal facts and the Lean modules; from two days before the deadline, helper sessions produced the port to 4.33.1, the Lean proofs of the families and the corollaries. The colourings of GP(n,k) and of the Möbius ladders were found by SAT search.
- **Verification**: Lean 4.33.1, Mathlib v4.33.1, standard axioms (`#print axioms`: 18 lines in pack3, 36 in pack4, 39 in pack5). pack3 was built both with `lake build` (20 minutes) and module by module; pack4 and pack5 module by module only. One baseline theorem uses `native_decide` but lies outside the dependency cone of the claimed theorems. That the family graphs agree with the textbook definitions is checked by a Python script only. The informal material (fact graph, exhaustive computations, the evidence for PMU) is **AI-checked** or **computed** (run once) and no credit is requested for it; it was not reviewed by a human. **Human-reviewed**: reported by the team for the claimed statements and the correspondence notes (details in `TEAM.md`).
- **Limitations**: the conjecture is open. The families do not remove the obstacle of the general conjecture. The finite range for general subcubic graphs is 7 vertices. Some families (part of GP, the cover theorem) are in the literature (packet §2.6).
- **Material**: `entries/dms-star6/`; tag TODO (operator, planned `dms-v1`). Investigation record: `findings/dms-c4c-core.md`.

### 2.3 erdos-m2-formalizations

- **Target and state before the event**: known results attached to Erdős problems (statements left as `sorry` in formal-conjectures at commit `df3f12d7`) and Schönberger's and Petersen's theorems (connected case). The mathematics is known; these are the ones for which the searches of packet §7 found no earlier formal proof.
- **Result**: 13 families, 19 theorems — 9 substantive (G-PM, E942, E44, E123, E918, E292, E395, E698, E939) and 4 minor / sanity ones (E295, E703, E748, E1136). The 5 optional families (E757, E261, E36, E649, E508) are not claimed. **Lean kernel-checked**.
- **How**: GPT (unattended codex sessions) wrote the proofs; Claude did target selection, the verification scripts, the prior-formalization search and the packet. `findings/formalization-workflow.md`.
- **Verification**: Lean 4.33.1, the Mathlib pinned by FC, standard axioms. That each statement is character-for-character identical to the pinned commit is checked by a script (**computed**). The prior-formalization search is **AI-checked**. **Human-reviewed**: reported by the team for the claimed statements and the correspondence notes (details in `TEAM.md`); the proofs were not reviewed by a human according to the sources.
- **Limitations**: "new" means only that the searches did not find it. The main statement of each problem is not claimed. Petersen's theorem for connected graphs only. `Star6Simple.lean` builds only with the star6 library.
- **Material**: `entries/erdos-m2-formalizations/`; tag TODO (operator).

### 2.4 erdos-1038

TODO (the member in charge).

## 3. Findings

### 3.1 Mathematics

- Newly known — proved (**Lean kernel-checked**): the theorems of sections 2.1–2.3. In particular: DMS is equivalent to the problem for bridgeless cubic multigraphs on at least 16 vertices and their leaf graphs; 5 colours suffice for the families above; the new upper bound for c_4.
- Newly known — evidence only (**computed**, no proof, no independent re-run): PMU (in a cyclically 4-edge-connected simple cubic graph on at least 10 vertices, every perfect matching is a colour class of some star 6-edge-colouring) had 0 failures over all 193,521 perfect matchings for n = 10–18 and over a sample of 88,144 for n = 20/24/30/40. It fails for K₃,₃ and for n = 8. Source: DMS packet §3.2, `findings/dms-c4c-core.md`.
- Refuted approaches and their counterexamples (**computed**): fixed-radius local repair is refuted at radius 2 (all 8 shapes) and radius 3 (6 of 8) by explicit c4c graphs (n = 258–574). Every case found is rescued by a single Kempe exchange. (FE-ALLPM-D) is refuted at 20 vertices. TD-RED-POLE is false at threshold 10. Source: DMS packet §3.3.
- Ramsey: adjusting only the weights of the 768-block seed already beats the reference, but by a small margin; the split into 1024 blocks contributes most (`findings/ramsey-search.md`; the sizes of the contributions are as stated by the search session).
- Open questions that remain: all hypotheses of the DMS reduction (infinite statements on the c4c core), PMU, the reduction of 4-cycle sides of cyclic 4-edge cuts; the value of c_4.

### 3.2 Methods

- Operating AI agents: the division of labour "one model fixes the statement, another proves it, then an independent recompilation and comparison" was used in all three entries. Informal facts went through the LLM verifier and, in addition, an audit by a different model family; the audit returned "correct" 627 times and "wrong" 37 times. Details: `findings/formalization-workflow.md`.
- Formalization: for finite checks, generated tables + `decide +kernel` worked, and for large checks, splitting into small files (2–3.3 GB of memory per file). One large check done with a single `decide` hit the memory cap. The port from Lean 4.20 to 4.33.1 needed changes at 15 places in 8 modules plus compatibility options, and build time fell from 4,248 s to 1,422 s (`entries/dms-star6/artifact/lean/pack3/README.md`).
- Search and computation: `findings/ramsey-search.md`.
- Incidents and measures: three server memory incidents and the caps, worker stops caused by usage limits (`findings/formalization-workflow.md` §4–5), 10 kernel panics of the laptop WSL and the move to the server (`timeline.md`).
- Most easy Erdős targets were duplicates of public formal proofs (31 excluded rows). It is better to run the duplicate check before selecting targets.

### 3.3 What we learned about running the competition

TODO (team discussion). On record: the organisers' answer that individual formalization of every claim of a partial advance is "not necessarily required but strongly recommended" (2026-10-02, `timeline.md`); whether a proposed problem (M3A) is admitted is decided at judging. Leaderboards: the platform numbers accounts with identical metrics consecutively in alphabetical order, so we compute ranks with ties sharing a rank and always state the board size; a board with one account is described as "only entry (1 account)".

## 4. Resources and statistics

All figures are sums, made by scripts, of records left by the tools (**computed**; not reviewed by a human). Summary: `archive/stats/SUMMARY.md` (script-generated); sources: `entries/*/STATS.yaml`, `archive/stats/*.yaml`. Charts: the "Resources used" section of the top-level `README.md`.

**AI usage (tokens)**

| Source | Period (KST) | Input | Output | Cache read | Cache write | Sessions | Remarks |
|---|---|---:|---:|---:|---:|---:|---|
| Claude in the server harness (4 workers, verifier, supervisor, decomposer, reviewer, falsifier) | 09-28 – 10-02 | 90,808 | 67,133,867 | 7,123,153,571 | 178,393,628 | 1,151 | all dms-star6. Output per model: opus-5-5 52.7M, sonnet-5 8.2M, fable-5-1 6.2M |
| codex (GPT) on the server | 09-28 – 10-03 | 83,975,710 | 11,954,416 | 2,249,000,448 | — | 928 | input excludes cached input. gpt-6-sol 534 sessions, gpt-5.6-sol 386 |
| Claude Code on the laptop (steering session + helper agents) | 09-27 – 10-03 | 9,748 | 2,366,563 | 1,273,633,924 | 69,960,092 | 66 | helper-agent output is a lower bound |

Total output: 81,454,846 tokens in 2,145 sessions (`archive/stats/SUMMARY.md`).

- GPT per entry: dms-star6 904 sessions (input 79.8M, output 11.0M, cache 2,027M — of these 822 verify/audit sessions and 68 GPT-worker sessions), erdos-m2-formalizations 21 sessions (input 3.7M, output 0.85M, cache 202M), ramsey-k4-multiplicity 3 sessions (input 0.46M, output 0.11M, cache 19M). Source: `archive/stats/server-codex.yaml`.
- Claude per entry: the server harness is all dms-star6. On the laptop only the helper agents can be split (dms-star6 39 sessions, ramsey 3, erdos-m2 5). The steering session (output 2.14M) is shared/steering.
- Cost: subscription plans were used and nothing was billed per token. The API-list-price equivalent given by the tool for Claude in the server harness is **3,717.96 USD (lower bound)** — the sum over the 1,103 runs that have a result record; the 60 runs that ended without one and the reviewer and falsifier runs, which have no run log, are missing (53.7M output tokens by the run logs against 67.1M by the session records). By role: verify 1,148, worker opar 939, lean 619, core 446, compute 432, decomposer 83, supervisor 50 USD. codex and Claude Code on the laptop give no equivalent. Source: `archive/stats/server-harness.yaml`.
- Per day (output tokens of Claude on the server): 09-28 18.4M, 09-29 19.3M, 09-30 13.5M, 10-01 15.6M, 10-02 0.3M. GPT output: 09-28 0.2M, 09-29 1.2M, 09-30 2.1M, 10-01 5.8M, 10-02 2.7M. The shift to GPT after the Claude workers stopped on the afternoon of 10-01 is visible.
- Missing: the Claude usage of the first part of the star6 run on the laptop (WSL), before the move to the server (09-27/28), was not collected. The output tokens of the laptop helper agents are a lower bound (2,343 of 2,660 records carry only the stream-start value). Usage for erdos-1038 and for the members' hill results is not included.

**Compute**

- Ramsey: certificate 4.7 CPU-hours, 50 minutes, 3.3 GB per process (`CERT_STATUS.md`); search, by the server logs, 2026-10-01 23:55 – 10-02 11:12 UTC (11.3 hours wall-clock), CPU time not recorded.
- DMS Lean builds: pack3 1,422 s (per module) and 20 minutes (`lake build`); 4,248 s on Lean 4.20; pack4 930 s; pack5 about 80 s (estimate).
- DMS harness jobs (695 job records on the server; wall-clock is the sum of "log modification time − start time" and therefore an **estimate**; CPU time not recorded): 213 worker computations 7.2 hours (cap 2 GB each), 453 GPT audits 50.6 hours, 14 review/decompose runs 18.2 hours, 6 Lean set-up jobs 0.4 hours.
- Erdős: sum of the session times of the 21 codex sessions 9.6 hours (estimate; includes compilation, not CPU time).

**Outputs**: Lean lines (claimed sources) Ramsey 104,665 (mostly generated numerals), DMS 81,622, Erdős 2,791; claimed theorems 8 / 45 (the packet's list of names, counted by hand) / 19; 786 informal DMS facts.

**Usage limits**: by the limit snapshots in the codex records, the GPT weekly window reached 100% on 10-01 and on 10-02 and was reset. For Claude see `findings/formalization-workflow.md` §5.

Human time of the operator: about 52 hours (estimate from the session records, see `TEAM.md`). **TODO**: names of the subscription plans and actual spending, cost per result, usage of the laptop-WSL part.

## 5. Timeline

`archive/timeline.md`. Summary: TODO (team).

## 6. Next steps

TODO (team): research to continue after the competition, publication plan.

## Appendix

- A. Members and roles: `TEAM.md` (each member fills in their own block).
- B. Tools and models: `ai_and_tools` in each `entries/<name>/ENTRY.yaml`; a team-wide list is TODO.
- C. References: the literature section of each packet; a team-wide list is TODO.
