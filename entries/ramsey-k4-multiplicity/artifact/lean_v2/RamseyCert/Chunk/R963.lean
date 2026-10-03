import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_963 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_15, eR_17, eR_18, eR_20, eR_22, eR_24,
  eR_26, eR_28, eR_30, eR_32, eR_33, eR_35, eR_36, eR_38, eR_39, eR_41, eR_43, eR_45, eR_47, eR_52, eR_53, eR_54,
  eR_55, eR_56, eR_57, eR_58, eR_59, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_84, eR_85, eR_86,
  eR_87, eR_92, eR_93, eR_94, eR_95, eR_96, eR_97, eR_101, eR_102, eR_104, eR_105, eR_106, eR_108, eR_110, eR_113, eR_115,
  eR_117, eR_119, eR_121, eR_123, eR_124, eR_126, eR_127, eR_129, eR_130, eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138,
  eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_149, eR_151, eR_153, eR_155, eR_157, eR_159, eR_160, eR_161, eR_162, eR_163,
  eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195,
  eR_200, eR_201, eR_202, eR_203, eR_209, eR_210, eR_211, eR_216, eR_219, eR_222, eR_225, eR_227, eR_229, eR_231, eR_234, eR_236,
  eR_238, eR_239, eR_241, eR_243, eR_248, eR_251, eR_253, eR_257, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269,
  eR_270, eR_271, eR_280, eR_281, eR_282, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_300, eR_301, eR_302, eR_303,
  eR_312, eR_313, eR_314, eR_316, eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_332, eR_333, eR_334, eR_335, eR_340, eR_345,
  eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375,
  eR_376, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_388, eR_390, eR_392, eR_395, eR_398, eR_400, eR_403, eR_404, eR_405,
  eR_407, eR_409, eR_411, eR_413, eR_415, eR_417, eR_419, eR_421, eR_423, eR_425, eR_431, eR_432, eR_433, eR_434, eR_435, eR_437,
  eR_438, eR_440, eR_441, eR_443, eR_444, eR_446, eR_448, eR_449, eR_450, eR_452, eR_454, eR_456, eR_457, eR_459, eR_461, eR_466,
  eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494,
  eR_495, eR_496, eR_497, eR_498, eR_499, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_524, eR_525, eR_526,
  eR_527, eR_528, eR_529, eR_530, eR_531, eR_536, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_557, eR_558, eR_559,
  eR_560, eR_562, eR_563, eR_564, eR_573, eR_574, eR_575, eR_576, eR_577, eR_578, eR_579, eR_589, eR_590, eR_591, eR_592, eR_594,
  eR_595, eR_596, eR_605, eR_606, eR_607, eR_608, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_622, eR_624,
  eR_625, eR_627, eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_653, eR_655,
  eR_656, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687,
  eR_688, eR_697, eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722, eR_725, eR_726,
  eR_727, eR_728, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762,
  eR_763, eR_764, eR_770, eR_771, eR_776, eR_777, eR_778, eR_779, eR_781, eR_782, eR_783, eR_784, eR_785, eR_786, eR_787, eR_788,
  eR_789, eR_790, eR_791, eR_796, eR_797, eR_802, eR_803, eR_806, eR_807, eR_810, eR_811, eR_814, eR_815, eR_826, eR_827, eR_828,
  eR_829, eR_830, eR_831, eR_834, eR_835, eR_838, eR_839, eR_842, eR_843, eR_848, eR_849, eR_854, eR_855, eR_858, eR_859, eR_860,
  eR_861, eR_866, eR_867, eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_878, eR_879, eR_880, eR_881, eR_882, eR_883, eR_886,
  eR_887, eR_888, eR_889, eR_894, eR_895, eR_898, eR_903, eR_905, eR_906, eR_907, eR_908, eR_909, eR_910, eR_911, eR_912, eR_913,
  eR_915, eR_917, eR_920, eR_922, eR_923, eR_927, eR_928, eR_931, eR_934, eR_936, eR_937, eR_938, eR_939, eR_942, eR_945, eR_948,
  eR_949, eR_951, eR_952, eR_954, eR_957, eR_958, eR_959, eR_960, eR_965, eR_967, eR_968, eR_969, eR_970, eR_973, eR_976, eR_978,
  eR_982, eR_984, eR_985, eR_987, eR_989, eR_990, eR_993, eR_994, eR_996, eR_998, eR_1003, eR_1004, eR_1005, eR_1011, eR_1013, eR_1014,
  eR_1016, eR_1017, eR_1018, eR_1022, eR_1023]
theorem nbOKR_963 : nbR_963 = nbhd entsR eR_963 := by decide +kernel
theorem mkOKR_963 : mkEnt 32 1024 W rR_963 963 = eR_963 := by decide +kernel
theorem tR_963 : kTermA 4294967295 eR_963 nbR_963 = 82366485344210538126889758 := by decide +kernel


end RamseyCert
