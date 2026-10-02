# Star6Simple.lean -- dependency note

`Star6Simple.lean` (sha256 `37fabd0f3cc1c26effe55b87e6d6574bd4e204951623754b2ba0be64703c1b04`) is NOT a standalone file: it is module `Star6Simple` of the star6 Lean library (Lean 4.33.1 + Mathlib v4.33.1, Mathlib commit `0df444a360ea`).
The library is not copied into this bundle; it lives in the star6 artifact (`openmath/star6_artifact/lean/pack3/src`, `.../pack5/src`; server: `~/danus-projects/star6/lean433/pack3`, `pack5`).

## Exact module list (transitive imports of `Star6Simple`, in import order)

pack5 (3): `Star6Bounded`, `Star6Corollaries`, `Star6Simple`

pack3 (98): `StarCore`, `StarCert`, `StarSix`, `StarReduce`, `StarLeaf`, `StarRigid`, `StarBottleneck`, `StarChecker`, `StarCompose`, `StarMatching`, `StarVizing`, `StarExtension`, `MhFact_5c1eb3f583cf643f`, `MhFact_7d291f6ca774e1da`, `MhFact_c64b6bd62b78d841`, `MhFact_657e581f1145250f`, `MhFact_974f7197c1be8069`, `MhFact_341b6e5e1be16205`, `MhFact_643ccea3769075c0`, `MhFact_046773df0a672922`, `MhFact_09796da8a434e150`, `MhFact_6e44d3c2232b5736`, `MhFact_ebeb33c568dfe4e4`, `MhFact_066dc781a8de9c11`, `MhFact_3e79907cfcc0085b`, `MhFact_75fc19c47ee38b89`, `MhFact_a030b9ec722eb795`, `MhFact_90b4662cdeba097d`, `MhFact_9e7dda3374e6b172`, `MhFact_413193082c4b8758`, `MhFact_81c52cea8147de67`, `MhFact_6c78409a046a3fe7`, `MhFact_c3375be11cf311ee`, `MhFact_345a55d7429fd4b1`, `MhFact_f7fb58786d241d68`, `MhFact_f4c06558ba3030b8`, `MhFact_30194dab4e05fdcf`, `MhFact_33aabc50b1cec1ba`, `MhFact_bde9371a01dd2855`, `MhFact_83263f8970f3987b`, `MhFact_85780d9a54267261`, `MhFact_57ea4db232a2b7f5`, `MhFact_2f482379fe24b1cb`, `MhFact_fe45f583e0b81581`, `MhFact_77e9ac7f87ab804f`, `MhFact_c156979f912a0408`, `MhFact_923511b69a46047e`, `MhFact_2e993e3b07378767`, `MhFact_54ed0ff9a1ed26b6`, `MhFact_eff6661027b6cbd2`, `MhFact_4f913d5550e57c85`, `MhFact_fbae65436c8cc8bf`, `MhFact_d39e578650322db3`, `MhFact_4b6dbe605eac3a1d`, `MhFact_724d35f964ae6f7d`, `MhFact_59c06cb7808fc140`, `MhFact_e1599bf3f3c26bdb`, `MhFact_cc801c1ba060f9c7`, `MhFact_def3ba43f6eccb6d`, `MhFact_256b4143cc30000f`, `MhFact_a8bfe25dadf921db`, `MhFact_38b6f78a47fdf12e`, `MhFact_024845889158353d`, `MhFact_4e4dfbfc10836500`, `MhFact_7b9500b9ad8bca15`, `MhFact_5343a2db598602a9`, `MhFact_06139ad5904fa064`, `MhFact_96b352680829f174`, `MhFact_c1bad3abf5f2e5e8`, `MhFact_144fd607d85ac5da`, `MhFact_e68d717a207ff44f`, `MhFact_b536c7d8a4f139e4`, `MhFact_7217c8f0517c24a9`, `MhFact_79ac08d5cf0788b9`, `MhFact_55368cd7a0c74072`, `MhFact_6882aa6fa76ff8ed`, `MhFact_77a5aa23394eb0f0`, `MhFact_6460e64b00785972`, `MhFact_e63e13afc71071cb`, `MhFact_b71709db7a82637a`, `MhFact_5e8f7a0c3cb04161`, `MhFact_1f8ebb817a59b41d`, `MhFact_7c9b506b16bbaf73`, `MhFact_66a4a19c81528d5b`, `MhFact_1b2e17f98116d9aa`, `MhFact_3c53e18d818a023b`, `MhFact_c03bb6e1daa663e4`, `MhFact_78d98836f6372f68`, `MhFact_4e63409f7b05a806`, `MhFact_4b7436a78212f56a`, `MhFact_916ccd41e9db4312`, `MhFact_78a34517ee1a6fff`, `MhFact_0e0e37a38e3c97d5`, `MhFact_f645e06d2ce727a3`, `MhFact_c35583f86422a75a`, `MhFact_51ff9480dc00823f`, `MhFact_6b1f8729194e23a3`, `MhFact_ba4d9c5abd0afd83`

Mathlib modules imported directly by these files (7): `Mathlib.Algebra.BigOperators.Fin`, `Mathlib.Combinatorics.SimpleGraph.Tutte`, `Mathlib.Data.Fintype.EquivFin`, `Mathlib.Data.Fintype.Sum`, `Mathlib.Data.Sym.Sym2`, `Mathlib.Logic.Relation`, `Mathlib.SetTheory.Cardinal.Finite`

Total: 101 library modules, 54401 lines. The import chain of pack3 is linear, so `Star6Simple` imports all of it through `Star6Corollaries`.

## Where the mathematics is

Schoenberger's theorem is proved in pack3 module `MhFact_046773df0a672922` (550 lines; `RH2P.schoenberger`, `RH2P.pstat`), directly from `SimpleGraph.tutte` (`Mathlib.Combinatorics.SimpleGraph.Tutte`). That module's own transitive imports are the 19-module prefix (12511 lines): `StarCore`, `StarCert`, `StarSix`, `StarReduce`, `StarLeaf`, `StarRigid`, `StarBottleneck`, `StarChecker`, `StarCompose`, `StarMatching`, `StarVizing`, `StarExtension`, `MhFact_5c1eb3f583cf643f`, `MhFact_7d291f6ca774e1da`, `MhFact_c64b6bd62b78d841`, `MhFact_657e581f1145250f`, `MhFact_974f7197c1be8069`, `MhFact_341b6e5e1be16205`, `MhFact_046773df0a672922`.
The remaining pack3 modules are imported only because the plain-vocabulary translation (`Star6.plain_schoenberger`, module `Star6Corollaries`, via the fidelity module `RH2Fid`) sits at the end of the chain; they are not used mathematically for Schoenberger/Petersen.

## Build

With pack3 built (`pack3/build/*.olean`, Mathlib cache in `pack3/.lake/packages`): `bash pack5/build5.sh` (compiles `Star6Bounded`, `Star6Corollaries`, `Star6Equiv`, `Star6Simple` with `lean -o`; about 20 s per module, < 3 GB).
`Star6Simple.out` in this bundle is the compiler output of an independent re-compilation by the M2 helper on 2026-10-02 (same command line as `build5.sh`, output written outside the star6 tree, last line `rc=0`). Expected axiom lines:

```
'Star6.simple_schoenberger' depends on axioms: [propext, Classical.choice, Quot.sound]
'Star6.simple_petersen_connected' depends on axioms: [propext, Classical.choice, Quot.sound]
'Star6.simple_star6_cubic_bridgeless_le14' depends on axioms: [propext, Classical.choice, Quot.sound]
'Star6.simple_star6_subcubic_le7' depends on axioms: [propext, Classical.choice, Quot.sound]
```
