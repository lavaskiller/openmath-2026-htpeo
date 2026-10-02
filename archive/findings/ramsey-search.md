# K4 Ramsey multiplicity upper bound: what moved the value during the search

한국어: [ramsey-search.ko.md](ramsey-search.ko.md)

Subject: an upper bound on the K4 Ramsey multiplicity constant c_4 (the limit of the minimum monochromatic K4 density over 2-edge-colourings of K_n). The hill metric is `density_ppt = ⌈10^12 · density⌉`, lower is better. Prior result: Parczyk–Pokutta–Spiegel–Szabó, "New Ramsey multiplicity bounds and search heuristics", arXiv:2206.04036.

## Summary

- The final solution is a 1024-block weighted blow-up template with `density_ppt = 30,139,933,996`. This is 2,339,436 ppt below the hill reference value B* (30,142,273,432, the value of the 768-vertex graph in the concluding Note of the paper above).
- The largest contribution came from the split of 768 blocks into 1024 blocks (about 1.3 million ppt), followed by L-BFGS weight optimization (200 to 250 thousand ppt). These figures are as reported by the search session.
- Single-flip tabu/SA and uniform splitting did not work. Adjusting only the weights on the seed colouring did beat B*, but by a small margin.
- The inequality `c_4 ≤ P < B*` was checked by the Lean 4.33.1 kernel. The proof does not trust the search process itself. Nothing has been human-reviewed.

## Details

### 1. Figures

| Item | Value | Verification level | Source |
|---|---|---|---|
| Final density P | 200080655744752337972227066537 / 6638390640717004439491700265361 (denominator = 50759309^4) | Lean kernel-checked (`sol_density`) | `ramsey_packet.md` §1.1 |
| Hill metric | 30,139,933,996 ppt | Lean kernel-checked (`sol_ppt`); computed (official hill report, re-run on the laptop in 198 s) | `ramsey_packet.md` §1.1, §2.2; `runs/report_1ab2354d.json` |
| Reference value B* | 10486266368 / 768^4 ≈ 30,142,273,432 ppt | The packet-writing session compared it against the arXiv text (AI-checked) | `ramsey_packet.md` §2.5 |
| B* − P | 2,339,436 ppt (≈ 2.34·10^-6) | Difference of the two values above | PLAN §4 "Ramsey 탐색 종료"; `ramsey_packet.md` §1.1 |
| Versus Theorem 1.1 of the paper | Improvement of 4.92·10^-6 | AI-checked (comparison with the literature) | `ramsey_packet.md` §1.3 |
| Fraction of the gap to the lower bound 0.0296 that was closed | About 0.43% | Computed (arithmetic in the packet) | `ramsey_packet.md` §1.3 |
| Versus the leaderboard leader of 09-27 (indirect record) | 1,786,828 ppt lower | Difference from the indirect record | PLAN §4 "Ramsey 탐색 종료" |
| `c_4 ≤ P`, `c_4 < B*` | `ramseyMultK4_le_sol`, `ramseyMultK4_lt_ref`, existence of the limit `ramseyMultK4_limit_lt_ref` | Lean kernel-checked (standard axioms, no `native_decide` in the main chain) | `ramsey_packet.md` §1.1, §2.6 |

Human-reviewed: none. The Lean statements, the transcription, the statement correspondence and the literature paragraphs have all gone unchecked by a human (`ramsey_packet.md` §3.3). The writing session did not read the live leaderboard; the only thing on record is that the operator reported first place on the evening of 2026-10-02 (Addendum of the same document).

### 2. Course of the search

- 2026-09-28~29 (`search/v1/`): baseline run, local search from the seed, weight adjustment, symmetric (orbit) search. Among 6 Autolab experiments, the first to give `reference_beaten = 1` was `0bcf1970` on 2026-09-29 (768 blocks, weights only adjusted). The ppt of that experiment was not recorded. Source: `ramsey_packet.md` §3.1, Addendum table.
- 2026-10-02 (`search/v2/`): about 12 hours on the server. Every candidate was re-scored exactly with the hill evaluator code and recorded in the ledger (62 lines). Source: `ramsey_packet.md` §3.1, §3.3; `runs/ledger_server.tsv`.

Course as read from the ledger (computed — integer arithmetic of the hill evaluator code; times are server time, time zone not recorded):

| Time | ppt | Blocks | Job label | Note |
|---|---|---|---|---|
| 10:16 | 30,141,883,715 | 768 | E4 | First line. Before the split |
| 10:19 | 30,140,885,560 | 1024 | S2 | First line of the 1024 split. 998,155 ppt below the preceding line |
| 10:55 | 30,140,606,048 | 1024 | KW1 | Weight experiment on the 1024-block solution (`jobK.sh` comment) |
| 11:01 | 30,140,555,790 | 1024 | L2 | Designed split + compound-move SA (`jobL.sh` comment) |
| 11:59 | 30,140,211,743 | 1024 | N1f | Description of the job with label N: TODO (no source) |
| 14:49 | 30,139,996,397 | 1024 | N2f | First time below 30,140,000,000 |
| 17:50 | 30,139,956,561 | 1024 | Y2 | basin hopping (`jobY.sh` comment) |
| 19:52 | 30,139,933,996 | 1024 | Y1 | Final |

The 30,142,153,848 ppt of the 09:50 KST interim report (weight optimization, 768 blocks) is a value from before hill-evaluator verification and is not in the ledger. Source: PLAN §4 "Ramsey 탐색 중간(09:50 KST)".

### 3. What worked

The contribution sizes below are as reported by the search session; there is no record of them being confirmed by separate ablation experiments (PLAN §4 "Ramsey 탐색 종료(10-02 20:15 KST)"). Only what can be matched against the ledger is noted alongside.

- Understanding the seed structure: the seed is 192 base blocks × 4 near-twins (768 blocks), and the vertex-pair orbits on which flips occur are only the 28 "soft" orbits of the automorphism group. The search was restricted to these orbits. Source: same PLAN entry; `ramsey_packet.md` §3.1 "Search method".
- Exact incremental evaluator (`tabu.c`, `sa.py`): keeps a table of the change for every flip, giving O(1) proposals. Source: header comment of `search/v2/sa.py`; `ramsey_packet.md` §3.1.
- Compound moves (rotations, alternating 4-cycles): colouring flips interact only when they share a vertex, so instead of flipping one pair at a time they were moved in bundles. Source: PLAN §4 "Ramsey 탐색 중간(09:50 KST)"; comments in `search/v2/jobE.sh`, `jobG.sh`.
- 1024-block split (near-twin split: divide one block in two and give the pairs between the two halves the opposite colour): reported contribution about 1.3 million ppt, the largest. In the ledger, 998,155 ppt dropped at once on the first line of the split. Source: same PLAN entry; header comments of `search/v2/twin.py`, `split4.py`; ledger rows 1~2.
- L-BFGS weight optimization followed by rounding to integer weights of at most 65535: reported contribution 200 to 250 thousand ppt. The weights of the final solution range over 17994~65535, with weight sum 50759309. Source: same PLAN entry; `ramsey_packet.md` §2, §3.1.
- Last-stage basin hopping (SA segment → quench → weight refit): over the 7 lines with label Y in the ledger (17:50~19:52), 30,139,958,907 → 30,139,933,996, about 25 thousand ppt. At the time of termination it was still dropping by about 10 thousand ppt per cycle. Source: ledger rows 55~62; same PLAN entry.

### 4. Design that worked on the Lean certificate side

- 2048 files, one per block and colour, each checked with `decide +kernel`. Masks and weights are packed into 32768-bit natural numbers and the inner sum is computed with the kernel's GMP arithmetic. Sum of per-file times 16,762 s (4.7 CPU hours), 50 minutes with 6 processes, at most 3.30GB per process. **Lean kernel-checked**. Source: `lean/CERT_STATUS.md` Build record.
- For the general lemmas (`Fast.lean`, `Limit.lean`, `Mono.lean`) a Claude session fixed the statements and GPT proved them. It was an AI session that recompiled them and compared whether the statements were the same as those specified (**AI-checked**; the proofs themselves are Lean kernel-checked). Source: `ramsey_packet.md` §3.3.
- What remains as trust boundary: the JSON → Lean transcription is a script (`gen.py`), cross-checked by a separate script (`check_data.py`). The hill's fast `_density` routine is not modelled in Lean; only numerical agreement was checked. A full `lake build` was not run; the build was done module by module. No rebuild on a different machine. Source: `ramsey_packet.md` §2.7.

## Failed/refuted approaches

- **Single-flip tabu/SA**. Tried: tabu flipping one pair at a time from the seed and from the previous best, and fast SA. Where it stopped: reported as not working. Numerical record of how this was confirmed: TODO (no source). Source: PLAN §4 "Ramsey 탐색 종료"; comments in `search/v2/jobA.sh`, `jobB.sh`.
- **Optimizing only the weights on the seed colouring**. Adjusting only the weights at 768 blocks does beat B* (experiment `0bcf1970` of 2026-09-29; the 10-02 09:50 interim value 30,142,153,848 is about 120 thousand ppt below B*). However, it fell about 430 thousand ppt short of the 09-27 leader record. PLAN classifies this under "안 통한 것" ("what did not work"). Source: PLAN §4 "Ramsey 탐색 중간", "Ramsey 탐색 종료"; `ramsey_packet.md` Addendum.
- **Uniform splitting**. Reported as not working. Numerical record: TODO (no source). Source: PLAN §4 "Ramsey 탐색 종료".
- **First design of the certificate** (plain structural recursion, `import Mathlib` in every file): about 45µs and 5.7KB per iteration. Putting 192 blocks in one file exceeded 5GB. It was reduced about 4-fold with primitive recursion and thin imports, and the files were split per block and colour. Source: `lean/CERT_STATUS.md` Build record.
- **Test compilation without a cap**: around 2026-10-02 18:37 KST it rose to 13GB and was OOM-killed. After that, every compilation had a cap. Source: "사고 기록" (incident record) within PLAN §4 "Ramsey Lean 인증서 완료" (hand-written record).
- Not tried: templates other than the seed. Source: PLAN §4 "Ramsey 탐색 종료".

## Open questions

- How much further does the value drop if the search is run longer. It had not converged at the time of termination. If the solution changes, the certificate (about 50 minutes), a resubmission and a packet update are needed. Source: PLAN §4 "Ramsey 개선에 star6 결과를 쓸 수 있는가".
- Do the same moves work on other templates (other Cayley constructions, block counts other than 1024). No record of an attempt.
- It has not been confirmed whether a value below B* has been published since 2024-09. Source: `ramsey_packet.md` §2.5.
- The method belongs to the same line as the cited paper (local search on a blow-up of the known 768-vertex construction) and is not a new idea. The packet also requested only band P1 (p = 0.05). Source: `ramsey_packet.md` §1.3.
- The report has `mode: validation`, `final: false`. It has not been confirmed whether a separate final-mode evaluation is needed. Source: `ramsey_packet.md` §3.5.

## Sources

- `openmath/ramsey_packet.md` §1~§3, Addendum.
- `openmath/ramsey_artifact/runs/ledger_server.tsv` (62 lines), `runs/report_1ab2354d.json`.
- `openmath/ramsey_artifact/lean/CERT_STATUS.md`, `openmath/ramsey_artifact/README.md`.
- Header comments of `job*.sh`, `sa.py`, `twin.py`, `split4.py` in `openmath/ramsey_artifact/search/v2/`.
- The Ramsey entries of `harness/docs/mh/PLAN.md` §4 (hand-written operations record; the contribution sizes and the "worked / did not work" classification come only from here).
- Time discrepancies: the final solution is at 19:52 in the ledger, 11:12 UTC (20:12 KST) in `CERT_STATUS.md`, and 20:15 KST in PLAN. The evaluation report is at 11:38:08Z (20:38 KST) versus PLAN's "21:08 평가 통과" ("21:08 evaluation passed").
