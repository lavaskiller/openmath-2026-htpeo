import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_790 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_14, eR_15, eR_19, eR_20, eR_28, eR_29, eR_31, eR_32, eR_34, eR_35, eR_37, eR_38,
  eR_40, eR_41, eR_43, eR_44, eR_46, eR_47, eR_53, eR_54, eR_55, eR_60, eR_61, eR_62, eR_64, eR_65, eR_66, eR_67,
  eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83, eR_88, eR_89, eR_90, eR_91, eR_97, eR_98, eR_100, eR_101,
  eR_103, eR_104, eR_106, eR_107, eR_109, eR_110, eR_112, eR_113, eR_115, eR_116, eR_118, eR_119, eR_121, eR_122, eR_124, eR_125,
  eR_127, eR_128, eR_130, eR_131, eR_140, eR_141, eR_143, eR_144, eR_146, eR_147, eR_149, eR_150, eR_152, eR_153, eR_155, eR_156,
  eR_158, eR_159, eR_164, eR_165, eR_167, eR_172, eR_173, eR_175, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186, eR_187,
  eR_192, eR_193, eR_194, eR_195, eR_200, eR_201, eR_202, eR_203, eR_208, eR_209, eR_211, eR_212, eR_215, eR_216, eR_218, eR_219,
  eR_221, eR_222, eR_224, eR_225, eR_227, eR_228, eR_230, eR_231, eR_233, eR_234, eR_236, eR_237, eR_239, eR_240, eR_242, eR_243,
  eR_250, eR_251, eR_252, eR_253, eR_254, eR_255, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275,
  eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303,
  eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335,
  eR_340, eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367,
  eR_368, eR_373, eR_374, eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_388, eR_389, eR_390, eR_391,
  eR_394, eR_397, eR_398, eR_399, eR_404, eR_407, eR_410, eR_413, eR_416, eR_419, eR_422, eR_423, eR_424, eR_425, eR_426, eR_428,
  eR_429, eR_430, eR_437, eR_440, eR_441, eR_444, eR_449, eR_452, eR_455, eR_456, eR_457, eR_458, eR_459, eR_462, eR_464, eR_465,
  eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_488, eR_489, eR_491, eR_500, eR_501, eR_502,
  eR_503, eR_508, eR_509, eR_510, eR_511, eR_513, eR_514, eR_515, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535,
  eR_536, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563,
  eR_564, eR_569, eR_570, eR_571, eR_572, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595,
  eR_596, eR_606, eR_608, eR_611, eR_614, eR_617, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_633,
  eR_634, eR_635, eR_636, eR_637, eR_638, eR_640, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655, eR_656, eR_665, eR_666,
  eR_667, eR_668, eR_669, eR_670, eR_671, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691, eR_692, eR_697, eR_698, eR_699,
  eR_700, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722, eR_723, eR_724, eR_729, eR_730, eR_731,
  eR_732, eR_733, eR_735, eR_736, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762, eR_763, eR_764,
  eR_765, eR_766, eR_767, eR_768, eR_769, eR_780, eR_781, eR_782, eR_784, eR_785, eR_800, eR_801, eR_806, eR_807, eR_808, eR_809,
  eR_815, eR_816, eR_817, eR_820, eR_821, eR_822, eR_823, eR_825, eR_826, eR_827, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843,
  eR_846, eR_847, eR_848, eR_849, eR_850, eR_854, eR_855, eR_859, eR_860, eR_861, eR_862, eR_863, eR_866, eR_867, eR_868, eR_869,
  eR_870, eR_871, eR_872, eR_873, eR_876, eR_877, eR_878, eR_879, eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_888, eR_889,
  eR_894, eR_895, eR_896, eR_898, eR_900, eR_904, eR_906, eR_909, eR_910, eR_914, eR_915, eR_916, eR_920, eR_921, eR_923, eR_924,
  eR_925, eR_927, eR_930, eR_931, eR_933, eR_935, eR_936, eR_939, eR_940, eR_941, eR_943, eR_945, eR_946, eR_948, eR_951, eR_953,
  eR_954, eR_956, eR_957, eR_961, eR_962, eR_963, eR_965, eR_967, eR_968, eR_971, eR_973, eR_974, eR_975, eR_976, eR_978, eR_979,
  eR_980, eR_982, eR_984, eR_991, eR_992, eR_996, eR_997, eR_1001, eR_1002, eR_1005, eR_1006, eR_1011, eR_1013, eR_1014, eR_1015, eR_1016,
  eR_1018, eR_1020]
theorem nbOKR_790 : nbR_790 = nbhd entsR eR_790 := by decide +kernel
theorem mkOKR_790 : mkEnt 32 1024 W rR_790 790 = eR_790 := by decide +kernel
theorem tR_790 : kTermA 4294967295 eR_790 nbR_790 = 94281235726633472939788224 := by decide +kernel


end RamseyCert
