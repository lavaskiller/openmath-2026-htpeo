import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_93 : List Ent := [
  eR_4, eR_6, eR_7, eR_12, eR_13, eR_14, eR_15, eR_27, eR_28, eR_29, eR_30, eR_31, eR_32, eR_42, eR_43, eR_44,
  eR_45, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_72,
  eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83, eR_88, eR_89, eR_90, eR_91, eR_136, eR_137, eR_138, eR_139, eR_140,
  eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_148, eR_149, eR_150, eR_151, eR_152, eR_153, eR_154, eR_155, eR_156,
  eR_157, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_188,
  eR_189, eR_190, eR_191, eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_208, eR_209, eR_210, eR_211, eR_212, eR_213,
  eR_214, eR_215, eR_216, eR_217, eR_218, eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229,
  eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238, eR_239, eR_240, eR_241, eR_242, eR_243, eR_244, eR_245,
  eR_246, eR_247, eR_253, eR_254, eR_256, eR_257, eR_258, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275, eR_280,
  eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307, eR_312,
  eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_341,
  eR_342, eR_344, eR_349, eR_350, eR_351, eR_358, eR_359, eR_360, eR_365, eR_366, eR_368, eR_374, eR_375, eR_376, eR_381, eR_382,
  eR_383, eR_384, eR_402, eR_403, eR_404, eR_405, eR_406, eR_407, eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415,
  eR_416, eR_417, eR_418, eR_419, eR_420, eR_421, eR_422, eR_423, eR_424, eR_425, eR_426, eR_431, eR_432, eR_433, eR_434, eR_435,
  eR_436, eR_437, eR_438, eR_439, eR_440, eR_441, eR_442, eR_443, eR_444, eR_445, eR_446, eR_447, eR_448, eR_449, eR_450, eR_451,
  eR_452, eR_453, eR_454, eR_455, eR_456, eR_457, eR_458, eR_459, eR_460, eR_461, eR_466, eR_467, eR_468, eR_469, eR_474, eR_475,
  eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502, eR_503,
  eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535,
  eR_536, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_561, eR_562, eR_563,
  eR_564, eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595,
  eR_596, eR_601, eR_602, eR_603, eR_604, eR_629, eR_630, eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_652,
  eR_658, eR_659, eR_660, eR_665, eR_666, eR_667, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686,
  eR_687, eR_688, eR_697, eR_699, eR_700, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720,
  eR_725, eR_726, eR_727, eR_728, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752,
  eR_761, eR_762, eR_763, eR_768, eR_769, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_782, eR_783, eR_786,
  eR_787, eR_788, eR_792, eR_793, eR_796, eR_797, eR_812, eR_813, eR_816, eR_817, eR_818, eR_819, eR_820, eR_821, eR_826, eR_827,
  eR_828, eR_829, eR_830, eR_831, eR_832, eR_833, eR_834, eR_835, eR_844, eR_845, eR_846, eR_847, eR_848, eR_849, eR_854, eR_855,
  eR_858, eR_859, eR_860, eR_861, eR_866, eR_867, eR_870, eR_871, eR_872, eR_873, eR_876, eR_877, eR_878, eR_879, eR_888, eR_889,
  eR_895, eR_897, eR_898, eR_900, eR_903, eR_904, eR_909, eR_910, eR_912, eR_913, eR_914, eR_915, eR_918, eR_921, eR_922, eR_924,
  eR_926, eR_928, eR_929, eR_930, eR_934, eR_935, eR_936, eR_940, eR_947, eR_948, eR_949, eR_950, eR_951, eR_953, eR_955, eR_957,
  eR_959, eR_963, eR_964, eR_965, eR_967, eR_969, eR_970, eR_971, eR_974, eR_976, eR_978, eR_979, eR_980, eR_981, eR_982, eR_983,
  eR_986, eR_987, eR_988, eR_989, eR_992, eR_996, eR_997, eR_998, eR_1000, eR_1004, eR_1006, eR_1008, eR_1009, eR_1013, eR_1015, eR_1017,
  eR_1018, eR_1019, eR_1020, eR_1021]
theorem nbOKR_93 : nbR_93 = nbhd entsR eR_93 := by decide +kernel
theorem mkOKR_93 : mkEnt 32 1024 W rR_93 93 = eR_93 := by decide +kernel
theorem tR_93 : kTermA 4294967295 eR_93 nbR_93 = 120824281995668923492025646 := by decide +kernel


end RamseyCert
