# pack3 — the complete star6 chain on Lean 4.33.1 + Mathlib v4.33.1 (2026-10-02 KST)

**Result.** All 98 modules of the import closure of `RH2F.layer37` (53 172 lines, the content of pack2 artifact A)
build on **Lean 4.33.1** (commit 819816b2e0a3) with **Mathlib tag `v4.33.1`**
(commit 0df444a360eaa60ab8c11dca51a86af692955474), 0 errors, no `sorry`, no new `axiom`, no new `native_decide`.
Every main theorem depends only on `[propext, Classical.choice, Quot.sound]` (`build/axioms.log`).
**DMS is not proved**: `layer37` proves the finite parts and DMS conditional on named open hypotheses
(`../pack2/STATEMENTS.md` describes every statement; nothing in the statements changed).

## What builds (all with standard axioms only)
| Theorem | Module | Content |
|---|---|---|
| `RH2F.base12` : `BASE12` | `MhFact_38b6f78a47fdf12e` (layer32d) | unconditional: 2-cut-reduced members of 𝒢 on 10/12 vertices are EX1-good |
| `RH2F.simple14` : `SIMPLE14`, `RH2F.b14d` : `B14D` | `MhFact_66a4a19c81528d5b` (layer35) | unconditional: the 14-vertex cases |
| `RH2F.feexist16` : `FEEXIST16`, `RH2F.cls16c` | `MhFact_6b1f8729194e23a3` (layer36) | unconditional: (FE-EXIST-D) at 16 vertices; classification of the 607 c4c cubic graphs on 16 vertices |
| `star6_finite` (Main.lean) | | `BASE12 ∧ SIMPLE14 ∧ B14D ∧ FEEXIST16` |
| `RH2P.layerP` | `MhFact_046773df0a672922` | Schönberger's theorem via Mathlib's Tutte theorem; RH2 with `PStat` discharged |
| `RH2Fid.fidelity_bundle` | `MhFact_6c78409a046a3fe7` | statement fidelity against Mathlib-style statements |
| `RH2F.rh2_final`, `feexistD10_of_18`, `iid16_of_ne`, `layer28`, `layer32d`, `layer35`, `layer37a` | | intermediate results (leaf case ≤ 14 vertices: `layer37` part 5, `IID16 → IID`) |
| `RH2F.layer37` | `MhFact_ba4d9c5abd0afd83` | top theorem (statement re-checked verbatim by `example` in Main.lean) |
| `star6_dms_conditional_A`, `star6_dms_conditional_B` (Main.lean) | | DMS conditional on six / five named open hypotheses |

Axiom audit of all theorems of the 98 modules (`build/audit_all.tsv`, 4 924 theorems): standard axioms only, with the
one known exception `MGraph.k4subdiv_star6` (baseline module `StarCert`, a pre-existing `native_decide`; no main
theorem uses it, see the axiom lists; pack2 artifact B re-proves it by kernel `decide`).

## Layout
| Path | What |
|---|---|
| `lean-toolchain`, `lakefile.toml`, `lake-manifest.json` | lake project `star6` (library `Star6`, sources in `src/`, requires Mathlib `v4.33.1`) |
| `src/` | the 98 ported modules + `Main.lean` + `order.txt` (import order) |
| `orig/` | the Lean 4.20 originals (verbatim copy of `pack2/lean420/src`, identical to the live library `lean/`) |
| `base/` | the pack2 Lean-4.33.1 core port of 5 modules (StarCert, hole, layers 2, 4, 5), used as the starting text for those |
| `patches/*.patch` | every edit made here as old → new hunks with the reason; `compat.txt`, `recdepth.txt`: modules that get an option line; `ALL.diff`: unified diff `orig/` → `src/` |
| `apply3.py` | regenerates `src/` from `orig/` + `base/` + `patches/` |
| `check_headers3.py` → `check_headers.out` | statement check (declaration headers of `src/` vs `orig/`) |
| `setup.sh` → `setup.log` | `lake update` + `lake exe cache get` (download of the prebuilt Mathlib oleans; Mathlib is not compiled) |
| `run433.sh`, `build_pkg.py` → `build/` | per-module build with `lean -o` (2 processes), `build/build.log`, `build_report.json`, **`axioms.log`** (output of Main.lean), `audit_all.tsv` |
| `lake_build.sh` → `lake_build.log` | plain `lake build` of the same project (one worker) |
| `errs.py`, `try.sh` | helpers used during the port |
| `STATUS.md` | milestone log |
| `star6_packet_draft_v3.md` | packet draft updated for this port |

## Reproduce
On a machine with elan (toolchain is fixed by `lean-toolchain`):

    cd pack3
    lake update            # clones Mathlib v4.33.1 + deps (manifest is pinned) and fetches the olean cache
    lake exe cache get     # (only if the post-update hook did not already fetch the cache)
    lake build             # builds the 98 modules and Main; the `#print axioms` lines are in the build output of Main

or, equivalently, the per-module build that produced the logs here (controls parallelism and writes reports):

    bash setup.sh          # = lake update + cache get, log in setup.log
    bash run433.sh         # all modules, then Main.lean -> build/axioms.log, then the audit -> build/audit_all.tsv
    python3 check_headers3.py

On the project server both must run as memory-capped jobs:
`cd ~/m_harness/harness && ~/.venvs/mh/bin/python -m danus.ops.jobs star6 leanport 7G -- /bin/bash <abs>/pack3/run433.sh`.
Measured (run433.sh, 2 processes, `-j 1`; the build was incremental, `build/build.log` holds all runs): 98/98 modules,
1 422 s of module time in total (the 13 certificate modules of layers 36–37: 825 s, 7 min wall), largest process
3.2 GB RSS. Under Lean 4.20 the same modules took 4 248 s and 6.3 GB. Plain `lake build` (clean, one worker, default
stack; `lake_build.log`): rc=0, 98 modules + Main, 20 min wall, the same 18 axiom lines. The Mathlib download is 7.5 GB under `.lake/`.
To regenerate the sources from the 4.20 originals: `python3 apply3.py && python3 check_headers3.py`.

## What was changed (proof edits only)
`check_headers.out`: 6 124 declaration headers compared with the Lean 4.20 originals, none changed
(the single reported difference is the 09-28 split of `tG_check` into `tG_check_0…8`, statement identical;
the only new declarations are those nine lemmas and the instance `decK4s`, both from the earlier core port).

1. **Option line** `set_option backward.isDefEq.respectTransparency false` inserted after the imports of 73 modules
   (`patches/compat.txt`: layer 10 and everything after it, and the fidelity bundle). Lean ≥ 4.29 checks implicit
   arguments at a restricted transparency; this official backward-compatibility option restores the behaviour
   the proofs were written for (`rw`/`simp` seeing through `(addEdge G u w).n = G.n` and similar). It affects
   elaboration only; the kernel checks the resulting terms as usual. Layers P, 6a, 6b, 7, 8, 9 build without it.
2. **Option line** `set_option maxRecDepth 200000` in the 13 modules of layer 36/37 (`patches/recdepth.txt`: the
   16-vertex certificate tables; long list literals and `decide +kernel` exceed the default depth under 4.33),
   and `set_option maxRecDepth 200000 in` before two theorems (`sh_cov24`, `sh_cov25`).
3. **15 hunks in 8 modules** (`patches/*.patch`):
   - Mathlib API changes (6 hunks): `SimpleGraph.symm/loopless` are now `Std.Symm`/`Std.Irrefl` (anonymous
     constructor added in the proof fields of `GT`), `Set.Nat.card_coe_set_eq` → `Nat.card_coe_set_eq` (layer P);
     `Finset.card_sdiff` → `card_sdiff_of_subset` (layer 6a); `Relation.ReflTransGen.symmetric` / `.mono` have new
     statements, replaced by direct inductions (fidelity bundle, 2 hunks); `convert … using 2` produces different
     side goals, replaced by an explicit congruence (layer 17).
   - Lean 4.33 behaviour (9 hunks): `simp only [mem_filter, …, MGraph.Inc]` split in two steps (layer P, 3 hunks);
     `simp …; rfl` (layer 6b); closing step of `simpa` (layers 12, smallhostd, 31a: 3 hunks); `maxRecDepth` (2 hunks).
4. Inherited from pack2 / the 09-28 port (`base/`, documented in `../pack2/lean433/patches/*.json` and
   `../patches/`): the edits of StarCert, `MhFact_5c1eb3f583cf643f`, layers 2, 4, 5.
5. `run433.sh` passes `-j 1 --tstack=1048576` to `lean`; the plain `lake build` (`lake_build.log`) uses the defaults.

81 of the 98 modules differ from the original text; for 68 of them the only difference is the option line(s).

## Not ported / not done
- Nothing of the layer-37 closure is missing. Modules of `lean/` outside this closure (67 modules, among them the
  partial layers 38a, 38a1, 38e_0…3 and the P05/P06/CS5s chain of pack2 artifact B) were not part of this task;
  the P05/P06/CS5s theorems are available on Lean 4.33.1 core in `../pack2/lean433/StarDMS2.lean`.
- No single-file bundle of the Mathlib-dependent chain was made; the lake project is the deliverable.
- The pre-existing `native_decide` in `StarCert.k4subdiv_star6` was left as in the library (not on any chain).
