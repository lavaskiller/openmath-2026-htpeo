# Erdős problems and two classical graph theorems: Lean 4.33.1 formalizations of known results (M2 packet)

Local, unpublished repository (no remote). Nothing in it has been submitted anywhere.

## What is here

| Path | Content |
|---|---|
| `PACKET_FINAL_v2.md` | the M2 packet: families, exact statements, prior-art verdicts, correspondence notes, operator TODO list |
| `PRIOR_ART_FINAL.tsv` | one row per verified theorem: verdict (NEW / DUPLICATE / DUPLICATE-CORE / TRIVIAL / REJECTED), decision, evidence links |
| `VERIFY.md` | how to re-check every file, with the expected `#print axioms` lines |
| `bundle/` | claimed set: 12 Erdős files (`Erdos<n>.lean`, statements from `google-deepmind/formal-conjectures` at commit `df3f12d7bd06feb3f71ae37abae0ca7cb798d9b1`) and `Star6Simple.lean` (Schönberger's theorem and Petersen's theorem, connected case, for Mathlib `SimpleGraph`; needs the star6 library, see `bundle/STAR6_DEPENDENCY.md`) |
| `bundle_optional/` | 5 Erdős files whose FC statement is new but whose mathematics is already formalized elsewhere under other definitions (not claimed by default) |
| `scripts/` | `verify_all.py` (statement identity against the pinned FC file, whole-file diff, axioms, forbidden tokens), `leancheck.sh`, `recheck*.sh`, `make_final.py`, `mk_final_v2.py` -> `make_final_v2.py` (packet/bundle generator), `jsp_scan*.py`, `gh_check*.py`, `prior_art.py` (prior-art search) |
| `logs/` | `VERIFIED.tsv` (all 63 verified rows), `recheck_v2/*.log` (fresh compilation of every bundle file, rc=0), GitHub / JSP scan outputs of the v2 prior-art pass |

## Families (see the packet for details)

- Substantive (9): G-PM (Schönberger 1934 / Petersen 1891, connected case), E942, E44, E123, E918, E292, E395, E698, E939.
- Minor / sanity (4): E295, E703, E748, E1136.
- Optional, not claimed by default (5): E757, E261, E36, E649, E508.

"NEW" always means "no prior formal proof found by the searches described in section 7 of the packet".

## Environment

Lean `leanprover/lean4:v4.33.1`. Erdős files: formal-conjectures at the commit above (Mathlib as pinned there);
`lake env lean bundle/Erdos<n>.lean`. `Star6Simple.lean`: star6 library (pack3 + pack5), Mathlib v4.33.1.
Every claimed theorem depends only on `[propext, Classical.choice, Quot.sound]`; no `native_decide`, no `sorry` in any
target. Other, untouched statements of the same FC files still contain `sorry` (open problems); they are not claimed.

## Provenance

Proofs of the Erdős families: OpenAI GPT (`gpt-6-sol`, `codex` CLI, unattended sessions, 2026-10-02).
star6 library: the team's star6 project. Verification scripts, prior-art search and packet: Claude (Anthropic).
The scripts use absolute server paths (`~/erdos-fc/...`) and are included for audit, not as a portable build.
Erdős files keep the Apache-2.0 header of formal-conjectures.
