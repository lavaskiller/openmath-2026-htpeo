# DMS: where things stopped at the cyclically 4-edge-connected (c4c) core, and PMU

한국어: [dms-c4c-core.ko.md](dms-c4c-core.ko.md)

Subject: the Dvořák–Mohar–Šámal conjecture (star chromatic index ≤ 6 for subcubic graphs; "Star chromatic index", J. Graph Theory 72(3), 2013, arXiv:1011.3376). Period: 2026-10-01 ~ 2026-10-02 (KST).

## Summary

- The conjecture has not been proved. What has been confirmed in Lean is only a reduction of the form "named open hypotheses ⇒ DMS" and finite cases.
- The five pieces of the reduction (P18, P16, P14, P23, P19) are all open, and each stopped at an infinite statement about c4c cubic graphs, which have no small edge cut to cut along.
- The candidate statement for the c4c core, PMU (every perfect matching is a colour class of some star 6-colouring), has no failures in the exhaustive check for n = 10~18 and in samples for n = 20~40. There is no proof.
- The route of proving the induction step of PMU by "local repair that recolours only within a fixed radius" was refuted by explicit graphs at radius 2 and 3. Every failure found is rescued by a single Kempe swap.
- The reduction that replaces a cyclic 4-edge cut by a gadget was confirmed only for 8-, 10- and 12-vertex sides, and the 4-cycle side does not reduce, so the core does not narrow to cyclically 5-edge-connected.
- The investigation results in this note have not been verified in Lean and have not been human-reviewed (preamble of `star6_packet_final.md` §3).

## Details

### 1. The five pieces and the Lean reduction

- **Lean kernel-checked**: `RH2F.layer37` (Lean 4.33.1 + Mathlib v4.33.1, 98 modules, axioms `[propext, Classical.choice, Quot.sound]`) proves `FEEXTD10 → FEEXISTD18 → POLE → TDTRI → FEEXTTNE16 → FEEXIST0NE16 → DMS` and the finite statements `BASE12`, `SIMPLE14`, `B14D`, `FEEXIST16`. The hypotheses have not been proved. Source: `star6_packet_final.md` §1.4, `star6_artifact/lean/pack3/STATUS.md`.
- **AI-checked**: the informal root combination ROOT-CS4 (fact `6010cb59`): P18 ∧ P16 ∧ P14(POLE) ∧ P23(TD-TRI) ∧ P19(II_D) ⇒ DMS. It passed LLM verification and the GPT audit. Source: PLAN §4 "이전 기록 (09-30 16:45~17:30)".
- **AI-checked + computed**: the correspondence between the Lean hypotheses and the contract sentences (FEEXTD10=P18, FEEXISTD10=P16, POLE=P14, TDTRI=P23, IID=P19) was compared clause by clause by an auxiliary session, and a per-definition computation comparing the Lean form with the prose form gave 0 mismatches. Source: PLAN §4 "Lean 명제 대조 세션 완료(01:05)".
- Human-reviewed: none.

### 2. Where each piece stopped (2026-10-01)

| Piece | What was confirmed | Where it stopped | Source |
|---|---|---|---|
| P23 (TD-TRI) | The reduction TD-RED (fact `b4e4863f`) showed no gap under adversarial checking. 0 violations among the 14,926 far sides for n=10~16 | The remaining (TD-CORE) does not reduce to a finite check. The remaining statements are (TD-C4C)/(TDD-C4C) on the c4c skeleton | `informal/p23-check_REPORT.md`; PLAN §4 results (1), (2) |
| P16 (FE-EXIST-D) | The original form (status form) holds in the exhaustive check for N=20 (401,621 X, about 22 million perfect matchings) | Minimal fact progress. No proof direction | `informal/p16_REPORT.md`; PLAN §4 "다섯 조각 현황(09:15)" |
| P18 / P09 (FE-EXT-D) | Only the case of (KR) with one swap and the window ignored is nearly proved by a Vizing fan argument (one case, the crossing configuration, is a gap) | With the window taken into account, about 2~20% fail, and k≥2 was not touched. Obstruction fact `567dd586`: the remaining ZONE cannot be closed by a finite list | PLAN §4 result (3) p09-kr, "이전 기록 (09-30 16:45~17:30)" |
| P14 (POLE) | 10~16 vertices hold by POLE-16 (fact `3462e827`) | The existence statement for the relocation path was refuted (see "Failed/refuted approaches" below). The exhaustive survey of (C4C-DOM-D)₌₁₈ was in progress as of 10-01 23:35 | PLAN §4 "P14 사전 조사 세션 완료(01:15)", "23:35 조치"; `star6_packet_final.md` §3.1 |
| P19 (II_D) | All three routes (LEAF-UNIV, NE, pole) have no counterexample up to around 18 vertices. (FE-EXT-T-NE)₁₆ has 0 failures in the exhaustive 16-vertex check of about 58.18 million cases | Local proof is impossible by Theorem O1. None of the approved tasks implies the NE statement | PLAN §4 "P19 증명 세션 완료(23:55)", "P19 NE 경로 세션 완료(00:35)" |

- Verification level: the figures in the table are all **computed** (a script run once on the server, no independent re-run). The TD-RED check, Theorem O1 and Lemma V are **AI-checked** (or hand proofs written by AI). Not human-reviewed.
- Common diagnosis (operations record): the infinite statements that succeeded in this project (the RH2 skeleton, the H-RED family, TD-RED) were all minimal-counterexample inductions that cut and reduce at small edge cuts, digons and triangles. The remaining five pieces stopped at the c4c core, where there is nowhere to cut. Source: PLAN §4 "공통 병목 진단".
- Literature survey (AI session, not human-reviewed): 6 colours is settled only for sparse classes, and entropy compression/LLL is at the level of 22 colours for Δ=3, so it was excluded. Source: PLAN §4 "조사 결과(두 세션 완료)".

### 3. PMU

Statement (conjecture): for every c4c simple cubic graph G with n ≥ 10 and every perfect matching M, there exists a star 6-edge-colouring in which the colour class of colour 6 is exactly M.

- **Computed**: 0 failures in the exhaustive check of the 193,521 perfect matchings of all c4c graphs with n = 10~18. 0 failures in the 88,144 samples for n = 20/24/30/40. The only failures are K3,3 (all 6 matchings) and 5 of the 16 for n=8. Source: `informal/c4c-ext_REPORT.md` "Proposed hypothesis" (evidence `071a1c01e5f8f204`). The n ≥ 20 samples are not uniform samples (Setup of the same report).
- **Computed**: in the exhaustive check for n ≤ 18, only K4 and Q3 have no removable edge, and for n = 10~18 every c4c graph has at least n/2 of them. Source: same report, "Removable edges".
- Induction-step candidate (mcPfix): remove a removable edge e in M and set M′ = M − e. At radius 2, of 600 pairs, 321 hold, 3 fail, 276 time out. At radius 3, 0 failures (313 hold, 527 time out). The timeouts are unresolved. **Computed**. Source: same report, "Results", "Proposed hypothesis".
- Gap (matchings with no removable edge): for n = 10/12/14/16/18 there are 2/18/29/138/540 pairs (727 pairs in total, 462 graphs). **Computed**. Source: `informal/c4c-norem_REPORT.md` §1.
- **AI-checked** (hand proof inside the report, no audit record) + **computed**: Lemma NR — in a c4c simple cubic graph (n ≥ 8), an edge being removable is equivalent to it belonging to no cyclic 4-edge cut. 0 mismatches over all edges for n = 8~18 and over 2,460 sampled graphs for n = 20~32. Source: `c4c-norem_REPORT.md` §1.
- **Computed**: the second reduction (delete a 4-cycle or contract it to K2) covers all 678 pairs for n = 16·18 and all 445 sampled pairs for n = 20·24·28. It does not cover the 2 pairs for n = 14, so the base becomes the computation for n = 10·12·14 and the step is n ≥ 16. Colouring extension has 0 failures at radius 3 and 1 failure at radius 2. Source: `c4c-norem_REPORT.md` preamble, §2, §4.
- Human-reviewed: none. Nothing has been proved about PMU (`star6_packet_final.md` §3.2).

### 4. The 4-edge-cut gadget

- **AI-checked** (proof outline only): gluing lemma. 240 states (c_i, l_i) per port. The colourings of the two sides merge into a star colouring of G if and only if the colours of the cut edges agree and l_i(y) + l′_i(y) ≤ 2 for all i, y. The number of environment states is 38,400,000 in general and 8,458,240 for matching colour (MC). Source: `informal/c4c-4cut_REPORT.md` "Boundary state and gluing lemma", "Counts".
- **Computed**: the single gadget K2 replaces all admissible sides with 8, 10 and 12 vertices (9/9, 50/50, 410/410). n=12 is a sampled computation and is sound only for positive verdicts. 0 mismatches in the cross-check against a brute-force checker. Source: same report, preamble, "Limits".
- Use of the result: a counterexample with the minimum number of vertices has no 4-edge cut with an admissible side of 8, 10 or 12 vertices. In MC this applies only to all of the 10-vertex ones and 5 of the 9 8-vertex ones. Source: same report, "What a worker would need".

## Failed/refuted approaches

- **Fixed-radius local repair (the "all c′" form of the PMU induction step)**. Tried: for 8 shapes of the neighbourhood of the insertion site, deciding "every boundary colouring is repaired within radius r" with SAT + CEGAR. Where it stopped: all 8 shapes fail at r = 2, 6 shapes fail at r = 3 (2 shapes timed out at the 45-minute cap). Confirmation: realized by actual c4c graphs — tree-type n = 318 (radius 2 impossible, 3 possible), n = 574 (radius 3 impossible, 4 possible), all 8 shapes at r = 2 with n = 258~510. In every realized case a single Kempe swap (component of at most 3 edges) rescues it. **Computed**. Source: `informal/c4c-ball_REPORT.md` §3, §4.
  - Mechanism (the report's explanation): contracting M makes the non-M edges a proper 5-edge-colouring of the 4-regular graph G/M, so each vertex is missing exactly one colour. The fixed boundary colours make the interior of the ball rigid. A random c′ is always repaired and only an adversarial c′ fails. Source: same report §5.
  - Radius 4 and above is unresolved (one probe timed out after 7,872 CEGAR rounds and 50 minutes). Source: same report §5.
- **Radius-1 repair of general colourings**. Refuted at n = 40 by 1 explicit c′. At radius 0, for almost every pair some c′ does not extend. The 1,336 r=0 failures found are all rescued by a single Kempe swap. **Computed**. Source: `c4c-ext_REPORT.md` "Results".
- **Fixed-radius repair of MC colourings without a hypothesis**. If the two new edges have colour 6, the repair needs a matching-alternating cycle and so is not local. r=2 failures for n = 14/16/20/24/30 are 8/7/42/50/50 pairs. **Computed**. Source: `c4c-ext_REPORT.md` "Results", "Failure patterns".
- **Local proof of P19 at radius 2 or less (LEAF-LOCAL)**. Impossible in principle by Theorem O1 (hand proof, **AI-checked**). LEAF-LOCAL(1) has a 44-vertex counterexample (evidence `b44b4c3cf72cbb37`, **computed**). Source: PLAN §4 "P19 증명 세션 완료(23:55)", "P19 국소 검사 세션 완료(10-01 00:10)".
- **Narrowing the core to cyclically 5-edge-connected by the 4-edge-cut reduction**. The 4-cycle side C4 does not reduce to a gadget with at most 3 vertices, in either the general or the MC mode. In general mode one 6-vertex side is also irreducible. The general statement (H-RED) is an infinite family and is unproved beyond 12 vertices. **Computed**. Source: `c4c-4cut_REPORT.md` preamble, "Results".
- **(FE-ALLPM-D)₂₀ (the "every perfect matching" form)**. 2 kinds of bad matching in the exhaustive check for N=20 (18-vertex host + 1 digon). **Computed**. Source: `informal/p16_REPORT.md`.
- **TD-RED-POLE (threshold 10)**. (D3P-SDR) fails at the 10-vertex Y0, pole v=8. At threshold 12 there are 0 failures in the exhaustive check for n = 12/14/16 (1,105/11,854/150,183 poles) and in 494,748 samples for n=18. **Computed**. Source: `informal/p23-pole_REPORT.md`.
- **The existence statement for the P14 relocation path**. P25 fails for 49 out of 154,792 at size 20 (evidence `91f4850e`, counterexample `977968d5`). P28, with the condition corrected to (d★), was also refuted by the falsifier (size 20, D=∅). **Computed**. Source: PLAN §4 "P14 사전 조사 세션 완료(01:15)", "23:35 조치".

## Open questions

- (NR-2) For pairs (n ≥ 16) in which every M-edge belongs to a cyclic 4-edge cut, is there always a usable 4-cycle. No proof idea. False for n = 14 (2 pairs). Source: `c4c-norem_REPORT.md` §4.
- Can PMU be strengthened into a self-reproducing statement that hands over a flexible c′ at the insertion site, or is a non-local repair argument using Kempe/alternating chains (Vizing-type) possible. Source: `c4c-ball_REPORT.md` §6; PLAN §4 "c4c 핵심 공략 종합(10-02)".
- Does the "all c′" form hold at radius 4 and above. At r = 3 the shapes c4e2 and c5u are unresolved. Source: `c4c-ball_REPORT.md` §3, §5.
- The PMU investigation covered simple graphs only. It was not ported to the digons, pole pieces and triangles of the project setting. Source: `c4c-ext_REPORT.md` "Not covered".
- (H-RED): is every admissible 4-pole with 8 or more vertices replaced by K2. Source: `c4c-4cut_REPORT.md`.
- Record of exactly which of the five pieces PMU implies: TODO (no source).
- Assessment on the operations side: proving it within the deadline was judged not to be possible, and it was recorded as a post-competition task. Source: PLAN §4 "c4c 핵심 공략 종합(10-02)".

## Sources

- `harness/docs/mh/PLAN.md` §4 (entries for 10-01, 10-02). This is a manually kept log, and the session completion times come only from this record.
- `openmath/star6_artifact/informal/c4c-ext_REPORT.md`, `c4c-4cut_REPORT.md`, `c4c-ball_REPORT.md`, `c4c-norem_REPORT.md`, `p23-check_REPORT.md`, `p23-pole_REPORT.md`, `p16_REPORT.md`.
- `openmath/star6_packet_final.md` §1.4, §3, §4.1; `openmath/star6_artifact/lean/pack3/STATUS.md`.
- The evidence records and counterexample files are in the project store on the server and are not in this repository (`star6_packet_final.md` §4.4).
- Discrepancy between figures: PLAN summarizes the K2 replacement as "8·10·12꼭짓점 … 유한·검증됨" ("8·10·12 vertices … finite, verified"), but the report states that n=12 is a sampled computation. This note followed the report.
