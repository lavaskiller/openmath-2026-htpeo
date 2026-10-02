import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_1006 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_13, eR_14, eR_15, eR_16, eR_18, eR_19, eR_20, eR_21, eR_23, eR_25, eR_30, eR_31,
  eR_32, eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_45, eR_46, eR_47, eR_48, eR_49, eR_50,
  eR_51, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_84, eR_85, eR_86,
  eR_87, eR_92, eR_93, eR_94, eR_95, eR_96, eR_97, eR_98, eR_99, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_118,
  eR_119, eR_120, eR_133, eR_134, eR_135, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_151, eR_152,
  eR_153, eR_157, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183,
  eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_195, eR_200, eR_201, eR_202, eR_203, eR_211, eR_212, eR_213, eR_215, eR_216,
  eR_217, eR_218, eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235,
  eR_242, eR_243, eR_244, eR_248, eR_249, eR_250, eR_251, eR_253, eR_264, eR_265, eR_266, eR_268, eR_269, eR_270, eR_271, eR_276,
  eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_297, eR_299, eR_305, eR_306, eR_307, eR_312, eR_313, eR_315, eR_316,
  eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335, eR_341, eR_342, eR_343, eR_344, eR_353,
  eR_354, eR_356, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_373, eR_374, eR_375, eR_376, eR_381, eR_382,
  eR_383, eR_384, eR_388, eR_390, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_398, eR_399, eR_400, eR_401, eR_402, eR_403,
  eR_404, eR_405, eR_406, eR_407, eR_411, eR_412, eR_413, eR_417, eR_418, eR_419, eR_423, eR_425, eR_431, eR_432, eR_433, eR_434,
  eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_447, eR_448, eR_449, eR_450, eR_451, eR_452, eR_457, eR_462, eR_463, eR_464,
  eR_465, eR_470, eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498,
  eR_499, eR_504, eR_505, eR_506, eR_507, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534,
  eR_535, eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563,
  eR_569, eR_570, eR_571, eR_577, eR_579, eR_580, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606,
  eR_607, eR_608, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_621, eR_623,
  eR_626, eR_628, eR_629, eR_630, eR_632, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659,
  eR_660, eR_665, eR_666, eR_667, eR_668, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691,
  eR_692, eR_693, eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724,
  eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752,
  eR_757, eR_758, eR_759, eR_772, eR_773, eR_774, eR_775, eR_780, eR_781, eR_782, eR_783, eR_786, eR_787, eR_790, eR_791, eR_792,
  eR_793, eR_796, eR_797, eR_798, eR_799, eR_802, eR_803, eR_812, eR_813, eR_820, eR_821, eR_826, eR_827, eR_836, eR_837, eR_838,
  eR_839, eR_853, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_878, eR_879, eR_882, eR_883,
  eR_890, eR_891, eR_892, eR_893, eR_896, eR_897, eR_898, eR_900, eR_902, eR_904, eR_907, eR_908, eR_909, eR_911, eR_912, eR_914,
  eR_915, eR_917, eR_921, eR_922, eR_925, eR_927, eR_928, eR_931, eR_932, eR_933, eR_935, eR_936, eR_940, eR_942, eR_943, eR_945,
  eR_946, eR_947, eR_948, eR_949, eR_952, eR_955, eR_956, eR_957, eR_959, eR_961, eR_967, eR_968, eR_969, eR_971, eR_974, eR_976,
  eR_977, eR_980, eR_982, eR_985, eR_987, eR_989, eR_990, eR_991, eR_992, eR_995, eR_997, eR_1000, eR_1003, eR_1004, eR_1005, eR_1007,
  eR_1009, eR_1010, eR_1011, eR_1013, eR_1016, eR_1017, eR_1018, eR_1019, eR_1021, eR_1022, eR_1023]
theorem nbOKR_1006 : nbR_1006 = nbhd entsR eR_1006 := by decide +kernel
theorem mkOKR_1006 : mkEnt 32 1024 W rR_1006 1006 = eR_1006 := by decide +kernel
theorem tR_1006 : kTermA 4294967295 eR_1006 nbR_1006 = 83583625055170362166990512 := by decide +kernel


end RamseyCert
