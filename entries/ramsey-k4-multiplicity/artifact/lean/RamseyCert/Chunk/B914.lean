import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_914 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_13, eB_15, eB_17, eB_19, eB_22, eB_24, eB_26, eB_27, eB_29, eB_31, eB_34,
  eB_37, eB_40, eB_42, eB_44, eB_46, eB_48, eB_49, eB_50, eB_51, eB_58, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65,
  eB_66, eB_67, eB_72, eB_73, eB_74, eB_75, eB_83, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_97,
  eB_101, eB_102, eB_103, eB_106, eB_108, eB_110, eB_113, eB_115, eB_117, eB_119, eB_121, eB_123, eB_125, eB_128, eB_131, eB_136,
  eB_137, eB_138, eB_139, eB_141, eB_142, eB_144, eB_145, eB_147, eB_148, eB_150, eB_152, eB_154, eB_156, eB_158, eB_160, eB_161,
  eB_162, eB_163, eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187, eB_194, eB_196,
  eB_197, eB_198, eB_199, eB_200, eB_201, eB_202, eB_203, eB_208, eB_212, eB_213, eB_216, eB_219, eB_222, eB_225, eB_228, eB_230,
  eB_232, eB_233, eB_235, eB_237, eB_240, eB_242, eB_244, eB_248, eB_252, eB_253, eB_256, eB_259, eB_264, eB_265, eB_266, eB_267,
  eB_272, eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299,
  eB_300, eB_301, eB_302, eB_303, eB_304, eB_306, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_328, eB_329,
  eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_340, eB_341, eB_342, eB_343, eB_344, eB_353, eB_354, eB_355, eB_356, eB_357,
  eB_358, eB_359, eB_360, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_385, eB_386, eB_387, eB_389, eB_392,
  eB_395, eB_397, eB_400, eB_402, eB_405, eB_407, eB_409, eB_411, eB_413, eB_415, eB_417, eB_419, eB_421, eB_423, eB_425, eB_431,
  eB_432, eB_433, eB_434, eB_436, eB_439, eB_442, eB_445, eB_447, eB_450, eB_452, eB_454, eB_457, eB_460, eB_466, eB_467, eB_468,
  eB_469, eB_470, eB_471, eB_472, eB_473, eB_477, eB_482, eB_483, eB_484, eB_485, eB_488, eB_489, eB_490, eB_491, eB_492, eB_500,
  eB_501, eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_508, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521, eB_522, eB_523,
  eB_524, eB_532, eB_533, eB_534, eB_535, eB_537, eB_538, eB_539, eB_540, eB_549, eB_550, eB_551, eB_552, eB_553, eB_554, eB_555,
  eB_556, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_581, eB_582, eB_583, eB_584, eB_589, eB_590, eB_591,
  eB_592, eB_593, eB_594, eB_595, eB_596, eB_605, eB_606, eB_607, eB_608, eB_609, eB_611, eB_612, eB_614, eB_615, eB_617, eB_618,
  eB_620, eB_621, eB_623, eB_626, eB_628, eB_633, eB_634, eB_635, eB_636, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646, eB_647,
  eB_648, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_677, eB_678, eB_679,
  eB_680, eB_682, eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_709, eB_710,
  eB_711, eB_712, eB_714, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_732, eB_737, eB_738, eB_739, eB_740,
  eB_741, eB_742, eB_743, eB_744, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_772, eB_773, eB_774, eB_775,
  eB_776, eB_777, eB_780, eB_781, eB_782, eB_783, eB_786, eB_787, eB_792, eB_793, eB_794, eB_795, eB_796, eB_797, eB_798, eB_799,
  eB_806, eB_807, eB_808, eB_809, eB_816, eB_817, eB_822, eB_823, eB_828, eB_829, eB_832, eB_833, eB_838, eB_839, eB_842, eB_843,
  eB_846, eB_847, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_856, eB_857, eB_858, eB_859, eB_866, eB_867, eB_878, eB_879,
  eB_880, eB_881, eB_891, eB_896, eB_902, eB_903, eB_905, eB_906, eB_907, eB_908, eB_909, eB_910, eB_913, eB_914, eB_915, eB_917,
  eB_920, eB_921, eB_922, eB_925, eB_929, eB_931, eB_933, eB_934, eB_935, eB_938, eB_940, eB_941, eB_942, eB_944, eB_946, eB_947,
  eB_949, eB_950, eB_954, eB_959, eB_960, eB_961, eB_962, eB_963, eB_964, eB_966, eB_967, eB_971, eB_972, eB_973, eB_974, eB_975,
  eB_979, eB_981, eB_983, eB_989, eB_990, eB_994, eB_996, eB_998, eB_999, eB_1001, eB_1003, eB_1005, eB_1007, eB_1009, eB_1010, eB_1011,
  eB_1013, eB_1015, eB_1018, eB_1019, eB_1020, eB_1023]
theorem nbOKB_914 : nbB_914 = nbhd entsB eB_914 := by decide +kernel
theorem mkOKB_914 : mkEnt 32 1024 W rB_914 914 = eB_914 := by decide +kernel
theorem tB_914 : kTermA 4294967295 eB_914 nbB_914 = 75500063820962852449644440 := by decide +kernel


end RamseyCert
