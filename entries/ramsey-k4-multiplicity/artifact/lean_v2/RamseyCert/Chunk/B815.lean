import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_815 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_13, eB_17, eB_18, eB_22, eB_24, eB_26, eB_27, eB_31, eB_32, eB_33, eB_36, eB_39,
  eB_42, eB_46, eB_47, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_76,
  eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_92, eB_93, eB_94, eB_95, eB_99, eB_100, eB_101, eB_105, eB_106,
  eB_107, eB_111, eB_114, eB_115, eB_116, eB_120, eB_121, eB_122, eB_126, eB_129, eB_132, eB_139, eB_142, eB_145, eB_148, eB_152,
  eB_153, eB_154, eB_158, eB_159, eB_160, eB_161, eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_180, eB_181, eB_182, eB_183,
  eB_184, eB_185, eB_186, eB_187, eB_196, eB_197, eB_198, eB_199, eB_200, eB_201, eB_202, eB_203, eB_208, eB_209, eB_213, eB_214,
  eB_215, eB_216, eB_218, eB_219, eB_221, eB_222, eB_224, eB_225, eB_227, eB_228, eB_232, eB_235, eB_236, eB_237, eB_239, eB_240,
  eB_244, eB_245, eB_246, eB_247, eB_248, eB_249, eB_251, eB_253, eB_255, eB_258, eB_260, eB_261, eB_262, eB_263, eB_271, eB_272,
  eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_294, eB_296, eB_297, eB_298, eB_299,
  eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_326, eB_328, eB_329, eB_330,
  eB_331, eB_333, eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_352, eB_353, eB_354, eB_355, eB_356, eB_357,
  eB_361, eB_362, eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_388, eB_390, eB_392, eB_393,
  eB_395, eB_396, eB_398, eB_400, eB_401, eB_404, eB_405, eB_406, eB_410, eB_411, eB_412, eB_416, eB_417, eB_418, eB_422, eB_423,
  eB_425, eB_431, eB_432, eB_433, eB_434, eB_437, eB_440, eB_441, eB_444, eB_449, eB_450, eB_451, eB_455, eB_457, eB_459, eB_462,
  eB_463, eB_464, eB_465, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_492, eB_493, eB_494, eB_495, eB_496,
  eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_524, eB_525, eB_526, eB_527, eB_532,
  eB_533, eB_534, eB_535, eB_537, eB_538, eB_539, eB_540, eB_542, eB_545, eB_546, eB_547, eB_548, eB_551, eB_557, eB_558, eB_559,
  eB_560, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579, eB_580, eB_583, eB_589, eB_590,
  eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_606, eB_611, eB_614, eB_617, eB_620, eB_622,
  eB_624, eB_625, eB_627, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_649, eB_650, eB_651, eB_652, eB_657,
  eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_668, eB_673, eB_674, eB_675, eB_676, eB_677, eB_678, eB_679, eB_680,
  eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_698, eB_705, eB_706, eB_707, eB_708, eB_709, eB_710, eB_711,
  eB_712, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740, eB_741,
  eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_770, eB_771,
  eB_772, eB_773, eB_774, eB_775, eB_780, eB_781, eB_794, eB_795, eB_796, eB_797, eB_798, eB_799, eB_800, eB_801, eB_802, eB_803,
  eB_806, eB_807, eB_810, eB_811, eB_812, eB_813, eB_814, eB_815, eB_818, eB_819, eB_826, eB_827, eB_830, eB_831, eB_832, eB_833,
  eB_836, eB_837, eB_838, eB_839, eB_840, eB_841, eB_844, eB_845, eB_846, eB_847, eB_848, eB_849, eB_850, eB_851, eB_856, eB_857,
  eB_858, eB_859, eB_860, eB_861, eB_864, eB_865, eB_866, eB_867, eB_872, eB_873, eB_874, eB_875, eB_878, eB_879, eB_884, eB_885,
  eB_894, eB_895, eB_896, eB_897, eB_899, eB_900, eB_903, eB_910, eB_911, eB_912, eB_915, eB_919, eB_920, eB_921, eB_922, eB_924,
  eB_927, eB_933, eB_938, eB_939, eB_940, eB_941, eB_945, eB_948, eB_953, eB_955, eB_956, eB_959, eB_960, eB_964, eB_966, eB_967,
  eB_968, eB_970, eB_971, eB_973, eB_976, eB_979, eB_980, eB_982, eB_983, eB_984, eB_986, eB_989, eB_990, eB_991, eB_994, eB_995,
  eB_997, eB_998, eB_1002, eB_1003, eB_1006, eB_1007, eB_1011, eB_1015, eB_1017, eB_1019, eB_1022, eB_1023]
theorem nbOKB_815 : nbB_815 = nbhd entsB eB_815 := by decide +kernel
theorem mkOKB_815 : mkEnt 32 1024 W rB_815 815 = eB_815 := by decide +kernel
theorem tB_815 : kTermA 4294967295 eB_815 nbB_815 = 92489666413079328309087556 := by decide +kernel


end RamseyCert
