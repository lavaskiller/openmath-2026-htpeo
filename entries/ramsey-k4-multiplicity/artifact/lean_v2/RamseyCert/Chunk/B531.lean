import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_531 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_15, eB_17, eB_20, eB_22, eB_24, eB_26, eB_29, eB_30, eB_31, eB_35, eB_38, eB_41,
  eB_44, eB_45, eB_46, eB_48, eB_49, eB_50, eB_51, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_76,
  eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_92, eB_93, eB_94, eB_95, eB_98, eB_100, eB_102, eB_104, eB_107,
  eB_108, eB_109, eB_112, eB_116, eB_117, eB_118, eB_122, eB_123, eB_124, eB_127, eB_130, eB_141, eB_144, eB_147, eB_150, eB_151,
  eB_152, eB_156, eB_157, eB_158, eB_164, eB_165, eB_166, eB_167, eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179,
  eB_184, eB_185, eB_186, eB_187, eB_196, eB_197, eB_198, eB_199, eB_200, eB_201, eB_202, eB_203, eB_208, eB_210, eB_212, eB_214,
  eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_225, eB_226, eB_228, eB_229, eB_230, eB_233, eB_237, eB_238, eB_240, eB_241,
  eB_242, eB_245, eB_246, eB_247, eB_248, eB_250, eB_251, eB_253, eB_255, eB_257, eB_260, eB_261, eB_262, eB_263, eB_268, eB_269,
  eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_287, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_300,
  eB_301, eB_302, eB_303, eB_309, eB_312, eB_313, eB_314, eB_315, eB_318, eB_320, eB_321, eB_322, eB_323, eB_327, eB_328, eB_329,
  eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_341, eB_342, eB_343, eB_344, eB_352, eB_353, eB_354, eB_355, eB_356, eB_357,
  eB_358, eB_359, eB_360, eB_365, eB_366, eB_367, eB_368, eB_375, eB_377, eB_378, eB_379, eB_380, eB_388, eB_390, eB_391, eB_392,
  eB_394, eB_395, eB_398, eB_399, eB_400, eB_403, eB_406, eB_407, eB_408, eB_412, eB_413, eB_414, eB_418, eB_419, eB_420, eB_423,
  eB_425, eB_431, eB_432, eB_433, eB_434, eB_435, eB_438, eB_443, eB_446, eB_448, eB_451, eB_452, eB_453, eB_457, eB_461, eB_466,
  eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_488, eB_489, eB_490, eB_491, eB_496,
  eB_497, eB_498, eB_499, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_528,
  eB_529, eB_530, eB_531, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_553, eB_554, eB_555, eB_556, eB_558,
  eB_561, eB_562, eB_563, eB_564, eB_566, eB_568, eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586,
  eB_587, eB_588, eB_590, eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_609, eB_612, eB_615, eB_618, eB_622,
  eB_624, eB_625, eB_627, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_645, eB_646, eB_647, eB_648, eB_650,
  eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_677, eB_678, eB_679, eB_680,
  eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_698, eB_705, eB_706, eB_707, eB_708, eB_713, eB_714, eB_715,
  eB_716, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736, eB_741, eB_742, eB_743,
  eB_744, eB_750, eB_752, eB_753, eB_754, eB_755, eB_756, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_768, eB_769,
  eB_770, eB_771, eB_772, eB_773, eB_774, eB_775, eB_776, eB_777, eB_778, eB_779, eB_780, eB_781, eB_786, eB_787, eB_790, eB_791,
  eB_794, eB_795, eB_796, eB_797, eB_800, eB_801, eB_802, eB_803, eB_804, eB_805, eB_808, eB_809, eB_834, eB_835, eB_842, eB_843,
  eB_848, eB_849, eB_850, eB_851, eB_862, eB_863, eB_868, eB_869, eB_874, eB_875, eB_876, eB_877, eB_878, eB_879, eB_880, eB_881,
  eB_884, eB_885, eB_890, eB_891, eB_892, eB_893, eB_894, eB_895, eB_896, eB_897, eB_899, eB_900, eB_902, eB_903, eB_904, eB_907,
  eB_909, eB_911, eB_915, eB_918, eB_919, eB_920, eB_924, eB_927, eB_928, eB_929, eB_933, eB_934, eB_936, eB_939, eB_941, eB_942,
  eB_947, eB_948, eB_949, eB_950, eB_952, eB_954, eB_955, eB_957, eB_958, eB_959, eB_960, eB_961, eB_962, eB_964, eB_965, eB_968,
  eB_971, eB_973, eB_974, eB_978, eB_982, eB_983, eB_986, eB_987, eB_992, eB_993, eB_995, eB_997, eB_998, eB_1003, eB_1005, eB_1006,
  eB_1009, eB_1010, eB_1011, eB_1012, eB_1013, eB_1014, eB_1015, eB_1016, eB_1020, eB_1021]
theorem nbOKB_531 : nbB_531 = nbhd entsB eB_531 := by decide +kernel
theorem mkOKB_531 : mkEnt 32 1024 W rB_531 531 = eB_531 := by decide +kernel
theorem tB_531 : kTermA 4294967295 eB_531 nbB_531 = 119689433791675746798996257 := by decide +kernel


end RamseyCert
