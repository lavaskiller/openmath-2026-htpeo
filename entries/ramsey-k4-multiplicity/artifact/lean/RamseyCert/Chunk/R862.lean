import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_862 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_15, eR_20, eR_22, eR_24, eR_26, eR_29, eR_30, eR_31,
  eR_35, eR_41, eR_44, eR_45, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_80, eR_81, eR_82, eR_83,
  eR_84, eR_85, eR_86, eR_87, eR_96, eR_97, eR_99, eR_101, eR_103, eR_105, eR_106, eR_110, eR_111, eR_113, eR_114, eR_115,
  eR_119, eR_120, eR_121, eR_125, eR_126, eR_128, eR_129, eR_131, eR_132, eR_133, eR_134, eR_135, eR_141, eR_144, eR_150, eR_151,
  eR_152, eR_156, eR_158, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_180,
  eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_200, eR_201, eR_202, eR_203, eR_204,
  eR_205, eR_206, eR_207, eR_209, eR_211, eR_213, eR_215, eR_218, eR_221, eR_224, eR_227, eR_231, eR_232, eR_234, eR_235, eR_236,
  eR_243, eR_244, eR_249, eR_252, eR_254, eR_256, eR_258, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268,
  eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_292,
  eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_332,
  eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_357,
  eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_381,
  eR_382, eR_383, eR_384, eR_387, eR_389, eR_393, eR_396, eR_397, eR_401, eR_403, eR_407, eR_412, eR_413, eR_414, eR_418, eR_420,
  eR_424, eR_426, eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_435, eR_438, eR_441, eR_442, eR_444, eR_445,
  eR_451, eR_452, eR_453, eR_458, eR_459, eR_460, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471,
  eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513,
  eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_537, eR_538,
  eR_539, eR_540, eR_541, eR_542, eR_543, eR_544, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_577, eR_578,
  eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602,
  eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_609, eR_612, eR_618, eR_622, eR_625, eR_627, eR_629, eR_630, eR_631, eR_632,
  eR_633, eR_634, eR_635, eR_636, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_661, eR_662, eR_663, eR_664,
  eR_665, eR_666, eR_667, eR_668, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_701, eR_702, eR_703, eR_704,
  eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720,
  eR_721, eR_722, eR_723, eR_724, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760,
  eR_761, eR_762, eR_763, eR_764, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785,
  eR_786, eR_787, eR_790, eR_791, eR_794, eR_795, eR_798, eR_799, eR_806, eR_807, eR_810, eR_811, eR_812, eR_813, eR_814, eR_815,
  eR_818, eR_819, eR_822, eR_823, eR_824, eR_825, eR_836, eR_837, eR_840, eR_841, eR_842, eR_843, eR_844, eR_845, eR_846, eR_847,
  eR_852, eR_853, eR_858, eR_859, eR_860, eR_864, eR_865, eR_866, eR_867, eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_890,
  eR_891, eR_894, eR_895, eR_897, eR_898, eR_900, eR_901, eR_903, eR_905, eR_907, eR_908, eR_909, eR_914, eR_916, eR_917, eR_920,
  eR_923, eR_924, eR_926, eR_930, eR_931, eR_933, eR_934, eR_935, eR_939, eR_941, eR_942, eR_944, eR_947, eR_948, eR_952, eR_954,
  eR_955, eR_957, eR_959, eR_960, eR_961, eR_962, eR_966, eR_970, eR_972, eR_973, eR_975, eR_978, eR_979, eR_980, eR_981, eR_984,
  eR_985, eR_987, eR_988, eR_991, eR_995, eR_996, eR_997, eR_1000, eR_1004, eR_1005, eR_1006, eR_1008, eR_1009, eR_1011, eR_1012, eR_1013,
  eR_1016, eR_1017, eR_1019]
theorem nbOKR_862 : nbR_862 = nbhd entsR eR_862 := by decide +kernel
theorem mkOKR_862 : mkEnt 32 1024 W rR_862 862 = eR_862 := by decide +kernel
theorem tR_862 : kTermA 4294967295 eR_862 nbR_862 = 89412445643250427013889036 := by decide +kernel


end RamseyCert
