import Lean
import StarCore
import StarCert
import StarSix
import StarReduce
import StarLeaf
import StarRigid
import StarBottleneck
import StarChecker
import StarCompose
import StarMatching
import StarVizing
import StarExtension
import MhFact_5c1eb3f583cf643f
import MhFact_7d291f6ca774e1da
import MhFact_c64b6bd62b78d841
import MhFact_657e581f1145250f
import MhFact_974f7197c1be8069
import MhFact_341b6e5e1be16205
import MhFact_643ccea3769075c0
import MhFact_046773df0a672922
import MhFact_09796da8a434e150
import MhFact_6e44d3c2232b5736
import MhFact_ebeb33c568dfe4e4
import MhFact_066dc781a8de9c11
import MhFact_3e79907cfcc0085b
import MhFact_75fc19c47ee38b89
import MhFact_a030b9ec722eb795
import MhFact_90b4662cdeba097d
import MhFact_9e7dda3374e6b172
import MhFact_413193082c4b8758
import MhFact_81c52cea8147de67
import MhFact_6c78409a046a3fe7
import MhFact_c3375be11cf311ee
import MhFact_345a55d7429fd4b1
import MhFact_f7fb58786d241d68
import MhFact_f4c06558ba3030b8
import MhFact_30194dab4e05fdcf
import MhFact_33aabc50b1cec1ba
import MhFact_bde9371a01dd2855
import MhFact_83263f8970f3987b
import MhFact_85780d9a54267261
import MhFact_57ea4db232a2b7f5
import MhFact_2f482379fe24b1cb
import MhFact_fe45f583e0b81581
import MhFact_77e9ac7f87ab804f
import MhFact_c156979f912a0408
import MhFact_923511b69a46047e
import MhFact_2e993e3b07378767
import MhFact_54ed0ff9a1ed26b6
import MhFact_eff6661027b6cbd2
import MhFact_4f913d5550e57c85
import MhFact_fbae65436c8cc8bf
import MhFact_d39e578650322db3
import MhFact_4b6dbe605eac3a1d
import MhFact_724d35f964ae6f7d
import MhFact_59c06cb7808fc140
import MhFact_e1599bf3f3c26bdb
import MhFact_cc801c1ba060f9c7
import MhFact_def3ba43f6eccb6d
import MhFact_256b4143cc30000f
import MhFact_a8bfe25dadf921db
import MhFact_38b6f78a47fdf12e
import MhFact_024845889158353d
import MhFact_4e4dfbfc10836500
import MhFact_7b9500b9ad8bca15
import MhFact_5343a2db598602a9
import MhFact_06139ad5904fa064
import MhFact_96b352680829f174
import MhFact_c1bad3abf5f2e5e8
import MhFact_144fd607d85ac5da
import MhFact_e68d717a207ff44f
import MhFact_b536c7d8a4f139e4
import MhFact_7217c8f0517c24a9
import MhFact_79ac08d5cf0788b9
import MhFact_55368cd7a0c74072
import MhFact_6882aa6fa76ff8ed
import MhFact_77a5aa23394eb0f0
import MhFact_6460e64b00785972
import MhFact_e63e13afc71071cb
import MhFact_b71709db7a82637a
import MhFact_5e8f7a0c3cb04161
import MhFact_1f8ebb817a59b41d
import MhFact_7c9b506b16bbaf73
import MhFact_66a4a19c81528d5b
import MhFact_1b2e17f98116d9aa
import MhFact_3c53e18d818a023b
import MhFact_c03bb6e1daa663e4
import MhFact_78d98836f6372f68
import MhFact_4e63409f7b05a806
import MhFact_4b7436a78212f56a
import MhFact_916ccd41e9db4312
import MhFact_78a34517ee1a6fff
import MhFact_0e0e37a38e3c97d5
import MhFact_f645e06d2ce727a3
import MhFact_c35583f86422a75a
import MhFact_51ff9480dc00823f
import MhFact_6b1f8729194e23a3
import MhFact_ba4d9c5abd0afd83
open Lean Elab Command in
#eval show CommandElabM Unit from do
  let env ← getEnv
  let mods : Array Name := #[`StarCore, `StarCert, `StarSix, `StarReduce, `StarLeaf, `StarRigid, `StarBottleneck, `StarChecker, `StarCompose, `StarMatching, `StarVizing, `StarExtension, `MhFact_5c1eb3f583cf643f, `MhFact_7d291f6ca774e1da, `MhFact_c64b6bd62b78d841, `MhFact_657e581f1145250f, `MhFact_974f7197c1be8069, `MhFact_341b6e5e1be16205, `MhFact_643ccea3769075c0, `MhFact_046773df0a672922, `MhFact_09796da8a434e150, `MhFact_6e44d3c2232b5736, `MhFact_ebeb33c568dfe4e4, `MhFact_066dc781a8de9c11, `MhFact_3e79907cfcc0085b, `MhFact_75fc19c47ee38b89, `MhFact_a030b9ec722eb795, `MhFact_90b4662cdeba097d, `MhFact_9e7dda3374e6b172, `MhFact_413193082c4b8758, `MhFact_81c52cea8147de67, `MhFact_6c78409a046a3fe7, `MhFact_c3375be11cf311ee, `MhFact_345a55d7429fd4b1, `MhFact_f7fb58786d241d68, `MhFact_f4c06558ba3030b8, `MhFact_30194dab4e05fdcf, `MhFact_33aabc50b1cec1ba, `MhFact_bde9371a01dd2855, `MhFact_83263f8970f3987b, `MhFact_85780d9a54267261, `MhFact_57ea4db232a2b7f5, `MhFact_2f482379fe24b1cb, `MhFact_fe45f583e0b81581, `MhFact_77e9ac7f87ab804f, `MhFact_c156979f912a0408, `MhFact_923511b69a46047e, `MhFact_2e993e3b07378767, `MhFact_54ed0ff9a1ed26b6, `MhFact_eff6661027b6cbd2, `MhFact_4f913d5550e57c85, `MhFact_fbae65436c8cc8bf, `MhFact_d39e578650322db3, `MhFact_4b6dbe605eac3a1d, `MhFact_724d35f964ae6f7d, `MhFact_59c06cb7808fc140, `MhFact_e1599bf3f3c26bdb, `MhFact_cc801c1ba060f9c7, `MhFact_def3ba43f6eccb6d, `MhFact_256b4143cc30000f, `MhFact_a8bfe25dadf921db, `MhFact_38b6f78a47fdf12e, `MhFact_024845889158353d, `MhFact_4e4dfbfc10836500, `MhFact_7b9500b9ad8bca15, `MhFact_5343a2db598602a9, `MhFact_06139ad5904fa064, `MhFact_96b352680829f174, `MhFact_c1bad3abf5f2e5e8, `MhFact_144fd607d85ac5da, `MhFact_e68d717a207ff44f, `MhFact_b536c7d8a4f139e4, `MhFact_7217c8f0517c24a9, `MhFact_79ac08d5cf0788b9, `MhFact_55368cd7a0c74072, `MhFact_6882aa6fa76ff8ed, `MhFact_77a5aa23394eb0f0, `MhFact_6460e64b00785972, `MhFact_e63e13afc71071cb, `MhFact_b71709db7a82637a, `MhFact_5e8f7a0c3cb04161, `MhFact_1f8ebb817a59b41d, `MhFact_7c9b506b16bbaf73, `MhFact_66a4a19c81528d5b, `MhFact_1b2e17f98116d9aa, `MhFact_3c53e18d818a023b, `MhFact_c03bb6e1daa663e4, `MhFact_78d98836f6372f68, `MhFact_4e63409f7b05a806, `MhFact_4b7436a78212f56a, `MhFact_916ccd41e9db4312, `MhFact_78a34517ee1a6fff, `MhFact_0e0e37a38e3c97d5, `MhFact_f645e06d2ce727a3, `MhFact_c35583f86422a75a, `MhFact_51ff9480dc00823f, `MhFact_6b1f8729194e23a3, `MhFact_ba4d9c5abd0afd83]
  let mut out : Array String := #[]
  for (n, ci) in env.constants.map₁.toList do
    if n.isInternal then continue
    let some idx := env.getModuleIdxFor? n | continue
    let some modName := env.header.moduleNames[idx.toNat]? | continue
    if !mods.contains modName then continue
    match ci with
    | .thmInfo _ =>
      let axs ← liftCoreM <| Lean.collectAxioms n
      let axStr := ",".intercalate (axs.toList.map toString)
      out := out.push s!"AXIOMS\t{modName}\t{n}\t{axStr}"
    | _ => pure ()
  for line in out do
    IO.println line
