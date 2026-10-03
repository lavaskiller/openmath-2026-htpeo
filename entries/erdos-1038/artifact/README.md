# Erdős #1038 artifact and reproduction

This is the owner’s complete pinned Lean implementation plus updated informal exposition and reusable M2 contribution candidates. The known #1038 final theorem is included for mathematical completeness; it is not a new-solution claim.

| File | Purpose |
|---|---|
| `erdos1038-openmath-20261003.zip` | All 315 proof modules, Verify.lean, toolchain/manifest, scripts, embedded Lean certificates, updated paper/audit and comparison documents. |
| `erdos1038-lean-20261001.zip` | Unchanged earlier compiled artifact; SHA-256 `c4eb54d3496bb654e54773801ac027b9360215018b83e29768e008c93194a502`. Its archived paper/audit is historical and superseded by the current documents. |
| `EP1038_paper.md` | Complete informal derivation, corrected attribution and completed-status Appendix D. |
| `CONTRIBUTIONS.md`, `EXACT_STATEMENTS.md` | Candidate reusable statements, complete hypotheses, comparative scope and prior-art limitations. |
| Loose `.lean` files | Byte-identical excerpts for convenient review; dependencies are in the full ZIP. These excerpts alone are not a standalone project. |
| `package_verification.json`, `original-final-axioms.log` | Recorded 2026-10-01 clean project build and 18 final axiom checks. |
| `VerifyContributions.lean`, `contribution-axioms.log` | Successful 2026-10-03 cached-project type/axiom check of 26 declarations, including 8 candidates. |
| `PACKAGING_RECEIPT.json`, `SHA256SUMS` | Archive identity, unchanged proof/configuration verification and artifact checksums. |
| `informal_audit.md`, `code-overlap-summary.json`, `wang-verification-summary.txt` | Historical completion, implementation comparison and bounded source-overlap screening. |

## Build

```sh
unzip erdos1038-openmath-20261003.zip
cd erdos1038-openmath-20261003
sh scripts/build.sh
cd Lean
lake env lean ../VerifyContributions.lean
```

Elan/Lean, Python 3 and network access to obtain pinned dependencies/caches are needed. Lean `leanprover/lean4:v4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Keep `Lean/lake-manifest.json`; do not update dependencies. Expected: build success; 18 checks in Verify.lean and 26 in the supplementary wrapper; axiom dependencies within propext, Classical.choice, Quot.sound. No proof hole, explicit extra axiom or native_decide is in the scanned proof closure. The uncompiled Formal Conjectures reference is outside the build root and retains its original placeholders.

The earlier run compiled the project sources from an empty project build directory, reusing pinned dependency caches; it did not rebuild all Mathlib. Memory was not recorded. Its recorded elapsed-seconds field and start/end timestamp span differ; timing is not used as a performance claim. This pass checks unchanged sources, manifest/import closure and the 26 cached declarations; it does not claim another fresh build. The team’s separate 4.33.1 server/memory attempt is not this pinned build.

Verify all repository artifact bytes with `bash tools/make_checksums.sh verify entries/erdos-1038` from the repository root. Review PACKET.md for candidacy, human-review status, event provenance and official route fields.
