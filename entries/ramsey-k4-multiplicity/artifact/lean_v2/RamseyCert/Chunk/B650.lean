import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_650 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_13, eB_14, eB_16, eB_17, eB_18, eB_19, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26,
  eB_29, eB_32, eB_33, eB_34, eB_36, eB_37, eB_39, eB_40, eB_44, eB_47, eB_48, eB_49, eB_50, eB_51, eB_52, eB_60,
  eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_76, eB_77, eB_78, eB_79, eB_84, eB_85, eB_86, eB_87, eB_88,
  eB_89, eB_90, eB_91, eB_92, eB_98, eB_101, eB_103, eB_105, eB_106, eB_109, eB_112, eB_115, eB_118, eB_121, eB_125, eB_126,
  eB_128, eB_129, eB_131, eB_132, eB_139, eB_140, eB_142, eB_143, eB_145, eB_146, eB_150, eB_153, eB_156, eB_159, eB_160, eB_161,
  eB_162, eB_163, eB_165, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183, eB_188, eB_189, eB_190, eB_191, eB_196,
  eB_197, eB_198, eB_199, eB_200, eB_201, eB_202, eB_203, eB_204, eB_209, eB_212, eB_216, eB_217, eB_219, eB_220, eB_222, eB_223,
  eB_225, eB_226, eB_227, eB_230, eB_233, eB_236, eB_239, eB_242, eB_249, eB_255, eB_257, eB_259, eB_264, eB_265, eB_266, eB_267,
  eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299,
  eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330, eB_331,
  eB_332, eB_333, eB_334, eB_335, eB_340, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352, eB_357, eB_358, eB_359,
  eB_360, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_385,
  eB_386, eB_393, eB_396, eB_401, eB_403, eB_406, eB_407, eB_409, eB_410, eB_412, eB_413, eB_415, eB_416, eB_418, eB_419, eB_421,
  eB_422, eB_427, eB_428, eB_429, eB_430, eB_435, eB_438, eB_443, eB_446, eB_448, eB_451, eB_452, eB_454, eB_455, eB_456, eB_461,
  eB_465, eB_466, eB_467, eB_468, eB_469, eB_471, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487,
  eB_488, eB_489, eB_490, eB_491, eB_496, eB_497, eB_498, eB_499, eB_507, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514,
  eB_515, eB_520, eB_521, eB_522, eB_523, eB_531, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537, eB_538, eB_539, eB_540, eB_549,
  eB_550, eB_551, eB_552, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_573, eB_574, eB_575, eB_576, eB_581,
  eB_582, eB_583, eB_584, eB_589, eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_609,
  eB_612, eB_615, eB_618, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_649, eB_650, eB_651, eB_652, eB_653,
  eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_671, eB_673, eB_674, eB_675, eB_676, eB_679, eB_681, eB_682, eB_683,
  eB_684, eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704, eB_709, eB_710, eB_711,
  eB_712, eB_717, eB_718, eB_719, eB_720, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_741, eB_742, eB_743,
  eB_744, eB_753, eB_754, eB_755, eB_756, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_774, eB_775, eB_776, eB_777,
  eB_778, eB_779, eB_782, eB_783, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_796, eB_797, eB_798, eB_802, eB_803, eB_804,
  eB_805, eB_806, eB_807, eB_810, eB_811, eB_812, eB_813, eB_814, eB_815, eB_816, eB_817, eB_820, eB_821, eB_822, eB_823, eB_824,
  eB_825, eB_828, eB_829, eB_836, eB_837, eB_842, eB_843, eB_844, eB_845, eB_850, eB_851, eB_858, eB_859, eB_860, eB_861, eB_862,
  eB_863, eB_866, eB_867, eB_870, eB_871, eB_874, eB_875, eB_876, eB_877, eB_878, eB_879, eB_882, eB_883, eB_884, eB_885, eB_892,
  eB_893, eB_894, eB_895, eB_897, eB_899, eB_901, eB_902, eB_906, eB_907, eB_908, eB_909, eB_912, eB_916, eB_917, eB_919, eB_922,
  eB_923, eB_924, eB_929, eB_932, eB_933, eB_934, eB_935, eB_936, eB_940, eB_944, eB_945, eB_946, eB_951, eB_953, eB_955, eB_956,
  eB_960, eB_962, eB_964, eB_966, eB_970, eB_972, eB_973, eB_974, eB_976, eB_978, eB_979, eB_982, eB_987, eB_988, eB_992, eB_993,
  eB_994, eB_996, eB_997, eB_998, eB_1000, eB_1002, eB_1004, eB_1005, eB_1007, eB_1009, eB_1010, eB_1011, eB_1020, eB_1021, eB_1022, eB_1023]
theorem nbOKB_650 : nbB_650 = nbhd entsB eB_650 := by decide +kernel
theorem mkOKB_650 : mkEnt 32 1024 W rB_650 650 = eB_650 := by decide +kernel
theorem tB_650 : kTermA 4294967295 eB_650 nbB_650 = 122181090878952565987425698 := by decide +kernel


end RamseyCert
