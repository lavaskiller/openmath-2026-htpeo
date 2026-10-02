#!/usr/bin/env python3
"""mk_final_v2.py -- derives make_final_v2.py from make_final.py (helper-m2-advanced, 2026-10-02).
make_final.py itself is left untouched.  Run in ~/erdos-fc/m2/final/ :  python3 mk_final_v2.py && python3 make_final_v2.py"""
import pathlib
F = pathlib.Path.home() / "erdos-fc/m2/final"
s = (F / "make_final.py").read_text()

def rep(old, new, count=1):
    global s
    assert s.count(old) >= 1, old[:80]
    s = s.replace(old, new) if count == 0 else s.replace(old, new, count)

def span(start, end, new):
    """replace s[start_marker .. end_marker) by new"""
    global s
    a = s.index(start); b = s.index(end, a)
    s = s[:a] + new + s[b:]

# ---------------------------------------------------------------- header / backups
rep('rows = json.loads((M2 / "verified.json").read_text())', r'''rows = json.loads((M2 / "verified.json").read_text())
for _n in ("PRIOR_ART_FINAL.tsv", "VERIFY.md"):          # keep the v1 outputs
    _b = F / (_n.rsplit(".", 1)[0] + ".v1." + _n.rsplit(".", 1)[1])
    if (F / _n).exists() and not _b.exists(): shutil.copyfile(F / _n, _b)
LPOOL = "https://github.com/Vilin97/lean-pool/blob/c77d19c49b/LeanPool/HadwigerNelsonBounds"
BENCH = "https://github.com/AllenGrahamHart/FormalConjectures-Bench/blob/0d031f72/oracles/erdosproblems-138-difference/Submission.lean"
STAR6 = HOME / "danus-projects/star6/lean433"''')

# ---------------------------------------------------------------- verdict table
span(' ("649", "erdos_649.variants.sampaio"): ("NEW"', ' ("698", "erdos_698.variants.erdos_szekeres"): ("NEW"',
 r''' ("649", "erdos_649.variants.sampaio"): ("DUPLICATE-CORE", PLBY + "Erdos649.lean#L488 (`sampaio_counterexample : ¬ ∃ n, P n = 19 ∧ P (n + 1) = 2`, own `P n := (n.primeFactors).max.getD 0`; present since the v4.24.0 tree; the FC `formal_proof` tag of the main `erdos_649` points to this very file). CORRECTION: v1 of this packet listed this theorem as NEW -- the plby file had been read only for its last theorem"),
 ("649", "erdos_649.variants.tong"): ("DUPLICATE-CORE", PLBY + "Erdos649.lean#L374 (`tong_counterexamples (p) (hp : p.Prime) : {q | q.Prime ∧ ¬ ∃ n, P n = p ∧ P (n + 1) = q}.Infinite`, the same Dirichlet + quadratic-reciprocity argument, own `P`). rjwalters/lean-genius has it as `axiom tong_theorem`. No proof of the FC statement (with `Nat.maxPrimeFac`) found"),
 ("508", "HadwigerNelsonAtLeast4"): ("DUPLICATE", JSP + "270 (2026-09-16, `hadwiger_nelson_at_least_four : 4 ≤ (UnitDistancePlaneGraph Set.univ).chromaticNumber`, Moser spindle, exact FC shape); subsumed by " + LPOOL + ".lean (5 ≤ χ)"),
 ("508", "HadwigerNelsonAtMostSeven"): ("DUPLICATE-CORE", LPOOL + ".lean (Vilin97/lean-pool, author Egor Lyfar, file history 2026-07-23 .. 2026-09-18: `hadwiger_nelson_known_bounds : 5 ≤ unitDistanceGraph.chromaticNumber ∧ unitDistanceGraph.chromaticNumber ≤ 7`, Isbell hexagonal colouring with lattice step 3/4, own `unitDistanceGraph : SimpleGraph (EuclideanSpace ℝ (Fin 2))`; no `sorry` in the top-level file, header 'Status: verified'; read, not compiled by us). No proof of the FC statement itself found (all public copies are `sorry` stubs; no JSP PR)"),
 ("138", "monoAP_guarantee_set_nonempty"): ("DUPLICATE", JSP + "516 (2026-09-17, exact FC statement `monoAP_guarantee_set_nonempty`, same Hales-Jewett derivation) ; " + BENCH + " (`vdw_nonempty (r k) : (monoAP_guarantee_set r k).Nonempty`, l. 197; the proof linked from FC's `formal_proof` tag of `erdos_138.variants.difference`). Also a thin wrapper: Mathlib has Hales-Jewett `Combinatorics.Line.exists_mono_in_high_dimension` and the van der Waerden corollary `Combinatorics.exists_mono_homothetic_copy`"),
 ("942", "erdos_942.variants.limsup"): ("NEW", "no complete proof found. kavanaghpatrick/aristotle-math-problems (commit 2425339, 2026-06-24) has two automated attempts (`submissions/yolo_results/yolo_d6_e942_limsup_extracted/...` and `.../yolo_mega6_e942_kronecker_extracted/...`, the latter also under `submissions/nu4_final/`) that prove the bookkeeping and leave the simultaneous-approximation lemma (`kronecker_construction` / `simultaneous_approx_primes`) as `sorry`; JSP PR #4355 states 'no complete formalization known' (#3575 is a filler file, #889 only two powerful numbers); conjectures-io erdos-942: 0 contributions; lean-genius / Bench / other copies: stubs; plby: no file"),
 ("770", "Nat.Prime.h_eq_add_one"): ("DUPLICATE", JSP + "580 (2026-09-17, exact FC statement `Erdos770.Nat.Prime.h_eq_add_one`)"),
 ("273", "erdos_273.variants.three"): ("DUPLICATE", JSP + "299 (2026-09-16, `erdos_273_three`, Selfridge's twelve moduli dividing 360, exact FC content) , " + JSP + "281 (`variants_three`, `exact_public_statement`)"),
 ("1136", "erdos_1136.variants.mueller"): ("DUPLICATE", PLBY + "Erdos1136.lean (Mueller's set, sum-freeness and density 1/2: `A_sumfree`, `A_density_half`). The adv5 file copies ~370 lines of that plby file as `namespace MuellerAux` and adds only a ~70-line bridge to the FC definitions `muellerSet` / `HasDensity`"),
''')

# ---------------------------------------------------------------- families
rep('def short(t): return', r'''# ---- v2 changes to the family list
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

def short(t): return''')

rep('shutil.copyfile(M2 / "bundle" / f["src"], dst)', 'shutil.copyfile(pathlib.Path(f["srcpath"]) if f.get("srcpath") else M2 / "bundle" / f["src"], dst)')

# ---------------------------------------------------------------- star6 files in the bundle
rep('# ---------- VERIFY.md', r'''# ---------- star6 (Schoenberger / Petersen): Star6Simple.lean + dependency note
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

# ---------- VERIFY.md''')

rep('"bundle_optional/ (not claimed by default, see PACKET_FINAL.md section 6)"', '"bundle_optional/ (not claimed by default, see PACKET_FINAL_v2.md section 3)"')
rep('vm += ["Server shortcut used by the team:', r'''vm += ["### bundle/Star6Simple.lean (family G-PM: Schoenberger / Petersen) -- different environment", "",
 "`Star6Simple.lean`  (sha256 `%s`) is a module of the star6 library and does NOT compile inside formal-conjectures. It needs the %d modules listed in `STAR6_DEPENDENCY.md` (star6 artifact, pack3 + pack5; Lean 4.33.1, Mathlib v4.33.1). With pack3 built: `bash pack5/build5.sh Star6Simple` (after `Star6Bounded Star6Corollaries`). Expected (`Star6Simple.out`, last line `rc=0`):" % (S6_SHA, len(_order) - 1), "```"] + S6_AX[:2] + ["```",
 "(the same file also proves `Star6.simple_star6_cubic_bridgeless_le14` and `Star6.simple_star6_subcubic_le7`, which belong to the star6 submission and are not M2 claims)", ""]
vm += ["Server shortcut used by the team:''')

# ---------------------------------------------------------------- PRIOR_ART rows for star6
rep('    missing = [k for k in V if k not in seen]', r'''    fh.write("\t".join(["G-PM", "Star6.simple_schoenberger", "(star6 library, not FC)", "NEW", "CLAIM (substantive)", S6_PRIOR]) + "\n")
    fh.write("\t".join(["G-PM", "Star6.simple_petersen_connected", "(star6 library, not FC)", "NEW", "CLAIM (substantive)", "as simple_schoenberger; corollary (connected case only)"]) + "\n")
    missing = [k for k in V if k not in seen]''')
rep('# ---------- PRIOR_ART_FINAL.tsv', r'''S6_PRIOR = ("no Lean proof found: Mathlib v4.33.1 (Mathlib/, Archive/, Counterexamples/) has `SimpleGraph.tutte` and `IsBridge` but no hit for petersen/schoenberger/bridgeless-matching; mathlib4 PR/issue search 'Petersen theorem perfect matching', 'bridgeless cubic perfect matching', 'Schönberger': 0 hits; KunalRelia/VCCBG states it as `public axiom PetersenMatching` ('Petersen 1891 (not yet in Mathlib)'); "
            "KokunoYumeto/lean-theorems-1 `petersen_bridgeless_cubic_1factor` takes Tutte's condition as a hypothesis `h_tutte` and is therefore not a proof of Petersen's theorem; Vilin97/lean-pool, plby/lean-proofs, formal-conjectures (Wikipedia/LovaszPlummerConjecture.lean only uses `IsBridgeless` in a conjecture), all 4155 JSP PR heads: no hit")
# ---------- PRIOR_ART_FINAL.tsv''')

# ---------------------------------------------------------------- packet text
rep('w("# OpenMath 2026 -- M2 formalization packet, FINAL DRAFT (not submitted)")', 'w("# OpenMath 2026 -- M2 formalization packet, FINAL DRAFT v2 (not submitted)")')
rep('by helper-m2-final (Claude) from `~/erdos-fc/m2/`. Nothing has been submitted, uploaded or sent. Fields marked **TODO(operator)** must be filled by the team." % now)',
    'by helper-m2-advanced (Claude) from `~/erdos-fc/m2/`; supersedes `PACKET_FINAL.md` (v1, kept). Nothing has been submitted, uploaded or sent. Fields marked **TODO(operator)** must be filled by the team." % now)\nw("")\nw("Local artifact repository (unpublished, no remote): `openmath/erdos_m2_artifact/`, commit `@@ARTIFACT_COMMIT@@`.")')
span('w("- Mechanically verified pool', 'w("- M2 counts families', r'''_nrows = len(rows); _nthm = len(set((r["problem"], short(r["theorem"])) for r in rows)); _nfam = len(set(r["problem"] for r in rows))
_ok = sum(1 for r in rows if r["verdict"].startswith("VERIFIED"))
w("- Mechanically verified pool: %d rows / %d distinct theorems / %d Erdos-problem families, of which %d rows pass (compile rc 0, statement textually identical to the pinned FC commit, axioms within [propext, Classical.choice, Quot.sound]) and %d are rejected (proof was already in FC); `verify_all.py` re-run 2026-10-02 14:16 UTC including the five 'advanced' sessions adv1..adv5." % (_nrows, _nthm, _nfam, _ok, _nrows - _ok))
w("- **Claimed set: %d families** = %d substantive (section 1: G-PM + %d Erdos families, %d Erdos theorems) + %d minor/sanity (section 2, %d theorems, team to decide)." % (1 + len(A) + len(Am), 1 + len(A), len(A), nth(A), len(Am), nth(Am)))
w("  - Substantive, ordered by level: G-PM (Schoenberger's theorem and Petersen's theorem, connected case, from the star6 library), " + ", ".join("E" + f["n"] for f in A))
w("  - Minor / sanity: " + ", ".join("E" + f["n"] for f in Am))
w("- Optional, NOT claimed by default (section 3): %d theorems in %d families (%s) -- the FC statement has no prior formal proof that we could find, but the same mathematics was already formalized publicly under different definitions." % (nth(B), len(B), ", ".join("E" + f["n"] for f in B)))
w("- **What changed against v1.** (a) New substantive families: G-PM and E942. (b) **Correction: E649 is moved from 'substantive' to 'optional'**: plby/lean-proofs already proves Sampaio's instance (and Tong's theorem) with its own definition of P(n); v1 was wrong to call it new. (c) Of the eight 'advanced' results produced on 2026-10-02 (E508 x2, E138, E942, E649 tong, E770, E273, E1136 mueller), the exhaustive prior-art pass found that **only E942 is new**: E508 `4 ≤ χ`, E138, E770, E273 are exact duplicates of JSP pull requests of 2026-09-16/17, E1136 mueller is plby's theorem (with plby code copied), E508 `χ ≤ 7` and E649 tong are formalized elsewhere under other definitions (optional). All eight are mechanically verified and are genuine proofs (section 4 and the notes in sections 1 and 3); they are simply not first formalizations.")
w("- Excluded as duplicates (section 4): E508 `HadwigerNelsonAtLeast4`, E138, E770, E273, E1136 `mueller` (this pass); E1063, E859, E835, E1074, E1193, E282, E291, E302, E317, E367, E423, E865, E885, E1008 (earlier); inside claimed/optional families `erdos_698.variants.erdos_szekeres_sharp`, `erdos_1136.variants.upper_bound` and `HadwigerNelsonAtLeast4` stay proved in the files but are not claimed. E723 and E120 were skipped by the proving sessions as duplicates of conjectures-io contributions. E617 `r_eq_3`: @@E617@@")
''')
rep('w("## 1. Identity / target (handbook 8.1)")', 'BOIL = []; w = BOIL.append\nw("## 5. Identity / target (handbook 8.1)")')
rep('packet final-draft 1")', 'packet final-draft 2")')
rep('Proofs: OpenAI GPT (`gpt-6-sol`) run through the `codex` CLI in unattended sessions.', 'Proofs of the Erdos families: OpenAI GPT (`gpt-6-sol`) run through the `codex` CLI in unattended sessions. G-PM: the star6 library was produced by the team\'s star6 project (AI-written, see the star6 packet); the 115-line translation to Mathlib `SimpleGraph` in `Star6Simple.lean` was written by `gpt-6-sol` against statements fixed beforehand.')
rep('- Family IDs: `E<n>` = Erdos problem n.', '- Family IDs: `E<n>` = Erdos problem n; `G-PM` = perfect matchings in bridgeless cubic graphs (Schoenberger 1934 / Petersen 1891), from the star6 library, not from formal-conjectures.')
rep('w("## 2. Artifact / proof (handbook 8.2)")', 'w("## 6. Artifact / proof (handbook 8.2)")')
rep('optional families in `bundle_optional/`.")', 'optional families in `bundle_optional/`. G-PM: `bundle/Star6Simple.lean` + `bundle/STAR6_DEPENDENCY.md` (exact list of the star6 modules it imports) + `bundle/Star6Simple.out`; the library itself is in the star6 artifact and is not duplicated here.")')
rep('w("## 3. Provenance (handbook 8.3)")', 'w("## 7. Provenance (handbook 8.3)")')
rep('w("  Limits: private repositories', r'''w("  6. **v2 pass (helper-m2-advanced, 2026-10-02 14:20-15:00 UTC)** for E508, E138, E942, E649, E770, E273, E1136-mueller, E617 and for Petersen/Schoenberger: (i) all 4155 JSP PR heads re-scanned with new number and keyword patterns (`final/jsp_scan3.py`, `jsp_scan4.py`; outputs `jsp_scan3.json/.out`, `jsp_scan4.json/.out`) and every hit file opened; (ii) plby (all trees), `prior/*` clones (FormalConjectures-Bench incl. `oracles/`, conjectures-io, aristotle-math-problems, lean-genius excerpts), pinned Mathlib `Mathlib/`, `Archive/`, `Counterexamples/` grepped by name and vocabulary; (iii) formal-conjectures `main` re-fetched: still at the pinned commit `df3f12d` (2026-10-01), no `formal_proof` tag on any target; (iv) GitHub code search for the nine exact theorem names (incl. E617 `r_eq_3`) (`final/ghsearch_adv.txt`, 194 hit files downloaded and tested by `final/gh_check_adv.py` -> `gh_check_adv.tsv`: no proved copy except the two Aristotle E942 files, whose main theorem rests on a `sorry` lemma) and generic searches ('Hadwiger Nelson', 'Moser spindle', 'Petersen bridgeless IsPerfectMatching', 'bridgeless cubic perfect matching', 'Schönberger', lean-pool-scoped searches), which found Vilin97/lean-pool `HadwigerNelsonBounds`, KunalRelia/VCCBG and (via web search) KokunoYumeto/lean-theorems-1; (v) mathlib4 PR and issue search for Petersen / Schoenberger: no hits; (vi) web search for a formalization of Petersen's theorem in any proof assistant: none found (only the Lean Tutte-theorem paper arXiv:2504.18146).")
w("     External proofs were read, not compiled by us; the four JSP submissions (#270, #516, #580, #299) carry their own `verification.txt` with `#print axioms` lines `[propext, Classical.choice, Quot.sound]`, and the Bench oracle file has no `sorry`.")
w("  7. v1 error found in this pass: the plby file for problem 649 contains `sampaio_counterexample` and `tong_counterexamples`; v1 had classified `erdos_649.variants.sampaio` as NEW. The other v1 'NEW' verdicts were spot-checked again against the plby theorem lists (E123, E292, E395, E698, E703, E748: plby proves only the main theorems; E44, E295, E918, E939: no plby file) but were not otherwise re-audited.")
w("  Limits: private repositories''')
rep('each file compiles standalone in about a minute (E757 a few minutes, kernel `decide` over 1001 four-subsets).")', 'each Erdos file compiles standalone in about a minute (E757 a few minutes, kernel `decide` over 1001 four-subsets). `Star6Simple.lean` needs the star6 library (see `STAR6_DEPENDENCY.md`); that library is so far only in local, unpublished repositories.")')
rep('w("## 4. Publication authority (handbook 8.4)")', 'w("## 8. Publication authority (handbook 8.4)")')
rep('def fam_block(f, k):', 'w = P.append\n\ndef fam_block(f, k):')
rep('(2026-10-02, see section 3): ")', '(2026-10-02, see section 7): ")')

rep('w("## 5. Claimed families")\nw("")\nw("### 5.1 Substantive (recommended)")\nw("")\nfor i, f in enumerate(A, 1): fam_block(f, "5.1.%d" % i)', r'''w("## 1. Substantive families (ordered by level)")
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
for i, f in enumerate(A, 2): fam_block(f, "1.%d" % i)''')
rep('w("### 5.2 Minor / sanity (no prior formal proof found, but trivial or helper-level -- team decides whether to include)")', 'w("## 2. Minor / sanity (no prior formal proof found, but trivial or helper-level -- team decides whether to include)")')
rep('fam_block(f, "5.2.%d" % i)', 'fam_block(f, "2.%d" % i)')
rep('w("## 6. Optional families -- FC statement new, mathematics already formalized elsewhere (NOT claimed by default)")', 'w("## 3. Optional families -- FC statement new, mathematics already formalized elsewhere (NOT claimed by default)")')
rep('fam_block(f, "6.%d" % i)', 'fam_block(f, "3.%d" % i)')
rep('w("## 7. Excluded families (duplicates / rejected) -- for the record")', 'w("## 4. Excluded families (duplicates / rejected) -- for the record")')
rep('w("## 8. Operator TODO list")', r'''w("Found in the v2 pass: E508 `HadwigerNelsonAtLeast4` (JSP PR #270, exact shape), E138 (JSP PR #516 and the FormalConjectures-Bench oracle; also a thin wrapper of Mathlib's Hales-Jewett theorem), E770 (JSP PR #580), E273 (JSP PRs #299 and #281), E1136 `mueller` (plby; proof body copied from plby), and the cores of E508 `HadwigerNelsonAtMostSeven` (Vilin97/lean-pool) and E649 (plby). Substance of these proofs, for the record: all are the real theorems (508: explicit spindle and explicit 7-colouring of the plane; 138: genuine Hales-Jewett encoding v -> 1 + Σ v_i with the injectivity argument needed for FC's exact-cardinality AP definition, degenerate cases r = 0 and k = 0 handled separately; 770: Fermat plus root counting for X^n - 1 over ZMod q; 273: Selfridge's 12 distinct moduli 2,4,6,10,12,18,30,36,40,60,72,180 = p - 1 with p prime >= 3, cover checked on 360 residues by `decide`, over `Ideal ℕ` as FC states it), none exploits a statement quirk.")
w("")
P.extend(BOIL)
w("## 9. Operator TODO list")''')
rep('one human reads sections 5.1 statements', 'one human reads the section 1 statements')
rep('"Decide: include the 5.2 minor list or not; claim the section 6 optional families (with disclosure) or not.",', r'''"Decide: include the section 2 minor list or not; claim the section 3 optional families (with disclosure) or not.",
          "G-PM: confirm that citing the star6 library in this M2 packet is compatible with the separate star6 submission (same Lean artifact used in two packets); publish or attach the star6 artifact so that `Star6Simple.lean` can be rebuilt by reviewers (it needs the 100 modules of `STAR6_DEPENDENCY.md`); keep the wording 'connected case' for Petersen; confirm that the Schönberger module (dated 2026-09-29 on the server) is event-window work relative to the declared star6 baseline.",
          "E649: v1 of this packet (and any text derived from it) called `erdos_649.variants.sampaio` a new formalization; that is wrong (plby). Remove E649 from any substantive list already circulated.",
          "The local repository `openmath/erdos_m2_artifact/` has no remote; decide whether and where to publish it (operator action only).",''')

rep('(F / "PACKET_FINAL.md").write_text("\\n".join(P))', '_txt = "\\n".join(P)\n_e = F / "e617.txt"; _c = F / "artifact_commit.txt"\n_txt = _txt.replace("@@E617@@", _e.read_text().strip() if _e.exists() else "still in progress (session adv5) when this packet was generated; not included.").replace("@@ARTIFACT_COMMIT@@", _c.read_text().strip() if _c.exists() else "(recorded after the first local commit)")\n(F / "PACKET_FINAL_v2.md").write_text(_txt)')
rep('print("claimed: %d theorems / %d families', 'print("claimed Erdos families (G-PM not counted here): %d theorems / %d families')
(F / "make_final_v2.py").write_text(s)
print("make_final_v2.py written,", len(s), "bytes")
