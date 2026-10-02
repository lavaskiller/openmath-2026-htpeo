import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_322 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_8, eB_9, eB_10, eB_11, eB_13, eB_17, eB_19, eB_20, eB_22, eB_24, eB_26, eB_28,
  eB_29, eB_30, eB_34, eB_35, eB_37, eB_38, eB_40, eB_41, eB_43, eB_44, eB_45, eB_48, eB_49, eB_50, eB_51, eB_56,
  eB_57, eB_58, eB_59, eB_65, eB_68, eB_69, eB_70, eB_71, eB_73, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82,
  eB_83, eB_88, eB_89, eB_90, eB_91, eB_97, eB_98, eB_102, eB_105, eB_108, eB_109, eB_110, eB_112, eB_113, eB_117, eB_118,
  eB_119, eB_123, eB_126, eB_129, eB_132, eB_139, eB_142, eB_145, eB_149, eB_150, eB_151, eB_155, eB_156, eB_157, eB_160, eB_161,
  eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_176, eB_180, eB_181, eB_182, eB_183, eB_185, eB_188, eB_189, eB_190, eB_191,
  eB_192, eB_193, eB_194, eB_195, eB_200, eB_201, eB_202, eB_203, eB_208, eB_209, eB_213, eB_217, eB_220, eB_223, eB_226, eB_227,
  eB_228, eB_232, eB_235, eB_236, eB_237, eB_239, eB_240, eB_244, eB_250, eB_251, eB_254, eB_258, eB_260, eB_261, eB_262, eB_263,
  eB_272, eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294, eB_295,
  eB_304, eB_305, eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327,
  eB_332, eB_333, eB_334, eB_335, eB_341, eB_342, eB_343, eB_344, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360,
  eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_388, eB_390, eB_391, eB_394, eB_398, eB_399, eB_402, eB_403,
  eB_405, eB_406, eB_410, eB_411, eB_412, eB_416, eB_417, eB_418, eB_422, eB_424, eB_426, eB_431, eB_432, eB_433, eB_434, eB_435,
  eB_436, eB_438, eB_439, eB_441, eB_444, eB_447, eB_448, eB_450, eB_451, eB_455, eB_456, eB_458, eB_459, eB_462, eB_463, eB_464,
  eB_465, eB_467, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_488, eB_489, eB_490, eB_491,
  eB_493, eB_494, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521,
  eB_522, eB_523, eB_527, eB_528, eB_529, eB_530, eB_531, eB_533, eB_536, eB_537, eB_538, eB_539, eB_540, eB_545, eB_546, eB_547,
  eB_548, eB_555, eB_556, eB_557, eB_558, eB_559, eB_560, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576, eB_577,
  eB_578, eB_579, eB_580, eB_585, eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_605, eB_606, eB_607, eB_608, eB_611,
  eB_614, eB_617, eB_620, eB_621, eB_623, eB_626, eB_628, eB_629, eB_630, eB_631, eB_632, eB_641, eB_642, eB_643, eB_644, eB_649,
  eB_650, eB_651, eB_652, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_669, eB_670, eB_671, eB_672, eB_675,
  eB_681, eB_682, eB_683, eB_684, eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704,
  eB_709, eB_710, eB_711, eB_712, eB_713, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739,
  eB_740, eB_741, eB_742, eB_743, eB_744, eB_747, eB_749, eB_750, eB_751, eB_752, eB_756, eB_761, eB_762, eB_763, eB_764, eB_768,
  eB_769, eB_770, eB_771, eB_772, eB_773, eB_774, eB_775, eB_780, eB_781, eB_786, eB_787, eB_792, eB_793, eB_794, eB_795, eB_796,
  eB_797, eB_804, eB_805, eB_810, eB_811, eB_812, eB_813, eB_816, eB_817, eB_838, eB_839, eB_846, eB_847, eB_848, eB_849, eB_854,
  eB_855, eB_856, eB_857, eB_858, eB_859, eB_860, eB_861, eB_862, eB_863, eB_868, eB_869, eB_872, eB_873, eB_874, eB_875, eB_876,
  eB_877, eB_880, eB_881, eB_882, eB_883, eB_886, eB_887, eB_888, eB_889, eB_891, eB_894, eB_895, eB_896, eB_897, eB_902, eB_905,
  eB_910, eB_912, eB_916, eB_919, eB_922, eB_924, eB_925, eB_927, eB_928, eB_930, eB_931, eB_933, eB_937, eB_938, eB_942, eB_943,
  eB_944, eB_945, eB_946, eB_947, eB_949, eB_951, eB_953, eB_955, eB_956, eB_958, eB_959, eB_960, eB_961, eB_963, eB_965, eB_966,
  eB_968, eB_969, eB_972, eB_978, eB_979, eB_987, eB_989, eB_991, eB_993, eB_994, eB_996, eB_999, eB_1000, eB_1004, eB_1005, eB_1006,
  eB_1008, eB_1009, eB_1011, eB_1012, eB_1015, eB_1016, eB_1017, eB_1019, eB_1020, eB_1021]
theorem nbOKB_322 : nbB_322 = nbhd entsB eB_322 := by decide +kernel
theorem mkOKB_322 : mkEnt 32 1024 W rB_322 322 = eB_322 := by decide +kernel
theorem tB_322 : kTermA 4294967295 eB_322 nbB_322 = 115878635612281283964495747 := by decide +kernel


end RamseyCert
