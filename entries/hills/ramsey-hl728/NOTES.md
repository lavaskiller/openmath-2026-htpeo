# Provenance and methods — @hl728 Ramsey hill records

Prepared from the existing local search records on 2026-10-03. The signed reports, certificates and submission receipts are preserved byte-for-byte. This packaging does not run another hill evaluation or submit another leaderboard entry.

## Starting point

The local search started from AutoLab project `hl728/clique-cluster-ramsey-multiplicity-attempt-17`, experiment `5ad5c42f-ef8d-48c5-937c-14c8c86dc744`, code commit `a1fe24da2358596fdc0b7f309912df8fdd1907db`. The certificate was copied from the immutable evaluation snapshot, rather than directly from a paper's seed. The unchanged frozen evaluator tree is `d30eba780f9526ad4b8c3b6c57c96632cb5b0311`; the signed reports identify evaluator commit `a97b93c118b29df95ed4986c33a78a658d3f2989`.

## September 29 final-board certificate

Source: local Git snapshot `codex/ramsey-local-one-hour@9877b74`, immutable certificate `submissions/006-final/solution.json`, report `reports/006-final.json`.

- 1024 blocks, total integer weight 25,172,815.
- Exact density: `127401476184523245082717157/4226720508896627013656177375`.
- Report metric: `density_ppt = 30141921123`, `reference_beaten = 1`, `passed = true`, `official = true`, `final = true`.
- Evaluation: `2026-09-29T14:09:44Z`; AutoLab submission: `2026-09-29T14:50:08.884087Z`.
- File SHA256: `7ca8bddee63e9bba5e74b3d73d6d2f24defad5313eeb45dda5d41db13d22134a`.

The first local round filled the permitted capacity of 1024 blocks, consolidated identical clusters, reused freed slots for merge/split moves, refined pairs of integer weights with colours fixed, and then used weight-aware reallocation with colour/weight relaxation. Exact integer arithmetic accepted candidates; numerical roots only proposed integer weight transfers. The selected certificate's final audit reproduced its validation density exactly.

The recorded final-mode command, run from the historical local search project, was:

```sh
~/.local/bin/hills eval submissions/006-final -H clique-cluster-ramsey-multiplicity --final -o reports/006-final.json
```

The source experiment notes record successful `hills verify reports/006-final.json` and a clean frozen evaluator. The signed report's `submission_hash` hashes a submission and should not be confused with the raw `solution.json` file SHA256. No new HMAC verification is claimed by the file-copy check performed for this contribution.

## September 30 validation-board certificate

Source: immutable certificate `round3/submissions/003-periodic24/solution.json`, identical to `codex/ramsey-local-one-hour@c6ee53b:solution.json`. Its validation report identifies the earlier certificate-freezing Git snapshot `086bd2a`; the solution bytes are identical.

- 1024 blocks, total integer weight 25,339,861.
- Exact density: `12427533938421324776666259885/412303397045424596831631461041`.
- Validation report: `density_ppt = 30141720946`, `passed = true`, `official = true`, `final = false`, timestamp `2026-09-30T08:14:36Z`.
- AutoLab validation submission confirmed `2026-09-30T08:23:56.490913Z`.
- File SHA256: `0d4238ba4389768c8b32eeb4b0952937093cfe0fd7e1760018463996b1319f5e`.

Later search rounds introduced local merge candidates and compared a first-improvement policy with fully relaxed multiple-candidate comparisons. Periodic full-three comparison every 24 sweeps, continued from a stronger control certificate, produced the recorded validation result. This continuation is not an isolated comparison of algorithm performance.

The local records also contain a September 30 final audit with the improved certificate, but the submission receipt explicitly records a validation-board submission. This folder preserves the certificate/report pair actually associated with each recorded board; it does not claim that the improved certificate replaced the September 29 final-board entry.

## Resources, attribution and limits

Search ran on the user's local Mac, with at most four worker processes and one BLAS thread per process. The recorded first round took 3384.585543 seconds (about 56.4 minutes); the third round records about 57.73 minutes. These are search-session wall times, not human time or cumulative CPU time. AI assisted the search and documentation; this contribution was assembled by Codex. Historical model identifiers, token totals and billed costs have not been reconstructed.

These certificates improve the hill's frozen reference `10486266368/768^4`. No novelty ruling, literature-record claim, proof-assistant certificate, or determination of the exact constant is made. The hill report's trust boundary is a Python integer certificate check plus a mathematical lifting lemma. Human-review and attribution/release declarations require the owner's own account and are not filled by this contribution.
