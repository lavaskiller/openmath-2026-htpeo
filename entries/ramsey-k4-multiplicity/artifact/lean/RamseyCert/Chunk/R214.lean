import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_214 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_13, eR_14, eR_15, eR_16, eR_17, eR_21, eR_23, eR_24,
  eR_26, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62,
  eR_63, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94,
  eR_95, eR_96, eR_103, eR_104, eR_105, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_133, eR_136,
  eR_137, eR_138, eR_141, eR_142, eR_143, eR_145, eR_146, eR_147, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191,
  eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_208, eR_209, eR_210, eR_211, eR_212, eR_213, eR_227, eR_228,
  eR_229, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238, eR_239, eR_240, eR_241, eR_242, eR_243, eR_244,
  eR_248, eR_249, eR_250, eR_253, eR_254, eR_255, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301,
  eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317,
  eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333,
  eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366,
  eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_391, eR_392,
  eR_393, eR_394, eR_395, eR_396, eR_399, eR_400, eR_401, eR_402, eR_403, eR_404, eR_423, eR_424, eR_425, eR_426, eR_427, eR_428,
  eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_435, eR_438, eR_439, eR_440, eR_447, eR_449, eR_456, eR_457, eR_458, eR_462,
  eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_478,
  eR_479, eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_537, eR_538, eR_539, eR_540, eR_541, eR_542, eR_543,
  eR_544, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559,
  eR_560, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575,
  eR_576, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_645,
  eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_661,
  eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_717,
  eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_733,
  eR_734, eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_749,
  eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762, eR_763, eR_764, eR_765,
  eR_766, eR_767, eR_772, eR_773, eR_776, eR_777, eR_780, eR_781, eR_786, eR_787, eR_792, eR_793, eR_796, eR_797, eR_804, eR_805,
  eR_808, eR_809, eR_810, eR_811, eR_816, eR_817, eR_818, eR_819, eR_821, eR_822, eR_823, eR_824, eR_825, eR_826, eR_827, eR_834,
  eR_835, eR_836, eR_837, eR_840, eR_841, eR_842, eR_843, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_856, eR_857, eR_858,
  eR_859, eR_860, eR_861, eR_866, eR_867, eR_868, eR_869, eR_874, eR_875, eR_876, eR_877, eR_884, eR_885, eR_886, eR_887, eR_890,
  eR_891, eR_892, eR_893, eR_894, eR_895, eR_897, eR_898, eR_903, eR_905, eR_910, eR_911, eR_912, eR_913, eR_914, eR_915, eR_916,
  eR_917, eR_920, eR_921, eR_922, eR_923, eR_924, eR_925, eR_930, eR_932, eR_934, eR_936, eR_938, eR_939, eR_941, eR_943, eR_945,
  eR_949, eR_950, eR_951, eR_952, eR_956, eR_957, eR_959, eR_962, eR_964, eR_966, eR_967, eR_969, eR_974, eR_979, eR_984, eR_987,
  eR_988, eR_990, eR_991, eR_992, eR_993, eR_997, eR_998, eR_1000, eR_1001, eR_1002, eR_1003, eR_1004, eR_1005, eR_1009, eR_1010, eR_1012,
  eR_1013, eR_1014, eR_1015, eR_1017, eR_1019]
theorem nbOKR_214 : nbR_214 = nbhd entsR eR_214 := by decide +kernel
theorem mkOKR_214 : mkEnt 32 1024 W rR_214 214 = eR_214 := by decide +kernel
theorem tR_214 : kTermA 4294967295 eR_214 nbR_214 = 121163649691627202605669188 := by decide +kernel


end RamseyCert
