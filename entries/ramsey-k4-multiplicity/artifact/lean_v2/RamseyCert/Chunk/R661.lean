import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_661 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_18, eR_28, eR_29, eR_31, eR_32, eR_33,
  eR_36, eR_39, eR_43, eR_44, eR_46, eR_47, eR_52, eR_53, eR_54, eR_55, eR_60, eR_61, eR_62, eR_63, eR_65, eR_66,
  eR_67, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_91, eR_96, eR_97, eR_98, eR_100,
  eR_101, eR_105, eR_106, eR_107, eR_109, eR_110, eR_112, eR_113, eR_115, eR_116, eR_118, eR_119, eR_121, eR_122, eR_126, eR_129,
  eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_142, eR_145, eR_149, eR_150, eR_152, eR_153, eR_155, eR_156,
  eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_176, eR_178, eR_179, eR_188, eR_189, eR_190,
  eR_191, eR_196, eR_197, eR_198, eR_199, eR_201, eR_202, eR_203, eR_208, eR_209, eR_211, eR_212, eR_214, eR_217, eR_220, eR_223,
  eR_226, eR_227, eR_228, eR_230, eR_231, eR_233, eR_234, eR_236, eR_237, eR_239, eR_240, eR_242, eR_243, eR_245, eR_246, eR_247,
  eR_248, eR_249, eR_251, eR_252, eR_253, eR_254, eR_256, eR_257, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275,
  eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_304, eR_305, eR_306, eR_307,
  eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339,
  eR_341, eR_342, eR_343, eR_344, eR_349, eR_350, eR_351, eR_352, eR_361, eR_363, eR_365, eR_366, eR_367, eR_368, eR_373, eR_374,
  eR_375, eR_376, eR_387, eR_388, eR_389, eR_390, eR_392, eR_393, eR_395, eR_396, eR_397, eR_398, eR_400, eR_401, eR_402, eR_403,
  eR_407, eR_410, eR_413, eR_416, eR_419, eR_422, eR_423, eR_424, eR_425, eR_426, eR_427, eR_428, eR_429, eR_430, eR_435, eR_436,
  eR_438, eR_439, eR_442, eR_443, eR_445, eR_446, eR_447, eR_448, eR_452, eR_455, eR_457, eR_458, eR_460, eR_461, eR_462, eR_463,
  eR_464, eR_465, eR_474, eR_475, eR_477, eR_482, eR_483, eR_485, eR_492, eR_495, eR_496, eR_497, eR_498, eR_499, eR_504, eR_505,
  eR_506, eR_507, eR_516, eR_517, eR_519, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_541, eR_542, eR_543,
  eR_544, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568, eR_573, eR_574, eR_575,
  eR_576, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_605, eR_606, eR_607,
  eR_608, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627,
  eR_628, eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655,
  eR_656, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_682, eR_683, eR_689, eR_691, eR_692, eR_693, eR_694,
  eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_725, eR_726, eR_727,
  eR_728, eR_737, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_761, eR_762, eR_763, eR_764,
  eR_768, eR_769, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_782, eR_783, eR_788, eR_789, eR_792, eR_793, eR_796, eR_797,
  eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_806, eR_807, eR_808, eR_809, eR_810, eR_811, eR_816, eR_817, eR_818, eR_819,
  eR_824, eR_825, eR_830, eR_831, eR_836, eR_837, eR_841, eR_846, eR_847, eR_850, eR_851, eR_856, eR_857, eR_860, eR_861, eR_862,
  eR_863, eR_874, eR_875, eR_882, eR_883, eR_888, eR_889, eR_890, eR_891, eR_894, eR_895, eR_897, eR_898, eR_899, eR_904, eR_907,
  eR_908, eR_909, eR_910, eR_913, eR_915, eR_916, eR_919, eR_921, eR_922, eR_923, eR_925, eR_927, eR_930, eR_931, eR_933, eR_935,
  eR_937, eR_938, eR_939, eR_942, eR_944, eR_947, eR_949, eR_950, eR_952, eR_953, eR_954, eR_957, eR_958, eR_961, eR_964, eR_965,
  eR_967, eR_968, eR_971, eR_972, eR_973, eR_974, eR_975, eR_976, eR_977, eR_981, eR_982, eR_984, eR_985, eR_986, eR_987, eR_988,
  eR_990, eR_991, eR_996, eR_997, eR_998, eR_1000, eR_1003, eR_1004, eR_1010, eR_1012, eR_1015, eR_1017, eR_1020, eR_1021, eR_1022]
theorem nbOKR_661 : nbR_661 = nbhd entsR eR_661 := by decide +kernel
theorem mkOKR_661 : mkEnt 32 1024 W rR_661 661 = eR_661 := by decide +kernel
theorem tR_661 : kTermA 4294967295 eR_661 nbR_661 = 79611012962007802864373700 := by decide +kernel


end RamseyCert
