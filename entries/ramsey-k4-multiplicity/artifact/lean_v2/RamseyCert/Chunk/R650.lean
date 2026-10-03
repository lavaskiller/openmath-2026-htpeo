import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_650 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_12, eR_15, eR_20, eR_27, eR_28, eR_30, eR_31, eR_35,
  eR_38, eR_41, eR_42, eR_43, eR_45, eR_46, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66,
  eR_67, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83, eR_93, eR_94, eR_95, eR_96, eR_97, eR_99, eR_100,
  eR_102, eR_104, eR_107, eR_108, eR_110, eR_111, eR_113, eR_114, eR_116, eR_117, eR_119, eR_120, eR_122, eR_123, eR_124, eR_127,
  eR_130, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_141, eR_144, eR_147, eR_148, eR_149, eR_151, eR_152, eR_154, eR_155,
  eR_157, eR_158, eR_164, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186,
  eR_187, eR_192, eR_193, eR_194, eR_195, eR_205, eR_206, eR_207, eR_208, eR_210, eR_211, eR_213, eR_214, eR_215, eR_218, eR_221,
  eR_224, eR_228, eR_229, eR_231, eR_232, eR_234, eR_235, eR_237, eR_238, eR_240, eR_241, eR_243, eR_244, eR_245, eR_246, eR_247,
  eR_248, eR_250, eR_251, eR_252, eR_253, eR_254, eR_256, eR_258, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274, eR_275,
  eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303,
  eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338, eR_339,
  eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372,
  eR_375, eR_376, eR_387, eR_388, eR_389, eR_390, eR_391, eR_392, eR_394, eR_395, eR_397, eR_398, eR_399, eR_400, eR_402, eR_404,
  eR_405, eR_408, eR_411, eR_414, eR_417, eR_420, eR_423, eR_424, eR_425, eR_426, eR_431, eR_432, eR_433, eR_434, eR_436, eR_437,
  eR_439, eR_440, eR_441, eR_442, eR_444, eR_445, eR_447, eR_449, eR_450, eR_453, eR_457, eR_458, eR_459, eR_460, eR_462, eR_463,
  eR_464, eR_470, eR_472, eR_473, eR_482, eR_483, eR_484, eR_485, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502, eR_503,
  eR_504, eR_505, eR_506, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_541, eR_542,
  eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570,
  eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606,
  eR_607, eR_608, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626,
  eR_627, eR_628, eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658,
  eR_659, eR_660, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_672, eR_677, eR_678, eR_680, eR_689, eR_690, eR_691, eR_692,
  eR_697, eR_698, eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724,
  eR_725, eR_726, eR_727, eR_728, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752,
  eR_757, eR_758, eR_759, eR_760, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_780, eR_781, eR_784, eR_785, eR_792, eR_793,
  eR_794, eR_795, eR_799, eR_800, eR_801, eR_808, eR_809, eR_818, eR_819, eR_826, eR_827, eR_830, eR_831, eR_832, eR_833, eR_834,
  eR_835, eR_838, eR_839, eR_840, eR_841, eR_846, eR_847, eR_848, eR_849, eR_852, eR_853, eR_854, eR_855, eR_856, eR_857, eR_864,
  eR_865, eR_868, eR_869, eR_872, eR_873, eR_880, eR_881, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_896, eR_898, eR_900,
  eR_903, eR_904, eR_905, eR_910, eR_911, eR_913, eR_914, eR_915, eR_918, eR_920, eR_921, eR_925, eR_926, eR_927, eR_928, eR_930,
  eR_931, eR_937, eR_938, eR_939, eR_941, eR_942, eR_943, eR_947, eR_948, eR_949, eR_950, eR_952, eR_954, eR_957, eR_958, eR_959,
  eR_961, eR_963, eR_965, eR_967, eR_968, eR_969, eR_971, eR_975, eR_977, eR_980, eR_981, eR_983, eR_984, eR_985, eR_986, eR_989,
  eR_990, eR_991, eR_995, eR_999, eR_1001, eR_1003, eR_1006, eR_1008, eR_1012, eR_1013, eR_1014, eR_1015, eR_1016, eR_1017, eR_1018, eR_1019]
theorem nbOKR_650 : nbR_650 = nbhd entsR eR_650 := by decide +kernel
theorem mkOKR_650 : mkEnt 32 1024 W rR_650 650 = eR_650 := by decide +kernel
theorem tR_650 : kTermA 4294967295 eR_650 nbR_650 = 121368800771833965742725612 := by decide +kernel


end RamseyCert
