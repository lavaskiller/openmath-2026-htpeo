import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_802 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_14, eB_16, eB_19, eB_21, eB_23, eB_25, eB_27, eB_29, eB_31, eB_34, eB_37, eB_40,
  eB_42, eB_44, eB_46, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_68, eB_69, eB_70, eB_71, eB_72,
  eB_73, eB_74, eB_75, eB_84, eB_85, eB_86, eB_87, eB_92, eB_93, eB_94, eB_95, eB_98, eB_99, eB_100, eB_103, eB_107,
  eB_109, eB_111, eB_112, eB_114, eB_116, eB_118, eB_120, eB_122, eB_125, eB_128, eB_131, eB_140, eB_143, eB_146, eB_148, eB_150,
  eB_152, eB_154, eB_156, eB_158, eB_160, eB_161, eB_162, eB_163, eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179,
  eB_188, eB_189, eB_190, eB_191, eB_192, eB_193, eB_194, eB_195, eB_200, eB_201, eB_202, eB_203, eB_208, eB_212, eB_213, eB_214,
  eB_215, eB_217, eB_218, eB_220, eB_221, eB_223, eB_224, eB_226, eB_228, eB_230, eB_232, eB_233, eB_235, eB_237, eB_240, eB_242,
  eB_244, eB_245, eB_246, eB_247, eB_249, eB_250, eB_252, eB_254, eB_255, eB_256, eB_260, eB_261, eB_262, eB_263, eB_268, eB_269,
  eB_270, eB_271, eB_278, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_293, eB_296, eB_297, eB_298, eB_299,
  eB_300, eB_301, eB_302, eB_303, eB_310, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_326, eB_328, eB_329,
  eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_357, eB_358,
  eB_359, eB_360, eB_368, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_387, eB_389, eB_391, eB_393, eB_394,
  eB_396, eB_397, eB_399, eB_401, eB_402, eB_406, eB_408, eB_410, eB_412, eB_414, eB_416, eB_418, eB_420, eB_422, eB_424, eB_426,
  eB_431, eB_432, eB_433, eB_434, eB_436, eB_439, eB_442, eB_445, eB_447, eB_451, eB_453, eB_455, eB_458, eB_460, eB_466, eB_467,
  eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_482, eB_483, eB_484, eB_485, eB_492, eB_493, eB_494, eB_495, eB_496, eB_497,
  eB_498, eB_499, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515, eB_524, eB_525, eB_526, eB_527, eB_528, eB_529,
  eB_530, eB_531, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_552, eB_557, eB_558, eB_559, eB_560, eB_561,
  eB_562, eB_563, eB_564, eB_568, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579, eB_580, eB_582, eB_589, eB_590, eB_591,
  eB_592, eB_593, eB_594, eB_595, eB_596, eB_600, eB_605, eB_606, eB_607, eB_608, eB_610, eB_613, eB_616, eB_619, eB_621, eB_623,
  eB_626, eB_628, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_649, eB_650, eB_651, eB_652, eB_653, eB_654,
  eB_655, eB_656, eB_659, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_681, eB_682, eB_683, eB_684, eB_685,
  eB_686, eB_687, eB_688, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_707, eB_709, eB_710, eB_711, eB_712,
  eB_717, eB_720, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_737, eB_738, eB_739, eB_740, eB_741, eB_742,
  eB_743, eB_744, eB_753, eB_754, eB_755, eB_756, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_770, eB_771, eB_774,
  eB_776, eB_777, eB_780, eB_781, eB_782, eB_783, eB_784, eB_785, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_792, eB_793,
  eB_796, eB_797, eB_800, eB_801, eB_802, eB_803, eB_814, eB_815, eB_820, eB_821, eB_822, eB_823, eB_830, eB_831, eB_832, eB_833,
  eB_836, eB_837, eB_842, eB_843, eB_848, eB_849, eB_854, eB_855, eB_856, eB_858, eB_859, eB_862, eB_863, eB_864, eB_865, eB_866,
  eB_867, eB_868, eB_869, eB_874, eB_875, eB_882, eB_883, eB_884, eB_885, eB_886, eB_887, eB_894, eB_895, eB_900, eB_903, eB_905,
  eB_908, eB_910, eB_911, eB_912, eB_917, eB_918, eB_920, eB_923, eB_925, eB_926, eB_927, eB_930, eB_932, eB_934, eB_936, eB_938,
  eB_942, eB_945, eB_946, eB_948, eB_949, eB_952, eB_953, eB_954, eB_955, eB_957, eB_958, eB_959, eB_965, eB_967, eB_969, eB_970,
  eB_971, eB_972, eB_973, eB_974, eB_975, eB_977, eB_978, eB_980, eB_981, eB_982, eB_984, eB_986, eB_990, eB_993, eB_994, eB_996,
  eB_998, eB_1002, eB_1004, eB_1005, eB_1010, eB_1011, eB_1015, eB_1017, eB_1018, eB_1019, eB_1020, eB_1021, eB_1023]
theorem nbOKB_802 : nbB_802 = nbhd entsB eB_802 := by decide +kernel
theorem mkOKB_802 : mkEnt 32 1024 W rB_802 802 = eB_802 := by decide +kernel
theorem tB_802 : kTermA 4294967295 eB_802 nbB_802 = 90582491331230190923449728 := by decide +kernel


end RamseyCert
