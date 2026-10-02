import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_903 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_52, eR_53, eR_54, eR_55, eR_61, eR_62, eR_63, eR_69, eR_70, eR_71, eR_77, eR_78,
  eR_79, eR_84, eR_86, eR_87, eR_92, eR_93, eR_94, eR_96, eR_97, eR_98, eR_99, eR_100, eR_101, eR_102, eR_103, eR_104,
  eR_105, eR_106, eR_107, eR_108, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_115, eR_116, eR_117, eR_118, eR_119, eR_120,
  eR_121, eR_122, eR_123, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_133, eR_134, eR_135, eR_164,
  eR_165, eR_166, eR_173, eR_175, eR_180, eR_181, eR_182, eR_183, eR_188, eR_190, eR_191, eR_196, eR_198, eR_199, eR_204, eR_205,
  eR_206, eR_208, eR_209, eR_210, eR_211, eR_212, eR_213, eR_214, eR_215, eR_216, eR_217, eR_218, eR_219, eR_220, eR_221, eR_222,
  eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238,
  eR_239, eR_240, eR_241, eR_242, eR_243, eR_244, eR_245, eR_246, eR_247, eR_259, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273,
  eR_274, eR_275, eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305,
  eR_306, eR_307, eR_312, eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337,
  eR_338, eR_339, eR_340, eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369,
  eR_370, eR_371, eR_372, eR_377, eR_378, eR_379, eR_380, eR_385, eR_386, eR_402, eR_403, eR_404, eR_405, eR_406, eR_407, eR_408,
  eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416, eR_417, eR_418, eR_419, eR_420, eR_421, eR_422, eR_431, eR_432,
  eR_433, eR_434, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_447, eR_448, eR_449, eR_450, eR_451, eR_452, eR_453, eR_454,
  eR_455, eR_456, eR_466, eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487,
  eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502, eR_503, eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519,
  eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535, eR_536, eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551,
  eR_552, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566, eR_567, eR_568, eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583,
  eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606, eR_607, eR_608, eR_609, eR_610, eR_611,
  eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627,
  eR_628, eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659,
  eR_660, eR_665, eR_666, eR_667, eR_668, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691,
  eR_692, eR_697, eR_698, eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723,
  eR_724, eR_729, eR_730, eR_731, eR_732, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755,
  eR_756, eR_762, eR_764, eR_772, eR_773, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785, eR_792, eR_793, eR_800, eR_801, eR_804,
  eR_805, eR_806, eR_807, eR_810, eR_811, eR_818, eR_819, eR_822, eR_823, eR_826, eR_827, eR_828, eR_829, eR_830, eR_831, eR_834,
  eR_835, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_846, eR_847, eR_850, eR_851, eR_854, eR_855, eR_856, eR_857, eR_860,
  eR_861, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_874, eR_875, eR_876, eR_877, eR_878, eR_879, eR_880, eR_881, eR_882,
  eR_883, eR_890, eR_891, eR_894, eR_895, eR_896, eR_898, eR_900, eR_901, eR_904, eR_905, eR_906, eR_907, eR_909, eR_910, eR_911,
  eR_912, eR_916, eR_918, eR_919, eR_924, eR_925, eR_926, eR_929, eR_931, eR_934, eR_935, eR_938, eR_939, eR_940, eR_942, eR_945,
  eR_947, eR_948, eR_949, eR_951, eR_952, eR_953, eR_955, eR_956, eR_957, eR_959, eR_961, eR_962, eR_963, eR_964, eR_973, eR_974,
  eR_977, eR_978, eR_980, eR_985, eR_986, eR_987, eR_989, eR_993, eR_995, eR_998, eR_999, eR_1000, eR_1001, eR_1004, eR_1007, eR_1010,
  eR_1014, eR_1015, eR_1019, eR_1021, eR_1023]
theorem nbOKR_903 : nbR_903 = nbhd entsR eR_903 := by decide +kernel
theorem mkOKR_903 : mkEnt 32 1024 W rR_903 903 = eR_903 := by decide +kernel
theorem tR_903 : kTermA 4294967295 eR_903 nbR_903 = 76328798271688892004718230 := by decide +kernel


end RamseyCert
