import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_640 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_13, eB_14, eB_15, eB_16, eB_17, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26,
  eB_48, eB_49, eB_50, eB_51, eB_56, eB_57, eB_58, eB_59, eB_64, eB_65, eB_66, eB_67, eB_76, eB_77, eB_78, eB_79,
  eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_97, eB_98, eB_99, eB_100, eB_101, eB_102, eB_106, eB_107,
  eB_108, eB_109, eB_110, eB_111, eB_112, eB_113, eB_114, eB_115, eB_116, eB_117, eB_118, eB_119, eB_120, eB_121, eB_122, eB_123,
  eB_136, eB_137, eB_138, eB_139, eB_140, eB_141, eB_142, eB_143, eB_144, eB_145, eB_146, eB_147, eB_164, eB_165, eB_166, eB_167,
  eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_192, eB_193, eB_194, eB_195,
  eB_204, eB_205, eB_206, eB_207, eB_214, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221, eB_222, eB_223, eB_224, eB_225,
  eB_226, eB_245, eB_246, eB_247, eB_251, eB_252, eB_256, eB_257, eB_258, eB_261, eB_264, eB_265, eB_266, eB_267, eB_270, eB_272,
  eB_273, eB_274, eB_275, eB_277, eB_280, eB_281, eB_282, eB_283, eB_287, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294,
  eB_295, eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326,
  eB_327, eB_332, eB_333, eB_334, eB_335, eB_345, eB_346, eB_347, eB_348, eB_350, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358,
  eB_359, eB_360, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_381, eB_382, eB_383, eB_384, eB_387, eB_388,
  eB_389, eB_390, eB_397, eB_398, eB_402, eB_403, eB_404, eB_429, eB_430, eB_431, eB_432, eB_433, eB_434, eB_435, eB_436, eB_437,
  eB_438, eB_439, eB_440, eB_441, eB_442, eB_443, eB_444, eB_445, eB_446, eB_447, eB_448, eB_449, eB_456, eB_459, eB_460, eB_461,
  eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_488, eB_489,
  eB_490, eB_491, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_520, eB_521,
  eB_522, eB_523, eB_528, eB_529, eB_530, eB_531, eB_536, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552, eB_557,
  eB_558, eB_559, eB_560, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584, eB_585,
  eB_586, eB_587, eB_588, eB_591, eB_593, eB_594, eB_595, eB_596, eB_598, eB_601, eB_602, eB_603, eB_604, eB_607, eB_621, eB_622,
  eB_623, eB_624, eB_625, eB_626, eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_649, eB_650,
  eB_651, eB_652, eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_677, eB_678,
  eB_679, eB_680, eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_699, eB_701, eB_702, eB_703, eB_704, eB_713,
  eB_714, eB_715, eB_716, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739, eB_740, eB_745,
  eB_746, eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_761, eB_762, eB_763, eB_764, eB_768, eB_769, eB_770, eB_772, eB_773,
  eB_775, eB_778, eB_779, eB_780, eB_781, eB_782, eB_783, eB_784, eB_785, eB_786, eB_787, eB_789, eB_792, eB_793, eB_798, eB_799,
  eB_800, eB_801, eB_802, eB_803, eB_806, eB_807, eB_812, eB_813, eB_814, eB_815, eB_816, eB_817, eB_820, eB_821, eB_824, eB_826,
  eB_827, eB_842, eB_843, eB_844, eB_845, eB_846, eB_847, eB_856, eB_857, eB_862, eB_863, eB_864, eB_865, eB_870, eB_871, eB_872,
  eB_873, eB_874, eB_875, eB_878, eB_879, eB_880, eB_881, eB_886, eB_887, eB_890, eB_891, eB_894, eB_895, eB_896, eB_899, eB_900,
  eB_901, eB_902, eB_903, eB_904, eB_908, eB_910, eB_912, eB_913, eB_919, eB_920, eB_921, eB_922, eB_924, eB_925, eB_926, eB_929,
  eB_931, eB_932, eB_934, eB_935, eB_938, eB_939, eB_941, eB_942, eB_943, eB_944, eB_945, eB_951, eB_952, eB_956, eB_957, eB_958,
  eB_959, eB_960, eB_962, eB_965, eB_967, eB_968, eB_969, eB_970, eB_972, eB_973, eB_975, eB_980, eB_981, eB_982, eB_983, eB_986,
  eB_987, eB_990, eB_996, eB_997, eB_1001, eB_1002, eB_1005, eB_1008, eB_1009, eB_1010, eB_1012, eB_1013, eB_1021]
theorem nbOKB_640 : nbB_640 = nbhd entsB eB_640 := by decide +kernel
theorem mkOKB_640 : mkEnt 32 1024 W rB_640 640 = eB_640 := by decide +kernel
theorem tB_640 : kTermA 4294967295 eB_640 nbB_640 = 123977936521013632940555496 := by decide +kernel


end RamseyCert
