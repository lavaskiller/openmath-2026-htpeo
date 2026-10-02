import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_325 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_15, eR_16, eR_19, eR_21, eR_23, eR_25, eR_28, eR_30, eR_32, eR_34,
  eR_37, eR_40, eR_43, eR_45, eR_47, eR_48, eR_49, eR_50, eR_51, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67,
  eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82, eR_83, eR_88, eR_89, eR_90, eR_91, eR_96, eR_97, eR_101, eR_102,
  eR_104, eR_105, eR_106, eR_108, eR_110, eR_113, eR_115, eR_117, eR_119, eR_121, eR_123, eR_124, eR_126, eR_127, eR_129, eR_130,
  eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_149, eR_151, eR_153,
  eR_155, eR_157, eR_159, eR_160, eR_161, eR_162, eR_163, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_188,
  eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_200, eR_201, eR_202, eR_203, eR_208, eR_212, eR_213, eR_214, eR_215, eR_217,
  eR_218, eR_220, eR_221, eR_223, eR_224, eR_226, eR_228, eR_230, eR_232, eR_233, eR_235, eR_237, eR_240, eR_242, eR_244, eR_245,
  eR_246, eR_247, eR_249, eR_250, eR_252, eR_253, eR_255, eR_257, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269,
  eR_270, eR_271, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301,
  eR_302, eR_303, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333,
  eR_334, eR_335, eR_340, eR_341, eR_342, eR_343, eR_344, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_365,
  eR_366, eR_367, eR_368, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_389, eR_391,
  eR_393, eR_394, eR_396, eR_397, eR_399, eR_401, eR_402, eR_406, eR_408, eR_410, eR_412, eR_414, eR_416, eR_418, eR_420, eR_422,
  eR_423, eR_425, eR_431, eR_432, eR_433, eR_434, eR_436, eR_439, eR_441, eR_443, eR_444, eR_446, eR_447, eR_451, eR_453, eR_455,
  eR_457, eR_459, eR_461, eR_466, eR_467, eR_468, eR_469, eR_471, eR_472, eR_473, eR_482, eR_483, eR_484, eR_485, eR_492, eR_493,
  eR_494, eR_495, eR_496, eR_497, eR_498, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_524, eR_525, eR_526, eR_527,
  eR_528, eR_530, eR_531, eR_537, eR_538, eR_539, eR_540, eR_549, eR_552, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567,
  eR_568, eR_569, eR_570, eR_571, eR_572, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_597, eR_598, eR_599,
  eR_600, eR_601, eR_602, eR_603, eR_604, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_622, eR_624, eR_625,
  eR_627, eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655,
  eR_656, eR_665, eR_666, eR_667, eR_668, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_689, eR_690, eR_691, eR_692,
  eR_697, eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_717, eR_719, eR_720, eR_729,
  eR_730, eR_731, eR_732, eR_734, eR_735, eR_736, eR_745, eR_746, eR_747, eR_748, eR_750, eR_751, eR_752, eR_761, eR_762, eR_763,
  eR_764, eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_774, eR_775, eR_778, eR_779, eR_782, eR_790, eR_791, eR_792,
  eR_793, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_810, eR_811, eR_815, eR_816, eR_817, eR_830, eR_831, eR_836, eR_837,
  eR_838, eR_839, eR_840, eR_841, eR_844, eR_845, eR_850, eR_851, eR_854, eR_855, eR_856, eR_857, eR_866, eR_867, eR_868, eR_869,
  eR_870, eR_871, eR_872, eR_873, eR_880, eR_881, eR_884, eR_885, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_894, eR_895,
  eR_896, eR_897, eR_906, eR_907, eR_910, eR_912, eR_913, eR_914, eR_915, eR_916, eR_917, eR_918, eR_920, eR_921, eR_922, eR_923,
  eR_926, eR_927, eR_928, eR_931, eR_932, eR_934, eR_939, eR_946, eR_948, eR_949, eR_950, eR_953, eR_954, eR_955, eR_956, eR_957,
  eR_958, eR_959, eR_961, eR_962, eR_972, eR_974, eR_975, eR_976, eR_978, eR_979, eR_980, eR_983, eR_985, eR_986, eR_988, eR_990,
  eR_992, eR_994, eR_995, eR_997, eR_998, eR_999, eR_1001, eR_1004, eR_1005, eR_1006, eR_1007, eR_1008, eR_1009, eR_1010, eR_1011, eR_1013,
  eR_1014, eR_1015, eR_1019, eR_1021]
theorem nbOKR_325 : nbR_325 = nbhd entsR eR_325 := by decide +kernel
theorem mkOKR_325 : mkEnt 32 1024 W rR_325 325 = eR_325 := by decide +kernel
theorem tR_325 : kTermA 4294967295 eR_325 nbR_325 = 82272387092979661529406240 := by decide +kernel


end RamseyCert
