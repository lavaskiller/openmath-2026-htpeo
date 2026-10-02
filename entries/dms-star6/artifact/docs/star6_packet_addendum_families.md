# Addendum to the star6 packet (draft v3): unconditional infinite families (pack4)

Status 2026-10-02. Supplements §2 of `star6_packet_draft_v3.md` (which is unchanged). Proposed as **§2.1b
"Artifact A″ — infinite families (pack4)"**. DMS is **not** proved; everything below is unconditional and
kernel-checked, and each theorem is a special case of the statement of the conjecture (`RH2F.DMS`) for an explicit
infinite family of cubic graphs — with 5 colours instead of 6.

## What it adds
Artifact A reduces DMS to named open hypotheses and proves finite cases; its only infinite-family result is the
cover theorem. Artifact A″ proves, on the same library (`StarCore.MGraph`, `MGraph.Star`, `MGraph.Subcubic`,
`MGraph.Loopless`, `MGraph.Colourable`), that explicit star edge colourings are correct **for every member** of
several infinite families. Lean 4.33.1 + Mathlib v4.33.1, 125 modules on top of artifact A (`pack4/src`; about 20 written by
hand or by GPT, the rest generated tables and window checks), no `sorry`, no `axiom`, no `native_decide`; every theorem
depends on `[propext, Classical.choice, Quot.sound]` only (`pack4/axioms.log`).

## Main statements
`StarFamily G k` := `G.Subcubic ∧ G.Loopless ∧ (∀ P, MGraph.Colourable P k) ∧ (∀ P, MGraph.Colourable P 6)`;
`BlockStar.dms_iff : RH2F.DMS ↔ ∀ G, DMSfor G` and `starFamily_dms : StarFamily G k → DMSfor G`, so each line is
literally the instance of `RH2F.DMS` for the graphs `G` of the family.

| | Family | Theorem | Range | Colours | Novelty (NOVELTY.md of 2026-10-01) |
|---|---|---|---|---|---|
| A | flower snarks J_n | `FlowerSnark.flower_star`, `flower_family` | every odd n ≥ 5 | 5 | **appears new** (#11): no paper on the star edge chromatic index of flower snarks found |
| B | Goldberg snarks G_k | `GoldbergSnark.goldberg_star`, `goldberg_family` | every odd k ≥ 5 | 5 | **appears new** (#12) |
| C | GP(k,2) with the spokes as one colour class | `GPetersen2.gp2_star`, `gp2_spokes`, `gp2_spoke_family` | every k ≥ 5 | 6, colour class 6 = the spokes | **appears new** as a perfect-matching-class statement; weaker than known bounds for some k (#10) |
| D1 | GP(n,2) | `GP2Five.star5`, `gp2_family` | every n ≥ 5 | 5 | **partly known** (#17): odd n ≥ 7 not found in print |
| D2 | GP(n,3) | `GP3Five.star5`, `gp3_family` | every n ≥ 7 | 5 | **partly known** (#17): n odd with 3 ∤ n not found in print |
| D3 | GP(10m,4), GP(14m,6), GP(17m,8), GP(22m,10), GP(26m,12), GP(30m,14) | `GPk.star4` … `GPk.star14`, `GPk.family4` … | every m ≥ 1 | 5 | **partly known** (#15); GP(30m,14) fully known |
| E | GP(n,k), 1 ≤ k ≤ 15 | `gp_star5`, `gp_family` (`GPn<k>.star5`) | every n ≥ 2k+1, except GP(3,1) | 5 | not in NOVELTY.md; the Zhu–Shao conjecture (χ′ₛ(GP(n,k)) ≤ 5 except GP(3,1)) for k ≤ 15; by the coverage of Zhu–Shao 2021 and Omoomi–Vahid Dastjerdi 2024 the cases with gcd(n,k) ≤ 2 outside those papers (e.g. n odd, gcd(n,k) = 1) are expected to be new; Omoomi–Vahid Dastjerdi (arXiv:2410.15024) prove the conjecture for gcd(n,k) ≥ 3 and state it as open otherwise — **[TODO: paper-by-paper check before claiming]** |
| F | Petersen-type vertex inflation of any loopless multigraph H with an injective port assignment (every vertex replaced by Petersen minus a vertex) | `Inflation.inflate_star5` | every such H | 5 | **appears new (elementary)** (#16); only the Petersen special case of fact aa607ed0 is formalized |
| G | Möbius ladders M_n | `Mobius.star5`, `mobius_family` | every n ≥ 4 | 5 | one web search on 2026-10-02 found nothing on star edge colourings of Möbius ladders — **[TODO: proper literature check]** |

Related known technique to cite (NOVELTY.md #11): the "good edge" of the informal proofs is the *rich edge* of
normal 5-edge-colourings (Jaeger; Sedlar–Škrekovski); covers of the Petersen graph being star 5-colourable is
immediate from DMS 2013 (#13) and is not claimed here.

## Method
A generic theorem `BlockStar.star_of_windows` for cyclic block graphs (blocks 0..n−1, edges inside a block or to a
block at bounded distance D): if every window of 3D+1 consecutive blocks passes a Boolean check (the local law
"no two edges at a vertex with the same colour, and no edges e2 ≠ e3 at v, e1 at the other end of e2, e4 at the other
end of e3 with c e1 = c e3, c e4 = c e2"), the block-wise colouring is a star colouring. The colourings are
"periodic part + seam", so every window of every n occurs for one of finitely many small n (lemmas proved by
`omega`), and those are checked by `decide +kernel` (kernel evaluation, no extra axiom). Details: `pack4/README.md`.

## Environment, reproduce, checks
- Lean 4.33.1, Mathlib v4.33.1, on top of `pack3` (artifact A). `bash build_all.sh` compiles the 125 modules of
  `order.txt` one at a time and writes `build/summary.txt` and `axioms.log` (the output of `src/All.lean`: all
  definitions, statements and `#print axioms`). On our server (2026-10-02): 125/125 modules,
  0 errors, 930 s of compiler time, largest process 2.05 GB; 33 axiom lines, all standard, no `sorryAx`.
- Statement fidelity: explicit edge lists (read-back theorem `BlockStar.BG_ends`); `src/Check.lean` restates the
  theorems with the graph argument explicit; `sanity_check.py` (plain Python) confirms that the edge lists Lean
  prints for J_5, J_7, G_5, M_5 are the textbook ones, that J_5, J_7, G_5 are snarks (cubic, girth ≥ 5, not
  3-edge-colourable), and re-checks two colourings by brute force. Not formalized: "simple", "cubic" (only
  `Subcubic`, `Loopless`), and an isomorphism with a Mathlib `SimpleGraph`. The Goldberg edge list is the one of
  fact 32a017c12a0c87eb (block description of arXiv:2511.08664); **[TODO: compare with Goldberg 1981]**.

## Provenance
- Informal proofs and colourings, star6 run (during the event): worker `core` (Claude) — flower snarks c97931f9caaa7c8b
  and Goldberg snarks 32a017c12a0c87eb (2026-09-27), inflation aa607ed0bc83ecf0 (2026-09-27), GP(k,2) spokes
  1262231d03310f70 (2026-09-29; its Lean module proves only the finite tables), GP(n,2) 2f8113cb26f31818 and GP(n,3)
  cab2712392b5deec (2026-09-30, corrected versions of two facts of 09-27); worker `compute` — f8e1edfe45707104,
  6309f733d6da8cd6, a491fe56b9f2d831 (2026-09-28).
- Lean proofs: 2026-10-02, by Claude (all modules except the inflation proof) and GPT (gpt-6-sol: `InflationA`–`E`,
  `Inflation`; statement fixed beforehand and verified unchanged). The Lean proofs verify the facts' colourings by
  the window criterion instead of transcribing the facts' tables; the statements of the facts are confirmed.
- Rows E and G are new on 2026-10-02 (SAT-found colourings, `pack4/search/`); they have no informal proof.

## Suggested packet text (one paragraph)
"(iv) Unconditional infinite families (artifact A″): for every odd n ≥ 5 the flower snark J_n and the Goldberg snark
G_n, for every n ≥ 4 the Möbius ladder M_n, for 1 ≤ k ≤ 15 every generalized Petersen graph GP(n,k) with n ≥ 2k+1
other than the prism GP(3,1), and every Petersen-type vertex inflation of a loopless cubic multigraph have star
chromatic index at most 5 (hence satisfy DMS); and GP(k,2), k ≥ 5, has a star 6-edge-colouring in which the spokes
are a colour class. All statements are Lean 4.33.1 theorems with standard axioms."
