import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_1008 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_14, eR_15, eR_18, eR_19, eR_20, eR_33,
  eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_52, eR_53, eR_54, eR_55, eR_60, eR_61, eR_62, eR_63,
  eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_75, eR_81, eR_82, eR_83, eR_92, eR_93, eR_94, eR_95, eR_97, eR_98,
  eR_99, eR_100, eR_101, eR_102, eR_106, eR_107, eR_108, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_115, eR_116, eR_117,
  eR_118, eR_119, eR_120, eR_121, eR_122, eR_123, eR_136, eR_137, eR_138, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145,
  eR_146, eR_147, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185,
  eR_186, eR_192, eR_193, eR_195, eR_204, eR_205, eR_206, eR_207, eR_208, eR_209, eR_210, eR_211, eR_212, eR_213, eR_227, eR_228,
  eR_229, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238, eR_239, eR_240, eR_241, eR_242, eR_243, eR_244,
  eR_248, eR_249, eR_250, eR_255, eR_256, eR_257, eR_258, eR_264, eR_267, eR_272, eR_273, eR_274, eR_275, eR_280, eR_281, eR_282,
  eR_283, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303, eR_308, eR_309, eR_310,
  eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335, eR_341, eR_342, eR_343,
  eR_344, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378, eR_379,
  eR_380, eR_381, eR_382, eR_383, eR_384, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_399, eR_400, eR_401, eR_405, eR_406,
  eR_407, eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416, eR_417, eR_418, eR_419, eR_420, eR_421, eR_422,
  eR_432, eR_433, eR_434, eR_441, eR_442, eR_443, eR_444, eR_445, eR_446, eR_450, eR_451, eR_452, eR_453, eR_454, eR_455, eR_459,
  eR_460, eR_461, eR_466, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_488, eR_489, eR_490, eR_491,
  eR_496, eR_497, eR_498, eR_499, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523,
  eR_528, eR_529, eR_530, eR_531, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556,
  eR_561, eR_562, eR_563, eR_564, eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_589, eR_590, eR_591, eR_592,
  eR_597, eR_598, eR_599, eR_600, eR_605, eR_606, eR_607, eR_608, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628,
  eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659, eR_660,
  eR_665, eR_666, eR_667, eR_668, eR_673, eR_675, eR_676, eR_681, eR_683, eR_684, eR_689, eR_690, eR_692, eR_693, eR_694, eR_695,
  eR_696, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_725, eR_726, eR_727,
  eR_728, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_761, eR_762, eR_763,
  eR_764, eR_765, eR_766, eR_767, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_782, eR_783, eR_788, eR_789,
  eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_812, eR_813, eR_814, eR_815,
  eR_820, eR_821, eR_828, eR_829, eR_834, eR_835, eR_836, eR_837, eR_840, eR_841, eR_846, eR_847, eR_848, eR_849, eR_850, eR_851,
  eR_858, eR_859, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_868, eR_869, eR_870, eR_871, eR_872, eR_873, eR_880, eR_881,
  eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_894, eR_895, eR_897, eR_898, eR_899, eR_901, eR_902, eR_904, eR_905, eR_909,
  eR_910, eR_911, eR_912, eR_913, eR_914, eR_916, eR_918, eR_920, eR_922, eR_925, eR_926, eR_929, eR_931, eR_934, eR_935, eR_936,
  eR_937, eR_939, eR_941, eR_942, eR_943, eR_944, eR_946, eR_950, eR_953, eR_955, eR_957, eR_958, eR_959, eR_961, eR_972, eR_973,
  eR_974, eR_979, eR_981, eR_984, eR_988, eR_989, eR_990, eR_992, eR_993, eR_995, eR_1002, eR_1003, eR_1005, eR_1007, eR_1012, eR_1013,
  eR_1015, eR_1016, eR_1017, eR_1018, eR_1019, eR_1022, eR_1023]
theorem nbOKR_1008 : nbR_1008 = nbhd entsR eR_1008 := by decide +kernel
theorem mkOKR_1008 : mkEnt 32 1024 W rR_1008 1008 = eR_1008 := by decide +kernel
theorem tR_1008 : kTermA 4294967295 eR_1008 nbR_1008 = 78927448286189885412072888 := by decide +kernel


end RamseyCert
