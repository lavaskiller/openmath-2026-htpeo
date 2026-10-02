# collatz-modular-descent

**Candidate** (`solution.json`): 234 rules, modulus powers <= 12. All 234 pass the hill's `_load_rules` + `_verify_rule`.

**The hidden targets are not available**, so coverage_ppm / min_descent_ppm cannot be computed locally. What is proven locally (`build_rules.py`, `cover_rules.py`):

- Targets are odd classes mod 2^k, k in 8..12: 3968 possible targets. 616 of them cannot be covered by any valid rule (no descent certificate with exponent sum <= k-1, or the least representative does not descend, e.g. residue 1). The other 3352 are all covered by this rule set (checked with the hill's `_covers`).
- For every target for which some valid rule has margin >= 269/512 (= 0.525390625, the board's min_descent value), this set contains such a rule. For the 759 targets whose best possible margin is below 269/512 the set contains some covering rule (coverage first).
- 234 is the minimum number of rules with these two properties (the constraint structure is a tree of dyadic classes, where taking the shallowest admissible ancestor is optimal; greedy + reverse-delete gives the same number).

**Expected official score**: if the leaders' 1,000,000 / 525,390 is the true optimum of the validation targets (two accounts with 3 rules and five more accounts all show exactly 525,390), this submission scores **1,000,000 / 525,390 / 234** -> rank 5 on the 2026-10-02T16:23Z board (3, 3, 166, 167, **234**, 256, 269, 512 rules). Below the leaders (who evidently know which few classes are targeted); it cannot tie without probing the hidden targets through submissions.

Alternatives kept in this folder:
- `cover_269_512_A.json` (205 rules): only targets that admit margin >= 269/512; fewer rules but loses coverage if a final-split target has a weaker best margin.
- `cover_269_512_C.json` (256 rules): every target gets its maximum possible margin capped at 269/512.
- `all_best_rules.json` (649 rules, over the 512 limit): every target's absolute best rule.
- The test split uses other targets: the 234-rule set is target-agnostic, so it keeps full coverage there (a 3-rule set tuned on validation does not).

**How a tie could be reached** (main session, needs submissions): probe which rules are actually needed by submitting subsets and reading coverage_ppm; with 3 rules sufficient, a bisection over the 234 rules needs about 25 submissions.

**Known vs new**: standard accelerated-Collatz descent certificates; nothing new mathematically.
