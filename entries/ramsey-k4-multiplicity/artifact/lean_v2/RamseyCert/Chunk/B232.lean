import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_232 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_12, eB_14, eB_15, eB_17, eB_19, eB_20, eB_21, eB_22, eB_24, eB_26, eB_27, eB_31,
  eB_32, eB_33, eB_34, eB_35, eB_37, eB_38, eB_40, eB_41, eB_42, eB_43, eB_45, eB_46, eB_47, eB_64, eB_65, eB_66,
  eB_67, eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75, eB_76, eB_77, eB_78, eB_79, eB_96, eB_99, eB_100,
  eB_101, eB_103, eB_104, eB_106, eB_107, eB_108, eB_111, eB_114, eB_115, eB_116, eB_120, eB_121, eB_122, eB_124, eB_125, eB_127,
  eB_128, eB_130, eB_131, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_140, eB_141, eB_143, eB_144, eB_145, eB_146, eB_147,
  eB_148, eB_150, eB_152, eB_153, eB_154, eB_158, eB_159, eB_160, eB_161, eB_162, eB_163, eB_164, eB_165, eB_166, eB_167, eB_168,
  eB_169, eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_200,
  eB_201, eB_202, eB_203, eB_204, eB_205, eB_206, eB_207, eB_208, eB_209, eB_213, eB_217, eB_220, eB_223, eB_226, eB_227, eB_228,
  eB_232, eB_235, eB_236, eB_237, eB_239, eB_240, eB_244, eB_250, eB_251, eB_253, eB_256, eB_257, eB_259, eB_268, eB_269, eB_270,
  eB_271, eB_272, eB_273, eB_274, eB_275, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310,
  eB_311, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_340, eB_341, eB_342,
  eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364, eB_381, eB_382,
  eB_383, eB_384, eB_385, eB_386, eB_388, eB_390, eB_391, eB_394, eB_398, eB_399, eB_402, eB_403, eB_404, eB_405, eB_406, eB_408,
  eB_410, eB_411, eB_412, eB_413, eB_415, eB_416, eB_417, eB_418, eB_422, eB_423, eB_425, eB_427, eB_428, eB_429, eB_430, eB_431,
  eB_432, eB_433, eB_434, eB_435, eB_436, eB_438, eB_439, eB_442, eB_443, eB_445, eB_446, eB_447, eB_448, eB_450, eB_451, eB_455,
  eB_456, eB_457, eB_460, eB_461, eB_470, eB_471, eB_472, eB_473, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481,
  eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503, eB_504, eB_505,
  eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_536, eB_553,
  eB_554, eB_555, eB_556, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_569,
  eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_609,
  eB_610, eB_612, eB_613, eB_615, eB_616, eB_618, eB_619, eB_622, eB_624, eB_625, eB_627, eB_661, eB_662, eB_663, eB_664, eB_665,
  eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674, eB_675, eB_676, eB_701, eB_702, eB_703, eB_704, eB_705,
  eB_706, eB_707, eB_708, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_741, eB_742, eB_743, eB_744, eB_745,
  eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755, eB_756, eB_774, eB_775, eB_778, eB_779, eB_782,
  eB_783, eB_784, eB_785, eB_786, eB_787, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_796, eB_797, eB_798, eB_799, eB_800,
  eB_801, eB_802, eB_803, eB_806, eB_807, eB_814, eB_815, eB_820, eB_821, eB_822, eB_823, eB_824, eB_825, eB_832, eB_833, eB_839,
  eB_840, eB_841, eB_842, eB_843, eB_844, eB_845, eB_846, eB_847, eB_856, eB_857, eB_858, eB_859, eB_860, eB_861, eB_864, eB_865,
  eB_868, eB_869, eB_870, eB_871, eB_874, eB_875, eB_876, eB_877, eB_881, eB_886, eB_887, eB_890, eB_891, eB_892, eB_893, eB_897,
  eB_900, eB_901, eB_904, eB_906, eB_907, eB_910, eB_913, eB_914, eB_915, eB_917, eB_918, eB_919, eB_920, eB_921, eB_924, eB_925,
  eB_936, eB_937, eB_939, eB_942, eB_945, eB_946, eB_947, eB_949, eB_950, eB_951, eB_953, eB_955, eB_957, eB_959, eB_960, eB_963,
  eB_964, eB_965, eB_966, eB_968, eB_971, eB_972, eB_976, eB_977, eB_978, eB_981, eB_985, eB_987, eB_989, eB_990, eB_993, eB_994,
  eB_1000, eB_1001, eB_1002, eB_1007, eB_1011, eB_1013, eB_1014, eB_1015, eB_1016, eB_1018, eB_1019, eB_1021]
theorem nbOKB_232 : nbB_232 = nbhd entsB eB_232 := by decide +kernel
theorem mkOKB_232 : mkEnt 32 1024 W rB_232 232 = eB_232 := by decide +kernel
theorem tB_232 : kTermA 4294967295 eB_232 nbB_232 = 120876639872164093514443097 := by decide +kernel


end RamseyCert
