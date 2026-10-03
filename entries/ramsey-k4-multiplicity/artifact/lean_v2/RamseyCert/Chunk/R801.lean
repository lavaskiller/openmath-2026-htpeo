import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_801 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_14, eR_16, eR_19, eR_23, eR_25, eR_27, eR_29, eR_31,
  eR_34, eR_37, eR_46, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_72, eR_73, eR_74, eR_75, eR_76,
  eR_77, eR_78, eR_79, eR_96, eR_97, eR_101, eR_102, eR_104, eR_105, eR_106, eR_108, eR_110, eR_113, eR_115, eR_117, eR_119,
  eR_121, eR_123, eR_124, eR_126, eR_127, eR_129, eR_130, eR_132, eR_133, eR_134, eR_135, eR_140, eR_143, eR_148, eR_150, eR_152,
  eR_154, eR_156, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165, eR_166, eR_167, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181,
  eR_182, eR_183, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205,
  eR_206, eR_207, eR_209, eR_210, eR_216, eR_219, eR_222, eR_225, eR_227, eR_229, eR_234, eR_236, eR_238, eR_239, eR_241, eR_243,
  eR_248, eR_251, eR_253, eR_257, eR_258, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270,
  eR_271, eR_272, eR_273, eR_274, eR_275, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_300, eR_301, eR_302,
  eR_303, eR_304, eR_305, eR_306, eR_307, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_332, eR_333, eR_334,
  eR_335, eR_336, eR_337, eR_338, eR_339, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359,
  eR_360, eR_361, eR_362, eR_363, eR_364, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383,
  eR_384, eR_388, eR_390, eR_392, eR_395, eR_398, eR_400, eR_402, eR_406, eR_408, eR_410, eR_412, eR_414, eR_416, eR_420, eR_422,
  eR_423, eR_425, eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_436, eR_441, eR_443, eR_444, eR_446, eR_447,
  eR_451, eR_453, eR_455, eR_457, eR_459, eR_461, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_478, eR_479,
  eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_504, eR_505,
  eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_537, eR_538,
  eR_539, eR_540, eR_541, eR_542, eR_543, eR_544, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_569, eR_570,
  eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_601, eR_602,
  eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_610, eR_613, eR_616, eR_621, eR_623, eR_628, eR_629, eR_630, eR_631, eR_632,
  eR_633, eR_634, eR_635, eR_636, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652, eR_661, eR_662, eR_663, eR_664,
  eR_665, eR_666, eR_667, eR_668, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_693, eR_694, eR_695, eR_696,
  eR_697, eR_698, eR_699, eR_700, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_733, eR_734, eR_735, eR_736,
  eR_737, eR_738, eR_739, eR_740, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760,
  eR_761, eR_762, eR_763, eR_764, eR_768, eR_769, eR_770, eR_771, eR_778, eR_779, eR_780, eR_781, eR_786, eR_787, eR_788, eR_789,
  eR_790, eR_791, eR_792, eR_793, eR_798, eR_799, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813,
  eR_818, eR_819, eR_821, eR_824, eR_825, eR_830, eR_831, eR_832, eR_833, eR_834, eR_835, eR_840, eR_841, eR_842, eR_843, eR_844,
  eR_845, eR_846, eR_847, eR_850, eR_851, eR_852, eR_853, eR_854, eR_855, eR_860, eR_861, eR_870, eR_871, eR_872, eR_873, eR_874,
  eR_875, eR_876, eR_877, eR_878, eR_879, eR_880, eR_881, eR_882, eR_883, eR_886, eR_887, eR_892, eR_893, eR_894, eR_895, eR_896,
  eR_897, eR_899, eR_901, eR_902, eR_903, eR_904, eR_910, eR_912, eR_914, eR_915, eR_916, eR_919, eR_920, eR_925, eR_927, eR_929,
  eR_931, eR_932, eR_934, eR_935, eR_938, eR_942, eR_944, eR_945, eR_946, eR_948, eR_950, eR_952, eR_954, eR_955, eR_957, eR_959,
  eR_964, eR_966, eR_967, eR_968, eR_969, eR_971, eR_973, eR_977, eR_978, eR_979, eR_983, eR_985, eR_988, eR_990, eR_991, eR_992,
  eR_994, eR_1000, eR_1003, eR_1005, eR_1008, eR_1011, eR_1014, eR_1018, eR_1020, eR_1023]
theorem nbOKR_801 : nbR_801 = nbhd entsR eR_801 := by decide +kernel
theorem mkOKR_801 : mkEnt 32 1024 W rR_801 801 = eR_801 := by decide +kernel
theorem tR_801 : kTermA 4294967295 eR_801 nbR_801 = 49519435448136957825509856 := by decide +kernel


end RamseyCert
