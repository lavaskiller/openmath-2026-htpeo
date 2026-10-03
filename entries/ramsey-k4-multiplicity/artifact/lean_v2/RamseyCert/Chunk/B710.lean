import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_710 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_13, eB_16, eB_18, eB_21, eB_23, eB_25, eB_28, eB_29, eB_30, eB_33, eB_36, eB_39,
  eB_43, eB_44, eB_45, eB_48, eB_49, eB_50, eB_51, eB_56, eB_57, eB_58, eB_59, eB_68, eB_69, eB_70, eB_71, eB_76,
  eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_96, eB_99, eB_100, eB_101, eB_103,
  eB_104, eB_106, eB_107, eB_111, eB_114, eB_115, eB_116, eB_120, eB_121, eB_122, eB_124, eB_125, eB_127, eB_128, eB_130, eB_131,
  eB_133, eB_134, eB_135, eB_139, eB_142, eB_145, eB_149, eB_150, eB_151, eB_155, eB_156, eB_157, eB_164, eB_165, eB_166, eB_167,
  eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187, eB_196, eB_197, eB_198, eB_199,
  eB_204, eB_205, eB_206, eB_207, eB_208, eB_209, eB_213, eB_217, eB_220, eB_223, eB_226, eB_227, eB_228, eB_232, eB_235, eB_236,
  eB_237, eB_239, eB_240, eB_244, eB_250, eB_251, eB_253, eB_256, eB_257, eB_260, eB_261, eB_262, eB_263, eB_268, eB_272, eB_273,
  eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294, eB_295, eB_301, eB_304,
  eB_305, eB_306, eB_307, eB_310, eB_312, eB_313, eB_314, eB_315, eB_316, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326,
  eB_327, eB_332, eB_333, eB_334, eB_335, eB_341, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_360, eB_361,
  eB_362, eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_381, eB_382, eB_383, eB_384, eB_388,
  eB_390, eB_391, eB_394, eB_398, eB_399, eB_404, eB_407, eB_408, eB_409, eB_413, eB_414, eB_415, eB_419, eB_420, eB_421, eB_423,
  eB_425, eB_427, eB_428, eB_429, eB_430, eB_437, eB_440, eB_442, eB_443, eB_445, eB_446, eB_449, eB_452, eB_453, eB_454, eB_457,
  eB_460, eB_461, eB_466, eB_467, eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_488, eB_491,
  eB_492, eB_493, eB_494, eB_495, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515,
  eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552,
  eB_553, eB_554, eB_555, eB_556, eB_559, eB_561, eB_562, eB_563, eB_564, eB_565, eB_569, eB_570, eB_571, eB_572, eB_573, eB_581,
  eB_582, eB_583, eB_584, eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_607,
  eB_611, eB_614, eB_617, eB_620, eB_621, eB_623, eB_626, eB_628, eB_633, eB_634, eB_635, eB_636, eB_641, eB_642, eB_643, eB_644,
  eB_649, eB_650, eB_651, eB_652, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_666, eB_669, eB_670, eB_671,
  eB_672, eB_681, eB_682, eB_683, eB_684, eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703,
  eB_704, eB_708, eB_709, eB_710, eB_711, eB_712, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738,
  eB_739, eB_740, eB_741, eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_761, eB_762, eB_763, eB_764, eB_770, eB_771,
  eB_772, eB_773, eB_778, eB_779, eB_780, eB_781, eB_782, eB_783, eB_784, eB_785, eB_788, eB_789, eB_791, eB_796, eB_797, eB_798,
  eB_799, eB_800, eB_801, eB_802, eB_803, eB_806, eB_807, eB_814, eB_815, eB_816, eB_817, eB_822, eB_823, eB_824, eB_825, eB_826,
  eB_827, eB_828, eB_829, eB_830, eB_831, eB_838, eB_839, eB_840, eB_841, eB_844, eB_845, eB_846, eB_847, eB_854, eB_855, eB_858,
  eB_859, eB_860, eB_861, eB_864, eB_865, eB_868, eB_869, eB_870, eB_871, eB_875, eB_876, eB_877, eB_882, eB_883, eB_888, eB_889,
  eB_892, eB_893, eB_894, eB_895, eB_897, eB_901, eB_903, eB_904, eB_909, eB_912, eB_914, eB_915, eB_917, eB_918, eB_919, eB_922,
  eB_925, eB_927, eB_928, eB_932, eB_933, eB_934, eB_936, eB_938, eB_940, eB_941, eB_942, eB_943, eB_948, eB_949, eB_950, eB_952,
  eB_954, eB_956, eB_961, eB_962, eB_964, eB_965, eB_966, eB_967, eB_968, eB_969, eB_972, eB_973, eB_981, eB_985, eB_993, eB_995,
  eB_997, eB_999, eB_1000, eB_1005, eB_1006, eB_1009, eB_1010, eB_1012, eB_1014, eB_1015, eB_1019, eB_1020, eB_1021, eB_1022, eB_1023]
theorem nbOKB_710 : nbB_710 = nbhd entsB eB_710 := by decide +kernel
theorem mkOKB_710 : mkEnt 32 1024 W rB_710 710 = eB_710 := by decide +kernel
theorem tB_710 : kTermA 4294967295 eB_710 nbB_710 = 119998022701090614402296383 := by decide +kernel


end RamseyCert
