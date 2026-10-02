import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_555 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_14, eB_15, eB_16, eB_18, eB_21, eB_23, eB_25, eB_27, eB_31, eB_32, eB_33,
  eB_36, eB_39, eB_42, eB_46, eB_47, eB_48, eB_49, eB_50, eB_51, eB_56, eB_57, eB_58, eB_59, eB_65, eB_68, eB_69,
  eB_70, eB_71, eB_72, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_97,
  eB_98, eB_102, eB_105, eB_108, eB_109, eB_110, eB_112, eB_113, eB_117, eB_118, eB_119, eB_123, eB_126, eB_129, eB_132, eB_136,
  eB_137, eB_138, eB_140, eB_141, eB_143, eB_144, eB_146, eB_147, eB_148, eB_152, eB_153, eB_154, eB_158, eB_159, eB_160, eB_161,
  eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_180, eB_181, eB_182, eB_183, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193,
  eB_194, eB_195, eB_200, eB_201, eB_202, eB_203, eB_208, eB_209, eB_213, eB_217, eB_220, eB_223, eB_226, eB_227, eB_228, eB_232,
  eB_235, eB_236, eB_237, eB_239, eB_240, eB_244, eB_250, eB_251, eB_254, eB_258, eB_259, eB_264, eB_265, eB_266, eB_267, eB_268,
  eB_269, eB_270, eB_271, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299, eB_300,
  eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_322, eB_323, eB_328, eB_329, eB_330,
  eB_331, eB_336, eB_337, eB_338, eB_339, eB_340, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_361, eB_362,
  eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_385, eB_386, eB_388, eB_390, eB_391, eB_394,
  eB_398, eB_399, eB_404, eB_407, eB_408, eB_409, eB_413, eB_414, eB_415, eB_419, eB_420, eB_421, eB_424, eB_426, eB_431, eB_432,
  eB_433, eB_434, eB_437, eB_440, eB_441, eB_444, eB_449, eB_452, eB_453, eB_454, eB_458, eB_459, eB_462, eB_463, eB_464, eB_465,
  eB_467, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_488, eB_489, eB_490, eB_491, eB_494, eB_500, eB_501,
  eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521, eB_522, eB_523, eB_527, eB_528,
  eB_529, eB_530, eB_531, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552, eB_553, eB_554, eB_555, eB_556, eB_561,
  eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_581, eB_582, eB_583, eB_584, eB_589, eB_590, eB_591, eB_592, eB_597,
  eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_609, eB_610, eB_612, eB_613, eB_615, eB_616, eB_618, eB_619, eB_622,
  eB_624, eB_625, eB_627, eB_633, eB_634, eB_635, eB_636, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646, eB_647, eB_648, eB_653,
  eB_654, eB_655, eB_656, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_674, eB_681, eB_682, eB_683, eB_684,
  eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_705, eB_706, eB_707, eB_708, eB_709, eB_710, eB_711, eB_712,
  eB_713, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739, eB_740, eB_741, eB_742, eB_743,
  eB_744, eB_747, eB_749, eB_750, eB_751, eB_752, eB_753, eB_757, eB_758, eB_759, eB_760, eB_780, eB_781, eB_784, eB_785, eB_788,
  eB_789, eB_790, eB_791, eB_794, eB_795, eB_796, eB_797, eB_808, eB_809, eB_810, eB_811, eB_812, eB_813, eB_816, eB_817, eB_818,
  eB_819, eB_820, eB_821, eB_826, eB_827, eB_828, eB_829, eB_830, eB_832, eB_833, eB_840, eB_841, eB_842, eB_844, eB_845, eB_852,
  eB_853, eB_858, eB_859, eB_860, eB_861, eB_862, eB_863, eB_866, eB_867, eB_868, eB_869, eB_872, eB_873, eB_880, eB_881, eB_882,
  eB_883, eB_886, eB_887, eB_897, eB_899, eB_900, eB_902, eB_903, eB_906, eB_907, eB_909, eB_910, eB_913, eB_914, eB_918, eB_919,
  eB_920, eB_921, eB_923, eB_924, eB_926, eB_929, eB_930, eB_931, eB_932, eB_935, eB_936, eB_938, eB_939, eB_940, eB_941, eB_944,
  eB_947, eB_950, eB_952, eB_954, eB_956, eB_957, eB_958, eB_959, eB_961, eB_962, eB_963, eB_965, eB_967, eB_968, eB_969, eB_971,
  eB_973, eB_976, eB_977, eB_978, eB_990, eB_991, eB_993, eB_994, eB_995, eB_997, eB_998, eB_999, eB_1002, eB_1004, eB_1006, eB_1009,
  eB_1010, eB_1011, eB_1013, eB_1015, eB_1019, eB_1021, eB_1022, eB_1023]
theorem nbOKB_555 : nbB_555 = nbhd entsB eB_555 := by decide +kernel
theorem mkOKB_555 : mkEnt 32 1024 W rB_555 555 = eB_555 := by decide +kernel
theorem tB_555 : kTermA 4294967295 eB_555 nbB_555 = 119469352047714530111008450 := by decide +kernel


end RamseyCert
