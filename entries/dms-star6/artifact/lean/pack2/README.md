# pack2 — competition packaging of the star6 Lean results (2026-10-01 UTC)

Read `STATEMENTS.md` (what is proved, what is hypothesis, axioms) and `INVENTORY.md` (closure of the top theorem).
DMS is **not** proved; the top theorem `RH2F.layer37` proves the finite parts and DMS conditional on named hypotheses.

## Layout
| Path | What |
|---|---|
| `lean420/src/` | verbatim snapshot (sha256 in `lean420/SHA256SUMS`) of the 98 modules of `lean/` in the import closure of `MhFact_ba4d9c5abd0afd83` (`RH2F.layer37`), `order.txt` (import order), `Main.lean` (statement re-check + `#print axioms`) |
| `lean420/build/` | `build.log`, `build_report.json`, **`axioms.log`**, `audit_all.tsv` (axioms of all 4 903 theorems), oleans |
| `lean433/StarDMS2.lean` | **single-file bundle for Lean 4.33.1 core** (31 modules, 20 180 lines, no imports) |
| `lean433/StarDMS2.log` | its build output, ending with the `#print axioms` lines, time and peak RSS |
| `lean433/src/`, `orig/`, `patches/` | per-module port; `orig/` = Lean 4.20 originals of the 5 new modules, `patches/*.json` = every edit (old → new, why) |
| `lean433/build/` | per-module 4.33.1 build (`build.log`, `build_report.json`, `audit_all.tsv`) |
| `lean433/check_headers.out` | statement check: declaration headers of port vs. originals |
| `star6_packet_draft_v2.md` | proposed submission packet (copy of the laptop file) |
| scripts | `closure.py`, `build_pkg.py`, `run420.sh`, `run433.sh`, `apply2.py`, `make_bundle2.py`, `check_headers.py`, `make_inventory.py`, `gen_l5_patch.py` (one-off), `iter433.sh` (helper) |

## Reproduce

Artifact A (Lean 4.20.0 + Mathlib v4.20.0, tag `v4.20.0`, commit c211948581bde9846a99e32d97a03f0d5307c31e, prebuilt
oleans expected under `$MATHLIB420_LAKE`, default `~/.cache/mh-mathlib/mathlib4/.lake`):

    bash run420.sh        # on the server: python -m danus.ops.jobs star6 leanpack 6G -- /bin/bash <abs path>/run420.sh

Each module is compiled with `lean -o` in import order (2 at a time). Measured: 98/98 modules, 4 248 s of module time,
about 50 min wall, largest single process 6.3 GB RSS (the ten 16-vertex certificate modules take 150–250 s each).
Elsewhere: `git clone --branch v4.20.0 https://github.com/leanprover-community/mathlib4 && cd mathlib4 && lake exe cache get`,
then `MATHLIB420_LAKE=<mathlib4>/.lake LEAN420=<lean 4.20.0 binary> bash run420.sh`.
A lake project is not needed: the modules are flat files `MhFact_<fact_id>.lean` / `Star*.lean` on `LEAN_PATH`.

Artifact B (Lean 4.33.1 core):

    lean lean433/StarDMS2.lean        # 73 s, 2.8 GB; or: bash run433.sh  (modules + bundle + log)

To regenerate the port from the originals: `python3 apply2.py && python3 make_bundle2.py && python3 check_headers.py`.

## Refreshing when the run adds layers
`python3 closure.py MhFact_<new top> > closure.tsv`, copy the listed modules from `lean/` to `lean420/src/`, rewrite
`order.txt` (first column), adapt `Main.lean`, rerun `run420.sh` (unchanged modules are cached by content hash).
State at packaging time: layers `38a`, `38a1`, `38e_0…3` exist (partial finite checks for the 16-vertex leaf case);
there is no layer-38 top theorem yet.

## Not done
The 79 Mathlib-dependent modules (layer P … layer 37) are not ported to Lean 4.33.1: no Mathlib for 4.33.1 is
installed on the server. Getting one is a download, not a build (`git clone --branch v4.33.1` of mathlib4 and
`lake exe cache get`: about 6 GB of disk, ~10 min, no compilation), but it needs the operator's approval, and the port
itself is the cost: the 5 core-only modules ported here (7 929 lines) needed 35 patch entries, all caused by the
4.33 change of unification transparency; the remaining 45 000 lines additionally face a year of Mathlib renames.
One full rebuild pass is about 50–70 min.
