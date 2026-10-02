# pack3 STATUS (helper-lean-port) — times in KST, 2026-10-02

| Time | Milestone |
|---|---|
| 01:44 | `setup.sh`: Mathlib `v4.33.1` (0df444a360eaa60ab8c11dca51a86af692955474) cloned by `lake update`, prebuilt cache fetched (8 322 oleans, 7.5 GB); nothing compiled from source |
| 01:54 | `RH2P.layerP` builds (5 hunks) |
| 02:07 | `RH2Fid.fidelity_bundle` builds (2 hunks) |
| 02:24 | **`RH2F.base12`** (layer32d) builds: 62/62 modules of its closure |
| 02:31 | **`RH2F.simple14`, `RH2F.b14d`** (layer35) build: 84/84 |
| 02:45 | **`RH2F.feexist16`, `RH2F.cls16c`, `RH2F.layer37`** build: **98/98**, `Main.lean` exit 0, audit done |

## Current state: COMPLETE — 98/98 modules on Lean 4.33.1 + Mathlib v4.33.1
- Ported modules: all of `orig/order.txt` (the closure of `RH2F.layer37`). Nothing unported.
- Edits: 15 hunks in 8 modules (`patches/*.patch`) + option line `backward.isDefEq.respectTransparency false`
  in 73 modules + `maxRecDepth 200000` in 13 modules (see README.md). Statements: 0 changed (`check_headers.out`).
- `build/axioms.log` (output of `#print axioms` in Main.lean), every line `[propext, Classical.choice, Quot.sound]`:
  `RH2F.layer37`, `star6_dms_conditional_A`, `star6_dms_conditional_B`, `star6_finite`, `RH2F.layer37a`,
  `RH2F.layer35`, `RH2F.layer32d`, `RH2F.layer28`, `RH2F.base12`, `RH2F.simple14`, `RH2F.b14d`, `RH2F.feexist16`,
  `RH2F.feexistD10_of_18`, `RH2F.iid16_of_ne`, `RH2F.cls16c`, `RH2F.rh2_final`, `RH2P.layerP`,
  `RH2Fid.fidelity_bundle`.
- Audit `build/audit_all.tsv`: 4 924 theorems, 1 beyond the standard axioms (`MGraph.k4subdiv_star6`, pre-existing
  `native_decide` in baseline `StarCert`, unused by the main theorems).
- DMS is NOT proved; the top theorem is conditional on named open hypotheses.

## Lake build
`lake build` (plain, one worker, default stack, clean build of all 98 modules + Main): rc=0, 99 targets built, 0 errors,
no dependency compiled from source; the 18 `#print axioms` lines in `lake_build.log` are all
`[propext, Classical.choice, Quot.sound]`. Finished 03:07 KST (20 min wall, sequential).
