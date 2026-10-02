import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_187 : List Ent := [
  eR_8, eR_9, eR_10, eR_13, eR_14, eR_15, eR_17, eR_18, eR_19, eR_20, eR_22, eR_24, eR_26, eR_27, eR_28, eR_29,
  eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_42, eR_43, eR_44, eR_52, eR_53, eR_54, eR_55,
  eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_84, eR_85, eR_86, eR_87, eR_88,
  eR_89, eR_90, eR_91, eR_97, eR_98, eR_99, eR_103, eR_104, eR_105, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_118,
  eR_119, eR_120, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_139, eR_140, eR_141, eR_142, eR_143,
  eR_144, eR_145, eR_146, eR_147, eR_148, eR_149, eR_150, eR_154, eR_155, eR_156, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169,
  eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205,
  eR_206, eR_207, eR_211, eR_212, eR_213, eR_214, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_242, eR_243, eR_244, eR_245,
  eR_246, eR_247, eR_251, eR_253, eR_255, eR_256, eR_257, eR_258, eR_264, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271, eR_276,
  eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303, eR_308,
  eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_345, eR_346, eR_348,
  eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_373, eR_374, eR_375, eR_376,
  eR_388, eR_390, eR_398, eR_402, eR_403, eR_404, eR_408, eR_409, eR_410, eR_414, eR_415, eR_416, eR_420, eR_421, eR_422, eR_423,
  eR_425, eR_427, eR_428, eR_429, eR_430, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_441, eR_442, eR_443, eR_444, eR_445,
  eR_446, eR_447, eR_448, eR_449, eR_453, eR_454, eR_455, eR_457, eR_459, eR_460, eR_461, eR_466, eR_467, eR_468, eR_469, eR_474,
  eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_504,
  eR_505, eR_506, eR_507, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535, eR_537,
  eR_538, eR_540, eR_545, eR_546, eR_548, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568, eR_573, eR_574, eR_575, eR_576,
  eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606, eR_607, eR_608,
  eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_622, eR_624, eR_625, eR_627,
  eR_629, eR_630, eR_632, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659, eR_660, eR_665,
  eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687, eR_688, eR_697,
  eR_698, eR_699, eR_700, eR_701, eR_702, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_729, eR_730,
  eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_757, eR_758,
  eR_760, eR_765, eR_766, eR_767, eR_772, eR_773, eR_778, eR_779, eR_780, eR_781, eR_784, eR_785, eR_786, eR_787, eR_788, eR_789,
  eR_790, eR_791, eR_792, eR_793, eR_794, eR_795, eR_796, eR_797, eR_798, eR_799, eR_802, eR_803, eR_810, eR_811, eR_816, eR_817,
  eR_819, eR_820, eR_821, eR_822, eR_823, eR_824, eR_825, eR_826, eR_827, eR_828, eR_829, eR_832, eR_833, eR_838, eR_839, eR_849,
  eR_850, eR_851, eR_853, eR_854, eR_855, eR_856, eR_857, eR_862, eR_863, eR_864, eR_865, eR_872, eR_873, eR_874, eR_875, eR_884,
  eR_885, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_897, eR_898, eR_901, eR_902, eR_907, eR_908, eR_910, eR_912, eR_915,
  eR_916, eR_918, eR_920, eR_922, eR_924, eR_927, eR_931, eR_933, eR_934, eR_935, eR_939, eR_940, eR_942, eR_946, eR_947, eR_948,
  eR_950, eR_953, eR_954, eR_956, eR_957, eR_960, eR_962, eR_965, eR_967, eR_968, eR_970, eR_972, eR_974, eR_977, eR_979, eR_981,
  eR_983, eR_984, eR_986, eR_987, eR_992, eR_993, eR_994, eR_995, eR_997, eR_998, eR_999, eR_1002, eR_1004, eR_1008, eR_1012, eR_1013,
  eR_1014, eR_1016, eR_1019, eR_1020, eR_1022, eR_1023]
theorem nbOKR_187 : nbR_187 = nbhd entsR eR_187 := by decide +kernel
theorem mkOKR_187 : mkEnt 32 1024 W rR_187 187 = eR_187 := by decide +kernel
theorem tR_187 : kTermA 4294967295 eR_187 nbR_187 = 116113587454180216427197320 := by decide +kernel


end RamseyCert
