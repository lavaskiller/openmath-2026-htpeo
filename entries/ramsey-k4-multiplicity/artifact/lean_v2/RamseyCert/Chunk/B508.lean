import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_508 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_15, eB_16, eB_20, eB_21, eB_23, eB_25, eB_27, eB_28, eB_32, eB_35, eB_38, eB_41,
  eB_42, eB_43, eB_47, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_64, eB_65, eB_66, eB_67, eB_76,
  eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_97, eB_99, eB_101, eB_104, eB_106,
  eB_110, eB_111, eB_113, eB_114, eB_115, eB_119, eB_120, eB_121, eB_124, eB_127, eB_130, eB_141, eB_144, eB_147, eB_148, eB_149,
  eB_153, eB_154, eB_155, eB_159, eB_160, eB_161, eB_162, eB_163, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183,
  eB_184, eB_185, eB_186, eB_187, eB_196, eB_197, eB_198, eB_199, eB_204, eB_205, eB_206, eB_207, eB_209, eB_211, eB_213, eB_214,
  eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_225, eB_226, eB_227, eB_231, eB_232, eB_234, eB_235, eB_236, eB_239, eB_243,
  eB_244, eB_245, eB_246, eB_247, eB_248, eB_250, eB_252, eB_254, eB_255, eB_257, eB_264, eB_265, eB_266, eB_267, eB_272, eB_273,
  eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_291, eB_292, eB_293, eB_294, eB_295, eB_298,
  eB_300, eB_301, eB_302, eB_303, eB_305, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330,
  eB_331, eB_332, eB_333, eB_334, eB_335, eB_337, eB_341, eB_342, eB_343, eB_344, eB_345, eB_353, eB_354, eB_355, eB_356, eB_361,
  eB_362, eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_378, eB_387, eB_389, eB_391, eB_392,
  eB_394, eB_395, eB_397, eB_399, eB_400, eB_403, eB_405, eB_409, eB_410, eB_411, eB_415, eB_416, eB_417, eB_421, eB_422, eB_424,
  eB_426, eB_427, eB_428, eB_429, eB_430, eB_435, eB_438, eB_443, eB_446, eB_448, eB_450, eB_454, eB_455, eB_458, eB_461, eB_462,
  eB_463, eB_464, eB_465, eB_470, eB_471, eB_472, eB_473, eB_482, eB_483, eB_484, eB_485, eB_488, eB_489, eB_490, eB_491, eB_496,
  eB_497, eB_498, eB_499, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_528,
  eB_529, eB_530, eB_531, eB_537, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_553, eB_554, eB_555, eB_556,
  eB_561, eB_562, eB_563, eB_564, eB_570, eB_573, eB_574, eB_575, eB_576, eB_580, eB_581, eB_582, eB_583, eB_584, eB_589, eB_590,
  eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_609, eB_612, eB_615, eB_618, eB_621, eB_623,
  eB_626, eB_628, eB_629, eB_630, eB_631, eB_632, eB_641, eB_642, eB_643, eB_644, eB_647, eB_649, eB_650, eB_651, eB_652, eB_653,
  eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684, eB_685,
  eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_704, eB_705, eB_706, eB_707, eB_708, eB_713, eB_714, eB_715, eB_716,
  eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_733, eB_734, eB_735, eB_736, eB_741, eB_742,
  eB_743, eB_744, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_765, eB_766, eB_767, eB_768, eB_774, eB_775,
  eB_776, eB_777, eB_778, eB_779, eB_780, eB_781, eB_782, eB_783, eB_796, eB_797, eB_802, eB_803, eB_806, eB_807, eB_808, eB_812,
  eB_813, eB_816, eB_817, eB_824, eB_825, eB_828, eB_829, eB_832, eB_833, eB_840, eB_841, eB_842, eB_843, eB_844, eB_845, eB_846,
  eB_847, eB_848, eB_849, eB_852, eB_853, eB_860, eB_861, eB_864, eB_865, eB_866, eB_868, eB_869, eB_874, eB_875, eB_876, eB_877,
  eB_878, eB_879, eB_882, eB_883, eB_884, eB_885, eB_888, eB_889, eB_890, eB_891, eB_896, eB_898, eB_899, eB_900, eB_901, eB_902,
  eB_905, eB_907, eB_910, eB_912, eB_916, eB_917, eB_919, eB_920, eB_921, eB_923, eB_925, eB_926, eB_927, eB_930, eB_931, eB_932,
  eB_935, eB_936, eB_941, eB_947, eB_948, eB_949, eB_950, eB_952, eB_953, eB_958, eB_962, eB_964, eB_966, eB_967, eB_969, eB_970,
  eB_975, eB_976, eB_978, eB_984, eB_986, eB_987, eB_989, eB_991, eB_992, eB_994, eB_996, eB_998, eB_999, eB_1000, eB_1003, eB_1005,
  eB_1006, eB_1007, eB_1008, eB_1012, eB_1013, eB_1014, eB_1016, eB_1019, eB_1021, eB_1023]
theorem nbOKB_508 : nbB_508 = nbhd entsB eB_508 := by decide +kernel
theorem mkOKB_508 : mkEnt 32 1024 W rB_508 508 = eB_508 := by decide +kernel
theorem tB_508 : kTermA 4294967295 eB_508 nbB_508 = 111089963864666837662277400 := by decide +kernel


end RamseyCert
