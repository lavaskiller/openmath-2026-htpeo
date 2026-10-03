import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_821 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_14, eB_16, eB_17,
  eB_19, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_28, eB_31, eB_34, eB_37, eB_40, eB_43, eB_46, eB_48, eB_49,
  eB_50, eB_51, eB_52, eB_53, eB_54, eB_55, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_97, eB_98,
  eB_99, eB_101, eB_102, eB_103, eB_104, eB_105, eB_106, eB_108, eB_109, eB_111, eB_112, eB_114, eB_115, eB_116, eB_117, eB_118,
  eB_120, eB_121, eB_123, eB_124, eB_126, eB_127, eB_129, eB_130, eB_132, eB_133, eB_136, eB_137, eB_138, eB_140, eB_143, eB_146,
  eB_149, eB_152, eB_155, eB_158, eB_160, eB_161, eB_162, eB_163, eB_164, eB_165, eB_166, eB_167, eB_176, eB_177, eB_178, eB_179,
  eB_180, eB_181, eB_182, eB_183, eB_208, eB_209, eB_210, eB_212, eB_213, eB_215, eB_217, eB_218, eB_220, eB_221, eB_223, eB_224,
  eB_226, eB_227, eB_229, eB_230, eB_232, eB_233, eB_234, eB_235, eB_236, eB_238, eB_239, eB_241, eB_242, eB_244, eB_245, eB_248,
  eB_250, eB_251, eB_252, eB_253, eB_254, eB_255, eB_256, eB_258, eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267,
  eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307,
  eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348,
  eB_349, eB_350, eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372,
  eB_381, eB_382, eB_383, eB_384, eB_387, eB_388, eB_389, eB_390, eB_392, eB_395, eB_397, eB_398, eB_400, eB_403, eB_404, eB_405,
  eB_407, eB_408, eB_410, eB_411, eB_413, eB_414, eB_416, eB_417, eB_419, eB_420, eB_422, eB_423, eB_424, eB_425, eB_426, eB_427,
  eB_428, eB_429, eB_430, eB_431, eB_432, eB_433, eB_434, eB_435, eB_437, eB_438, eB_439, eB_440, eB_442, eB_445, eB_447, eB_448,
  eB_449, eB_450, eB_452, eB_453, eB_455, eB_457, eB_458, eB_460, eB_461, eB_470, eB_471, eB_472, eB_473, eB_474, eB_475, eB_476,
  eB_477, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526,
  eB_527, eB_537, eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_553, eB_554, eB_555, eB_556, eB_557, eB_558, eB_559,
  eB_560, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_577, eB_578, eB_579, eB_580, eB_581, eB_582, eB_583,
  eB_584, eB_585, eB_586, eB_587, eB_588, eB_589, eB_590, eB_591, eB_592, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607,
  eB_608, eB_609, eB_611, eB_612, eB_614, eB_615, eB_617, eB_618, eB_620, eB_637, eB_638, eB_639, eB_640, eB_641, eB_642, eB_643,
  eB_644, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667,
  eB_668, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684, eB_717, eB_718, eB_719, eB_720, eB_721, eB_722, eB_723,
  eB_724, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_765, eB_766, eB_767, eB_768, eB_769, eB_770, eB_771,
  eB_774, eB_775, eB_780, eB_781, eB_784, eB_785, eB_788, eB_789, eB_792, eB_796, eB_797, eB_800, eB_802, eB_803, eB_806, eB_807,
  eB_808, eB_809, eB_810, eB_811, eB_812, eB_813, eB_820, eB_821, eB_824, eB_825, eB_826, eB_827, eB_834, eB_835, eB_836, eB_838,
  eB_839, eB_844, eB_845, eB_856, eB_857, eB_860, eB_861, eB_862, eB_863, eB_864, eB_865, eB_870, eB_871, eB_878, eB_879, eB_880,
  eB_881, eB_882, eB_883, eB_884, eB_885, eB_888, eB_889, eB_896, eB_903, eB_904, eB_905, eB_907, eB_909, eB_912, eB_913, eB_915,
  eB_916, eB_917, eB_918, eB_920, eB_921, eB_924, eB_926, eB_930, eB_932, eB_933, eB_935, eB_936, eB_937, eB_942, eB_943, eB_944,
  eB_945, eB_946, eB_948, eB_950, eB_952, eB_953, eB_954, eB_957, eB_959, eB_960, eB_962, eB_963, eB_966, eB_968, eB_971, eB_974,
  eB_975, eB_979, eB_980, eB_981, eB_982, eB_983, eB_984, eB_987, eB_988, eB_989, eB_993, eB_994, eB_997, eB_998, eB_999, eB_1000,
  eB_1001, eB_1003, eB_1009, eB_1014, eB_1017, eB_1019, eB_1021, eB_1023]
theorem nbOKB_821 : nbB_821 = nbhd entsB eB_821 := by decide +kernel
theorem mkOKB_821 : mkEnt 32 1024 W rB_821 821 = eB_821 := by decide +kernel
theorem tB_821 : kTermA 4294967295 eB_821 nbB_821 = 103361551880356172318156496 := by decide +kernel


end RamseyCert
