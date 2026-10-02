import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_887 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_13, eR_14, eR_15, eR_16, eR_18, eR_19, eR_20, eR_21, eR_23, eR_25, eR_30, eR_31,
  eR_32, eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_45, eR_46, eR_47, eR_52, eR_53, eR_54,
  eR_55, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_83,
  eR_88, eR_89, eR_90, eR_91, eR_100, eR_101, eR_102, eR_103, eR_104, eR_105, eR_106, eR_107, eR_108, eR_115, eR_116, eR_117,
  eR_121, eR_122, eR_123, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_139, eR_140, eR_141, eR_142,
  eR_143, eR_144, eR_145, eR_146, eR_147, eR_151, eR_152, eR_153, eR_157, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168,
  eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186, eR_187, eR_196, eR_197, eR_198, eR_199, eR_204,
  eR_205, eR_206, eR_207, eR_208, eR_209, eR_210, eR_214, eR_227, eR_228, eR_229, eR_236, eR_237, eR_238, eR_239, eR_240, eR_241,
  eR_245, eR_246, eR_247, eR_252, eR_254, eR_255, eR_256, eR_257, eR_258, eR_264, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271,
  eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_304, eR_306, eR_307, eR_312, eR_314,
  eR_315, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335, eR_341, eR_342, eR_343,
  eR_344, eR_353, eR_354, eR_356, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_373, eR_374, eR_375, eR_376,
  eR_387, eR_389, eR_397, eR_402, eR_403, eR_404, eR_405, eR_406, eR_407, eR_411, eR_412, eR_413, eR_417, eR_418, eR_419, eR_424,
  eR_426, eR_427, eR_428, eR_429, eR_430, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_441, eR_442, eR_443, eR_444, eR_445,
  eR_446, eR_447, eR_448, eR_449, eR_450, eR_451, eR_452, eR_458, eR_459, eR_460, eR_461, eR_466, eR_467, eR_468, eR_469, eR_474,
  eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502, eR_503, eR_508,
  eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_541,
  eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_569, eR_570,
  eR_572, eR_577, eR_579, eR_580, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606, eR_607, eR_608,
  eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_621, eR_623, eR_626, eR_628,
  eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659, eR_660,
  eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687, eR_688,
  eR_693, eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_725,
  eR_726, eR_727, eR_728, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_757,
  eR_759, eR_760, eR_765, eR_766, eR_767, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_786, eR_787, eR_790,
  eR_791, eR_792, eR_793, eR_794, eR_795, eR_800, eR_801, eR_806, eR_807, eR_810, eR_811, eR_814, eR_815, eR_816, eR_817, eR_820,
  eR_821, eR_822, eR_823, eR_824, eR_825, eR_826, eR_827, eR_830, eR_831, eR_834, eR_835, eR_838, eR_839, eR_842, eR_843, eR_850,
  eR_851, eR_852, eR_853, eR_858, eR_859, eR_860, eR_861, eR_866, eR_867, eR_872, eR_873, eR_880, eR_881, eR_884, eR_885, eR_896,
  eR_899, eR_900, eR_901, eR_907, eR_909, eR_910, eR_912, eR_914, eR_919, eR_922, eR_924, eR_925, eR_927, eR_928, eR_930, eR_932,
  eR_933, eR_934, eR_936, eR_938, eR_941, eR_942, eR_943, eR_944, eR_945, eR_946, eR_949, eR_952, eR_954, eR_955, eR_957, eR_958,
  eR_963, eR_964, eR_965, eR_967, eR_970, eR_971, eR_975, eR_976, eR_977, eR_978, eR_981, eR_983, eR_984, eR_986, eR_987, eR_988,
  eR_989, eR_990, eR_993, eR_994, eR_995, eR_997, eR_999, eR_1001, eR_1005, eR_1010, eR_1013, eR_1014, eR_1015, eR_1016, eR_1017, eR_1022,
  eR_1023]
theorem nbOKR_887 : nbR_887 = nbhd entsR eR_887 := by decide +kernel
theorem mkOKR_887 : mkEnt 32 1024 W rR_887 887 = eR_887 := by decide +kernel
theorem tR_887 : kTermA 4294967295 eR_887 nbR_887 = 36850725780778892034220080 := by decide +kernel


end RamseyCert
