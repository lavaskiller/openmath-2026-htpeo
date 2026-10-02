import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_740 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_13, eB_17, eB_18, eB_22, eB_24, eB_26, eB_27, eB_31, eB_32, eB_33, eB_36, eB_39,
  eB_42, eB_46, eB_47, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_76,
  eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_92, eB_93, eB_94, eB_95, eB_96, eB_97, eB_98, eB_102, eB_103,
  eB_104, eB_108, eB_109, eB_110, eB_112, eB_113, eB_117, eB_118, eB_119, eB_123, eB_124, eB_125, eB_127, eB_128, eB_130, eB_131,
  eB_133, eB_134, eB_135, eB_139, eB_142, eB_145, eB_148, eB_152, eB_153, eB_154, eB_158, eB_159, eB_160, eB_161, eB_162, eB_163,
  eB_168, eB_169, eB_170, eB_171, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_196, eB_197, eB_198, eB_199,
  eB_200, eB_201, eB_202, eB_203, eB_210, eB_211, eB_212, eB_217, eB_220, eB_223, eB_226, eB_229, eB_230, eB_231, eB_233, eB_234,
  eB_238, eB_241, eB_242, eB_243, eB_250, eB_252, eB_254, eB_256, eB_257, eB_264, eB_265, eB_266, eB_267, eB_268, eB_269, eB_270,
  eB_271, eB_272, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_304, eB_305,
  eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327, eB_329, eB_332,
  eB_333, eB_334, eB_335, eB_338, eB_339, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_353, eB_357, eB_358,
  eB_359, eB_360, eB_362, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_387,
  eB_389, eB_391, eB_394, eB_397, eB_399, eB_404, eB_405, eB_406, eB_410, eB_411, eB_412, eB_416, eB_417, eB_418, eB_422, eB_424,
  eB_426, eB_431, eB_432, eB_433, eB_434, eB_437, eB_440, eB_442, eB_443, eB_445, eB_446, eB_449, eB_450, eB_451, eB_455, eB_458,
  eB_460, eB_461, eB_462, eB_463, eB_464, eB_465, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_492, eB_493,
  eB_494, eB_495, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_517, eB_519,
  eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_538, eB_541, eB_542, eB_543, eB_544, eB_545, eB_549, eB_550,
  eB_551, eB_552, eB_553, eB_554, eB_555, eB_556, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_580, eB_581,
  eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_604, eB_605, eB_606, eB_607, eB_608,
  eB_611, eB_614, eB_617, eB_620, eB_622, eB_624, eB_625, eB_627, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640,
  eB_645, eB_646, eB_647, eB_648, eB_653, eB_654, eB_655, eB_656, eB_663, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675,
  eB_676, eB_677, eB_678, eB_679, eB_680, eB_685, eB_686, eB_687, eB_688, eB_694, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702,
  eB_703, eB_704, eB_709, eB_710, eB_711, eB_712, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738,
  eB_739, eB_740, eB_741, eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_768, eB_769,
  eB_778, eB_779, eB_780, eB_781, eB_784, eB_785, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_794, eB_795, eB_796, eB_797,
  eB_798, eB_799, eB_802, eB_803, eB_804, eB_805, eB_808, eB_809, eB_812, eB_813, eB_814, eB_815, eB_822, eB_823, eB_826, eB_827,
  eB_830, eB_831, eB_832, eB_833, eB_834, eB_835, eB_838, eB_839, eB_841, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_858,
  eB_859, eB_862, eB_863, eB_866, eB_868, eB_869, eB_870, eB_871, eB_876, eB_877, eB_880, eB_881, eB_896, eB_897, eB_898, eB_905,
  eB_910, eB_911, eB_914, eB_916, eB_919, eB_921, eB_922, eB_923, eB_924, eB_926, eB_929, eB_930, eB_931, eB_935, eB_936, eB_938,
  eB_939, eB_940, eB_941, eB_942, eB_943, eB_948, eB_949, eB_950, eB_952, eB_953, eB_955, eB_956, eB_957, eB_959, eB_960, eB_962,
  eB_964, eB_970, eB_971, eB_972, eB_974, eB_975, eB_976, eB_979, eB_981, eB_982, eB_983, eB_984, eB_985, eB_989, eB_991, eB_994,
  eB_996, eB_1000, eB_1005, eB_1006, eB_1007, eB_1008, eB_1010, eB_1011, eB_1012, eB_1014, eB_1021, eB_1022]
theorem nbOKB_740 : nbB_740 = nbhd entsB eB_740 := by decide +kernel
theorem mkOKB_740 : mkEnt 32 1024 W rB_740 740 = eB_740 := by decide +kernel
theorem tB_740 : kTermA 4294967295 eB_740 nbB_740 = 122429022487771059745022296 := by decide +kernel


end RamseyCert
