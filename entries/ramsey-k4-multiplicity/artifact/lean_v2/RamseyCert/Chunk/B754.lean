import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_754 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_15, eB_17, eB_20, eB_22, eB_24, eB_26, eB_29, eB_30, eB_31, eB_35, eB_38, eB_41,
  eB_44, eB_45, eB_46, eB_48, eB_49, eB_50, eB_51, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_76,
  eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_92, eB_93, eB_94, eB_95, eB_96, eB_97, eB_99, eB_101, eB_103,
  eB_105, eB_106, eB_110, eB_111, eB_113, eB_114, eB_115, eB_119, eB_120, eB_121, eB_125, eB_126, eB_128, eB_129, eB_131, eB_132,
  eB_133, eB_134, eB_135, eB_141, eB_144, eB_147, eB_150, eB_151, eB_152, eB_156, eB_157, eB_158, eB_164, eB_165, eB_166, eB_167,
  eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187, eB_196, eB_197, eB_198, eB_199,
  eB_200, eB_201, eB_202, eB_203, eB_209, eB_211, eB_213, eB_215, eB_218, eB_221, eB_224, eB_227, eB_231, eB_232, eB_234, eB_235,
  eB_236, eB_239, eB_243, eB_244, eB_249, eB_252, eB_254, eB_256, eB_258, eB_264, eB_265, eB_266, eB_267, eB_272, eB_273, eB_274,
  eB_275, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_296, eB_297, eB_298, eB_299, eB_304, eB_305, eB_306,
  eB_307, eB_308, eB_309, eB_310, eB_311, eB_312, eB_316, eB_317, eB_318, eB_319, eB_323, eB_324, eB_325, eB_326, eB_327, eB_336,
  eB_337, eB_338, eB_339, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_355, eB_361, eB_362, eB_363, eB_364,
  eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_379, eB_381, eB_382, eB_383, eB_384, eB_387, eB_389, eB_393,
  eB_396, eB_397, eB_401, eB_403, eB_406, eB_407, eB_408, eB_412, eB_413, eB_414, eB_418, eB_419, eB_420, eB_424, eB_426, eB_431,
  eB_432, eB_433, eB_434, eB_435, eB_438, eB_441, eB_442, eB_444, eB_445, eB_448, eB_451, eB_452, eB_453, eB_458, eB_459, eB_460,
  eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_488, eB_489, eB_490, eB_491,
  eB_496, eB_497, eB_498, eB_499, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527,
  eB_528, eB_529, eB_530, eB_531, eB_533, eB_534, eB_537, eB_538, eB_539, eB_540, eB_547, eB_549, eB_550, eB_551, eB_552, eB_554,
  eB_557, eB_558, eB_559, eB_560, eB_562, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_577, eB_578, eB_579,
  eB_580, eB_585, eB_587, eB_589, eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_609,
  eB_612, eB_615, eB_618, eB_622, eB_624, eB_625, eB_627, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_648,
  eB_649, eB_650, eB_651, eB_652, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_669, eB_670, eB_671, eB_672,
  eB_677, eB_678, eB_679, eB_680, eB_689, eB_690, eB_691, eB_692, eB_694, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703,
  eB_704, eB_713, eB_714, eB_715, eB_716, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735,
  eB_736, eB_741, eB_742, eB_743, eB_744, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_776, eB_777, eB_780,
  eB_781, eB_784, eB_785, eB_788, eB_789, eB_794, eB_795, eB_796, eB_797, eB_802, eB_803, eB_804, eB_806, eB_807, eB_810, eB_811,
  eB_818, eB_819, eB_822, eB_823, eB_836, eB_837, eB_840, eB_841, eB_842, eB_843, eB_844, eB_845, eB_846, eB_847, eB_848, eB_850,
  eB_851, eB_852, eB_853, eB_854, eB_855, eB_856, eB_857, eB_860, eB_861, eB_864, eB_865, eB_866, eB_867, eB_870, eB_871, eB_872,
  eB_873, eB_890, eB_891, eB_892, eB_893, eB_898, eB_902, eB_904, eB_905, eB_907, eB_909, eB_911, eB_912, eB_914, eB_916, eB_918,
  eB_919, eB_923, eB_924, eB_926, eB_927, eB_928, eB_929, eB_930, eB_931, eB_934, eB_935, eB_939, eB_940, eB_941, eB_943, eB_945,
  eB_947, eB_948, eB_950, eB_954, eB_955, eB_958, eB_959, eB_960, eB_961, eB_964, eB_965, eB_966, eB_967, eB_971, eB_972, eB_975,
  eB_978, eB_979, eB_980, eB_981, eB_982, eB_983, eB_985, eB_987, eB_990, eB_992, eB_993, eB_996, eB_998, eB_1000, eB_1002, eB_1006,
  eB_1008, eB_1009, eB_1010, eB_1011, eB_1013, eB_1016, eB_1017, eB_1019, eB_1020, eB_1023]
theorem nbOKB_754 : nbB_754 = nbhd entsB eB_754 := by decide +kernel
theorem mkOKB_754 : mkEnt 32 1024 W rB_754 754 = eB_754 := by decide +kernel
theorem tB_754 : kTermA 4294967295 eB_754 nbB_754 = 39146684050420575569705380 := by decide +kernel


end RamseyCert
