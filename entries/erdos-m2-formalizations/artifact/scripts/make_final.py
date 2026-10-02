#!/usr/bin/env python3
"""make_final.py -- builds ~/erdos-fc/m2/final/{bundle,bundle_optional,SHA256SUMS,VERIFY.md,PRIOR_ART_FINAL.tsv,PACKET_FINAL.md}
from m2/verified.json, m2/bundle and the hand-reviewed prior-art table below (helper-m2-final, 2026-10-02).
Nothing is submitted or uploaded."""
import json, re, shutil, hashlib, pathlib, datetime, subprocess

HOME = pathlib.Path.home(); ROOT = HOME / "erdos-fc"; M2 = ROOT / "m2"; F = M2 / "final"
COMMIT = (ROOT / "FC_COMMIT").read_text().split()[0]
rows = json.loads((M2 / "verified.json").read_text())
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
 ("649", "erdos_649.variants.sampaio"): ("NEW", "plby Erdos649.lean proves {q | StrangePair 2 q}.Infinite (general disproof, different statement); lean-genius proves only the (2,7) instance; the (19,2) instance not found"),
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
    shutil.copyfile(M2 / "bundle" / f["src"], dst)
    f["dst"] = dst; f["sha"] = hashlib.sha256(dst.read_bytes()).hexdigest()
    txt = dst.read_text()
    f["printed"] = re.findall(r"^#print axioms (\S+)", txt, re.M)
for d in ("bundle", "bundle_optional"):
    with open(F / d / "SHA256SUMS", "w") as fh:
        for f in FAM:
            if f["dst"].parent.name == d: fh.write("%s  %s\n" % (f["sha"], f["dst"].name))

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
for d, title in (("bundle", "bundle/ (claimed set)"), ("bundle_optional", "bundle_optional/ (not claimed by default, see PACKET_FINAL.md section 6)")):
    vm.append("### " + title); vm.append("")
    for f in FAM:
        if f["dst"].parent.name != d: continue
        vm.append("`%s`  (sha256 `%s`)" % (f["dst"].name, f["sha"])); vm.append("```")
        vm += expected(f); vm.append("```")
        nc = [t for t in f["printed"] if any(t.endswith(x) for x in f.get("notclaimed", []))]
        if nc: vm.append("(proved in the file but NOT claimed: %s)" % ", ".join("`%s`" % x for x in nc))
        vm.append("")
vm += ["Server shortcut used by the team: `~/erdos-fc/leancheck.sh /abs/path/File.lean`; full audit (statement identity against the pinned FC file, whole-file diff, axioms, forbidden tokens): `python3 ~/erdos-fc/m2/verify_all.py` -> `~/erdos-fc/m2/VERIFIED.tsv`.", ""]
(F / "VERIFY.md").write_text("\n".join(vm))
for d in ("bundle", "bundle_optional"): shutil.copyfile(F / "VERIFY.md", F / d / "VERIFY.md")

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
    missing = [k for k in V if k not in seen]
    assert not missing, missing

# ---------- PACKET_FINAL.md
A = [f for f in FAM if f["tier"] == "A"]; Am = [f for f in FAM if f["tier"] == "A-minor"]; B = [f for f in FAM if f["tier"] == "B"]
nth = lambda L: sum(len(f["claim"]) for f in L)
now = datetime.datetime.utcnow().strftime("%Y-%m-%dT%H:%MZ")
P = []
w = P.append
w("# OpenMath 2026 -- M2 formalization packet, FINAL DRAFT (not submitted)")
w("")
w("Prepared %s by helper-m2-final (Claude) from `~/erdos-fc/m2/`. Nothing has been submitted, uploaded or sent. Fields marked **TODO(operator)** must be filled by the team." % now)
w("")
w("## 0. Summary")
w("")
w("- Mechanically verified pool: 50 rows / 46 distinct theorems / 29 Erdos-problem families (compile rc 0, statement textually identical to the pinned FC commit, axioms within [propext, Classical.choice, Quot.sound]); `verify_all.py` re-run 2026-10-02, unchanged.")
w("- **Claimed set (section 5): %d theorems in %d families** = %d theorems / %d families substantive (5.1) + %d theorems / %d families minor/sanity (5.2, team to decide)." % (nth(A) + nth(Am), len(A) + len(Am), nth(A), len(A), nth(Am), len(Am)))
w("  - Substantive: " + ", ".join("E" + f["n"] for f in A))
w("  - Minor / sanity: " + ", ".join("E" + f["n"] for f in Am))
w("- Optional, NOT claimed by default (section 6): %d theorems in %d families (%s) -- the FC statement has no prior formal proof that we could find, but the same mathematics was already formalized publicly under different definitions." % (nth(B), len(B), ", ".join("E" + f["n"] for f in B)))
w("- Excluded as duplicates (section 7): E1063, E859, E835, E1074, E1193 (found in this pass) and E282, E291, E302, E317, E367, E423, E865, E885, E1008 (found earlier); inside claimed families `erdos_698.variants.erdos_szekeres_sharp` and `erdos_1136.variants.upper_bound` stay proved in the files but are not claimed.")
w("- M2 counts families, not theorems (handbook 4.1). Each family below is one Erdos problem number; variants of one problem are never counted separately.")
w("- Human review status: **none yet**. All proofs were written by an AI model and checked only by the Lean kernel and by scripts.")
w("")
w("## 1. Identity / target (handbook 8.1)")
w("")
w("- Submission / version: **TODO(operator)** (Autolab submission ID) / packet final-draft 1")
w("- Modality: **M2** (new formalizations of known mathematics; separate M2 family leaderboard, handbook 4.1). No open-problem credit is requested for anything here.")
w("- Roster / entrant class / affiliations / resource classification: **TODO(operator)** (team entrant)")
w("- Authors / contributions: **TODO(operator)** for the humans. Proofs: OpenAI GPT (`gpt-6-sol`) run through the `codex` CLI in unattended sessions. Verification scripts, prior-art search and this packet: Claude (Anthropic).")
w("- Source / snapshot: `google-deepmind/formal-conjectures` commit `%s`, files `FormalConjectures/ErdosProblems/<n>.lean`; informal source https://www.erdosproblems.com/<n> and the references in each FC docstring." % COMMIT)
w("- Family IDs: `E<n>` = Erdos problem n. Exact claims: the Lean statements listed per family, verbatim from the pinned FC commit. Claimed completeness: each listed theorem is fully proved; the main (often open) statement of each problem is NOT claimed. Requested p: n/a (M2).")
w("")
w("## 2. Artifact / proof (handbook 8.2)")
w("")
w("- Autolab owner, Hill hash/version, Climb link, final commit, evaluator report: **TODO(operator)**")
w("- Formal source: `bundle/Erdos<n>.lean` (one file per claimed family), `bundle/SHA256SUMS`, `VERIFY.md`; optional families in `bundle_optional/`.")
w("- Environment: Lean `leanprover/lean4:v4.33.1`; Mathlib as pinned by formal-conjectures at `%s`." % COMMIT)
w("- Reproduction: `git checkout %s` in formal-conjectures, `lake exe cache get`, `lake env lean bundle/Erdos<n>.lean`; expected output lines are listed in `VERIFY.md`." % COMMIT)
w("- Statement correspondence (mechanical): for every target the text from the attribute line through `:=` is compared (comments stripped, whitespace-normalised) with the pinned FC file, and a whole-file diff confirms that the only removed FC lines are the `sorry` proofs of the targets. Added lines are private auxiliary declarations plus, in some files, `open`/`set_option`/local `instance` lines (listed in `VERIFIED.tsv` flags). Per-family notes on what the statement really says are given below.")
w("- Axioms / trust: every target prints `[propext, Classical.choice, Quot.sound]`. No `native_decide`, `axiom`, `unsafe`, `implemented_by`, `admit`. Other, untouched statements of the same FC files still contain `sorry`; they are not claimed and no target depends on them.")
w("- `answer(...)`: no target contains `answer(sorry)`; `answer(True)` / `answer(False)` terms were fixed by FC and are unchanged.")
w("")
w("## 3. Provenance (handbook 8.3)")
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
w("  Limits: private repositories, Zulip, and the erdosproblems.com forum attachments were not searched; GitHub code search is not exhaustive. 'NEW' means 'no prior formal proof found by the above', nothing stronger.")
w("- Reproducibility limitations: none known; each file compiles standalone in about a minute (E757 a few minutes, kernel `decide` over 1001 four-subsets).")
w("")
w("## 4. Publication authority (handbook 8.4)")
w("")
w("- Attribution approval and permission to release under the competition terms: **TODO(operator)**. formal-conjectures is Apache-2.0; bundle files are derived from it and keep its header.")
w("")

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
    w("- Prior formal libraries searched (2026-10-02, see section 3): ")
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

w("## 5. Claimed families")
w("")
w("### 5.1 Substantive (recommended)")
w("")
for i, f in enumerate(A, 1): fam_block(f, "5.1.%d" % i)
w("### 5.2 Minor / sanity (no prior formal proof found, but trivial or helper-level -- team decides whether to include)")
w("")
w("Handbook 4.1 requires each counted contribution to be 'new, faithful, useful, and reusable'; the items below are new and faithful, but their usefulness is small. Including them risks looking like count-padding; excluding them costs at most %d families." % len(Am))
w("")
for i, f in enumerate(Am, 1): fam_block(f, "5.2.%d" % i)
w("## 6. Optional families -- FC statement new, mathematics already formalized elsewhere (NOT claimed by default)")
w("")
w("Handbook 3.2: 'Renaming declarations, re-exporting library results, or restating an existing formalization is not a new accomplishment.' The proofs below were produced independently and for a different formal statement (the FC one), but a reviewer who finds the earlier formalization may reasonably call them restatements. If the team claims them, the prior work must be disclosed exactly as written here.")
w("")
for i, f in enumerate(B, 1): fam_block(f, "6.%d" % i)
w("## 7. Excluded families (duplicates / rejected) -- for the record")
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
w("## 8. Operator TODO list")
w("")
for t in ["Autolab owner / workspace, submission ID(s), Hill hash/version and Climb link (if the competition Hill applies to M2), final commit, evaluator report.",
          "Roster, entrant class, affiliations, resource classification; each human's contribution.",
          "Human checking statement (currently: none). Recommended minimum: one human reads sections 5.1 statements + correspondence notes and re-runs VERIFY.md on a clean checkout.",
          "Decide: include the 5.2 minor list or not; claim the section 6 optional families (with disclosure) or not.",
          "Decide whether E939 r = 7 should be claimed given its degenerate witness (summand 1); r = 8 alone still carries the family.",
          "Model version / compute / credit disclosure; outside help and conflicts statement.",
          "Publication authority: attribution approval and release permission under the competition terms.",
          "If M2 targets must be registered/admitted as families before scoring (handbook 3.1, 4.1), register E<n> ids with the organisers."]:
    w("- [ ] " + t)
w("")
(F / "PACKET_FINAL.md").write_text("\n".join(P))
print("claimed: %d theorems / %d families (substantive %d/%d, minor %d/%d); optional %d/%d" % (nth(A) + nth(Am), len(A) + len(Am), nth(A), len(A), nth(Am), len(Am), nth(B), len(B)))
for f in FAM:
    cl = set("Erdos%s.%s" % (f["n"], c) for c in f["claim"])
    assert cl <= set(f["printed"]), (f["n"], cl - set(f["printed"]), f["printed"])
    for c in f["claim"]: assert byname[(f["n"], c)]["verdict"].startswith("VERIFIED"), c
print("ok")
