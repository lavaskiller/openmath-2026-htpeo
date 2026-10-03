import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_644 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_18, eR_19, eR_20, eR_27, eR_28, eR_29, eR_30, eR_31,
  eR_32, eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_42, eR_43, eR_44, eR_45, eR_46, eR_47,
  eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_76, eR_77, eR_78, eR_79,
  eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_96, eR_103, eR_104, eR_105, eR_124, eR_125, eR_126, eR_127,
  eR_128, eR_129, eR_130, eR_131, eR_132, eR_133, eR_134, eR_135, eR_148, eR_149, eR_150, eR_151, eR_152, eR_153, eR_154, eR_155,
  eR_156, eR_157, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183,
  eR_184, eR_185, eR_186, eR_187, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205, eR_206, eR_207, eR_208, eR_209, eR_210, eR_211,
  eR_212, eR_213, eR_227, eR_228, eR_229, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238, eR_239, eR_240,
  eR_241, eR_242, eR_243, eR_244, eR_248, eR_249, eR_250, eR_253, eR_254, eR_255, eR_259, eR_264, eR_265, eR_267, eR_272, eR_273,
  eR_275, eR_281, eR_282, eR_283, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303, eR_308,
  eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335, eR_340,
  eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_356, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_373,
  eR_374, eR_375, eR_376, eR_385, eR_386, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_399, eR_400, eR_401, eR_405, eR_406,
  eR_407, eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416, eR_417, eR_418, eR_419, eR_420, eR_421, eR_422,
  eR_423, eR_424, eR_425, eR_426, eR_433, eR_434, eR_450, eR_451, eR_452, eR_453, eR_454, eR_455, eR_457, eR_458, eR_466, eR_467,
  eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497,
  eR_498, eR_499, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529,
  eR_530, eR_531, eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566,
  eR_567, eR_568, eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_585, eR_587, eR_588, eR_593, eR_595, eR_596,
  eR_601, eR_602, eR_604, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_630,
  eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659, eR_660, eR_665, eR_666,
  eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687, eR_688, eR_694, eR_695,
  eR_696, eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_729, eR_730, eR_731,
  eR_732, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762, eR_763,
  eR_764, eR_765, eR_766, eR_767, eR_768, eR_769, eR_772, eR_773, eR_780, eR_781, eR_782, eR_783, eR_786, eR_787, eR_798, eR_799,
  eR_802, eR_803, eR_810, eR_811, eR_812, eR_813, eR_814, eR_815, eR_816, eR_817, eR_822, eR_823, eR_828, eR_829, eR_832, eR_833,
  eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_842, eR_843, eR_844, eR_845, eR_846, eR_847, eR_856, eR_857, eR_860, eR_861,
  eR_868, eR_869, eR_874, eR_875, eR_884, eR_885, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_894, eR_895, eR_896, eR_898,
  eR_899, eR_901, eR_902, eR_903, eR_904, eR_906, eR_907, eR_908, eR_909, eR_910, eR_912, eR_915, eR_918, eR_919, eR_920, eR_921,
  eR_924, eR_926, eR_928, eR_929, eR_930, eR_934, eR_935, eR_937, eR_938, eR_941, eR_943, eR_944, eR_945, eR_946, eR_952, eR_953,
  eR_955, eR_956, eR_957, eR_958, eR_959, eR_962, eR_965, eR_967, eR_969, eR_970, eR_971, eR_974, eR_976, eR_977, eR_982, eR_983,
  eR_985, eR_989, eR_990, eR_996, eR_997, eR_1001, eR_1002, eR_1003, eR_1005, eR_1008, eR_1009, eR_1010, eR_1012, eR_1014, eR_1015, eR_1016,
  eR_1019, eR_1020, eR_1022]
theorem nbOKR_644 : nbR_644 = nbhd entsR eR_644 := by decide +kernel
theorem mkOKR_644 : mkEnt 32 1024 W rR_644 644 = eR_644 := by decide +kernel
theorem tR_644 : kTermA 4294967295 eR_644 nbR_644 = 123113544760141578042226200 := by decide +kernel


end RamseyCert
