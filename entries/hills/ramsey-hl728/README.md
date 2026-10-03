# K4 Ramsey multiplicity — result of @hl728

Original certificates and signed hill reports for the final-board result and the later validation-board result. Both required final-board files are included.

## Recorded results

Hill: [`alejandrozu/clique-cluster-ramsey-multiplicity`](https://app.autolab.ai/hills/alejandrozu/clique-cluster-ramsey-multiplicity).
Frozen evaluator tree: `d30eba780f9526ad4b8c3b6c57c96632cb5b0311`.

| Record | density_ppt | Evaluation time (UTC) | Certificate | Signed report | Submission receipt |
|---|---:|---|---|---|---|
| Submitted final-board run | 30,141,921,123 | 2026-09-29T14:09:44Z | [solution.json](solution.json) | [report.json](report.json), `final: true` | [receipt](submission-receipt.json), submitted 2026-09-29T14:50:08.884087Z |
| Later validation-board run | 30,141,720,946 | 2026-09-30T08:14:36Z | [validation-solution.json](validation-solution.json) | [validation-report.json](validation-report.json), `final: false` | [receipt](validation-submission-receipt.json), confirmed 2026-09-30T08:23:56.490913Z |

The repository's 2026-10-02 leaderboard snapshot lists @hl728 as the only entry on the final board and fifth of twelve on the validation board. The receipts record the ranks at submission, which differ from that later snapshot.

The root `solution.json` and `report.json` are the September 29 final-board pair. The improved September 30 certificate is stored under separate validation filenames; it does not replace the certificate of the recorded final-board submission.

## Required files

- [x] `solution.json` of the final-board run, exactly as evaluated
- [x] The signed `report.json` of that run, including hill tree, metrics, mode and signature

Both solution files match the corresponding historical Git snapshots byte-for-byte. Reports and submission receipts are copied without editing; [SHA256SUMS](SHA256SUMS) records file hashes.

## Method and scope

See [NOTES.md](NOTES.md) for search provenance, methods, evaluation commands, exact densities and limitations. These are Python hill evaluations of weighted two-colour templates. No Lean artifact, proof-assistant acceptance, solution of the exact Ramsey multiplicity constant, or literature-record claim is asserted for this folder.

Historical AI token usage and human review/time records are not reconstructed here. The owner's personal declarations in `TEAM.md` remain to be completed by the owner.
