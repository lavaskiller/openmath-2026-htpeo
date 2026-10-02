import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_565 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_15, eR_16, eR_18, eR_19, eR_21, eR_23, eR_25, eR_29,
  eR_30, eR_31, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_44, eR_45, eR_46, eR_52, eR_53, eR_55, eR_56, eR_57,
  eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_84, eR_86, eR_87, eR_88, eR_89, eR_90,
  eR_91, eR_96, eR_97, eR_99, eR_101, eR_103, eR_105, eR_106, eR_110, eR_111, eR_113, eR_114, eR_115, eR_119, eR_120, eR_121,
  eR_125, eR_126, eR_128, eR_129, eR_131, eR_132, eR_133, eR_134, eR_135, eR_141, eR_144, eR_147, eR_150, eR_151, eR_152, eR_156,
  eR_157, eR_158, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186,
  eR_187, eR_196, eR_197, eR_199, eR_200, eR_201, eR_202, eR_203, eR_208, eR_210, eR_212, eR_214, eR_216, eR_217, eR_219, eR_220,
  eR_222, eR_223, eR_225, eR_226, eR_228, eR_229, eR_230, eR_233, eR_237, eR_238, eR_240, eR_241, eR_242, eR_245, eR_246, eR_247,
  eR_248, eR_250, eR_251, eR_254, eR_255, eR_256, eR_258, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275, eR_280,
  eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307, eR_308,
  eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338, eR_339, eR_341, eR_342, eR_343,
  eR_344, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_377, eR_378, eR_379,
  eR_380, eR_381, eR_382, eR_383, eR_384, eR_388, eR_390, eR_391, eR_392, eR_394, eR_395, eR_398, eR_399, eR_400, eR_402, eR_404,
  eR_405, eR_409, eR_410, eR_411, eR_415, eR_416, eR_417, eR_421, eR_422, eR_424, eR_426, eR_431, eR_432, eR_433, eR_434, eR_436,
  eR_437, eR_439, eR_440, eR_441, eR_442, eR_444, eR_445, eR_447, eR_449, eR_450, eR_454, eR_455, eR_456, eR_458, eR_459, eR_460,
  eR_466, eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_481, eR_486, eR_487, eR_489, eR_490, eR_491,
  eR_496, eR_497, eR_498, eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_528,
  eR_529, eR_531, eR_536, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_561,
  eR_562, eR_563, eR_564, eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_597,
  eR_598, eR_599, eR_600, eR_605, eR_606, eR_607, eR_608, eR_609, eR_612, eR_615, eR_618, eR_622, eR_624, eR_625, eR_627, eR_633,
  eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_661,
  eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687, eR_697, eR_698,
  eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_709, eR_711, eR_712, eR_717, eR_719, eR_720, eR_729, eR_730, eR_731, eR_732,
  eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_757, eR_758, eR_759, eR_760, eR_765,
  eR_766, eR_767, eR_768, eR_769, eR_774, eR_775, eR_786, eR_787, eR_792, eR_793, eR_794, eR_795, eR_802, eR_803, eR_804, eR_805,
  eR_806, eR_807, eR_810, eR_811, eR_816, eR_817, eR_818, eR_819, eR_822, eR_823, eR_826, eR_827, eR_828, eR_829, eR_834, eR_835,
  eR_846, eR_847, eR_848, eR_849, eR_852, eR_853, eR_854, eR_855, eR_858, eR_859, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869,
  eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_878, eR_879, eR_882, eR_883, eR_884, eR_885, eR_892, eR_893, eR_896, eR_897,
  eR_902, eR_903, eR_904, eR_907, eR_912, eR_921, eR_923, eR_924, eR_926, eR_927, eR_928, eR_930, eR_931, eR_932, eR_934, eR_935,
  eR_936, eR_937, eR_938, eR_939, eR_941, eR_942, eR_943, eR_946, eR_947, eR_948, eR_950, eR_951, eR_952, eR_953, eR_954, eR_956,
  eR_959, eR_962, eR_964, eR_966, eR_968, eR_969, eR_970, eR_971, eR_972, eR_973, eR_974, eR_978, eR_981, eR_984, eR_985, eR_986,
  eR_988, eR_989, eR_990, eR_995, eR_997, eR_999, eR_1000, eR_1001, eR_1002, eR_1003, eR_1007, eR_1011, eR_1013, eR_1015, eR_1018, eR_1020,
  eR_1021, eR_1022]
theorem nbOKR_565 : nbR_565 = nbhd entsR eR_565 := by decide +kernel
theorem mkOKR_565 : mkEnt 32 1024 W rR_565 565 = eR_565 := by decide +kernel
theorem tR_565 : kTermA 4294967295 eR_565 nbR_565 = 118124081417831613067829280 := by decide +kernel


end RamseyCert
