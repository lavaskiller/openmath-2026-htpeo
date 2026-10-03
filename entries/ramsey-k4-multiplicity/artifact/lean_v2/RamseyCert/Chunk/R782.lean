import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_782 : List Ent := [
  eR_4, eR_6, eR_7, eR_12, eR_14, eR_16, eR_17, eR_18, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27,
  eR_29, eR_30, eR_32, eR_33, eR_35, eR_36, eR_38, eR_39, eR_41, eR_42, eR_44, eR_45, eR_47, eR_48, eR_49, eR_50,
  eR_51, eR_60, eR_61, eR_63, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83,
  eR_92, eR_93, eR_94, eR_95, eR_96, eR_98, eR_99, eR_101, eR_102, eR_103, eR_106, eR_108, eR_109, eR_111, eR_112, eR_114,
  eR_115, eR_117, eR_118, eR_120, eR_121, eR_123, eR_125, eR_128, eR_131, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_140,
  eR_143, eR_146, eR_148, eR_150, eR_151, eR_153, eR_154, eR_156, eR_157, eR_159, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169,
  eR_170, eR_171, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190, eR_191, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201,
  eR_202, eR_203, eR_208, eR_211, eR_215, eR_217, eR_218, eR_220, eR_221, eR_223, eR_224, eR_226, eR_228, eR_231, eR_234, eR_237,
  eR_240, eR_243, eR_248, eR_253, eR_254, eR_255, eR_257, eR_258, eR_264, eR_265, eR_266, eR_267, eR_268, eR_270, eR_271, eR_280,
  eR_281, eR_282, eR_283, eR_284, eR_285, eR_287, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_303, eR_312, eR_313, eR_314,
  eR_315, eR_320, eR_321, eR_322, eR_323, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346, eR_347, eR_348,
  eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_366, eR_367, eR_368, eR_377, eR_378, eR_379, eR_380, eR_392,
  eR_395, eR_400, eR_402, eR_405, eR_407, eR_408, eR_410, eR_411, eR_413, eR_414, eR_416, eR_417, eR_419, eR_420, eR_422, eR_423,
  eR_424, eR_425, eR_426, eR_427, eR_428, eR_429, eR_430, eR_436, eR_439, eR_441, eR_443, eR_444, eR_446, eR_447, eR_450, eR_452,
  eR_453, eR_455, eR_456, eR_457, eR_458, eR_459, eR_461, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_482,
  eR_483, eR_484, eR_485, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506,
  eR_507, eR_512, eR_513, eR_514, eR_515, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_536, eR_537, eR_538,
  eR_539, eR_540, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_561, eR_562, eR_563, eR_564, eR_573, eR_574, eR_575,
  eR_577, eR_578, eR_579, eR_580, eR_589, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_605, eR_606, eR_608, eR_609, eR_611,
  eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_629, eR_630,
  eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_658, eR_659, eR_660, eR_661, eR_662, eR_663,
  eR_664, eR_669, eR_670, eR_671, eR_672, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687, eR_688, eR_693, eR_694, eR_695,
  eR_696, eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_729, eR_730, eR_731,
  eR_732, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762, eR_764,
  eR_765, eR_766, eR_767, eR_772, eR_773, eR_778, eR_779, eR_784, eR_785, eR_790, eR_791, eR_792, eR_793, eR_794, eR_795, eR_796,
  eR_797, eR_798, eR_799, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_812, eR_813, eR_814, eR_815, eR_818, eR_819, eR_820,
  eR_821, eR_822, eR_823, eR_824, eR_825, eR_832, eR_833, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_862, eR_863, eR_864,
  eR_865, eR_866, eR_867, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_880, eR_881, eR_882, eR_883, eR_884, eR_885, eR_890,
  eR_891, eR_894, eR_896, eR_898, eR_899, eR_902, eR_903, eR_904, eR_907, eR_909, eR_910, eR_911, eR_913, eR_915, eR_917, eR_918,
  eR_921, eR_925, eR_926, eR_927, eR_928, eR_930, eR_932, eR_934, eR_935, eR_936, eR_938, eR_939, eR_942, eR_943, eR_948, eR_949,
  eR_950, eR_951, eR_953, eR_956, eR_958, eR_960, eR_963, eR_964, eR_965, eR_966, eR_970, eR_972, eR_976, eR_979, eR_980, eR_985,
  eR_988, eR_989, eR_996, eR_997, eR_999, eR_1003, eR_1004, eR_1006, eR_1008, eR_1009, eR_1010, eR_1011, eR_1015, eR_1016, eR_1017, eR_1018,
  eR_1020, eR_1021, eR_1022, eR_1023]
theorem nbOKR_782 : nbR_782 = nbhd entsR eR_782 := by decide +kernel
theorem mkOKR_782 : mkEnt 32 1024 W rR_782 782 = eR_782 := by decide +kernel
theorem tR_782 : kTermA 4294967295 eR_782 nbR_782 = 103631326527729930043603482 := by decide +kernel


end RamseyCert
