# VERIFY -- OpenMath 2026 M2 bundle (Erdos problems, formal-conjectures statements)

Environment: `google-deepmind/formal-conjectures` at commit `df3f12d7bd06feb3f71ae37abae0ca7cb798d9b1`, toolchain `leanprover/lean4:v4.33.1`, Mathlib as pinned by that commit's `lake-manifest.json`.

```
git clone https://github.com/google-deepmind/formal-conjectures && cd formal-conjectures
git checkout df3f12d7bd06feb3f71ae37abae0ca7cb798d9b1
lake exe cache get                         # Mathlib build cache
lake build FormalConjecturesUtil FormalConjecturesForMathlib   # required: the FC libraries imported by every problem file (this is what the team server ran, see ~/erdos-fc/setup.sh)
(cd /path/to/bundle && sha256sum -c SHA256SUMS)
for f in /path/to/bundle/Erdos*.lean; do lake env lean "$f" || echo FAIL $f; done
```

Each file is the pinned `FormalConjectures/ErdosProblems/<n>.lean` with the `sorry` of the target theorem(s) replaced by a proof, private auxiliary declarations added, and `#print axioms` lines appended. Expected per file: exit code 0 and exactly the lines listed below. Warnings `declaration uses 'sorry'` refer to other, untouched statements of the same FC file (open problems etc.); they are not targets and are not claimed.

No `native_decide`, `axiom`, `unsafe`, `implemented_by`, `admit` in any file; no target depends on `sorryAx`.

## Expected `#print axioms` output

### bundle/ (claimed set)

`Erdos942.lean`  (sha256 `e902e8e237372f54a19c554b715ef0435b80cedd1ce68cd5d3064f521a3a1d77`)
```
'Erdos942.erdos_942.variants.limsup' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos44.lean`  (sha256 `2a1d49488e57fddd11d99bea84730545868ec84aa32407ce5f54f786696408a5`)
```
'Erdos44.greedy_sidon_construction' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos123.lean`  (sha256 `9f7d935c3e8622b38ce8423f3952ae657e7e1a7b423d7988e3f5904623a8b256`)
```
'Erdos123.erdos_123.variants.powers_2_3' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos918.lean`  (sha256 `e3b9555c94193117c38d4499fad4f7def1121994cded0c589f6d10006cd080b1`)
```
'Erdos918.erdos_918.variants.eq_aleph_0_all_subgraphs.parts.i' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos918.erdos_918.variants.eq_aleph_0_all_subgraphs.parts.ii' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos918.erdos_918.variants.eq_aleph_0.parts.i' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos292.lean`  (sha256 `b9db02f5d45241bb708b563e8abe648645929406283ef0c0b931db71a7633df4`)
```
'Erdos292.erdos_292.variants.mul' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos292.erdos_292.variants.two_mul' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos292.erdos_292.variants.prime_pow' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos395.lean`  (sha256 `003880cb653e5f4b35e2e56122fe32c317347cb9d567bcd31056b2b6848c914d`)
```
'Erdos395.erdos_395.variants.one' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos698.lean`  (sha256 `15577f010988f4751510a1739de0765a855f07df090d135613e96ccecd37c1d9`)
```
'Erdos698.erdos_698.variants.erdos_szekeres' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos698.erdos_698.variants.erdos_szekeres_sharp' depends on axioms: [propext, Classical.choice, Quot.sound]
```
(proved in the file but NOT claimed: `Erdos698.erdos_698.variants.erdos_szekeres_sharp`)

`Erdos939.lean`  (sha256 `17bd86b729b6d7cd47118c4590253119dbded6741e57888ef6a17400c42868ac`)
```
'Erdos939.erdos_939.variants.seven' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos939.erdos_939.variants.eight' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos295.lean`  (sha256 `59b39678630187fd4544d3d717cccdde5241e75d2ab50aafde9f7ad36a25751b`)
```
'Erdos295.exists_k' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos703.lean`  (sha256 `1bf2ca3afc1bc2fcf482220ec22ee4e8a9489bf54e9a1784f1cbdf76ed201c58`)
```
'Erdos703.erdos_703.variants.zero' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos748.lean`  (sha256 `b04797885f82798e79b0bd275cc5ec59dd71ea749769c197ac51226ae70fd849`)
```
'Erdos748.erdos_748.variants.lower_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos1136.lean`  (sha256 `74ece9ebc11495cc1dc38f68b9cbd5c12e9601f8b0f06cd7f471dc59e4fe032a`)
```
'Erdos1136.erdos_1136.variants.multiples_of_three' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos1136.erdos_1136.variants.upper_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
```
(proved in the file but NOT claimed: `Erdos1136.erdos_1136.variants.upper_bound`)

`Erdos477.lean`  (sha256 `6f36a324a5c890fa4c7e38df2da86e8a12144bfc29877d7de99e14b78bfc3e1d`)  -- added 2026-10-03
```
'Erdos477.erdos_477.variants.S_sq' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos477.erdos_477.variants.degree_two_dvd_condition_b_ne_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos358.lean`  (sha256 `bbaccc0fbda2b195d0bed0327d46d4eaf0a2ce29616cb565eceb37df7b712c68`)  -- added 2026-10-03
```
'Erdos358.f_id' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos619.lean`  (sha256 `f596f21e1353bf6e9292d7f0cd9772c265dfc705ca855868e0a9e166149132ab`)  -- added 2026-10-03
```
'Erdos619.erdos_619.variants.add_edges_diam_three' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos1148.lean`  (sha256 `e44647fb459d160b9c3499ba926a048c35c608587d54f87c5a66fa12c935534e`)  -- added 2026-10-03
```
'Erdos1148.erdos_1148.variants.weaker' depends on axioms: [propext, Classical.choice, Quot.sound]
```

### bundle_optional/ (not claimed by default, see PACKET_FINAL_v2.md section 3)

`Erdos757.lean`  (sha256 `a1260c57f324cbc3e0794bdc32dfb94d4c905e2643eb8e347b8b07fea3d6043f`)
```
'Erdos757.erdos_757.variants.upperBound' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos261.lean`  (sha256 `ebc7899a33f775bf08240f139d23c3ade6ff3b9cff8ffec8918560276ff01548`)
```
'Erdos261.erdos_261.variants.borwein_loring' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos261.erdos_261.variants.borwein_loring_property' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos261.erdos_261.parts.i' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos36.lean`  (sha256 `06d274ab776ca3673e160ebf917562b9e7cba10e8b85ff995535e40b736e745f`)
```
'Erdos36.minimum_overlap.variants.lower.erdos_1955' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos649.lean`  (sha256 `5ea9a0b3071602d0b7e7f7151c91c14e6320dfc1c4e1280d9ed2db4e83ab5f2c`)
```
'Erdos649.erdos_649.variants.tong' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos649.erdos_649.variants.sampaio' depends on axioms: [propext, Classical.choice, Quot.sound]
```

`Erdos508.lean`  (sha256 `ddb8ccdba30284308afc16e66290b390154ca83999c432e7947a061e840bb171`)
```
'Erdos508.HadwigerNelsonAtLeast4' depends on axioms: [propext, Classical.choice, Quot.sound]
'Erdos508.HadwigerNelsonAtMostSeven' depends on axioms: [propext, Classical.choice, Quot.sound]
```
(proved in the file but NOT claimed: `Erdos508.HadwigerNelsonAtLeast4`)

### bundle/Star6Simple.lean (family G-PM: Schoenberger / Petersen) -- different environment

`Star6Simple.lean`  (sha256 `37fabd0f3cc1c26effe55b87e6d6574bd4e204951623754b2ba0be64703c1b04`) is a module of the star6 library and does NOT compile inside formal-conjectures. It needs the 100 modules listed in `STAR6_DEPENDENCY.md` (star6 artifact, pack3 + pack5; Lean 4.33.1, Mathlib v4.33.1). With pack3 built: `bash pack5/build5.sh Star6Simple` (after `Star6Bounded Star6Corollaries`). Expected (`Star6Simple.out`, last line `rc=0`):
```
'Star6.simple_schoenberger' depends on axioms: [propext, Classical.choice, Quot.sound]
'Star6.simple_petersen_connected' depends on axioms: [propext, Classical.choice, Quot.sound]
```
(the same file also proves `Star6.simple_star6_cubic_bridgeless_le14` and `Star6.simple_star6_subcubic_le7`, which belong to the star6 submission and are not M2 claims)

Server shortcut used by the team: `~/erdos-fc/leancheck.sh /abs/path/File.lean`; full audit (statement identity against the pinned FC file, whole-file diff, axioms, forbidden tokens): `python3 ~/erdos-fc/m2/verify_all.py` -> `~/erdos-fc/m2/VERIFIED.tsv`.
