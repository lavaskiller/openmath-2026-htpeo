import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_861 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_15, eR_22, eR_24, eR_26, eR_29, eR_31, eR_35, eR_38,
  eR_41, eR_44, eR_45, eR_46, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67,
  eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_88, eR_89, eR_90, eR_91,
  eR_92, eR_93, eR_94, eR_95, eR_98, eR_100, eR_102, eR_104, eR_107, eR_108, eR_112, eR_116, eR_117, eR_118, eR_122, eR_123,
  eR_124, eR_127, eR_130, eR_144, eR_147, eR_150, eR_151, eR_152, eR_156, eR_157, eR_158, eR_160, eR_161, eR_162, eR_163, eR_164,
  eR_165, eR_166, eR_167, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_208, eR_210, eR_212, eR_214, eR_216,
  eR_217, eR_219, eR_220, eR_222, eR_223, eR_225, eR_226, eR_228, eR_229, eR_230, eR_233, eR_237, eR_238, eR_240, eR_241, eR_242,
  eR_245, eR_246, eR_247, eR_248, eR_250, eR_251, eR_253, eR_255, eR_257, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266,
  eR_267, eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282,
  eR_283, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303, eR_304, eR_305, eR_306,
  eR_307, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347,
  eR_348, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_369, eR_370, eR_371,
  eR_372, eR_388, eR_390, eR_391, eR_392, eR_394, eR_395, eR_398, eR_399, eR_400, eR_403, eR_412, eR_413, eR_414, eR_418, eR_419,
  eR_420, eR_423, eR_425, eR_435, eR_443, eR_446, eR_448, eR_451, eR_452, eR_453, eR_457, eR_461, eR_478, eR_479, eR_480, eR_481,
  eR_482, eR_483, eR_484, eR_485, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497, eR_498, eR_499,
  eR_500, eR_501, eR_502, eR_503, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539, eR_540,
  eR_541, eR_542, eR_543, eR_544, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_577, eR_578, eR_579, eR_580,
  eR_581, eR_582, eR_583, eR_584, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602, eR_603, eR_604,
  eR_605, eR_606, eR_607, eR_608, eR_609, eR_612, eR_615, eR_622, eR_624, eR_627, eR_629, eR_630, eR_631, eR_632, eR_633, eR_634,
  eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658,
  eR_659, eR_660, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674,
  eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706,
  eR_707, eR_708, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738,
  eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762,
  eR_763, eR_764, eR_765, eR_766, eR_767, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_784,
  eR_785, eR_786, eR_787, eR_790, eR_791, eR_796, eR_797, eR_800, eR_801, eR_802, eR_803, eR_816, eR_817, eR_818, eR_819, eR_830,
  eR_831, eR_834, eR_835, eR_840, eR_841, eR_844, eR_845, eR_846, eR_847, eR_850, eR_851, eR_852, eR_853, eR_866, eR_867, eR_868,
  eR_869, eR_874, eR_875, eR_878, eR_879, eR_880, eR_881, eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_892, eR_893, eR_894,
  eR_895, eR_900, eR_902, eR_903, eR_904, eR_905, eR_907, eR_909, eR_910, eR_911, eR_914, eR_915, eR_916, eR_918, eR_919, eR_920,
  eR_921, eR_923, eR_926, eR_928, eR_933, eR_935, eR_938, eR_939, eR_940, eR_942, eR_952, eR_955, eR_956, eR_957, eR_958, eR_960,
  eR_962, eR_963, eR_964, eR_965, eR_966, eR_968, eR_969, eR_972, eR_973, eR_974, eR_979, eR_982, eR_983, eR_986, eR_992, eR_993,
  eR_994, eR_995, eR_996, eR_997, eR_999, eR_1000, eR_1001, eR_1003, eR_1005, eR_1007, eR_1008, eR_1012, eR_1013, eR_1014, eR_1015, eR_1016,
  eR_1017, eR_1018, eR_1021]
theorem nbOKR_861 : nbR_861 = nbhd entsR eR_861 := by decide +kernel
theorem mkOKR_861 : mkEnt 32 1024 W rR_861 861 = eR_861 := by decide +kernel
theorem tR_861 : kTermA 4294967295 eR_861 nbR_861 = 96121252458878780603615640 := by decide +kernel


end RamseyCert
