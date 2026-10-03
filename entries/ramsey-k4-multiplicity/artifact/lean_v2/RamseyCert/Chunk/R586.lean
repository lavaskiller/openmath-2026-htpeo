import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_586 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_12, eR_15, eR_16, eR_17, eR_20, eR_21, eR_22, eR_23,
  eR_24, eR_25, eR_26, eR_29, eR_32, eR_35, eR_38, eR_41, eR_44, eR_47, eR_52, eR_53, eR_54, eR_55, eR_57, eR_58,
  eR_59, eR_64, eR_66, eR_67, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_92, eR_93, eR_94, eR_95,
  eR_97, eR_99, eR_100, eR_102, eR_103, eR_105, eR_107, eR_108, eR_110, eR_111, eR_113, eR_114, eR_116, eR_117, eR_119, eR_120,
  eR_122, eR_123, eR_125, eR_126, eR_128, eR_129, eR_131, eR_132, eR_136, eR_137, eR_138, eR_141, eR_144, eR_147, eR_150, eR_153,
  eR_156, eR_159, eR_164, eR_165, eR_166, eR_167, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_188, eR_189, eR_190,
  eR_191, eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_207, eR_208, eR_210, eR_211, eR_213, eR_216, eR_217, eR_219,
  eR_220, eR_222, eR_223, eR_225, eR_226, eR_228, eR_229, eR_231, eR_232, eR_234, eR_235, eR_237, eR_238, eR_240, eR_241, eR_243,
  eR_244, eR_249, eR_251, eR_252, eR_253, eR_254, eR_255, eR_257, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271,
  eR_276, eR_277, eR_278, eR_279, eR_289, eR_291, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303, eR_312, eR_313,
  eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346,
  eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_377, eR_378,
  eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_387, eR_388, eR_389, eR_390, eR_393, eR_396, eR_397, eR_398, eR_401, eR_402,
  eR_404, eR_406, eR_407, eR_409, eR_410, eR_412, eR_413, eR_415, eR_416, eR_418, eR_419, eR_421, eR_422, eR_423, eR_424, eR_425,
  eR_426, eR_432, eR_433, eR_434, eR_436, eR_437, eR_439, eR_440, eR_443, eR_446, eR_447, eR_449, eR_451, eR_452, eR_454, eR_455,
  eR_457, eR_458, eR_461, eR_462, eR_463, eR_464, eR_465, eR_470, eR_471, eR_472, eR_473, eR_482, eR_483, eR_485, eR_488, eR_489,
  eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_508, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522,
  eR_523, eR_532, eR_533, eR_534, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556,
  eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_589, eR_590, eR_591, eR_592,
  eR_593, eR_594, eR_595, eR_596, eR_601, eR_602, eR_603, eR_604, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620,
  eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_661,
  eR_662, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_689, eR_690, eR_691, eR_697, eR_698,
  eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_729, eR_731,
  eR_732, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_756, eR_761, eR_762, eR_763, eR_764,
  eR_765, eR_766, eR_767, eR_778, eR_779, eR_784, eR_785, eR_786, eR_787, eR_790, eR_791, eR_792, eR_793, eR_794, eR_795, eR_796,
  eR_797, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_810, eR_811, eR_814, eR_815, eR_818, eR_819, eR_822, eR_823, eR_826,
  eR_827, eR_828, eR_829, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_842, eR_843, eR_844, eR_845, eR_848, eR_849, eR_854,
  eR_855, eR_856, eR_857, eR_858, eR_859, eR_864, eR_865, eR_870, eR_871, eR_878, eR_879, eR_880, eR_881, eR_884, eR_885, eR_894,
  eR_895, eR_896, eR_898, eR_900, eR_901, eR_902, eR_904, eR_908, eR_909, eR_910, eR_911, eR_912, eR_913, eR_914, eR_915, eR_916,
  eR_917, eR_919, eR_920, eR_923, eR_929, eR_930, eR_931, eR_932, eR_933, eR_935, eR_937, eR_940, eR_943, eR_944, eR_949, eR_950,
  eR_952, eR_953, eR_955, eR_956, eR_959, eR_960, eR_961, eR_964, eR_965, eR_966, eR_968, eR_973, eR_975, eR_976, eR_977, eR_978,
  eR_983, eR_984, eR_988, eR_990, eR_991, eR_992, eR_996, eR_997, eR_999, eR_1004, eR_1012, eR_1013, eR_1015, eR_1016, eR_1017, eR_1019,
  eR_1020, eR_1021, eR_1023]
theorem nbOKR_586 : nbR_586 = nbhd entsR eR_586 := by decide +kernel
theorem mkOKR_586 : mkEnt 32 1024 W rR_586 586 = eR_586 := by decide +kernel
theorem tR_586 : kTermA 4294967295 eR_586 nbR_586 = 121293821598718656493942830 := by decide +kernel


end RamseyCert
