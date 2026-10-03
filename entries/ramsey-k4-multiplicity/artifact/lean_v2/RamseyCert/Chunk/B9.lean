import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_9 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_8, eB_9, eB_10, eB_11, eB_12, eB_13, eB_14, eB_15, eB_16, eB_17, eB_18, eB_19,
  eB_20, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_27, eB_28, eB_29, eB_30, eB_31, eB_32, eB_33, eB_34, eB_35,
  eB_36, eB_37, eB_38, eB_39, eB_40, eB_41, eB_42, eB_43, eB_44, eB_45, eB_46, eB_47, eB_49, eB_52, eB_53, eB_54,
  eB_55, eB_56, eB_60, eB_61, eB_62, eB_63, eB_64, eB_68, eB_69, eB_70, eB_71, eB_72, eB_76, eB_77, eB_78, eB_79,
  eB_80, eB_84, eB_85, eB_86, eB_87, eB_89, eB_92, eB_93, eB_94, eB_95, eB_136, eB_137, eB_138, eB_139, eB_140, eB_141,
  eB_142, eB_143, eB_144, eB_145, eB_146, eB_147, eB_148, eB_149, eB_150, eB_151, eB_152, eB_153, eB_154, eB_155, eB_156, eB_157,
  eB_158, eB_159, eB_164, eB_165, eB_166, eB_167, eB_170, eB_172, eB_173, eB_174, eB_175, eB_179, eB_180, eB_181, eB_182, eB_183,
  eB_187, eB_188, eB_189, eB_190, eB_191, eB_194, eB_196, eB_197, eB_198, eB_199, eB_200, eB_204, eB_205, eB_206, eB_207, eB_248,
  eB_249, eB_250, eB_251, eB_252, eB_253, eB_254, eB_255, eB_256, eB_257, eB_258, eB_264, eB_265, eB_266, eB_267, eB_272, eB_273,
  eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299, eB_304, eB_305,
  eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330, eB_331, eB_336, eB_337,
  eB_338, eB_339, eB_345, eB_346, eB_347, eB_348, eB_353, eB_354, eB_355, eB_356, eB_361, eB_362, eB_363, eB_364, eB_369, eB_370,
  eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_387, eB_388, eB_389, eB_390, eB_391, eB_392,
  eB_393, eB_394, eB_395, eB_396, eB_397, eB_398, eB_399, eB_400, eB_401, eB_423, eB_424, eB_425, eB_426, eB_431, eB_432, eB_433,
  eB_434, eB_441, eB_442, eB_443, eB_444, eB_445, eB_446, eB_457, eB_458, eB_459, eB_460, eB_461, eB_466, eB_467, eB_468, eB_469,
  eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_492, eB_493, eB_494, eB_495, eB_500, eB_501, eB_502, eB_503,
  eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535,
  eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552, eB_557, eB_558, eB_559, eB_560, eB_565, eB_566, eB_567, eB_568,
  eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584, eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600,
  eB_605, eB_606, eB_607, eB_608, eB_633, eB_634, eB_635, eB_636, eB_641, eB_642, eB_643, eB_644, eB_649, eB_650, eB_651, eB_652,
  eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684,
  eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707, eB_708, eB_713, eB_714, eB_715, eB_716,
  eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739, eB_740, eB_745, eB_746, eB_747, eB_748,
  eB_753, eB_754, eB_755, eB_756, eB_757, eB_759, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_772, eB_773, eB_778,
  eB_779, eB_780, eB_781, eB_782, eB_783, eB_784, eB_785, eB_804, eB_805, eB_812, eB_813, eB_818, eB_819, eB_820, eB_821, eB_830,
  eB_831, eB_832, eB_833, eB_836, eB_837, eB_840, eB_841, eB_842, eB_843, eB_846, eB_847, eB_850, eB_851, eB_854, eB_855, eB_856,
  eB_857, eB_866, eB_867, eB_868, eB_869, eB_870, eB_871, eB_872, eB_873, eB_874, eB_875, eB_876, eB_877, eB_882, eB_883, eB_884,
  eB_885, eB_888, eB_889, eB_890, eB_891, eB_894, eB_895, eB_896, eB_900, eB_901, eB_904, eB_905, eB_908, eB_910, eB_911, eB_912,
  eB_913, eB_915, eB_916, eB_919, eB_922, eB_924, eB_926, eB_928, eB_929, eB_930, eB_932, eB_934, eB_935, eB_937, eB_938, eB_940,
  eB_942, eB_945, eB_946, eB_947, eB_948, eB_949, eB_952, eB_956, eB_957, eB_959, eB_960, eB_961, eB_962, eB_963, eB_964, eB_968,
  eB_969, eB_971, eB_973, eB_975, eB_976, eB_978, eB_981, eB_984, eB_993, eB_994, eB_995, eB_998, eB_999, eB_1000, eB_1001, eB_1003,
  eB_1004, eB_1007, eB_1010, eB_1011, eB_1013, eB_1016, eB_1020, eB_1022, eB_1023]
theorem nbOKB_9 : nbB_9 = nbhd entsB eB_9 := by decide +kernel
theorem mkOKB_9 : mkEnt 32 1024 W rB_9 9 = eB_9 := by decide +kernel
theorem tB_9 : kTermA 4294967295 eB_9 nbB_9 = 118439297295088812168184008 := by decide +kernel


end RamseyCert
