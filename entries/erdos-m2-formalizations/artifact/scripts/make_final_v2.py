#!/usr/bin/env python3
"""make_final.py -- builds ~/erdos-fc/m2/final/{bundle,bundle_optional,SHA256SUMS,VERIFY.md,PRIOR_ART_FINAL.tsv,PACKET_FINAL.md}
from m2/verified.json, m2/bundle and the hand-reviewed prior-art table below (helper-m2-final, 2026-10-02).
Nothing is submitted or uploaded."""
import json, re, shutil, hashlib, pathlib, datetime, subprocess

HOME = pathlib.Path.home(); ROOT = HOME / "erdos-fc"; M2 = ROOT / "m2"; F = M2 / "final"
COMMIT = (ROOT / "FC_COMMIT").read_text().split()[0]
rows = json.loads((M2 / "verified.json").read_text())
for _n in ("PRIOR_ART_FINAL.tsv", "VERIFY.md"):          # keep the v1 outputs
    _b = F / (_n.rsplit(".", 1)[0] + ".v1." + _n.rsplit(".", 1)[1])
    if (F / _n).exists() and not _b.exists(): shutil.copyfile(F / _n, _b)
LPOOL = "https://github.com/Vilin97/lean-pool/blob/c77d19c49b/LeanPool/HadwigerNelsonBounds"
BENCH = "https://github.com/AllenGrahamHart/FormalConjectures-Bench/blob/0d031f72/oracles/erdosproblems-138-difference/Submission.lean"
STAR6 = HOME / "danus-projects/star6/lean433"
JSP = "https://github.com/TheJustinSunPrize/awards/pull/"
PLBY = "https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/"
CIO = "https://github.com/conjectures-io/conjectures-contribution/tree/be220ff/contributions/"
LG = "https://github.com/rjwalters/lean-genius/blob/HEAD/proofs/Proofs/"

# verdict per theorem (short name without the ErdosN. namespace): (verdict, link/evidence)
V = {
 ("44", "greedy_sidon_construction"): ("NEW", "no proof found; conjectures-io erdos-44 proves only maxSidonSubsetCard_icc_bound; lean-genius Erdos44Problem has no greedy N^(1/3) bound; kavanaghpatrick/aristotle-math-problems and FormalConjectures-Bench copies are `sorry` stubs (of an older, false sqrt(N) version of the statement)"),
 ("123", "erdos_123.variants.powers_2_3"): ("NEW", "plby Erdos123.lean and JSP PR #715 treat the three-generator theorem / the 6,10,15 counterexample, not the two-generator set; lean-genius Erdos123Problem derives it from an `axiom powers23_repr` (not a proof); FC upstream PRs #2485/#3344 only retag the category (sorryAx present)"),
 ("918", "erdos_918.variants.eq_aleph_0.parts.i"): ("NEW", "no proof found (lean-genius Erdos918Problem axiomatises the questions; Bench/Aristotle copies are stubs)"),
 ("918", "erdos_918.variants.eq_aleph_0_all_subgraphs.parts.i"): ("NEW", "as above"),
 ("918", "erdos_918.variants.eq_aleph_0_all_subgraphs.parts.ii"): ("NEW", "as above"),
 ("292", "erdos_292.variants.mul"): ("NEW", "plby Erdos292.lean proves only the main density-1 theorem; lean-genius Erdos292Problem states Straus closure and the prime-power fact as `axiom`s"),
 ("292", "erdos_292.variants.two_mul"): ("NEW", "as above; no hit anywhere"),
 ("292", "erdos_292.variants.prime_pow"): ("NEW", "as above (lean-genius: `axiom prime_powers_not_in_A`)"),
 ("395", "erdos_395.variants.one"): ("NEW", "plby Erdos395.lean proves the main sqrt(2) theorem only; lean-genius has `axiom erdos_original_is_false`"),
 ("649", "erdos_649.variants.sampaio"): ("DUPLICATE-CORE", PLBY + "Erdos649.lean#L488 (`sampaio_counterexample : ¬ ∃ n, P n = 19 ∧ P (n + 1) = 2`, own `P n := (n.primeFactors).max.getD 0`; present since the v4.24.0 tree; the FC `formal_proof` tag of the main `erdos_649` points to this very file). CORRECTION: v1 of this packet listed this theorem as NEW -- the plby file had been read only for its last theorem"),
 ("649", "erdos_649.variants.tong"): ("DUPLICATE-CORE", PLBY + "Erdos649.lean#L374 (`tong_counterexamples (p) (hp : p.Prime) : {q | q.Prime ∧ ¬ ∃ n, P n = p ∧ P (n + 1) = q}.Infinite`, the same Dirichlet + quadratic-reciprocity argument, own `P`). rjwalters/lean-genius has it as `axiom tong_theorem`. No proof of the FC statement (with `Nat.maxPrimeFac`) found"),
 ("508", "HadwigerNelsonAtLeast4"): ("DUPLICATE", JSP + "270 (2026-09-16, `hadwiger_nelson_at_least_four : 4 ≤ (UnitDistancePlaneGraph Set.univ).chromaticNumber`, Moser spindle, exact FC shape); subsumed by " + LPOOL + ".lean (5 ≤ χ)"),
 ("508", "HadwigerNelsonAtMostSeven"): ("DUPLICATE-CORE", LPOOL + ".lean (Vilin97/lean-pool, author Egor Lyfar, file history 2026-07-23 .. 2026-09-18: `hadwiger_nelson_known_bounds : 5 ≤ unitDistanceGraph.chromaticNumber ∧ unitDistanceGraph.chromaticNumber ≤ 7`, Isbell hexagonal colouring with lattice step 3/4, own `unitDistanceGraph : SimpleGraph (EuclideanSpace ℝ (Fin 2))`; no `sorry` in the top-level file, header 'Status: verified'; read, not compiled by us). No proof of the FC statement itself found (all public copies are `sorry` stubs; no JSP PR)"),
 ("138", "monoAP_guarantee_set_nonempty"): ("DUPLICATE", JSP + "516 (2026-09-17, exact FC statement `monoAP_guarantee_set_nonempty`, same Hales-Jewett derivation) ; " + BENCH + " (`vdw_nonempty (r k) : (monoAP_guarantee_set r k).Nonempty`, l. 197; the proof linked from FC's `formal_proof` tag of `erdos_138.variants.difference`). Also a thin wrapper: Mathlib has Hales-Jewett `Combinatorics.Line.exists_mono_in_high_dimension` and the van der Waerden corollary `Combinatorics.exists_mono_homothetic_copy`"),
 ("942", "erdos_942.variants.limsup"): ("NEW", "no complete proof found. kavanaghpatrick/aristotle-math-problems (commit 2425339, 2026-06-24) has two automated attempts (`submissions/yolo_results/yolo_d6_e942_limsup_extracted/...` and `.../yolo_mega6_e942_kronecker_extracted/...`, the latter also under `submissions/nu4_final/`) that prove the bookkeeping and leave the simultaneous-approximation lemma (`kronecker_construction` / `simultaneous_approx_primes`) as `sorry`; JSP PR #4355 states 'no complete formalization known' (#3575 is a filler file, #889 only two powerful numbers); conjectures-io erdos-942: 0 contributions; lean-genius / Bench / other copies: stubs; plby: no file"),
 ("770", "Nat.Prime.h_eq_add_one"): ("DUPLICATE", JSP + "580 (2026-09-17, exact FC statement `Erdos770.Nat.Prime.h_eq_add_one`)"),
 ("273", "erdos_273.variants.three"): ("DUPLICATE", JSP + "299 (2026-09-16, `erdos_273_three`, Selfridge's twelve moduli dividing 360, exact FC content) , " + JSP + "281 (`variants_three`, `exact_public_statement`)"),
 ("1136", "erdos_1136.variants.mueller"): ("DUPLICATE", PLBY + "Erdos1136.lean (Mueller's set, sum-freeness and density 1/2: `A_sumfree`, `A_density_half`). The adv5 file copies ~370 lines of that plby file as `namespace MuellerAux` and adds only a ~70-line bridge to the FC definitions `muellerSet` / `HasDensity`"),
 ("698", "erdos_698.variants.erdos_szekeres"): ("NEW", "plby Erdos698.lean proves Bergman's bound for i>=2 (different inequality); JSP PR #589 proves only the sharpness variant; lean-genius has `axiom erdos_szekeres_exponential`"),
 ("698", "erdos_698.variants.erdos_szekeres_sharp"): ("DUPLICATE", JSP + "589 (exact FC statement, 2026-09-17)"),
 ("939", "erdos_939.variants.seven"): ("NEW", "all public copies found (kavanaghpatrick/aristotle-math-problems tier5/6, FormalConjectures-Bench tasks-v2, Paul-Lez/fc100, epoch-research/LeanOpenProblems, ...) are `sorry` stubs; JSP PRs #65/#265/#370 prove the 3-powerful-triples and r=6 infinitude statements, not r=7/8; FC upstream PRs #2591/#3115 only retag"),
 ("939", "erdos_939.variants.eight"): ("NEW", "as r=7"),
 ("295", "exists_k"): ("NEW", "helper lemma of the FC file; JSP PR #271 proves the Erdos-Straus lower bound with its own definitions and assumes existence; no proof of this lemma found"),
 ("703", "erdos_703.variants.zero"): ("TRIVIAL", "source: 'It is trivial that T(n,0)=2^(n-1)'. No prior proof of this exact statement found (plby Erdos703 proves the Frankl-Rodl main theorem)"),
 ("748", "erdos_748.variants.lower_bound"): ("TRIVIAL", "source: 'It is trivial to see'. No prior proof of this exact statement found (plby Erdos748 / JSP #1664 prove the Cameron-Erdos upper bound)"),
 ("1136", "erdos_1136.variants.multiples_of_three"): ("TRIVIAL", "trivial example given on the problem page (density 1/3); plby Erdos1136.lean proves the stronger density-1/2 construction; no prior proof of this exact statement found"),
 ("1136", "erdos_1136.variants.upper_bound"): ("DUPLICATE", PLBY + "Erdos1136.lean (2nd conjunct: upper density <= 1/2 for every such set; subsumes)"),
 ("757", "erdos_757.variants.upperBound"): ("DUPLICATE-CORE", JSP + "74 (2026-09-16: `admissible_le_four_sevenths`, the same Ma-Tang 14-point c <= 4/7 argument, with its own `Admissible` over Finset R; NOT the FC statement `sSup {c | IsAdmissible c} < 3/5`). No proof of the FC statement itself found (Bench/Aristotle copies are stubs; FC PRs #2696/#3218 only retag)"),
 ("261", "erdos_261.variants.borwein_loring"): ("DUPLICATE-CORE", LG + "Erdos261Problem.lean (2026-07-17: `borwein_loring_family`, `ErdosProblem261_infinitely_many`, own definitions `IsRepresentable`; not compiled by us). No proof of the FC statements found; JSP PR #268 covers only n <= 10000"),
 ("261", "erdos_261.variants.borwein_loring_property"): ("DUPLICATE-CORE", "as borwein_loring"),
 ("261", "erdos_261.parts.i"): ("DUPLICATE-CORE", "as borwein_loring"),
 ("36", "minimum_overlap.variants.lower.erdos_1955"): ("DUPLICATE-CORE", LG + "Erdos36Problem.lean (`trivial_lower_bound`, `erdos_lower_quarter`: M(N)/N > 1/4 for all N, own definitions); also TRIVIAL (pigeonhole). No proof of the FC liminf statement found"),
 ("36", "minimum_overlap.variants.upper.erdos_1955"): ("DUPLICATE", JSP + "304 (exact FC statement, 2026-09-16)"),
 ("1063", "erdos_1063.variants.exists_exception"): ("DUPLICATE", JSP + "631 (exact FC statement `erdos_1063.variants.exists_exception`, 2026-09-17)"),
 ("1063", "erdos_1063.variants.monier_upper_bound"): ("DUPLICATE", JSP + "56 , " + JSP + "406 (Monier bound, 2026-09-16); subsumed by https://github.com/pcycho/erdos1063-cambie"),
 ("859", "erdos_859.variants.positive_density"): ("DUPLICATE", CIO + "erdos-859 (`positive_density (t) : (DivisorSumSet t).HasPosDensity`, exact FC statement); FC itself calls it 'an easy sanity check'"),
 ("835", "property_iff_chromaticNumber"): ("DUPLICATE", CIO + "erdos-835 (exact statement); FC category `test`"),
 ("1074", "erdos_1074.variants.EHSNumbers_init"): ("DUPLICATE", CIO + "erdos-1074-variants-ehsnumbers-one-half and https://github.com/williamjblair/lean-proofs/blob/HEAD/ErdosProblems/Erdos1074.lean ; FC category `test`"),
 ("1074", "erdos_1074.variants.PillaiPrimes_init"): ("DUPLICATE", CIO + "erdos-1074-variants-ehsnumbers-one-half ; FC category `test`"),
 ("1193", "erdos_1193.parts.i"): ("DUPLICATE-CORE", PLBY + "Erdos1193.lean (`not_erdos_1193`) and " + JSP + "26 (density-one statements for A = N, g(n) = n+1); also TRIVIAL (source: 'the answer is trivially no')"),
 ("1193", "erdos_1193.parts.ii"): ("DUPLICATE-CORE", "as parts.i"),
 ("1193", "erdos_1193.variants.upper_density_pos"): ("DUPLICATE-CORE", "as parts.i"),
 ("282", "erdos_282.variants.fibonacci"): ("DUPLICATE", JSP + "583"),
 ("291", "erdos_291.parts.ii"): ("DUPLICATE", JSP + "216"),
 ("302", "erdos_302.parts.ii"): ("DUPLICATE", JSP + "301 (corollary of the 5/8 bound)"),
 ("302", "erdos_302.variants.lower_five_eighths"): ("DUPLICATE", JSP + "301"),
 ("302", "erdos_302.variants.lower_half"): ("DUPLICATE", JSP + "301"),
 ("317", "claim2_inequality"): ("DUPLICATE", JSP + "493"),
 ("367", "erdos_367.variants.k_le_two"): ("DUPLICATE", JSP + "455"),
 ("423", "erdos_423.variants.nondecreasing"): ("DUPLICATE", JSP + "415 , https://github.com/baobingzhang/jsp-000348-erdos423-lean"),
 ("865", "erdos_865.variants.k2"): ("DUPLICATE", JSP + "658"),
 ("885", "erdos_885.variants.k_eq_2"): ("DUPLICATE", JSP + "297"),
 ("885", "erdos_885.variants.k_eq_3"): ("DUPLICATE", JSP + "297"),
 ("1008", "erdos_1008.variants.lower_bound"): ("DUPLICATE", PLBY + "Erdos1008.lean (stronger m^(2/3) bound) ; " + JSP + "662"),
 ("602", "erdos_602.variants.two_sets"): ("REJECTED", "proof already present in FC, nothing contributed"),
 ("409", "erdos_409.variants.termination"): ("REJECTED", "proof already present in FC, nothing contributed"),
}

# families: tier, bundle source, claimed theorems, text fields
FAM = [
 dict(n="44", tier="A", src="Erdos44.lean", sess="gptG", claim=["greedy_sidon_construction"],
  source="Greedy Sidon set: for every N >= 1 there is a Sidon set A in {1..N} with |A| >= N^(1/3) (folklore, usually attributed to Erdos; FC cites the survey arXiv:2103.15850, Section 1).",
  new="First formal proof found of the greedy N <= |A|^3 bound in the FC statement. An auxiliary lemma builds the greedy set by recursion on N and shows every x in [1,N] is of the form b+c-a with a,b,c in A, whence N <= |A|^3.",
  corr="Statement is exactly the intended bound, written as `N <= A.card ^ 3` (no real cube roots). No junk values: A is a Finset inside `Finset.Icc 1 N`. Note the FC statement was corrected upstream before the pinned commit (older FC versions claimed the false bound `A.card >= N.sqrt`; public stub copies still carry that).",
  tier_sig="Substantive (textbook-level counting argument, ~80 added lines)."),
 dict(n="123", tier="A", src="Erdos123.lean", sess="gptF", claim=["erdos_123.variants.powers_2_3"],
  source="{2^k 3^l} is d-complete: every (large) integer is a sum of distinct numbers 2^k 3^l none dividing another. Conjectured by Erdos 1992 [Er92b]; proved by Jansen and others by the induction quoted in the FC docstring (erdosproblems.com/123).",
  new="First formal proof found of the two-generator d-completeness statement. Strong induction exactly as in the docstring (double the representation of n/2; for odd n subtract the largest power of 3), with the antichain condition checked.",
  corr="`IsDComplete` asks for representations eventually; the proof gives them for every n (n = 0 by the empty sum), so nothing degenerate is used. `powers 2 * powers 3` is the pointwise product set {2^k 3^l}.",
  tier_sig="Substantive (classical result Erdos called 'nice and difficult'; ~120 added lines)."),
 dict(n="918", tier="A", src="Erdos918.lean", sess="w3f", claim=["erdos_918.variants.eq_aleph_0.parts.i", "erdos_918.variants.eq_aleph_0_all_subgraphs.parts.i", "erdos_918.variants.eq_aleph_0_all_subgraphs.parts.ii"],
  source="Remark on erdosproblems.com/918 about [Er69b]: with '= aleph_0' in place of '<= aleph_0' no such graph exists (a likely typo in the source).",
  new="Formal proofs of three of the four '= aleph_0' impossibility variants. All-subgraph versions: an edgeless subgraph on kappa vertices has chromatic cardinal <= 1. Induced version at aleph_1: a countable colouring of an aleph_1-set has an uncountable colour class, which induces an edgeless graph on aleph_1 vertices. The induced aleph_omega variant (`eq_aleph_0.parts.ii`) is NOT proved (the argument needs regularity).",
  corr="HONESTY NOTE: these statements are true for a structural reason that does not use the chromatic-number hypothesis `G.chromaticCardinal = aleph_2` at all (only #V >= kappa); that is the source's own argument for the all-subgraph versions. For the induced variant `eq_aleph_0.parts.i` the FC formalisation note says the edgeless argument 'does not carry over'; our proof uses a different (pigeonhole) argument, so this variant is slightly more than the source asserts. `chromaticCardinal` is an sInf over cardinals; the proof exhibits explicit colourings, no junk value of sInf is used.",
  tier_sig="Substantive-low (short cardinal arguments, ~100 added lines; FC category `textbook`)."),
 dict(n="292", tier="A", src="Erdos292.lean", sess="gptC", claim=["erdos_292.variants.mul", "erdos_292.variants.two_mul", "erdos_292.variants.prime_pow"],
  source="Observations recorded on erdosproblems.com/292: Straus (A is closed under multiplication), 'easy to see' (A contains no prime power), van Doorn (n in A, n > 1 implies 2n in A).",
  new="First formal proofs found of the three closure/exclusion facts about the set A of largest denominators of Egyptian-fraction representations of 1 (main density theorem is formalized in plby and is not claimed). prime_pow uses p-adic valuations of the unit-fraction sum.",
  corr="FC's A contains 1 (S = {1}); the proofs handle m = 1 / n = 1 honestly and `IsPrimePow 1` is false, so nothing is vacuous. two_mul is not a special case of mul (2 is not in A).",
  tier_sig="Substantive-low (elementary observations; ~190 added lines)."),
 dict(n="395", tier="A", src="Erdos395.lean", sess="gptD", claim=["erdos_395.variants.one"],
  source="Carnielli-Carolino 2011 [CaCa11]: Erdos's original radius-1 reverse Littlewood-Offord question is false (z_1 = 1, z_k = i).",
  new="First formal proof found of the radius-1 counterexample in the FC statement (`answer(False)`); uses n = 2, z = (1, i): all four signed sums have norm sqrt 2 > 1.",
  corr="`answer(False)` is fixed by FC, unchanged. `signedSumCount` is an `ncard` of a finite set of sign vectors and is shown to be 0 by case analysis (no junk value). Only the smallest instance n = 2 of the published family is needed.",
  tier_sig="Substantive-low (short, ~30 added lines)."),
 dict(n="649", tier="A", src="Erdos649.lean", sess="gptE", claim=["erdos_649.variants.sampaio"],
  source="Observation attributed to Sampaio on erdosproblems.com/649: there is no n with P(n) = 19 and P(n+1) = 2.",
  new="First formal proof found of this instance: n+1 = 2^k, 19 | 2^k - 1 forces 18 | k, then 73 | 2^18 - 1 | n contradicts P(n) = 19.",
  corr="`Nat.maxPrimeFac` junk values at n = 0, 1 are excluded inside the proof. FC category `textbook`.",
  tier_sig="Minor-to-substantive (one explicit instance, ~26 added lines)."),
 dict(n="698", tier="A", src="Erdos698.lean", sess="gptB", claim=["erdos_698.variants.erdos_szekeres"], notclaimed=["erdos_698.variants.erdos_szekeres_sharp"],
  source="Erdos-Szekeres 1978: gcd(C(n,i), C(n,j)) >= C(n,i)/C(j,i) >= 2^i for 1 <= i < j <= n/2.",
  new="First formal proof found of the Erdos-Szekeres inequality in the FC statement, via C(n,i) C(n-i,j-i) = C(n,j) C(j,i). (Bergman's stronger theorem for i >= 2 is in plby with a different statement.)",
  corr="Real division by `j.choose i > 0`; no junk. The file also proves the sharpness variant, which is a DUPLICATE of JSP PR #589 and is NOT claimed.",
  tier_sig="Substantive-low (elementary, ~60 added lines for the claimed theorem)."),
 dict(n="939", tier="A", src="Erdos939.lean", sess="gptF", claim=["erdos_939.variants.seven", "erdos_939.variants.eight"],
  source="erdosproblems.com/939: Cambie found sums of r-2 coprime r-powerful numbers that are r-powerful for r = 7 and r = 8.",
  new="First formal proofs found of the r = 7 and r = 8 existence statements, by explicit witnesses checked in the kernel (no native_decide).",
  corr="HONESTY NOTE: the r = 7 witness is {1, 2^7 3^8, 2^9 5^7, 2^15 3^10, 2^9 5^10} with sum 17^8; it uses the summand 1, which is vacuously 7-full, and coprimality in FC is set-wise gcd = 1 (trivial once 1 is present). This satisfies the FC definition `Erdos939Sums 7` but is a degenerate example that is NOT taken from Cambie; it was found by the model's own finite search. The r = 8 witness comes from the binomial identity recorded in the FC docstring (X = 8^8, Y = 7^8), has no summand 1, and is non-degenerate.",
  tier_sig="Minor-to-substantive (explicit certificates)."),
 dict(n="295", tier="A-minor", src="Erdos295.lean", sess="gptG", claim=["exists_k"],
  source="Folklore: for every N there are N <= n_1 < ... < n_k with sum 1/n_i = 1 (needed for k(N) in Erdos problem 295 to be well defined).",
  new="Formal proof of the FC helper lemma (harmonic block plus greedy Egyptian-fraction completion; ~200 added lines). It is what makes FC's `k N := Nat.find (exists_k N)` sorry-free.",
  corr="N = 0 is allowed by the statement; the construction uses denominators > max(N,1), so `1/0 = 0` is not exploited. This is a helper lemma, not a named result of the problem.",
  tier_sig="Minor (helper lemma), although the proof is not short."),
 dict(n="703", tier="A-minor", src="Erdos703.lean", sess="gptE", claim=["erdos_703.variants.zero"],
  source="erdosproblems.com/703: 'It is trivial that T(n,0) = 2^(n-1)' (maximum intersecting family).",
  new="Formal proof of the trivial t = 0 value in the FC statement.",
  corr="`T` is an `sSup` of a bounded nonempty set of naturals; both bounds are proved (no junk).",
  tier_sig="Minor / trivial per the source."),
 dict(n="748", tier="A-minor", src="Erdos748.lean", sess="gptE", claim=["erdos_748.variants.lower_bound"],
  source="erdosproblems.com/748: trivially f(n) >= 2^(n/2) (subsets of the odd numbers are sum-free).",
  new="Formal proof of the trivial lower bound, with the real exponent n/2 as fixed upstream on 2026-09-22 (FC PR #6495).",
  corr="No junk; real power.",
  tier_sig="Minor / trivial per the source."),
 dict(n="1136", tier="A-minor", src="Erdos1136.lean", sess="gptE", claim=["erdos_1136.variants.multiples_of_three"], notclaimed=["erdos_1136.variants.upper_bound"],
  source="erdosproblems.com/1136: the multiples of 3 avoid sums equal to powers of two and have density 1/3 (the trivial example the question asks to beat).",
  new="Formal proof of the trivial example in the FC statement.",
  corr="{n | 3 | n} contains 0; 0 + 0 = 0 is not a power of two, fine. The file also proves `upper_bound`, subsumed by plby (NOT claimed).",
  tier_sig="Minor / trivial."),
 dict(n="757", tier="B", src="Erdos757.lean", sess="w3e", claim=["erdos_757.variants.upperBound"],
  source="FC docstring: Gyarfas-Lehel 1995 [GyLe95] ('the supremum is smaller than 3/5'). The proof here does NOT follow [GyLe95]: it uses the 14-point set of Jie Ma and Quanyu Tang, 'Largest Sidon subsets in weak Sidon sets', arXiv:2602.23282 (2026), which gives sup <= 4/7.",
  new="Proof of the exact FC statement `sSup {c | IsAdmissible c} < 3/5`. The integer set {0,136,200,243,246,249,272,286,298,323,400,528,596,1056} is checked by `decide` to satisfy the (4,5) condition and to have no Sidon subset of size 9 (every 9-subset contains one of 12 listed 3-term APs); it is transported to R; hence every admissible c satisfies 14 c <= 8.",
  corr="Is using Ma-Tang fine for the fixed statement? Yes: the statement only asserts sup < 3/5 and 4/7 < 3/5; any valid proof suffices, and the strict inequality is in fact not obviously delivered by the cited non-strict Gyarfas-Lehel bound. The set {c | IsAdmissible c} is nonempty (c <= 0) and bounded above, and the proof bounds every admissible c, so no junk value of `sSup` is used; `Set.ncard` is only applied to finite sets. The implicit `{A : Set R}` in the FC statement is unused. PRIOR ART: the same mathematical result (Ma-Tang 14-point set, c <= 4/7) was formalized publicly on 2026-09-16 in JSP PR #74 with its own definitions; only the FC-statement form is new here.",
  tier_sig="Would be the most substantive item of the batch, but the core is not a first formalization."),
 dict(n="261", tier="B", src="Erdos261.lean", sess="gptA", claim=["erdos_261.variants.borwein_loring", "erdos_261.variants.borwein_loring_property", "erdos_261.parts.i"],
  source="Borwein-Loring 1990 [BoLo90]: for n = 2^(m+1) - m - 2, n/2^n = sum_{n<k<=n+m} k/2^k; hence infinitely many n have the property (Erdos credits Cusick for infinitude).",
  new="Proofs of the three FC statements (identity by telescoping; property for m >= 2; infinitude, `answer(True)`).",
  corr="Natural subtraction in n is justified (m + 2 <= 2^(m+1)); `answer(True)` fixed by FC. No junk. PRIOR ART: rjwalters/lean-genius `Erdos261Problem.lean` (2026-07-17) already contains `borwein_loring_family` and an 'infinitely many' theorem with its own definitions (we did not compile it); only the FC-statement form is new here.",
  tier_sig="Elementary; core not a first formalization."),
 dict(n="36", tier="B", src="Erdos36.gptA.lean", sess="gptA", claim=["minimum_overlap.variants.lower.erdos_1955"],
  source="Erdos 1955: M(N) >= N/4 (pigeonhole), i.e. liminf M(N)/N >= 1/4.",
  new="Proof of the FC liminf statement.",
  corr="No junk. PRIOR ART: lean-genius `Erdos36Problem.lean` proves M(N)/N > 1/4 for all N with its own definitions; the bound is the trivial pigeonhole bound. (The upper bound variant is a DUPLICATE of JSP PR #304 and lives in a different session file, not bundled here.)",
  tier_sig="Minor / trivial; core not a first formalization."),
]

# ---- v2 changes to the family list
FAM = [f for f in FAM if f["n"] != "649"]
FAM.insert(0, dict(n="942", tier="A", src="Erdos942.lean", srcpath=str(M2 / "build/adv3/Erdos942.lean"), sess="adv3", claim=["erdos_942.variants.limsup"],
  source="erdosproblems.com/942 (FC docstring: 'It is not hard to prove that limsup h(n) = infinity'), where h(n) is the number of powerful integers in [n^2, (n+1)^2). Standard argument: the powerful numbers a^2 p^3 (p prime) plus simultaneous Diophantine approximation.",
  new="First complete formal proof found. Two earlier public attempts by an automated prover (kavanaghpatrick/aristotle-math-problems) reduce the theorem to a simultaneous-approximation lemma and leave exactly that lemma as `sorry` ('requires Kronecker's theorem ... not available in Mathlib'). The proof here closes the gap without Kronecker's theorem and without any linear-independence input: homogeneous simultaneous Dirichlet approximation on the torus (R/Z)^k, obtained from Mathlib's `NormedAddCommGroup.exists_norm_nsmul_le` (measure pigeonhole on a compact group), gives arbitrarily large q with every q / p_i^(3/2) within epsilon of a positive integer a_i; then every a_i^2 p_i^3 lies in [(q-1)^2, (q+1)^2), and of 2M such numbers M lie in one of the two adjacent intervals [(q-1)^2, q^2), [q^2, (q+1)^2). Distinctness of the numbers a_i^2 p_i^3 is by parity of the p_i-adic valuation.",
  corr="The statement is `atTop.limsup (fun n => (h n : ℕ∞)) = ⊤`; the proof shows: for all M, N there is n >= N with h(n) >= M, which is what the limsup in ℕ∞ expresses (no junk value). FC's `Powerful` (= `Nat.Powerful`) also holds for 0 and 1; the witnesses are numbers a^2 p^3 with a > 0, so this plays no role. One added line `open MeasureTheory` (the script's semantic statement check -- restating the FC statement at the end of the file and comparing types by `rfl` -- passed). FC category is `textbook`.",
  tier_sig="Substantive: the strongest Erdos item of the batch (about 230 added lines, real analysis on the torus; earlier automated attempts stalled on exactly this step)."))
FAM.append(dict(n="649", tier="B", src="Erdos649.lean", srcpath=str(M2 / "build/adv4/Erdos649.lean"), sess="adv4", claim=["erdos_649.variants.tong", "erdos_649.variants.sampaio"],
  source="erdosproblems.com/649. Tong: for every prime p there are infinitely many primes q with no n such that P(n) = p and P(n+1) = q. Sampaio: there is no n with P(n) = 19 and P(n+1) = 2.",
  new="Proofs of the two FC statements in terms of `Nat.maxPrimeFac`. tong: Dirichlet's theorem (`Nat.infinite_setOfPred_prime_and_eq_mod`) gives infinitely many primes q ≡ -1 (mod 8·p!); by quadratic reciprocity and the supplementary law for 2 every prime r <= p is a square mod q, hence so is n; but -1 is not a square mod q (q ≡ 3 mod 4), so q does not divide n+1. sampaio: n+1 = 2^k, 19 | 2^k - 1 forces 18 | k, then 73 | 2^18 - 1 | n.",
  corr="`Nat.maxPrimeFac` junk values at n = 0, 1 are excluded inside the proofs (P(n) = p prime forces n > 1). The tong proof is the real theorem for every prime p (not a degenerate case). PRIOR ART: plby/lean-proofs `Erdos649.lean` already proves both results (`tong_counterexamples`, `sampaio_counterexample`) with its own `P n := (n.primeFactors).max.getD 0`; only the FC-statement form is new. CORRECTION to v1 of this packet, which claimed `sampaio` as a new substantive family: that was an error of the earlier prior-art pass.",
  tier_sig="Tong's theorem is a genuine number-theoretic result, but it is not a first formalization."))
FAM.append(dict(n="508", tier="B", src="Erdos508.lean", srcpath=str(M2 / "build/adv1/Erdos508.lean"), sess="adv1", claim=["HadwigerNelsonAtMostSeven"], notclaimed=["HadwigerNelsonAtLeast4"],
  source="Hadwiger-Nelson problem. Upper bound χ(R^2) <= 7: Isbell's hexagonal colouring (see Soifer, The Mathematical Coloring Book, 2008). Lower bound χ(R^2) >= 4: the Moser spindle (L. Moser and W. Moser, 1961).",
  new="Proof of the exact FC statement `χ(ℝ²) ≤ 7` for FC's `UnitDistancePlaneGraph Set.univ`: triangular lattice of centres ((4/5)(i + j/2), (2√3/5) j), colour (i + 5j) mod 7; every point of the plane is at distance < 1/2 from some centre (squared distance <= 16/75, proved in oblique coordinates with floors); two distinct centres of the same colour are at distance > 2 because i^2 + ij + j^2 is a positive multiple of 7; so two points of the same colour are at distance < 1 or > 1. The file also proves `4 ≤ χ(ℝ²)` with an explicit Moser spindle (seven points with coordinates in Q(√3, √11), eleven unit distances checked by `nlinarith`, the 3-colour contradiction by two 'diamond' lemmas).",
  corr="Both proofs are the real theorems, not artefacts: FC's graph has as vertices the subtype of `Set.univ` in `EuclideanSpace ℝ (Fin 2)`, adjacency `dist x y = 1`, and `chromaticNumber` is ℕ∞-valued; the upper bound exhibits a total colouring of the whole plane by `ZMod 7` (the nearby centre is picked by `Classical.choose`), the lower bound exhibits a genuine unit-distance configuration with exact real coordinates. PRIOR ART: Vilin97/lean-pool `HadwigerNelsonBounds` proves 5 <= χ <= 7 (same Isbell construction, own graph definition), and JSP PR #270 proves `4 ≤ χ(ℝ²)` in the exact FC shape; so only the FC-statement form of the upper bound is new.",
  tier_sig="Famous classical result, about 300 added lines, but not a first formalization (lean-pool)."))

def short(t): return re.sub(r"^Erdos\d+\.", "", t)
byname = {}
for r in rows:
    byname.setdefault((r["problem"], short(r["theorem"])), r)

# ---------- bundle
for d in ("bundle", "bundle_optional"):
    p = F / d
    if p.exists(): shutil.rmtree(p)
    p.mkdir(parents=True)
for f in FAM:
    dst = F / ("bundle_optional" if f["tier"] == "B" else "bundle") / ("Erdos%s.lean" % f["n"])
    shutil.copyfile(pathlib.Path(f["srcpath"]) if f.get("srcpath") else M2 / "bundle" / f["src"], dst)
    f["dst"] = dst; f["sha"] = hashlib.sha256(dst.read_bytes()).hexdigest()
    txt = dst.read_text()
    f["printed"] = re.findall(r"^#print axioms (\S+)", txt, re.M)
for d in ("bundle", "bundle_optional"):
    with open(F / d / "SHA256SUMS", "w") as fh:
        for f in FAM:
            if f["dst"].parent.name == d: fh.write("%s  %s\n" % (f["sha"], f["dst"].name))

# ---------- star6 (Schoenberger / Petersen): Star6Simple.lean + dependency note
def _closure(mod, seen, order, dirs):
    if mod in seen: return
    f = None
    for d in dirs:
        if (d / (mod + ".lean")).exists(): f = d / (mod + ".lean"); break
    seen[mod] = f
    if f is None: return
    for l in f.read_text(errors="replace").splitlines():
        m = re.match(r"\s*(?:public\s+)?import\s+(\S+)", l)
        if m: _closure(m.group(1), seen, order, dirs)
    order.append(mod)
_seen, _order = {}, []
_closure("Star6Simple", _seen, _order, [STAR6 / "pack5/src", STAR6 / "pack3/src"])
S6_P5 = [m for m in _order if _seen[m].parent.parent.name == "pack5"]
S6_P3 = [m for m in _order if _seen[m].parent.parent.name == "pack3"]
S6_EXT = sorted(m for m in _seen if _seen[m] is None)
_s2, _o2 = {}, []
_closure("MhFact_046773df0a672922", _s2, _o2, [STAR6 / "pack3/src"])
S6_CORE = [m for m in _o2 if _s2[m] is not None]
S6_LINES = sum(len(_seen[m].read_text(errors="replace").splitlines()) for m in _order)
S6_CORE_LINES = sum(len(_s2[m].read_text(errors="replace").splitlines()) for m in S6_CORE)
shutil.copyfile(STAR6 / "pack5/src/Star6Simple.lean", F / "bundle/Star6Simple.lean")
shutil.copyfile(F / "star6check/Star6Simple.out", F / "bundle/Star6Simple.out")
S6_SHA = hashlib.sha256((F / "bundle/Star6Simple.lean").read_bytes()).hexdigest()
S6_AX = [l.strip() for l in (F / "bundle/Star6Simple.out").read_text().splitlines() if "depends on axioms" in l]
assert S6_SHA == "37fabd0f3cc1c26effe55b87e6d6574bd4e204951623754b2ba0be64703c1b04", S6_SHA
assert len(S6_AX) == 4 and all(l.endswith("[propext, Classical.choice, Quot.sound]") for l in S6_AX) and (F / "bundle/Star6Simple.out").read_text().strip().endswith("rc=0")
dep = ["# Star6Simple.lean -- dependency note", "",
 "`Star6Simple.lean` (sha256 `%s`) is NOT a standalone file: it is module `Star6Simple` of the star6 Lean library (Lean 4.33.1 + Mathlib v4.33.1, Mathlib commit `0df444a360ea`)." % S6_SHA,
 "The library is not copied into this bundle; it lives in the star6 artifact (`openmath/star6_artifact/lean/pack3/src`, `.../pack5/src`; server: `~/danus-projects/star6/lean433/pack3`, `pack5`).", "",
 "## Exact module list (transitive imports of `Star6Simple`, in import order)", "",
 "pack5 (%d): %s" % (len(S6_P5), ", ".join("`%s`" % m for m in S6_P5)), "",
 "pack3 (%d): %s" % (len(S6_P3), ", ".join("`%s`" % m for m in S6_P3)), "",
 "Mathlib modules imported directly by these files (%d): %s" % (len(S6_EXT), ", ".join("`%s`" % m for m in S6_EXT)), "",
 "Total: %d library modules, %d lines. The import chain of pack3 is linear, so `Star6Simple` imports all of it through `Star6Corollaries`." % (len(_order), S6_LINES), "",
 "## Where the mathematics is", "",
 "Schoenberger's theorem is proved in pack3 module `MhFact_046773df0a672922` (550 lines; `RH2P.schoenberger`, `RH2P.pstat`), directly from `SimpleGraph.tutte` (`Mathlib.Combinatorics.SimpleGraph.Tutte`). That module's own transitive imports are the %d-module prefix (%d lines): %s." % (len(S6_CORE), S6_CORE_LINES, ", ".join("`%s`" % m for m in S6_CORE)),
 "The remaining pack3 modules are imported only because the plain-vocabulary translation (`Star6.plain_schoenberger`, module `Star6Corollaries`, via the fidelity module `RH2Fid`) sits at the end of the chain; they are not used mathematically for Schoenberger/Petersen.", "",
 "## Build", "",
 "With pack3 built (`pack3/build/*.olean`, Mathlib cache in `pack3/.lake/packages`): `bash pack5/build5.sh` (compiles `Star6Bounded`, `Star6Corollaries`, `Star6Equiv`, `Star6Simple` with `lean -o`; about 20 s per module, < 3 GB).",
 "`Star6Simple.out` in this bundle is the compiler output of an independent re-compilation by the M2 helper on 2026-10-02 (same command line as `build5.sh`, output written outside the star6 tree, last line `rc=0`). Expected axiom lines:", "", "```"] + S6_AX + ["```", ""]
(F / "bundle/STAR6_DEPENDENCY.md").write_text("\n".join(dep))
with open(F / "bundle/SHA256SUMS", "a") as fh:
    for n in ("Star6Simple.lean", "Star6Simple.out", "STAR6_DEPENDENCY.md"):
        fh.write("%s  %s\n" % (hashlib.sha256((F / "bundle" / n).read_bytes()).hexdigest(), n))

# ---------- VERIFY.md
def expected(f):
    out = []
    for t in f["printed"]:
        out.append("'%s' depends on axioms: [propext, Classical.choice, Quot.sound]" % t)
    return out
vm = ["# VERIFY -- OpenMath 2026 M2 bundle (Erdos problems, formal-conjectures statements)", "",
 "Environment: `google-deepmind/formal-conjectures` at commit `%s`, toolchain `leanprover/lean4:v4.33.1`, Mathlib as pinned by that commit's `lake-manifest.json`." % COMMIT, "",
 "```", "git clone https://github.com/google-deepmind/formal-conjectures && cd formal-conjectures", "git checkout %s" % COMMIT,
 "lake exe cache get                         # Mathlib build cache", "lake build FormalConjecturesUtil FormalConjecturesForMathlib   # required: the FC libraries imported by every problem file (this is what the team server ran, see ~/erdos-fc/setup.sh)",
 "(cd /path/to/bundle && sha256sum -c SHA256SUMS)", "for f in /path/to/bundle/Erdos*.lean; do lake env lean \"$f\" || echo FAIL $f; done", "```", "",
 "Each file is the pinned `FormalConjectures/ErdosProblems/<n>.lean` with the `sorry` of the target theorem(s) replaced by a proof, private auxiliary declarations added, and `#print axioms` lines appended. Expected per file: exit code 0 and exactly the lines listed below. Warnings `declaration uses 'sorry'` refer to other, untouched statements of the same FC file (open problems etc.); they are not targets and are not claimed.", "",
 "No `native_decide`, `axiom`, `unsafe`, `implemented_by`, `admit` in any file; no target depends on `sorryAx`.", "",
 "## Expected `#print axioms` output", ""]
for d, title in (("bundle", "bundle/ (claimed set)"), ("bundle_optional", "bundle_optional/ (not claimed by default, see PACKET_FINAL_v2.md section 3)")):
    vm.append("### " + title); vm.append("")
    for f in FAM:
        if f["dst"].parent.name != d: continue
        vm.append("`%s`  (sha256 `%s`)" % (f["dst"].name, f["sha"])); vm.append("```")
        vm += expected(f); vm.append("```")
        nc = [t for t in f["printed"] if any(t.endswith(x) for x in f.get("notclaimed", []))]
        if nc: vm.append("(proved in the file but NOT claimed: %s)" % ", ".join("`%s`" % x for x in nc))
        vm.append("")
vm += ["### bundle/Star6Simple.lean (family G-PM: Schoenberger / Petersen) -- different environment", "",
 "`Star6Simple.lean`  (sha256 `%s`) is a module of the star6 library and does NOT compile inside formal-conjectures. It needs the %d modules listed in `STAR6_DEPENDENCY.md` (star6 artifact, pack3 + pack5; Lean 4.33.1, Mathlib v4.33.1). With pack3 built: `bash pack5/build5.sh Star6Simple` (after `Star6Bounded Star6Corollaries`). Expected (`Star6Simple.out`, last line `rc=0`):" % (S6_SHA, len(_order) - 1), "```"] + S6_AX[:2] + ["```",
 "(the same file also proves `Star6.simple_star6_cubic_bridgeless_le14` and `Star6.simple_star6_subcubic_le7`, which belong to the star6 submission and are not M2 claims)", ""]
vm += ["Server shortcut used by the team: `~/erdos-fc/leancheck.sh /abs/path/File.lean`; full audit (statement identity against the pinned FC file, whole-file diff, axioms, forbidden tokens): `python3 ~/erdos-fc/m2/verify_all.py` -> `~/erdos-fc/m2/VERIFIED.tsv`.", ""]
(F / "VERIFY.md").write_text("\n".join(vm))
for d in ("bundle", "bundle_optional"): shutil.copyfile(F / "VERIFY.md", F / d / "VERIFY.md")

S6_PRIOR = ("no Lean proof found: Mathlib v4.33.1 (Mathlib/, Archive/, Counterexamples/) has `SimpleGraph.tutte` and `IsBridge` but no hit for petersen/schoenberger/bridgeless-matching; mathlib4 PR/issue search 'Petersen theorem perfect matching', 'bridgeless cubic perfect matching', 'Schönberger': 0 hits; KunalRelia/VCCBG states it as `public axiom PetersenMatching` ('Petersen 1891 (not yet in Mathlib)'); "
            "KokunoYumeto/lean-theorems-1 `petersen_bridgeless_cubic_1factor` takes Tutte's condition as a hypothesis `h_tutte` and is therefore not a proof of Petersen's theorem; Vilin97/lean-pool, plby/lean-proofs, formal-conjectures (Wikipedia/LovaszPlummerConjecture.lean only uses `IsBridgeless` in a conjecture), all 4155 JSP PR heads: no hit")
# ---------- PRIOR_ART_FINAL.tsv
famtier = {}
for f in FAM:
    for c in f["claim"]: famtier[(f["n"], c)] = f["tier"]
with open(F / "PRIOR_ART_FINAL.tsv", "w") as fh:
    fh.write("problem\ttheorem\tfc_category\tverdict\tdecision\tevidence\n")
    seen = set()
    for r in rows:
        k = (r["problem"], short(r["theorem"]))
        if k in seen: continue
        seen.add(k)
        v, ev = V.get(k, ("UNREVIEWED", "-"))
        t = famtier.get(k)
        dec = {"A": "CLAIM (substantive)", "A-minor": "CLAIM? (minor/sanity list)", "B": "OPTIONAL (not claimed by default)"}.get(t, "NOT CLAIMED")
        fh.write("\t".join([k[0], k[1], r["category"], v, dec, ev]) + "\n")
    fh.write("\t".join(["G-PM", "Star6.simple_schoenberger", "(star6 library, not FC)", "NEW", "CLAIM (substantive)", S6_PRIOR]) + "\n")
    fh.write("\t".join(["G-PM", "Star6.simple_petersen_connected", "(star6 library, not FC)", "NEW", "CLAIM (substantive)", "as simple_schoenberger; corollary (connected case only)"]) + "\n")
    missing = [k for k in V if k not in seen]
    assert not missing, missing

# ---------- PACKET_FINAL.md
A = [f for f in FAM if f["tier"] == "A"]; Am = [f for f in FAM if f["tier"] == "A-minor"]; B = [f for f in FAM if f["tier"] == "B"]
nth = lambda L: sum(len(f["claim"]) for f in L)
now = datetime.datetime.utcnow().strftime("%Y-%m-%dT%H:%MZ")
P = []
w = P.append
w("# OpenMath 2026 -- M2 formalization packet, FINAL DRAFT v2 (not submitted)")
w("")
w("Prepared %s by helper-m2-advanced (Claude) from `~/erdos-fc/m2/`; supersedes `PACKET_FINAL.md` (v1, kept). Nothing has been submitted, uploaded or sent. Fields marked **TODO(operator)** must be filled by the team." % now)
w("")
w("Local artifact repository (unpublished, no remote): `openmath/erdos_m2_artifact/`, commit `@@ARTIFACT_COMMIT@@`.")
w("")
w("## 0. Summary")
w("")
_nrows = len(rows); _nthm = len(set((r["problem"], short(r["theorem"])) for r in rows)); _nfam = len(set(r["problem"] for r in rows))
_ok = sum(1 for r in rows if r["verdict"].startswith("VERIFIED"))
w("- Mechanically verified pool: %d rows / %d distinct theorems / %d Erdos-problem families, of which %d rows pass (compile rc 0, statement textually identical to the pinned FC commit, axioms within [propext, Classical.choice, Quot.sound]) and %d are rejected (proof was already in FC); `verify_all.py` re-run 2026-10-02 14:16 UTC including the five 'advanced' sessions adv1..adv5." % (_nrows, _nthm, _nfam, _ok, _nrows - _ok))
w("- **Claimed set: %d families** = %d substantive (section 1: G-PM + %d Erdos families, %d Erdos theorems) + %d minor/sanity (section 2, %d theorems, team to decide)." % (1 + len(A) + len(Am), 1 + len(A), len(A), nth(A), len(Am), nth(Am)))
w("  - Substantive, ordered by level: G-PM (Schoenberger's theorem and Petersen's theorem, connected case, from the star6 library), " + ", ".join("E" + f["n"] for f in A))
w("  - Minor / sanity: " + ", ".join("E" + f["n"] for f in Am))
w("- Optional, NOT claimed by default (section 3): %d theorems in %d families (%s) -- the FC statement has no prior formal proof that we could find, but the same mathematics was already formalized publicly under different definitions." % (nth(B), len(B), ", ".join("E" + f["n"] for f in B)))
w("- **What changed against v1.** (a) New substantive families: G-PM and E942. (b) **Correction: E649 is moved from 'substantive' to 'optional'**: plby/lean-proofs already proves Sampaio's instance (and Tong's theorem) with its own definition of P(n); v1 was wrong to call it new. (c) Of the eight 'advanced' results produced on 2026-10-02 (E508 x2, E138, E942, E649 tong, E770, E273, E1136 mueller), the exhaustive prior-art pass found that **only E942 is new**: E508 `4 ≤ χ`, E138, E770, E273 are exact duplicates of JSP pull requests of 2026-09-16/17, E1136 mueller is plby's theorem (with plby code copied), E508 `χ ≤ 7` and E649 tong are formalized elsewhere under other definitions (optional). All eight are mechanically verified and are genuine proofs (section 4 and the notes in sections 1 and 3); they are simply not first formalizations.")
w("- Excluded as duplicates (section 4): E508 `HadwigerNelsonAtLeast4`, E138, E770, E273, E1136 `mueller` (this pass); E1063, E859, E835, E1074, E1193, E282, E291, E302, E317, E367, E423, E865, E885, E1008 (earlier); inside claimed/optional families `erdos_698.variants.erdos_szekeres_sharp`, `erdos_1136.variants.upper_bound` and `HadwigerNelsonAtLeast4` stay proved in the files but are not claimed. E723 and E120 were skipped by the proving sessions as duplicates of conjectures-io contributions. E617 `r_eq_3`: @@E617@@")
w("- M2 counts families, not theorems (handbook 4.1). Each family below is one Erdos problem number; variants of one problem are never counted separately.")
w("- Human review status: **none yet**. All proofs were written by an AI model and checked only by the Lean kernel and by scripts.")
w("")
BOIL = []; w = BOIL.append
w("## 5. Identity / target (handbook 8.1)")
w("")
w("- Submission / version: **TODO(operator)** (Autolab submission ID) / packet final-draft 2")
w("- Modality: **M2** (new formalizations of known mathematics; separate M2 family leaderboard, handbook 4.1). No open-problem credit is requested for anything here.")
w("- Roster / entrant class / affiliations / resource classification: **TODO(operator)** (team entrant)")
w("- Authors / contributions: **TODO(operator)** for the humans. Proofs of the Erdos families: OpenAI GPT (`gpt-6-sol`) run through the `codex` CLI in unattended sessions. G-PM: the star6 library was produced by the team's star6 project (AI-written, see the star6 packet); the 115-line translation to Mathlib `SimpleGraph` in `Star6Simple.lean` was written by `gpt-6-sol` against statements fixed beforehand. Verification scripts, prior-art search and this packet: Claude (Anthropic).")
w("- Source / snapshot: `google-deepmind/formal-conjectures` commit `%s`, files `FormalConjectures/ErdosProblems/<n>.lean`; informal source https://www.erdosproblems.com/<n> and the references in each FC docstring." % COMMIT)
w("- Family IDs: `E<n>` = Erdos problem n; `G-PM` = perfect matchings in bridgeless cubic graphs (Schoenberger 1934 / Petersen 1891), from the star6 library, not from formal-conjectures. Exact claims: the Lean statements listed per family, verbatim from the pinned FC commit. Claimed completeness: each listed theorem is fully proved; the main (often open) statement of each problem is NOT claimed. Requested p: n/a (M2).")
w("")
w("## 6. Artifact / proof (handbook 8.2)")
w("")
w("- Autolab owner, Hill hash/version, Climb link, final commit, evaluator report: **TODO(operator)**")
w("- Formal source: `bundle/Erdos<n>.lean` (one file per claimed family), `bundle/SHA256SUMS`, `VERIFY.md`; optional families in `bundle_optional/`. G-PM: `bundle/Star6Simple.lean` + `bundle/STAR6_DEPENDENCY.md` (exact list of the star6 modules it imports) + `bundle/Star6Simple.out`; the library itself is in the star6 artifact and is not duplicated here.")
w("- Environment: Lean `leanprover/lean4:v4.33.1`; Mathlib as pinned by formal-conjectures at `%s`." % COMMIT)
w("- Reproduction: `git checkout %s` in formal-conjectures, `lake exe cache get`, `lake env lean bundle/Erdos<n>.lean`; expected output lines are listed in `VERIFY.md`." % COMMIT)
w("- Statement correspondence (mechanical): for every target the text from the attribute line through `:=` is compared (comments stripped, whitespace-normalised) with the pinned FC file, and a whole-file diff confirms that the only removed FC lines are the `sorry` proofs of the targets. Added lines are private auxiliary declarations plus, in some files, `open`/`set_option`/local `instance` lines (listed in `VERIFIED.tsv` flags). Per-family notes on what the statement really says are given below.")
w("- Axioms / trust: every target prints `[propext, Classical.choice, Quot.sound]`. No `native_decide`, `axiom`, `unsafe`, `implemented_by`, `admit`. Other, untouched statements of the same FC files still contain `sorry`; they are not claimed and no target depends on them.")
w("- `answer(...)`: no target contains `answer(sorry)`; `answer(True)` / `answer(False)` terms were fixed by FC and are unchanged.")
w("")
w("## 7. Provenance (handbook 8.3)")
w("")
w("- Baseline: formal-conjectures at `%s` (statements and definitions; not our work) and Mathlib. Event delta: the proofs and auxiliary lemmas, all produced on 2026-10-02 inside the event window (session directories `~/erdos-fc/work/<session>/` with prompts and `codex_*.log`)." % COMMIT)
w("- AI / tool disclosure: proofs written by OpenAI GPT `gpt-6-sol` via `codex exec` (unattended); Lean 4 via `lake env lean`; verification (`verify_all.py`), prior-art search (`prior_art.py`, `final/jsp_scan*.py`, `final/gh_check.py`) and packet by Claude (Anthropic). Compute: one team server. Model versions / credits: **TODO(operator)**.")
w("- Human checking statement: **TODO(operator)**. At the time of writing no human has read the proofs or this packet.")
w("- Outside help / conflicts: none known to the helper; **TODO(operator)** confirm.")
w("- Prior-art search performed 2026-10-02 (what was searched):")
w("  1. `TheJustinSunPrize/awards`: main at `5125fd7` plus the head of **every one of its 4155 pull requests** (fetched to a local clone); all non-catalog files grepped for the problem numbers, FC theorem names and statement vocabulary.")
w("  2. `plby/lean-proofs` at `8822f7d` (2026-09-15, still HEAD on 2026-10-02): all trees (`src/latest`, `src/v4.*`, `ErdosProblems/`), by file name, theorem name and number.")
w("  3. formal-conjectures `main` (raw files fetched 2026-10-02): no target carries a `formal_proof` tag or a proof; upstream PRs titled 'solve(...)' for these problems (e.g. #2485, #3344, #2591, #3115, #2696, #3218; all closed 2026-03-03) only retag the category and leave `sorryAx`.")
w("  4. GitHub code search (2026-10-02) for each target theorem name and key definition names; every hit file was downloaded and the target declaration tested for a non-`sorry` body (`final/gh_check.tsv`, 328 files). Repositories inspected include AllenGrahamHart/FormalConjectures-Bench (77 gold tasks checked; the others are unsolved task stubs), kavanaghpatrick/aristotle-math-problems, conjectures-io/conjectures-contribution, williamjblair/lean-proofs, rjwalters/lean-genius, Paul-Lez/fc100, epoch-research/LeanOpenProblems, hongjin-he/erdos-lean, pcycho/erdos1063-cambie, tadamcz/fc-review-results.")
w("  5. Mathlib (pinned): name/keyword grep, done by the earlier helper.")
w("  6. **v2 pass (helper-m2-advanced, 2026-10-02 14:20-15:00 UTC)** for E508, E138, E942, E649, E770, E273, E1136-mueller, E617 and for Petersen/Schoenberger: (i) all 4155 JSP PR heads re-scanned with new number and keyword patterns (`final/jsp_scan3.py`, `jsp_scan4.py`; outputs `jsp_scan3.json/.out`, `jsp_scan4.json/.out`) and every hit file opened; (ii) plby (all trees), `prior/*` clones (FormalConjectures-Bench incl. `oracles/`, conjectures-io, aristotle-math-problems, lean-genius excerpts), pinned Mathlib `Mathlib/`, `Archive/`, `Counterexamples/` grepped by name and vocabulary; (iii) formal-conjectures `main` re-fetched: still at the pinned commit `df3f12d` (2026-10-01), no `formal_proof` tag on any target; (iv) GitHub code search for the nine exact theorem names (incl. E617 `r_eq_3`) (`final/ghsearch_adv.txt`, 194 hit files downloaded and tested by `final/gh_check_adv.py` -> `gh_check_adv.tsv`: no proved copy except the two Aristotle E942 files, whose main theorem rests on a `sorry` lemma) and generic searches ('Hadwiger Nelson', 'Moser spindle', 'Petersen bridgeless IsPerfectMatching', 'bridgeless cubic perfect matching', 'Schönberger', lean-pool-scoped searches), which found Vilin97/lean-pool `HadwigerNelsonBounds`, KunalRelia/VCCBG and (via web search) KokunoYumeto/lean-theorems-1; (v) mathlib4 PR and issue search for Petersen / Schoenberger: no hits; (vi) web search for a formalization of Petersen's theorem in any proof assistant: none found (only the Lean Tutte-theorem paper arXiv:2504.18146).")
w("     External proofs were read, not compiled by us; the four JSP submissions (#270, #516, #580, #299) carry their own `verification.txt` with `#print axioms` lines `[propext, Classical.choice, Quot.sound]`, and the Bench oracle file has no `sorry`.")
w("  7. v1 error found in this pass: the plby file for problem 649 contains `sampaio_counterexample` and `tong_counterexamples`; v1 had classified `erdos_649.variants.sampaio` as NEW. The other v1 'NEW' verdicts were spot-checked again against the plby theorem lists (E123, E292, E395, E698, E703, E748: plby proves only the main theorems; E44, E295, E918, E939: no plby file) but were not otherwise re-audited.")
w("  Limits: private repositories, Zulip, and the erdosproblems.com forum attachments were not searched; GitHub code search is not exhaustive. 'NEW' means 'no prior formal proof found by the above', nothing stronger.")
w("- Reproducibility limitations: none known; each Erdos file compiles standalone in about a minute (E757 a few minutes, kernel `decide` over 1001 four-subsets). `Star6Simple.lean` needs the star6 library (see `STAR6_DEPENDENCY.md`); that library is so far only in local, unpublished repositories.")
w("")
w("## 8. Publication authority (handbook 8.4)")
w("")
w("- Attribution approval and permission to release under the competition terms: **TODO(operator)**. formal-conjectures is Apache-2.0; bundle files are derived from it and keep its header.")
w("")

w = P.append

def fam_block(f, k):
    w("### %s. Family E%s -- Erdos problem %s" % (k, f["n"], f["n"]))
    w("")
    w("- FC file + commit: `FormalConjectures/ErdosProblems/%s.lean` @ `%s`; informal: https://www.erdosproblems.com/%s" % (f["n"], COMMIT, f["n"]))
    w("- Bundle file: `%s/%s` (sha256 `%s`), produced by session `%s`" % (f["dst"].parent.name, f["dst"].name, f["sha"], f["sess"]))
    w("- Claimed theorems: " + ", ".join("`Erdos%s.%s`" % (f["n"], c) for c in f["claim"]))
    if f.get("notclaimed"):
        w("- Proved in the file but **not claimed** (duplicates): " + "; ".join("`%s` -- %s" % (c, V[(f["n"], c)][1]) for c in f["notclaimed"]))
    w("- Source theorem / citation: " + f["source"])
    w("- Statements (verbatim from FC, whitespace-normalised):")
    w("```lean")
    for c in f["claim"]: w(byname[(f["n"], c)]["fc_stmt"])
    w("```")
    w("- Prior formal libraries searched (2026-10-02, see section 7): ")
    for c in f["claim"]:
        v, ev = V[(f["n"], c)]
        w("  - `%s`: **%s** -- %s" % (c, v, ev))
    w("- Genuinely new formal contribution: " + f["new"])
    w("- Statement-correspondence note: " + f["corr"])
    w("- Axioms: [propext, Classical.choice, Quot.sound] for every claimed theorem. FC categories: " + ", ".join(sorted(set(byname[(f["n"], c)]["category"] for c in f["claim"]))) + ".")
    pm = ROOT / "work" / f["sess"] / ("Erdos%s.proof.md" % f["n"])
    if pm.exists():
        w("- Proof summary (written by the proving model in `work/%s/Erdos%s.proof.md`; read but not re-derived line by line by the helper):" % (f["sess"], f["n"]))
        w("")
        for l in pm.read_text().strip().splitlines(): w("  > " + l)
        w("")
    w("- Significance tier: " + f["tier_sig"])
    w("")

w("## 1. Substantive families (ordered by level)")
w("")
w("### 1.1. Family G-PM -- Schoenberger's theorem and Petersen's theorem (connected case), Mathlib `SimpleGraph` form")
w("")
w("- Source theorems: J. Petersen, *Die Theorie der regulären graphs*, Acta Math. 15 (1891), 193-220: every bridgeless cubic graph has a perfect matching. T. Schönberger, *Ein Beweis des Petersenschen Graphensatzes*, Acta Litt. Sci. Szeged 7 (1934), 51-57: in a bridgeless cubic graph every edge lies in a perfect matching (equivalently: for any edge there is also a perfect matching avoiding it; the special case of Plesník 1972 with one deleted edge). The Schönberger reference was confirmed in this form by a web search on 2026-10-02 (it is cited so in the current literature on perfect matchings of cubic graphs); the Petersen reference is the standard one (e.g. Wikipedia, 'Petersen's theorem').")
w("- Formal source: `bundle/Star6Simple.lean` (sha256 `%s`), module `Star6Simple` of the star6 library; star6 artifact `openmath/star6_artifact/lean/pack5/src/Star6Simple.lean` (server `~/danus-projects/star6/lean433/pack5/src/`). Environment: Lean 4.33.1, Mathlib v4.33.1 (commit `0df444a360ea`). NOT a formal-conjectures statement." % S6_SHA)
w("- Claimed theorems: `Star6.simple_schoenberger`, `Star6.simple_petersen_connected` (one family).")
w("- Exact Lean statements (context `{V : Type} [Fintype V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]`):")
w("```lean")
w("def Star6.Bridgeless (G : SimpleGraph V) : Prop := ∀ e ∈ G.edgeSet, ¬ G.IsBridge e")
w("theorem Star6.simple_schoenberger (hconn : G.Connected) (hreg : G.IsRegularOfDegree 3) (hbr : Bridgeless G)")
w("    {e : Sym2 V} (he : e ∈ G.edgeSet) :")
w("    (∃ M : G.Subgraph, M.IsPerfectMatching ∧ e ∈ M.edgeSet) ∧ (∃ M : G.Subgraph, M.IsPerfectMatching ∧ e ∉ M.edgeSet)")
w("theorem Star6.simple_petersen_connected (hconn : G.Connected) (hreg : G.IsRegularOfDegree 3) (hbr : Bridgeless G) :")
w("    ∃ M : G.Subgraph, M.IsPerfectMatching")
w("```")
w("- How it is proved: derived from Mathlib's Tutte theorem `SimpleGraph.tutte` (`Mathlib/Combinatorics/SimpleGraph/Tutte.lean`). The library proves the multigraph version `RH2P.schoenberger` (pack3 module `MhFact_046773df0a672922`, 550 lines): for an edge h = uw form the simple graph GT on the remaining vertices; if GT had a Tutte violator U, every odd component of GT - U sends an odd number of edges to S = U ∪ {u, w} (degree sum), not exactly one (bridgeless), hence at least three; counting the edges leaving S (h lies inside S) bounds the number of odd components by |U|, so there is no violator; `SimpleGraph.tutte` gives a perfect matching of GT, and h plus one edge per matched pair is the matching through h. The avoiding matching is obtained by applying this to another edge at an end of h. `Star6Corollaries.plain_schoenberger` restates it for a multigraph given by `en : E → Sym2 V`; `Star6Simple.lean` (115 lines of private lemmas) translates `SimpleGraph.Connected`, `IsRegularOfDegree 3`, `IsBridge` and `Subgraph.IsPerfectMatching` to and from that vocabulary. Petersen (connected) is a 5-line corollary.")
w("- Dependencies: `Star6Simple` imports `Star6Corollaries` and through it %d further library modules (%d lines in total; exact list in `bundle/STAR6_DEPENDENCY.md`). The mathematics of this family is in the %d-module prefix ending with `MhFact_046773df0a672922` (%d lines) plus the translation layers; the rest of the chain (the star-edge-colouring development) is imported but not used for these two theorems." % (len(_order) - 2, S6_LINES, len(S6_CORE), S6_CORE_LINES))
w("- Prior formal libraries searched (2026-10-02, see section 7): **NEW** -- " + S6_PRIOR + ".")
w("- Genuinely new formal contribution: first formal proof found (Lean ecosystem searched as described in section 7; a web search found no formalization in another proof assistant either) of Schönberger's theorem, and of Petersen's theorem for connected graphs, stated for Mathlib's `SimpleGraph` with Mathlib's own `IsBridge`, `IsRegularOfDegree`, `Subgraph.IsPerfectMatching`. Not a re-export of a Mathlib result: Mathlib has Tutte's theorem (the input) but no theorem producing a perfect matching from regularity and bridgelessness.")
w("- Statement-correspondence / honesty notes: (1) **connected case only** -- Petersen's theorem is usually stated without connectedness (apply the connected case to each component); the union over components is not formalized, so the claim must say 'connected'. (2) `[Fintype V]` finite graphs; `IsRegularOfDegree 3` is cubic; `Bridgeless` is the plain 'no edge is a bridge' with Mathlib's `IsBridge`. Nothing is vacuous: a 3-regular graph has edges, and the hypotheses are satisfiable (e.g. K4). (3) The simple-graph theorems are corollaries of a multigraph theorem; for simple graphs parallel edges do not occur, so the multigraph generality is not visible in the claimed statements. (4) The theorems are by-products of the star6 (DMS conjecture) library that the team submits separately; **the same Lean library is thus cited in two packets** -- operator to confirm that this is acceptable (TODO list). (5) Event-window delta (handbook: only work contributed within the window counts; the window opened 2026-09-27 noon EDT): on the project server the Schönberger module `MhFact_046773df0a672922` is dated 2026-09-29 (fact store `fact_graph/facts/046773df0a672922.md`, `lean/MhFact_046773df0a672922.lean`; Lean 4.20 original), its Lean 4.33.1 port 2026-10-01, `Star6Corollaries.lean` / `Star6Simple.lean` 2026-10-02. These are file timestamps read by the helper, not a signed baseline; the operator must confirm them against the baseline declaration of the star6 submission.")
w("- Axioms: `[propext, Classical.choice, Quot.sound]` for both theorems (`pack5/logs/Star6Simple.out`, and re-compiled independently by this helper against the existing pack3/pack5 oleans: `bundle/Star6Simple.out`, rc=0). No `sorry`, `axiom`, `native_decide` in `Star6Simple.lean`.")
w("- Significance tier: Substantive -- the highest-level item of this packet (two named classical theorems of graph theory absent from Mathlib, about 550 lines for the multigraph theorem on top of Tutte's theorem, plus the translation layers).")
w("")
for i, f in enumerate(A, 2): fam_block(f, "1.%d" % i)
w("## 2. Minor / sanity (no prior formal proof found, but trivial or helper-level -- team decides whether to include)")
w("")
w("Handbook 4.1 requires each counted contribution to be 'new, faithful, useful, and reusable'; the items below are new and faithful, but their usefulness is small. Including them risks looking like count-padding; excluding them costs at most %d families." % len(Am))
w("")
for i, f in enumerate(Am, 1): fam_block(f, "2.%d" % i)
w("## 3. Optional families -- FC statement new, mathematics already formalized elsewhere (NOT claimed by default)")
w("")
w("Handbook 3.2: 'Renaming declarations, re-exporting library results, or restating an existing formalization is not a new accomplishment.' The proofs below were produced independently and for a different formal statement (the FC one), but a reviewer who finds the earlier formalization may reasonably call them restatements. If the team claims them, the prior work must be disclosed exactly as written here.")
w("")
for i, f in enumerate(B, 1): fam_block(f, "3.%d" % i)
w("## 4. Excluded families (duplicates / rejected) -- for the record")
w("")
w("| Family | Theorem | Verdict | Evidence |")
w("| --- | --- | --- | --- |")
claimed = set((f["n"], c) for f in FAM for c in f["claim"])
for k, (v, ev) in sorted(V.items(), key=lambda x: (int(x[0][0]), x[0][1])):
    if k in claimed: continue
    w("| E%s | `%s` | %s | %s |" % (k[0], k[1], v, ev.replace("|", "/")))
w("")
w("New duplicates found in this pass (they were listed as 'no prior formal proof found' in the earlier draft): E1063 `exists_exception` (JSP PR #631, exact statement), E859 `positive_density` and E835 `property_iff_chromaticNumber` and E1074 `*_init` (conjectures-io/conjectures-contribution, exact statements), E1193 (plby + JSP PR #26, same core), and the core of E757 (JSP PR #74), E261 and E36-lower (rjwalters/lean-genius).")
w("")
w("Found in the v2 pass: E508 `HadwigerNelsonAtLeast4` (JSP PR #270, exact shape), E138 (JSP PR #516 and the FormalConjectures-Bench oracle; also a thin wrapper of Mathlib's Hales-Jewett theorem), E770 (JSP PR #580), E273 (JSP PRs #299 and #281), E1136 `mueller` (plby; proof body copied from plby), and the cores of E508 `HadwigerNelsonAtMostSeven` (Vilin97/lean-pool) and E649 (plby). Substance of these proofs, for the record: all are the real theorems (508: explicit spindle and explicit 7-colouring of the plane; 138: genuine Hales-Jewett encoding v -> 1 + Σ v_i with the injectivity argument needed for FC's exact-cardinality AP definition, degenerate cases r = 0 and k = 0 handled separately; 770: Fermat plus root counting for X^n - 1 over ZMod q; 273: Selfridge's 12 distinct moduli 2,4,6,10,12,18,30,36,40,60,72,180 = p - 1 with p prime >= 3, cover checked on 360 residues by `decide`, over `Ideal ℕ` as FC states it), none exploits a statement quirk.")
w("")
P.extend(BOIL)
w("## 9. Operator TODO list")
w("")
for t in ["Autolab owner / workspace, submission ID(s), Hill hash/version and Climb link (if the competition Hill applies to M2), final commit, evaluator report.",
          "Roster, entrant class, affiliations, resource classification; each human's contribution.",
          "Human checking statement (currently: none). Recommended minimum: one human reads the section 1 statements + correspondence notes and re-runs VERIFY.md on a clean checkout.",
          "Decide: include the section 2 minor list or not; claim the section 3 optional families (with disclosure) or not.",
          "G-PM: confirm that citing the star6 library in this M2 packet is compatible with the separate star6 submission (same Lean artifact used in two packets); publish or attach the star6 artifact so that `Star6Simple.lean` can be rebuilt by reviewers (it needs the 100 modules of `STAR6_DEPENDENCY.md`); keep the wording 'connected case' for Petersen; confirm that the Schönberger module (dated 2026-09-29 on the server) is event-window work relative to the declared star6 baseline.",
          "E649: v1 of this packet (and any text derived from it) called `erdos_649.variants.sampaio` a new formalization; that is wrong (plby). Remove E649 from any substantive list already circulated.",
          "The local repository `openmath/erdos_m2_artifact/` has no remote; decide whether and where to publish it (operator action only).",
          "Decide whether E939 r = 7 should be claimed given its degenerate witness (summand 1); r = 8 alone still carries the family.",
          "Model version / compute / credit disclosure; outside help and conflicts statement.",
          "Publication authority: attribution approval and release permission under the competition terms.",
          "If M2 targets must be registered/admitted as families before scoring (handbook 3.1, 4.1), register E<n> ids with the organisers."]:
    w("- [ ] " + t)
w("")
_txt = "\n".join(P)
_e = F / "e617.txt"; _c = F / "artifact_commit.txt"
_txt = _txt.replace("@@E617@@", _e.read_text().strip() if _e.exists() else "still in progress (session adv5) when this packet was generated; not included.").replace("@@ARTIFACT_COMMIT@@", _c.read_text().strip() if _c.exists() else "(recorded after the first local commit)")
(F / "PACKET_FINAL_v2.md").write_text(_txt)
print("claimed Erdos families (G-PM not counted here): %d theorems / %d families (substantive %d/%d, minor %d/%d); optional %d/%d" % (nth(A) + nth(Am), len(A) + len(Am), nth(A), len(A), nth(Am), len(Am), nth(B), len(B)))
for f in FAM:
    cl = set("Erdos%s.%s" % (f["n"], c) for c in f["claim"])
    assert cl <= set(f["printed"]), (f["n"], cl - set(f["printed"]), f["printed"])
    for c in f["claim"]: assert byname[(f["n"], c)]["verdict"].startswith("VERIFIED"), c
print("ok")
