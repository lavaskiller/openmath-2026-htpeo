import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_729 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_14, eR_17, eR_18, eR_19, eR_22, eR_24,
  eR_26, eR_29, eR_30, eR_31, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_44, eR_45, eR_46, eR_52, eR_53, eR_54,
  eR_55, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82,
  eR_83, eR_88, eR_89, eR_90, eR_91, eR_97, eR_99, eR_101, eR_104, eR_106, eR_110, eR_111, eR_113, eR_114, eR_115, eR_119,
  eR_120, eR_121, eR_124, eR_127, eR_130, eR_136, eR_137, eR_138, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_150, eR_151,
  eR_152, eR_156, eR_157, eR_158, eR_160, eR_161, eR_162, eR_163, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183,
  eR_184, eR_185, eR_186, eR_187, eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_207, eR_209, eR_211, eR_213, eR_214,
  eR_216, eR_217, eR_219, eR_220, eR_222, eR_223, eR_225, eR_226, eR_227, eR_231, eR_232, eR_234, eR_235, eR_236, eR_239, eR_243,
  eR_244, eR_245, eR_246, eR_247, eR_248, eR_250, eR_252, eR_254, eR_255, eR_257, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268,
  eR_269, eR_270, eR_271, eR_276, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_297, eR_299, eR_304, eR_305, eR_306, eR_307,
  eR_308, eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_339, eR_340,
  eR_345, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_377,
  eR_379, eR_380, eR_385, eR_386, eR_387, eR_389, eR_391, eR_392, eR_394, eR_395, eR_397, eR_399, eR_400, eR_402, eR_404, eR_406,
  eR_407, eR_408, eR_412, eR_413, eR_414, eR_418, eR_419, eR_420, eR_424, eR_426, eR_427, eR_428, eR_429, eR_430, eR_436, eR_437,
  eR_439, eR_440, eR_443, eR_446, eR_447, eR_449, eR_451, eR_452, eR_453, eR_456, eR_458, eR_461, eR_462, eR_463, eR_464, eR_465,
  eR_470, eR_471, eR_472, eR_473, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497,
  eR_498, eR_499, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531,
  eR_536, eR_537, eR_538, eR_540, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566, eR_567, eR_568,
  eR_570, eR_571, eR_572, eR_577, eR_579, eR_580, eR_585, eR_586, eR_588, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606, eR_607,
  eR_608, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_622, eR_624, eR_625, eR_627, eR_633, eR_634, eR_635,
  eR_636, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658, eR_659, eR_660, eR_665, eR_666, eR_667,
  eR_668, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687, eR_688, eR_697, eR_698, eR_699,
  eR_700, eR_701, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728,
  eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762, eR_763, eR_764,
  eR_765, eR_766, eR_767, eR_769, eR_770, eR_771, eR_772, eR_773, eR_776, eR_777, eR_778, eR_779, eR_780, eR_781, eR_782, eR_783,
  eR_784, eR_785, eR_786, eR_787, eR_788, eR_789, eR_790, eR_791, eR_792, eR_793, eR_796, eR_797, eR_802, eR_803, eR_804, eR_805,
  eR_806, eR_807, eR_809, eR_812, eR_813, eR_816, eR_817, eR_819, eR_820, eR_821, eR_824, eR_825, eR_826, eR_827, eR_838, eR_839,
  eR_842, eR_843, eR_854, eR_855, eR_856, eR_857, eR_860, eR_861, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_878, eR_879,
  eR_882, eR_883, eR_884, eR_885, eR_890, eR_891, eR_894, eR_895, eR_898, eR_901, eR_902, eR_903, eR_906, eR_909, eR_910, eR_913,
  eR_914, eR_917, eR_918, eR_919, eR_921, eR_922, eR_928, eR_929, eR_930, eR_931, eR_933, eR_937, eR_939, eR_941, eR_942, eR_943,
  eR_945, eR_946, eR_947, eR_948, eR_951, eR_955, eR_957, eR_958, eR_960, eR_964, eR_969, eR_970, eR_971, eR_972, eR_973, eR_975,
  eR_977, eR_979, eR_984, eR_986, eR_990, eR_991, eR_992, eR_994, eR_995, eR_997, eR_999, eR_1002, eR_1003, eR_1006, eR_1007, eR_1010,
  eR_1014, eR_1017, eR_1019, eR_1020, eR_1021, eR_1022]
theorem nbOKR_729 : nbR_729 = nbhd entsR eR_729 := by decide +kernel
theorem mkOKR_729 : mkEnt 32 1024 W rR_729 729 = eR_729 := by decide +kernel
theorem tR_729 : kTermA 4294967295 eR_729 nbR_729 = 117612381740094911480203632 := by decide +kernel


end RamseyCert
