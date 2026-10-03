# Additional M2 formalizations (helper-erdos3, 2026-10-03 08:10 KST)

Saved by the main session from the helper's final report (the helper could not write `.md` files). Formal-conjectures (FC) pinned at df3f12d7 (= FC main on 2026-10-03), Lean 4.33.1 + Mathlib v4.33.1. Server copy: `~/erdos-fc/m2/extra3/`.

Every claimed theorem was checked by `scripts/e3_verify.py` (table: `VERIFIED.tsv`): the statement text is identical to FC (the file differs from FC only by the removed `sorry` of the proved theorem), the proof has no sorry / admit / native_decide / axiom, the file compiles (`leancheck` rc=0), and `#print axioms` gives `[propext, Classical.choice, Quot.sound]` (logs in `logs/`). The other `sorry` lines in these files belong to FC theorems that were not proved and are not claimed. FC's own `erdos_1148.variants.lower_bound` uses `decide +native`; our theorem does not depend on it. The proofs were written by the helper and checked by the kernel only; no human has reviewed them.

| Family | Theorem | Category | Verdict |
|---|---|---|---|
| E477 | `erdos_477.variants.S_sq`; `erdos_477.variants.degree_two_dvd_condition_b_ne_zero` | research solved | claim (substantive, elementary) |
| E358 | `Erdos358.f_id` | textbook | minor / textbook — team decides |
| E619 | `erdos_619.variants.add_edges_diam_three` | research solved | minor — team decides |
| E1148 | `erdos_1148.variants.weaker` | research solved | minor — team decides |
| E494 | `k_eq_2_card_not_pow_two` (Selfridge–Straus) | research solved | DUPLICATE of TheJustinSunPrize PR #127 (2026-09-16); not claimed |
| E825 | `necessary_cond` (weird number 70) | research solved | DUPLICATE of TheJustinSunPrize PRs #685 and #400; not claimed |

## E477
- `S_sq`: for f = X², no set A ⊆ ℤ makes every integer uniquely a + f(n). Source: Sekanina 1959 ([Sek59] in FC). Proof: odd numbers and multiples of 4 are differences of squares, so distinct elements of A differ by 2 mod 4; hence |A| ≤ 2, but A must be unbounded below.
- `degree_two_dvd_condition_b_ne_zero`: the same for f = aX² + bX + c with a ∣ b. Source: FC docstring (AlphaProof for X² − X + 1, then generalised); the proof is the helper's, by the same argument (every multiple of 4a is a difference of two values; pigeonhole in ZMod |4a|). The hypothesis b ≠ 0 is unused.
- Only Mathlib definitions are used. Prior art: none found (FC has `sorry`; plby proves only the sixth-power case; TheJustinSunPrize/awards PR heads only generic templates; GitHub code search only stubs). The AlphaProof proof of its instance was not found publicly.

## E358
- `f_id`: the number of representations of n as a sum of consecutive positive integers equals the number of odd divisors of n (Sylvester; textbook). Uses FC's definitions `f` and `intervalRepresentations`.
- Doubtful: n = 0 holds only by convention (infinitely many representations, `Nat.card` of an infinite set is 0, `divisors 0 = ∅`). Textbook level.

## E619
- `add_edges_diam_three`: a connected triangle-free graph has a triangle-free supergraph of diameter ≤ 3. Source: EGR98 (Erdős–Gyárfás–Ruszinkó 1998), their preliminary observation (a maximal triangle-free supergraph has diameter ≤ 2), not their quantitative bounds. Easy.

## E1148
- `weaker`: every n is x² + y² − z² with x², y², z² ≤ n + 2√n. Source: [Va99] via FC ("obvious"). ℕ subtraction is truncated, but the witnesses always have x² + y² ≥ z². Trivial level.

## Prior-art check and its limits
Skipped before proving because already formalized elsewhere: 780 sharp (TheJustinSunPrize #700), 69 (#521), 318 `contain_single_even` and `parts.i` (plby), 673 `tao` (plby), 1098 (plby), 650 (van Doorn), 1190 `lt_one` (plby 947 under other definitions).
Searched: FC at the pinned commit; TheJustinSunPrize/awards main and all 4155 PR heads (number and keyword patterns); plby/lean-proofs @ 8822f7d; FC-Bench (with oracles), aristotle, conjectures-io, erdos-lean, williamjblair; GitHub code search for each theorem name and key definition. Not searched: Zulip, arXiv, private repositories, repositories outside code search; Mathlib only for E358's terms.
