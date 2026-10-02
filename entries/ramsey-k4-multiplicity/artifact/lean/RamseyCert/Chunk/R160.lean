import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_160 : List Ent := [
  eR_8, eR_9, eR_11, eR_12, eR_15, eR_16, eR_17, eR_18, eR_19, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27,
  eR_28, eR_30, eR_31, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_42, eR_43, eR_45, eR_46, eR_49, eR_50, eR_60,
  eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_88,
  eR_89, eR_90, eR_91, eR_96, eR_97, eR_99, eR_100, eR_102, eR_104, eR_107, eR_108, eR_110, eR_111, eR_113, eR_114, eR_116,
  eR_117, eR_119, eR_120, eR_122, eR_123, eR_124, eR_127, eR_130, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_141, eR_144,
  eR_147, eR_148, eR_149, eR_151, eR_152, eR_154, eR_155, eR_157, eR_158, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170,
  eR_171, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186, eR_187, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205, eR_206,
  eR_207, eR_209, eR_212, eR_216, eR_217, eR_219, eR_220, eR_222, eR_223, eR_225, eR_226, eR_227, eR_230, eR_233, eR_236, eR_239,
  eR_242, eR_249, eR_253, eR_254, eR_255, eR_256, eR_258, eR_260, eR_261, eR_262, eR_263, eR_272, eR_274, eR_275, eR_281, eR_282,
  eR_283, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303, eR_313, eR_314, eR_315,
  eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_336, eR_338, eR_339, eR_341, eR_342, eR_343, eR_344, eR_349,
  eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_378, eR_379, eR_380, eR_393, eR_396,
  eR_401, eR_403, eR_406, eR_407, eR_409, eR_410, eR_412, eR_413, eR_415, eR_416, eR_418, eR_419, eR_421, eR_422, eR_423, eR_424,
  eR_425, eR_426, eR_431, eR_432, eR_433, eR_434, eR_435, eR_438, eR_441, eR_442, eR_444, eR_445, eR_448, eR_451, eR_452, eR_454,
  eR_455, eR_456, eR_457, eR_458, eR_459, eR_460, eR_462, eR_463, eR_464, eR_465, eR_470, eR_471, eR_472, eR_473, eR_482, eR_483,
  eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507,
  eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_536, eR_537, eR_539, eR_540,
  eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_573, eR_574, eR_575, eR_576,
  eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_596, eR_603, eR_604, eR_610, eR_611, eR_613,
  eR_614, eR_616, eR_617, eR_619, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_633, eR_634, eR_635,
  eR_636, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_657, eR_658, eR_659, eR_660, eR_665, eR_666, eR_667, eR_668,
  eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687, eR_688, eR_697, eR_698, eR_699, eR_700,
  eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_729, eR_730, eR_731, eR_732,
  eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_760, eR_765,
  eR_766, eR_767, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_786, eR_787, eR_788, eR_789, eR_794, eR_795, eR_796, eR_797,
  eR_798, eR_799, eR_800, eR_801, eR_804, eR_808, eR_809, eR_816, eR_817, eR_818, eR_819, eR_828, eR_829, eR_830, eR_831, eR_832,
  eR_833, eR_836, eR_837, eR_838, eR_839, eR_842, eR_843, eR_844, eR_845, eR_846, eR_850, eR_851, eR_853, eR_854, eR_855, eR_858,
  eR_859, eR_860, eR_861, eR_864, eR_865, eR_872, eR_873, eR_874, eR_875, eR_878, eR_879, eR_880, eR_881, eR_882, eR_883, eR_884,
  eR_885, eR_886, eR_887, eR_888, eR_889, eR_900, eR_901, eR_904, eR_908, eR_909, eR_910, eR_913, eR_915, eR_916, eR_917, eR_919,
  eR_920, eR_925, eR_926, eR_927, eR_928, eR_930, eR_931, eR_932, eR_939, eR_941, eR_943, eR_945, eR_946, eR_947, eR_948, eR_949,
  eR_951, eR_953, eR_954, eR_955, eR_956, eR_957, eR_958, eR_959, eR_960, eR_962, eR_963, eR_970, eR_971, eR_973, eR_974, eR_977,
  eR_979, eR_981, eR_982, eR_985, eR_987, eR_988, eR_990, eR_991, eR_992, eR_993, eR_996, eR_997, eR_1007, eR_1010, eR_1012, eR_1013,
  eR_1014, eR_1021, eR_1022, eR_1023]
theorem nbOKR_160 : nbR_160 = nbhd entsR eR_160 := by decide +kernel
theorem mkOKR_160 : mkEnt 32 1024 W rR_160 160 = eR_160 := by decide +kernel
theorem tR_160 : kTermA 4294967295 eR_160 nbR_160 = 123491132617883764713564726 := by decide +kernel


end RamseyCert
