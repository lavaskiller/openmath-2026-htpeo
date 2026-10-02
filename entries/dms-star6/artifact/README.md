# star6 — Lean 4.33.1 artifact for the Dvořák–Mohar–Šámal conjecture

Conjecture (DMS 2013; Open Problem Garden "Star chromatic index of cubic graphs", OPG-37271): every subcubic
graph has star chromatic index at most 6. **The conjecture is not proved here.** This repository contains
kernel-checked partial results: infinite families, small orders, an equivalent reformulation, and a reduction of
the conjecture to named open hypotheses. The submission packet is `star6_packet_final.md`; read it first.

Toolchain: Lean 4.33.1 (commit 819816b2e0a3), Mathlib tag `v4.33.1` (commit 0df444a360ea), pinned in
`lean/pack3/lean-toolchain` and `lean/pack3/lake-manifest.json`. No `.lake/` directory and no `.olean` files are
included; Mathlib and its olean cache (7.5 GB) are fetched by `lake`.

## What is where

| Path | Tier in the packet | Content |
|---|---|---|
| `star6_packet_final.md` | | the OpenMath 2026 packet (claims, axioms, provenance, TODOs) |
| `lean/pack3/` | T3, T4 | lake project `star6`: the 98 modules of the import closure of `RH2F.layer37` (the conditional reduction chain and the finite certificates), `Main.lean`, the Lean 4.20 originals (`orig/`), the port patches, build scripts and logs |
| `lean/pack5/` | T2 | four modules on top of pack3: small-order theorems (≤ 14 / ≤ 7 vertices), `Star6.dms_iff_cubic16`, counterexample structure, Schönberger / Petersen, `SimpleGraph` forms |
| `lean/pack4/` | T1 | 125 modules on top of pack3: flower snarks, Goldberg snarks, generalized Petersen graphs GP(n,k) for k ≤ 15, Möbius ladders, Petersen-type inflation; generators, SAT search scripts and results, sanity check |
| `lean/pack2/` | T3 (core-only part) | `lean433/StarDMS2.lean`: one file, Lean core only, no imports (HOLE ⇒ DMS, CubicSharp5 ⇒ DMS, covers, RH2 layers 1–5) with its build log; `STATEMENTS.md`, `INVENTORY.md` (state of 2026-10-01) |
| `docs/` | | statement-correspondence note, the two packet addenda of 2026-10-02, M2 candidates, `NOVELTY.md` (literature assessment) |
| `paper/` | not formalized | partial-results paper draft of 2026-09-30 (tex + pdf); older than the Lean artifact |
| `informal/` | not formalized | reports of informal / computational studies cited in section 3 of the packet |
| `SHA256SUMS` | | sha256 of every other file (`sha256sum -c SHA256SUMS`) |

Each pack has its own `README.md` with the exact statements, and `STATUS.md` with the build milestones.

## How to verify each tier

Prerequisite: `elan` (the toolchain is selected by `lean/pack3/lean-toolchain`). Scripts have no executable bit
here; call them with `bash`. Environment variables: `LEAN433` = path of the Lean 4.33.1 binary (default
`$HOME/.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean`), `PACK3` = path of pack3 (default `../pack3`).

**T3 + T4 — the chain (`lean/pack3`).**

    cd lean/pack3
    lake update && lake exe cache get && lake build

Expected: 98 modules + `Main` build, 0 errors; the build output of `Main` contains 18 `#print axioms` lines, all
`[propext, Classical.choice, Quot.sound]` (reference: `lake_build.log`, `build/axioms.log`). About 20 min with
one worker, largest process 3.2 GB. `Main.lean` re-elaborates the statement of `RH2F.layer37` verbatim.

Per-module build (needed for T1 and T2, which link against `lean/pack3/build/*.olean`):

    bash setup.sh && bash run433.sh      # writes build/*.olean, build/axioms.log, build/audit_all.tsv
    python3 check_headers3.py            # statements identical to the Lean 4.20 originals in orig/

`build/audit_all.tsv` lists the axioms of each of the 4 924 theorems of the closure. The only non-standard row is
`MGraph.k4subdiv_star6` (baseline module `StarCert`, `native_decide`); no other theorem depends on it.

**T2 — corollaries (`lean/pack5`).** After the per-module build of pack3:

    cd lean/pack5 && python3 gen5.py && bash build5.sh
    tail -n 1 logs/*.out                 # rc=0 four times
    grep -h "depends on axioms" logs/*.out | grep -v "\[propext, Classical.choice, Quot.sound\]"   # empty

**T1 — infinite families (`lean/pack4`).** After the per-module build of pack3:

    cd lean/pack4 && bash build_all.sh   # 125 modules of order.txt, one compiler process at a time (about 16 min)
    cat build/summary.txt                # rc=0 errors=0 sorry=0 for each module
    cat axioms.log                       # definitions, statements, 33 standard axiom lines + 3 axiom-free
    python3 sanity_check.py              # plain Python check of the graph definitions (reference: sanity.out)

**Lean-core file (`lean/pack2/lean433`).**

    cd lean/pack2/lean433 && lean StarDMS2.lean      # 73 s, 2.8 GB; 12 `#print axioms` lines at the end (StarDMS2.log)

## Known limitations (details: packet section 2.7)

* pack4 and pack5 are built module by module with `lean -o`, not by `lake`.
* The port from Lean 4.20 inserts `set_option backward.isDefEq.respectTransparency false` in 73 modules and
  `set_option maxRecDepth 200000` in 13 certificate modules; statements are unchanged (`check_headers.out`).
* The graph families of pack4 are explicit edge lists; their agreement with the textbook graphs is checked by a
  Python script, not by a formal isomorphism.
* `paper/` and `informal/` are not Lean-checked and were not checked by a human.
* Logs mention paths of the build server (`/home/lead/...`, `~/danus-projects/star6`, `~/m_harness/harness`);
  they are not needed.

## Provenance

Produced by an automated multi-agent harness with Claude (Anthropic) workers and by Claude Code sessions; some
Lean proofs and the cross-check audits by GPT (OpenAI) via codex. See packet section 4. Commit author: Woohyuk Kang.
