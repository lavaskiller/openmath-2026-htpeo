import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_74 : List Ent := [
  eR_8, eR_9, eR_11, eR_13, eR_14, eR_15, eR_17, eR_18, eR_19, eR_20, eR_22, eR_24, eR_26, eR_27, eR_28, eR_29,
  eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_42, eR_43, eR_44, eR_48, eR_49, eR_50, eR_51,
  eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82, eR_83,
  eR_92, eR_93, eR_94, eR_95, eR_96, eR_100, eR_101, eR_102, eR_106, eR_107, eR_108, eR_115, eR_116, eR_117, eR_121, eR_122,
  eR_123, eR_133, eR_134, eR_135, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_148, eR_149, eR_150,
  eR_154, eR_155, eR_156, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_186,
  eR_187, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_208, eR_209, eR_210, eR_215, eR_216, eR_217, eR_218,
  eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229, eR_236, eR_237, eR_238, eR_239, eR_240,
  eR_241, eR_248, eR_249, eR_250, eR_252, eR_254, eR_264, eR_265, eR_267, eR_268, eR_269, eR_270, eR_271, eR_276, eR_277, eR_278,
  eR_279, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303, eR_308, eR_309, eR_310,
  eR_311, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346, eR_348, eR_349,
  eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_373, eR_374, eR_375, eR_376, eR_381,
  eR_382, eR_383, eR_384, eR_387, eR_389, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_397, eR_399, eR_400, eR_401, eR_402,
  eR_403, eR_404, eR_408, eR_409, eR_410, eR_414, eR_415, eR_416, eR_420, eR_421, eR_422, eR_424, eR_426, eR_431, eR_432, eR_433,
  eR_434, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_447, eR_448, eR_449, eR_453, eR_454, eR_455, eR_458, eR_462, eR_463,
  eR_464, eR_465, eR_470, eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501,
  eR_502, eR_503, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529,
  eR_530, eR_531, eR_537, eR_538, eR_539, eR_545, eR_548, eR_553, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568, eR_573, eR_574,
  eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606,
  eR_607, eR_608, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_622, eR_624,
  eR_625, eR_627, eR_629, eR_630, eR_632, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659,
  eR_660, eR_665, eR_666, eR_667, eR_668, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691,
  eR_692, eR_697, eR_698, eR_699, eR_700, eR_701, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720,
  eR_725, eR_726, eR_727, eR_728, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756,
  eR_757, eR_758, eR_759, eR_760, eR_772, eR_773, eR_776, eR_777, eR_782, eR_783, eR_784, eR_785, eR_786, eR_787, eR_788, eR_789,
  eR_790, eR_791, eR_792, eR_793, eR_800, eR_801, eR_806, eR_807, eR_812, eR_813, eR_814, eR_815, eR_819, eR_820, eR_821, eR_826,
  eR_827, eR_828, eR_829, eR_830, eR_831, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_842, eR_843, eR_848,
  eR_849, eR_852, eR_854, eR_855, eR_856, eR_857, eR_858, eR_859, eR_860, eR_861, eR_868, eR_869, eR_870, eR_871, eR_874, eR_875,
  eR_876, eR_877, eR_878, eR_879, eR_880, eR_881, eR_882, eR_883, eR_888, eR_889, eR_892, eR_893, eR_904, eR_907, eR_911, eR_912,
  eR_916, eR_917, eR_918, eR_919, eR_920, eR_921, eR_922, eR_927, eR_930, eR_933, eR_935, eR_938, eR_939, eR_941, eR_942, eR_944,
  eR_946, eR_953, eR_957, eR_958, eR_959, eR_960, eR_961, eR_962, eR_963, eR_964, eR_967, eR_969, eR_972, eR_975, eR_977, eR_978,
  eR_979, eR_980, eR_982, eR_985, eR_987, eR_988, eR_991, eR_995, eR_997, eR_1001, eR_1002, eR_1003, eR_1006, eR_1007, eR_1009, eR_1011,
  eR_1012, eR_1013, eR_1015, eR_1016, eR_1020, eR_1021, eR_1022, eR_1023]
theorem nbOKR_74 : nbR_74 = nbhd entsR eR_74 := by decide +kernel
theorem mkOKR_74 : mkEnt 32 1024 W rR_74 74 = eR_74 := by decide +kernel
theorem tR_74 : kTermA 4294967295 eR_74 nbR_74 = 118061717991308519276785176 := by decide +kernel


end RamseyCert
