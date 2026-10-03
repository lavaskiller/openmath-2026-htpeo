import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_702 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_13, eR_14, eR_15, eR_16, eR_21, eR_23, eR_25, eR_27,
  eR_28, eR_29, eR_42, eR_43, eR_44, eR_52, eR_53, eR_54, eR_55, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70,
  eR_71, eR_72, eR_73, eR_75, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_97, eR_98, eR_99, eR_103, eR_104,
  eR_105, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_118, eR_119, eR_120, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129,
  eR_130, eR_131, eR_132, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_148, eR_149, eR_150, eR_154,
  eR_155, eR_156, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185,
  eR_186, eR_187, eR_196, eR_197, eR_198, eR_199, eR_201, eR_202, eR_203, eR_208, eR_209, eR_210, eR_215, eR_216, eR_217, eR_218,
  eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229, eR_236, eR_237, eR_238, eR_239, eR_240,
  eR_241, eR_248, eR_249, eR_250, eR_252, eR_253, eR_256, eR_257, eR_258, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274,
  eR_275, eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306,
  eR_307, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334,
  eR_335, eR_345, eR_348, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_373,
  eR_374, eR_375, eR_376, eR_387, eR_389, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_397, eR_399, eR_400, eR_401, eR_405,
  eR_406, eR_407, eR_411, eR_412, eR_413, eR_417, eR_418, eR_419, eR_423, eR_425, eR_431, eR_432, eR_434, eR_441, eR_442, eR_443,
  eR_444, eR_445, eR_446, eR_450, eR_451, eR_452, eR_456, eR_457, eR_459, eR_460, eR_461, eR_462, eR_463, eR_464, eR_465, eR_470,
  eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_492, eR_493, eR_494, eR_500, eR_501, eR_502, eR_508,
  eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_536,
  eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568,
  eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600,
  eR_605, eR_606, eR_607, eR_608, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620,
  eR_622, eR_624, eR_625, eR_627, eR_629, eR_630, eR_631, eR_632, eR_641, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_653,
  eR_654, eR_655, eR_656, eR_661, eR_662, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685,
  eR_686, eR_687, eR_688, eR_693, eR_694, eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_716, eR_721, eR_722,
  eR_723, eR_724, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751,
  eR_752, eR_761, eR_762, eR_763, eR_764, eR_770, eR_771, eR_778, eR_779, eR_781, eR_782, eR_783, eR_784, eR_785, eR_786, eR_787,
  eR_788, eR_789, eR_796, eR_797, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813, eR_814, eR_815, eR_816, eR_817, eR_820, eR_821,
  eR_822, eR_823, eR_830, eR_831, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_846, eR_847, eR_848, eR_849,
  eR_850, eR_851, eR_856, eR_857, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_872, eR_873,
  eR_874, eR_875, eR_878, eR_879, eR_888, eR_889, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895, eR_897, eR_899, eR_900, eR_904,
  eR_907, eR_908, eR_909, eR_915, eR_916, eR_917, eR_922, eR_923, eR_926, eR_929, eR_931, eR_932, eR_937, eR_939, eR_942, eR_943,
  eR_944, eR_949, eR_950, eR_951, eR_955, eR_956, eR_958, eR_962, eR_963, eR_964, eR_965, eR_966, eR_967, eR_970, eR_975, eR_977,
  eR_979, eR_980, eR_981, eR_983, eR_984, eR_989, eR_990, eR_991, eR_992, eR_993, eR_995, eR_997, eR_999, eR_1000, eR_1003, eR_1005,
  eR_1008, eR_1013, eR_1014, eR_1015, eR_1018, eR_1020, eR_1021, eR_1023]
theorem nbOKR_702 : nbR_702 = nbhd entsR eR_702 := by decide +kernel
theorem mkOKR_702 : mkEnt 32 1024 W rR_702 702 = eR_702 := by decide +kernel
theorem tR_702 : kTermA 4294967295 eR_702 nbR_702 = 118195828419221517178713630 := by decide +kernel


end RamseyCert
