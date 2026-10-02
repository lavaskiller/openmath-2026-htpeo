import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_23 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_13, eB_14, eB_15, eB_16,
  eB_21, eB_23, eB_25, eB_27, eB_28, eB_29, eB_42, eB_43, eB_44, eB_72, eB_73, eB_74, eB_75, eB_76, eB_77, eB_78,
  eB_79, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_97, eB_98, eB_99, eB_103, eB_104, eB_105, eB_107,
  eB_109, eB_110, eB_111, eB_112, eB_113, eB_114, eB_117, eB_118, eB_119, eB_120, eB_121, eB_123, eB_124, eB_125, eB_126, eB_127,
  eB_128, eB_129, eB_130, eB_131, eB_132, eB_133, eB_139, eB_140, eB_141, eB_142, eB_143, eB_144, eB_145, eB_146, eB_147, eB_148,
  eB_149, eB_150, eB_154, eB_155, eB_156, eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_200, eB_201, eB_202,
  eB_203, eB_204, eB_205, eB_206, eB_207, eB_208, eB_209, eB_210, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221, eB_222,
  eB_223, eB_224, eB_225, eB_226, eB_227, eB_228, eB_229, eB_231, eB_233, eB_235, eB_236, eB_237, eB_238, eB_239, eB_240, eB_241,
  eB_248, eB_249, eB_250, eB_252, eB_253, eB_256, eB_257, eB_258, eB_268, eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275,
  eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291,
  eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307,
  eB_308, eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348,
  eB_381, eB_387, eB_389, eB_391, eB_392, eB_393, eB_394, eB_395, eB_396, eB_397, eB_398, eB_399, eB_400, eB_401, eB_405, eB_406,
  eB_407, eB_411, eB_412, eB_413, eB_417, eB_418, eB_419, eB_423, eB_425, eB_427, eB_428, eB_429, eB_430, eB_431, eB_432, eB_433,
  eB_434, eB_441, eB_442, eB_443, eB_444, eB_445, eB_446, eB_450, eB_451, eB_452, eB_456, eB_457, eB_458, eB_459, eB_460, eB_461,
  eB_486, eB_487, eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501,
  eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_536, eB_537, eB_538, eB_539, eB_540, eB_541,
  eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_549, eB_550, eB_551, eB_552, eB_553, eB_554, eB_555, eB_556, eB_557,
  eB_558, eB_559, eB_560, eB_609, eB_610, eB_611, eB_612, eB_613, eB_614, eB_615, eB_616, eB_617, eB_618, eB_619, eB_620, eB_621,
  eB_622, eB_624, eB_625, eB_626, eB_627, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639,
  eB_640, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652, eB_653, eB_654, eB_655,
  eB_656, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_693, eB_694, eB_695,
  eB_696, eB_697, eB_698, eB_699, eB_700, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_717, eB_718, eB_719,
  eB_720, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731, eB_732, eB_767, eB_772, eB_773,
  eB_774, eB_775, eB_776, eB_777, eB_778, eB_779, eB_780, eB_781, eB_784, eB_785, eB_790, eB_791, eB_798, eB_799, eB_802, eB_803,
  eB_808, eB_809, eB_810, eB_811, eB_816, eB_817, eB_820, eB_821, eB_822, eB_823, eB_824, eB_825, eB_830, eB_831, eB_832, eB_833,
  eB_834, eB_835, eB_836, eB_837, eB_838, eB_839, eB_846, eB_847, eB_848, eB_849, eB_854, eB_855, eB_858, eB_859, eB_860, eB_861,
  eB_862, eB_863, eB_864, eB_865, eB_866, eB_867, eB_868, eB_869, eB_870, eB_872, eB_873, eB_878, eB_879, eB_888, eB_889, eB_890,
  eB_891, eB_898, eB_899, eB_901, eB_902, eB_903, eB_907, eB_909, eB_911, eB_912, eB_915, eB_916, eB_919, eB_920, eB_922, eB_923,
  eB_925, eB_926, eB_927, eB_929, eB_931, eB_932, eB_933, eB_937, eB_939, eB_941, eB_945, eB_949, eB_950, eB_951, eB_952, eB_955,
  eB_956, eB_957, eB_959, eB_963, eB_966, eB_973, eB_975, eB_977, eB_978, eB_979, eB_980, eB_981, eB_982, eB_986, eB_988, eB_989,
  eB_999, eB_1000, eB_1002, eB_1003, eB_1004, eB_1008, eB_1010, eB_1011, eB_1012, eB_1013, eB_1014, eB_1015, eB_1018, eB_1020, eB_1021]
theorem nbOKB_23 : nbB_23 = nbhd entsB eB_23 := by decide +kernel
theorem mkOKB_23 : mkEnt 32 1024 W rB_23 23 = eB_23 := by decide +kernel
theorem tB_23 : kTermA 4294967295 eB_23 nbB_23 = 82761811038146457735004878 := by decide +kernel


end RamseyCert
