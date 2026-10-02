import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_645 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_12, eR_15, eR_20, eR_27, eR_28, eR_30, eR_31, eR_35,
  eR_38, eR_41, eR_42, eR_43, eR_45, eR_46, eR_48, eR_50, eR_51, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70,
  eR_71, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_96, eR_97, eR_99, eR_100,
  eR_102, eR_104, eR_107, eR_108, eR_110, eR_111, eR_113, eR_114, eR_116, eR_117, eR_119, eR_120, eR_122, eR_123, eR_124, eR_127,
  eR_130, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_141, eR_144, eR_147, eR_148, eR_149, eR_151, eR_152, eR_154, eR_155,
  eR_157, eR_158, eR_160, eR_161, eR_163, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190,
  eR_191, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_208, eR_210, eR_211, eR_213, eR_214, eR_215, eR_218, eR_221,
  eR_224, eR_228, eR_229, eR_231, eR_232, eR_234, eR_235, eR_237, eR_238, eR_240, eR_241, eR_243, eR_244, eR_245, eR_246, eR_247,
  eR_248, eR_250, eR_251, eR_252, eR_253, eR_254, eR_256, eR_258, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271,
  eR_276, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307,
  eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335,
  eR_341, eR_342, eR_343, eR_344, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368,
  eR_377, eR_379, eR_387, eR_388, eR_389, eR_390, eR_391, eR_392, eR_394, eR_395, eR_397, eR_398, eR_399, eR_400, eR_402, eR_404,
  eR_405, eR_408, eR_411, eR_414, eR_417, eR_420, eR_423, eR_424, eR_425, eR_426, eR_427, eR_428, eR_429, eR_430, eR_436, eR_437,
  eR_439, eR_440, eR_441, eR_442, eR_444, eR_445, eR_447, eR_449, eR_450, eR_453, eR_457, eR_458, eR_459, eR_460, eR_466, eR_467,
  eR_468, eR_474, eR_475, eR_477, eR_478, eR_479, eR_480, eR_481, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499,
  eR_508, eR_509, eR_510, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_533, eR_534, eR_535, eR_537, eR_538,
  eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_573, eR_574,
  eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_601, eR_602,
  eR_603, eR_604, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626,
  eR_627, eR_628, eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654,
  eR_655, eR_656, eR_661, eR_662, eR_663, eR_664, eR_674, eR_675, eR_676, eR_681, eR_682, eR_684, eR_685, eR_686, eR_687, eR_688,
  eR_693, eR_694, eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720,
  eR_729, eR_730, eR_732, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756, eR_761,
  eR_762, eR_763, eR_764, eR_774, eR_775, eR_782, eR_783, eR_786, eR_787, eR_788, eR_789, eR_790, eR_791, eR_792, eR_793, eR_796,
  eR_797, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_812, eR_813, eR_814, eR_815, eR_816, eR_817, eR_824, eR_825, eR_826,
  eR_827, eR_832, eR_833, eR_834, eR_835, eR_838, eR_839, eR_843, eR_844, eR_845, eR_850, eR_851, eR_858, eR_859, eR_864, eR_865,
  eR_866, eR_867, eR_868, eR_869, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_880, eR_881, eR_882, eR_883, eR_888, eR_889,
  eR_892, eR_893, eR_894, eR_895, eR_898, eR_899, eR_902, eR_908, eR_912, eR_913, eR_915, eR_916, eR_918, eR_919, eR_923, eR_925,
  eR_928, eR_929, eR_930, eR_931, eR_933, eR_935, eR_936, eR_937, eR_939, eR_940, eR_944, eR_945, eR_956, eR_962, eR_964, eR_966,
  eR_968, eR_970, eR_971, eR_972, eR_973, eR_975, eR_977, eR_978, eR_979, eR_980, eR_981, eR_982, eR_985, eR_986, eR_988, eR_989,
  eR_992, eR_993, eR_994, eR_996, eR_997, eR_998, eR_1000, eR_1002, eR_1003, eR_1004, eR_1005, eR_1007, eR_1009, eR_1010, eR_1011, eR_1013,
  eR_1014, eR_1015, eR_1016, eR_1019, eR_1023]
theorem nbOKR_645 : nbR_645 = nbhd entsR eR_645 := by decide +kernel
theorem mkOKR_645 : mkEnt 32 1024 W rR_645 645 = eR_645 := by decide +kernel
theorem tR_645 : kTermA 4294967295 eR_645 nbR_645 = 120242242120746948330253896 := by decide +kernel


end RamseyCert
