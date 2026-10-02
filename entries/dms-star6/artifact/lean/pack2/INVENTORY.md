# INVENTORY: import closure of the top theorem `RH2F.layer37` (fact ba4d9c5abd0afd83)

Generated 2026-10-01 15:55 (server time) by `pack2/make_inventory.py` from `lean/` (read-only).

## Summary
- `lean/` holds 165 modules; the closure of `MhFact_ba4d9c5abd0afd83` (layer 37) has **98 modules, 8.7 MB, 53172 lines**.
- **Mathlib**: 3 modules import Mathlib directly (`MhFact_046773df0a672922` Tutte / perfect matchings, `MhFact_09796da8a434e150` BigOperators, `MhFact_6c78409a046a3fe7` fidelity bundle). 79 of the 98 closure modules depend on Mathlib transitively (everything from layer P on); 19 are core-only (733 kB).
- There is **no Mathlib build for Lean 4.33.1 on the server** (only Mathlib v4.20.0 in `~/.cache/mh-mathlib`); the 09-28 bundle `bundle/StarDMS.lean` is Mathlib-free.
- Old bundle (`bundle/order.txt`, 26 modules): 14 of them are in the layer-37 closure; the other 12 (P05, P06, CS5s chain) are not used by layer 37 but stay in the 4.33.1 bundle.
- `native_decide` / `sorry` columns count occurrences of the *word* in the source (comments included). The kernel-level answer is the axiom audit (`lean420/build/audit_all.tsv`).
- Newer layers: `layer38a`, `layer38a1`, `layer38e_0..3` (facts 56f2ec098428c4e3, 94f8afbedef645a3, ace533ac9597f00d, 9c1da83408d4b743, c3bfd6755297d0c4, c925e45cfe4902cc) exist and are gate-verified, but they are partial (finite leaf-case checks at 16 vertices, still being produced); there is no `layer38` top theorem yet, so layer 37 is the top statement. They are not in this closure.

Columns: `4.33.1` = `old` (in the 09-28 bundle), `new` (ported now, core only), `-` (needs Mathlib, not ported); `gate s` = build seconds in the project gate (4.20); `pack s` = seconds in the pack2 4.20 build.

| # | module | theorem (fact label) | bytes | lines | Mathlib | nd-word | 4.33.1 | gate s | pack s |
|---|---|---|---|---|---|---|---|---|---|
| 1 | `StarCore` | baseline library | 19199 | 427 | no | 0 | old | 0.4 | 0.9 |
| 2 | `StarCert` | baseline library | 2859 | 66 | no | 1 | old | 4.3 | 7.7 |
| 3 | `StarSix` | baseline library | 6717 | 144 | no | 1 | old | 0.7 | 1.4 |
| 4 | `StarReduce` | baseline library | 19538 | 397 | no | 0 | old | 0.4 | 0.6 |
| 5 | `StarLeaf` | baseline library | 25423 | 433 | no | 0 | old | 15.9 | 17.8 |
| 6 | `StarRigid` | baseline library | 38024 | 854 | no | 1 | old | 1.5 | 1.8 |
| 7 | `StarBottleneck` | baseline library | 21264 | 381 | no | 0 | old | 0.3 | 0.5 |
| 8 | `StarChecker` | baseline library | 9287 | 176 | no | 1 | old | 0.3 | 0.5 |
| 9 | `StarCompose` | baseline library | 7179 | 125 | no | 0 | old | 0.3 | 0.4 |
| 10 | `StarMatching` | baseline library | 12208 | 250 | no | 0 | old | 0.3 | 0.4 |
| 11 | `StarVizing` | baseline library | 13941 | 249 | no | 0 | old | 0.3 | 0.4 |
| 12 | `StarExtension` | baseline library | 11289 | 205 | no | 0 | old | 0.3 | 0.4 |
| 13 | `MhFact_5c1eb3f583cf643f` | MGraph.dms_of_hole | 115198 | 2324 | no | 0 | old | 80.3 | 126.5 |
| 14 | `MhFact_7d291f6ca774e1da` | RH2F.layer1 | 74749 | 1420 | no | 0 | new | 3.2 | 7.4 |
| 15 | `MhFact_c64b6bd62b78d841` | RH2F.layer2 | 98557 | 1843 | no | 0 | new | 4.2 | 3.3 |
| 16 | `MhFact_657e581f1145250f` | RH2F.layer3 | 71084 | 1234 | no | 0 | new | 2.4 | 5.7 |
| 17 | `MhFact_974f7197c1be8069` | DmsIILean.dms_of_I_II | 9929 | 192 | no | 0 | old | 0.3 | 0.7 |
| 18 | `MhFact_341b6e5e1be16205` | RH2F.layer4 | 58176 | 1210 | no | 0 | new | 5.0 | 8.4 |
| 19 | `MhFact_643ccea3769075c0` | RH2F.layer5 | 118216 | 2222 | no | 0 | new | 16.6 | 39.5 |
| 20 | `MhFact_046773df0a672922` | RH2P.layerP | 24830 | 550 | direct | 0 | - | 1.4 | 5.6 |
| 21 | `MhFact_09796da8a434e150` | RH2F.layer6a | 59359 | 900 | direct | 0 | - | 10.7 | 26.5 |
| 22 | `MhFact_6e44d3c2232b5736` | RH2F.layer6b | 27516 | 528 | via imports | 0 | - | 8.2 | 20.9 |
| 23 | `MhFact_ebeb33c568dfe4e4` | RH2F.layer7 | 79419 | 1176 | via imports | 0 | - | 5.6 | 13.1 |
| 24 | `MhFact_066dc781a8de9c11` | RH2F.layer8 | 58060 | 384 | via imports | 0 | - | 10.7 | 26.9 |
| 25 | `MhFact_3e79907cfcc0085b` | RH2F.layer9 | 57736 | 522 | via imports | 0 | - | 9.2 | 18.5 |
| 26 | `MhFact_75fc19c47ee38b89` | RH2F.layer10 | 53718 | 1047 | via imports | 0 | - | 3.7 | 5.2 |
| 27 | `MhFact_a030b9ec722eb795` | RH2F.layer11 | 61643 | 724 | via imports | 0 | - | 7.7 | 14.1 |
| 28 | `MhFact_90b4662cdeba097d` | RH2F.layer12 | 20332 | 411 | via imports | 0 | - | 1.9 | 3.1 |
| 29 | `MhFact_9e7dda3374e6b172` | RH2F.layer13 | 62674 | 1250 | via imports | 0 | - | 1.5 | 2.5 |
| 30 | `MhFact_413193082c4b8758` | RH2F.layer15 | 26331 | 559 | via imports | 0 | - | 1.6 | 1.6 |
| 31 | `MhFact_81c52cea8147de67` | RH2F.layer16 | 57226 | 1194 | via imports | 0 | - | 7.6 | 9.3 |
| 32 | `MhFact_6c78409a046a3fe7` | RH2Fid.fidelity_bundle | 86239 | 1564 | direct | 0 | - | 16.6 | 22.8 |
| 33 | `MhFact_c3375be11cf311ee` | RH2F.layer17 | 76391 | 1569 | via imports | 0 | - | 3.4 | 3.0 |
| 34 | `MhFact_345a55d7429fd4b1` | RH2F.layer18 | 27467 | 547 | via imports | 0 | - | 4.0 | 3.4 |
| 35 | `MhFact_f7fb58786d241d68` | RH2F.layer19 | 11941 | 217 | via imports | 0 | - | 1.4 | 1.3 |
| 36 | `MhFact_f4c06558ba3030b8` | RH2F.layer20 | 98910 | 379 | via imports | 0 | - | 21.2 | 42.9 |
| 37 | `MhFact_30194dab4e05fdcf` | RH2F.layer21 | 75455 | 1478 | via imports | 0 | - | 4.6 | 5.5 |
| 38 | `MhFact_33aabc50b1cec1ba` | RH2F.layer22 | 67296 | 1386 | via imports | 0 | - | 17.0 | 31.2 |
| 39 | `MhFact_bde9371a01dd2855` | RH2F.layer23 | 34176 | 640 | via imports | 0 | - | 3.1 | 6.1 |
| 40 | `MhFact_83263f8970f3987b` | RH2F.layer24 | 32770 | 605 | via imports | 0 | - | 2.1 | 5.2 |
| 41 | `MhFact_85780d9a54267261` | RH2F.layer25 | 29132 | 560 | via imports | 0 | - | 11.1 | 26.8 |
| 42 | `MhFact_57ea4db232a2b7f5` | RH2F.layer26 | 73762 | 1072 | via imports | 0 | - | 10.2 | 21.2 |
| 43 | `MhFact_2f482379fe24b1cb` | RH2F.smallhostd_of | 88727 | 1525 | via imports | 0 | - | 15.0 | 35.9 |
| 44 | `MhFact_fe45f583e0b81581` | RH2F.shPart1 | 109345 | 228 | via imports | 0 | - | 19.0 | 46.2 |
| 45 | `MhFact_77e9ac7f87ab804f` | RH2F.shPart2 | 108117 | 203 | via imports | 0 | - | 20.3 | 45.1 |
| 46 | `MhFact_c156979f912a0408` | RH2F.shPart3 | 107070 | 200 | via imports | 0 | - | 17.8 | 46.8 |
| 47 | `MhFact_923511b69a46047e` | RH2F.shPart4 | 105041 | 182 | via imports | 0 | - | 19.0 | 45.4 |
| 48 | `MhFact_2e993e3b07378767` | RH2F.layer28 | 79566 | 155 | via imports | 0 | - | 14.8 | 34.9 |
| 49 | `MhFact_54ed0ff9a1ed26b6` | RH2F.layer29a | 130021 | 2562 | via imports | 0 | - | 4.7 | 10.2 |
| 50 | `MhFact_eff6661027b6cbd2` | RH2F.layer31a | 95046 | 1959 | via imports | 0 | - | 2.1 | 5.4 |
| 51 | `MhFact_4f913d5550e57c85` | RH2F.layer29b | 123428 | 586 | via imports | 0 | - | 21.5 | 38.7 |
| 52 | `MhFact_fbae65436c8cc8bf` | RH2F.scl12 | 47993 | 49 | via imports | 0 | - | 9.8 | 22.9 |
| 53 | `MhFact_d39e578650322db3` | RH2F.htab12_part1 | 64390 | 42 | via imports | 0 | - | 12.9 | 30.8 |
| 54 | `MhFact_4b6dbe605eac3a1d` | RH2F.htab12_part2 | 64733 | 42 | via imports | 0 | - | 14.2 | 29.8 |
| 55 | `MhFact_724d35f964ae6f7d` | RH2F.htab12_part3 | 64682 | 42 | via imports | 0 | - | 13.1 | 29.4 |
| 56 | `MhFact_59c06cb7808fc140` | RH2F.htab12_part4 | 64831 | 42 | via imports | 0 | - | 12.9 | 30.9 |
| 57 | `MhFact_e1599bf3f3c26bdb` | RH2F.scl14 | 50233 | 58 | via imports | 0 | - | 10.5 | 21.1 |
| 58 | `MhFact_cc801c1ba060f9c7` | RH2F.layer31b | 77355 | 242 | via imports | 0 | - | 12.2 | 27.8 |
| 59 | `MhFact_def3ba43f6eccb6d` | RH2F.layer32a | 75725 | 214 | via imports | 0 | - | 13.0 | 32.7 |
| 60 | `MhFact_256b4143cc30000f` | RH2F.layer32b | 73892 | 229 | via imports | 0 | - | 14.0 | 35.1 |
| 61 | `MhFact_a8bfe25dadf921db` | RH2F.layer32c | 53597 | 148 | via imports | 0 | - | 12.8 | 30.0 |
| 62 | `MhFact_38b6f78a47fdf12e` | RH2F.layer32d | 3666 | 87 | via imports | 0 | - | 1.0 | 2.6 |
| 63 | `MhFact_024845889158353d` | RH2F.layer33_0 | 55686 | 145 | via imports | 0 | - | 8.6 | 21.6 |
| 64 | `MhFact_4e4dfbfc10836500` | RH2F.layer33_1 | 69549 | 139 | via imports | 0 | - | 14.9 | 29.1 |
| 65 | `MhFact_7b9500b9ad8bca15` | RH2F.layer33_2 | 62480 | 144 | via imports | 0 | - | 11.0 | 27.7 |
| 66 | `MhFact_5343a2db598602a9` | RH2F.layer33_3 | 81573 | 167 | via imports | 0 | - | 15.6 | 37.4 |
| 67 | `MhFact_06139ad5904fa064` | RH2F.layer33_4 | 35410 | 82 | via imports | 0 | - | 8.6 | 16.9 |
| 68 | `MhFact_96b352680829f174` | RH2F.layer33_5 | 85153 | 176 | via imports | 0 | - | 16.4 | 40.2 |
| 69 | `MhFact_c1bad3abf5f2e5e8` | RH2F.layer33_6 | 51915 | 120 | via imports | 0 | - | 12.2 | 24.9 |
| 70 | `MhFact_144fd607d85ac5da` | RH2F.layer33_7 | 83235 | 174 | via imports | 0 | - | 16.7 | 37.4 |
| 71 | `MhFact_e68d717a207ff44f` | RH2F.layer33_8 | 70437 | 194 | via imports | 0 | - | 15.0 | 34.5 |
| 72 | `MhFact_b536c7d8a4f139e4` | RH2F.layer33_9 | 84513 | 206 | via imports | 0 | - | 18.8 | 43.1 |
| 73 | `MhFact_7217c8f0517c24a9` | RH2F.layer33_10 | 85792 | 207 | via imports | 0 | - | 18.7 | 44.9 |
| 74 | `MhFact_79ac08d5cf0788b9` | RH2F.layer33_11 | 80314 | 188 | via imports | 0 | - | 19.2 | 40.9 |
| 75 | `MhFact_55368cd7a0c74072` | RH2F.layer33_12 | 79443 | 191 | via imports | 0 | - | 16.2 | 40.2 |
| 76 | `MhFact_6882aa6fa76ff8ed` | RH2F.layer33_13 | 90257 | 214 | via imports | 0 | - | 18.9 | 44.7 |
| 77 | `MhFact_77a5aa23394eb0f0` | RH2F.layer33_14 | 57634 | 155 | via imports | 0 | - | 13.1 | 29.1 |
| 78 | `MhFact_6460e64b00785972` | RH2F.layer34_0 | 66285 | 151 | via imports | 0 | - | 24.9 | 39.5 |
| 79 | `MhFact_e63e13afc71071cb` | RH2F.layer34_1 | 65579 | 151 | via imports | 0 | - | 25.9 | 40.7 |
| 80 | `MhFact_b71709db7a82637a` | RH2F.layer34_2 | 65692 | 151 | via imports | 0 | - | 30.9 | 44.1 |
| 81 | `MhFact_5e8f7a0c3cb04161` | RH2F.layer34_3 | 65674 | 151 | via imports | 0 | - | 25.2 | 44.2 |
| 82 | `MhFact_1f8ebb817a59b41d` | RH2F.layer34_4 | 65623 | 151 | via imports | 0 | - | 17.7 | 45.3 |
| 83 | `MhFact_7c9b506b16bbaf73` | RH2F.layer34_5 | 45283 | 108 | via imports | 0 | - | 18.2 | 31.3 |
| 84 | `MhFact_66a4a19c81528d5b` | RH2F.layer35 | 7110 | 184 | via imports | 0 | - | 2.5 | 6.9 |
| 85 | `MhFact_1b2e17f98116d9aa` | RH2F.layer37a | 1476 | 37 | via imports | 0 | - | 1.8 | 2.9 |
| 86 | `MhFact_3c53e18d818a023b` | RH2F.layer36a | 226755 | 1646 | via imports | 0 | - | 72.3 | 169.2 |
| 87 | `MhFact_c03bb6e1daa663e4` | RH2F.wTab14R_0_45 | 360001 | 418 | via imports | 0 | - | 188.0 | 256.1 |
| 88 | `MhFact_78d98836f6372f68` | RH2F.wTab14R_45_90 | 357700 | 418 | via imports | 0 | - | 136.1 | 297.7 |
| 89 | `MhFact_4e63409f7b05a806` | RH2F.wTab14R_90_135 | 358759 | 418 | via imports | 0 | - | 131.9 | 224.5 |
| 90 | `MhFact_4b7436a78212f56a` | RH2F.wTab14R_135_180 | 358739 | 418 | via imports | 0 | - | 274.2 | 218.9 |
| 91 | `MhFact_916ccd41e9db4312` | RH2F.wTab14R_180_225 | 357715 | 418 | via imports | 0 | - | 139.4 | 218.6 |
| 92 | `MhFact_78a34517ee1a6fff` | RH2F.wTab14R_225_270 | 353144 | 418 | via imports | 0 | - | 157.4 | 240.3 |
| 93 | `MhFact_0e0e37a38e3c97d5` | RH2F.wTab14R_270_315 | 353882 | 418 | via imports | 0 | - | 256.9 | 212.2 |
| 94 | `MhFact_f645e06d2ce727a3` | RH2F.wTab14R_315_341 | 204338 | 247 | via imports | 0 | - | 90.7 | 121.5 |
| 95 | `MhFact_c35583f86422a75a` | RH2F.layer36c | 411934 | 1186 | via imports | 0 | - | 160.8 | 219.6 |
| 96 | `MhFact_51ff9480dc00823f` | RH2F.hfe14R_0_341 | 394413 | 1250 | via imports | 0 | - | 107.7 | 156.4 |
| 97 | `MhFact_6b1f8729194e23a3` | RH2F.layer36 | 4057 | 88 | via imports | 0 | - | 1.2 | 1.7 |
| 98 | `MhFact_ba4d9c5abd0afd83` | RH2F.layer37 | 1758 | 34 | via imports | 0 | - | 0.9 | 1.5 |

## Modules of `lean/` outside the closure
67 modules: `MhFact_03f44697df9e917a` (RH2Fid.fidelity_IID), `MhFact_0c35d380addab9a7` (PiRigidOnLean.pi_rigid_twin_on), `MhFact_1262231d03310f70` (GPSpokesMC.gp2_tables), `MhFact_1a8aa1c2b8a6bb8e` (PiRigidLean.pi_rigid_twin), `MhFact_1cbbdf1f13cbe1b5` (OparEX1TabC.tables_ok), `MhFact_22e13cb89bd889df` (OparEX1TabA.tables_ok), `MhFact_290df276f477d889` (OparB14DP2.all_ok), `MhFact_31347ad2c548a205` (OparB14DP5.all_ok), `MhFact_38786e2ec9fae902` (PetersenSumAdaptive.certificate_ok), `MhFact_3a172a440dfeed42` (PiSubOnLean.pi_subst_on), `MhFact_3a342f9ff1de66f1` (MGraph.glue2_main), `MhFact_4976bb29de0dd20a` (OparB14DP4.all_ok), `MhFact_4da62a86a36e387e` (LeafAllLean.leaf_all), `MhFact_5078e44d6cea3964` (OparS14P3.all_ok), `MhFact_53cc2fcf862a24d4` (RH2F.sTab14R_120_180), `MhFact_56f2ec098428c4e3` (RH2F.layer38a), `MhFact_58c4b6496df1dd82` (LeafRecipeLean.step4), `MhFact_5e1275fd55eba3e8` (OparB14DP3.all_ok), `MhFact_63b9e393de697bd5` (P05Lean.cubicSharp5_dms), `MhFact_6729360b4f239b08` (OparEX1TabB.tables_ok), `MhFact_675ed330334cf136` (RH2F.layer5), `MhFact_6e89f4acc57cf14b` (OparB14DP10.all_ok), `MhFact_6fc7fe9025fa606a` (RH2F.layer14), `MhFact_6fe2490efdff9cb1` (RH2F.sTab14R_180_240), `MhFact_784c2ccab202ede4` (OparB14DP1.all_ok), `MhFact_7935d329f8fb5b2d` (P06Lean.cover_main), `MhFact_7966551c7ad62866` (OparB14DP12.all_ok), `MhFact_7981cf806f3d578f` (OparB14DP0.all_ok), `MhFact_7bae7837ff8807e2` (KPiLean.kpi_main), `MhFact_80bd5b2f8476243c` (OparB14DP6.all_ok), `MhFact_86678f40e3e70935` (OparS14P3.all_ok), `MhFact_8a659f12b2c2e4d0` (OparS14P4.all_ok), `MhFact_8ccc1b5a5b11e5c3` (RH2F.adS16_ok), `MhFact_91056c0cfcd46f86` (RH2F.sTab14R_300_341), `MhFact_94f8afbedef645a3` (RH2F.layer38a1), `MhFact_9c01b9b4366b1bad` (LeafWLean.claimW), `MhFact_9c1da83408d4b743` (RH2F.layer38e_1), `MhFact_a20d73d94641ebb9` (OparBase.all_ok), `MhFact_a41e8f0a9a642563` (CS5sLean.dmsI_of_cs5s), `MhFact_a43f8e55f5450acd` (RH2F.sTab14R_240_300), `MhFact_a9652ded8ba3b398` (OparS14P0.all_ok), `MhFact_ace533ac9597f00d` (RH2F.layer38e_0), `MhFact_ae44e3567f77389f` (OparB14DP8.all_ok), `MhFact_b48ff163d23f4754` (RH2Lean.rh2_of_parts'), `MhFact_c1ae206f1e97a734` (OparB14DP11.all_ok), `MhFact_c3bfd6755297d0c4` (RH2F.layer38e_2), `MhFact_c925e45cfe4902cc` (RH2F.layer38e_3), `MhFact_d08514f78b25c912` (OparS14P4.all_ok), `MhFact_d1ef48fd75072624` (DmsIIsLean.cs5s_dms), `MhFact_d68273de7a954c1f` (OparS14P0.all_ok), `MhFact_d9fbe3906514b798` (PiSubLean.pi_subst), `MhFact_dadf583552788d8a` (OparB14DP9.all_ok), `MhFact_dfd4f7a11fa5702e` (RH2F.sTab14R_60_120), `MhFact_e1a8991ddfba7611` (OparB14DP7.all_ok), `MhFact_f3a50a27efdf0d7f` (DigonsLean.exists_digonList), `MhFact_fd6dda1d4556ff5f` (OparB14DP13.all_ok), `MhFact_fe114fb2c94909a6` (OparS14P2.all_ok), `MhFact_ff0c230ba4fe999b` (OparS14P1.all_ok), `MhFact_ff5b8620fff933df` (RH2F.sTab14R_0_60), `StarExchange` (baseline library), `StarFive` (baseline library), `StarObstruction` (baseline library), `StarPartial` (baseline library), `StarSeven` (baseline library), `StarTripleCert` (baseline library), `StarVizingCert` (baseline library), `StarW` (baseline library)
