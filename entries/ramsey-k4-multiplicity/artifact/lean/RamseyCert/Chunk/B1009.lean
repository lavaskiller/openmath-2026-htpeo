import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_1009 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_10, eB_13, eB_14, eB_20, eB_29, eB_32, eB_35, eB_38,
  eB_41, eB_44, eB_47, eB_48, eB_49, eB_50, eB_51, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_76,
  eB_77, eB_78, eB_79, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_96, eB_97, eB_99, eB_100, eB_102,
  eB_104, eB_107, eB_108, eB_110, eB_111, eB_113, eB_114, eB_116, eB_117, eB_119, eB_120, eB_122, eB_123, eB_124, eB_127, eB_130,
  eB_133, eB_134, eB_135, eB_139, eB_140, eB_142, eB_143, eB_145, eB_146, eB_150, eB_153, eB_156, eB_159, eB_160, eB_164, eB_165,
  eB_166, eB_167, eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187, eB_192, eB_193,
  eB_194, eB_195, eB_204, eB_205, eB_206, eB_207, eB_209, eB_212, eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_225, eB_226,
  eB_227, eB_230, eB_233, eB_236, eB_239, eB_242, eB_249, eB_253, eB_254, eB_255, eB_256, eB_258, eB_259, eB_264, eB_265, eB_266,
  eB_267, eB_268, eB_269, eB_270, eB_271, eB_273, eB_276, eB_277, eB_278, eB_279, eB_282, eB_288, eB_289, eB_290, eB_291, eB_296,
  eB_297, eB_298, eB_299, eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_312, eB_320, eB_321, eB_322, eB_323,
  eB_328, eB_329, eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_337, eB_340, eB_345, eB_346, eB_347, eB_348, eB_353, eB_354,
  eB_355, eB_356, eB_361, eB_362, eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_379, eB_385,
  eB_386, eB_393, eB_396, eB_401, eB_402, eB_404, eB_405, eB_408, eB_411, eB_414, eB_417, eB_420, eB_423, eB_424, eB_425, eB_426,
  eB_431, eB_432, eB_433, eB_434, eB_436, eB_437, eB_439, eB_440, eB_441, eB_442, eB_444, eB_445, eB_447, eB_449, eB_450, eB_453,
  eB_457, eB_458, eB_459, eB_460, eB_462, eB_463, eB_464, eB_465, eB_470, eB_471, eB_472, eB_473, eB_482, eB_483, eB_484, eB_485,
  eB_492, eB_493, eB_494, eB_495, eB_500, eB_501, eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_516, eB_517, eB_518, eB_519,
  eB_524, eB_525, eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_538, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547,
  eB_548, eB_553, eB_554, eB_555, eB_556, eB_562, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_577, eB_578,
  eB_579, eB_580, eB_585, eB_586, eB_587, eB_588, eB_593, eB_597, eB_598, eB_599, eB_600, eB_602, eB_605, eB_606, eB_607, eB_608,
  eB_609, eB_612, eB_615, eB_618, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_648, eB_649, eB_650, eB_651,
  eB_652, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683,
  eB_684, eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704, eB_709, eB_710, eB_711,
  eB_712, eB_717, eB_718, eB_719, eB_720, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_741, eB_742, eB_743,
  eB_744, eB_753, eB_754, eB_755, eB_756, eB_758, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_768, eB_769, eB_784,
  eB_785, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_796, eB_797, eB_798, eB_799, eB_800, eB_801, eB_809, eB_816, eB_817,
  eB_820, eB_821, eB_826, eB_827, eB_830, eB_831, eB_836, eB_837, eB_840, eB_841, eB_842, eB_843, eB_845, eB_848, eB_849, eB_850,
  eB_851, eB_856, eB_857, eB_858, eB_859, eB_860, eB_861, eB_864, eB_865, eB_866, eB_867, eB_872, eB_873, eB_876, eB_877, eB_878,
  eB_879, eB_880, eB_881, eB_882, eB_883, eB_884, eB_885, eB_886, eB_887, eB_894, eB_895, eB_896, eB_899, eB_901, eB_903, eB_904,
  eB_905, eB_906, eB_907, eB_908, eB_910, eB_912, eB_914, eB_915, eB_917, eB_918, eB_919, eB_922, eB_923, eB_929, eB_930, eB_931,
  eB_933, eB_935, eB_937, eB_941, eB_942, eB_947, eB_948, eB_950, eB_952, eB_954, eB_956, eB_958, eB_959, eB_963, eB_966, eB_967,
  eB_970, eB_972, eB_974, eB_976, eB_979, eB_981, eB_982, eB_985, eB_988, eB_989, eB_991, eB_992, eB_993, eB_994, eB_995, eB_998,
  eB_1000, eB_1002, eB_1005, eB_1007, eB_1008, eB_1009, eB_1014, eB_1016, eB_1017, eB_1020, eB_1021]
theorem nbOKB_1009 : nbB_1009 = nbhd entsB eB_1009 := by decide +kernel
theorem mkOKB_1009 : mkEnt 32 1024 W rB_1009 1009 = eB_1009 := by decide +kernel
theorem tB_1009 : kTermA 4294967295 eB_1009 nbB_1009 = 74808323565150772214012720 := by decide +kernel


end RamseyCert
