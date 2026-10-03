import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_437 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_16, eR_17,
  eR_18, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27, eR_30, eR_33, eR_36, eR_39, eR_42, eR_45, eR_64, eR_65,
  eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81,
  eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94, eR_95, eR_96, eR_99,
  eR_102, eR_105, eR_108, eR_111, eR_114, eR_117, eR_120, eR_123, eR_126, eR_132, eR_133, eR_134, eR_136, eR_137, eR_138, eR_142,
  eR_148, eR_151, eR_154, eR_157, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187,
  eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203,
  eR_204, eR_205, eR_206, eR_207, eR_210, eR_220, eR_223, eR_226, eR_229, eR_232, eR_235, eR_241, eR_244, eR_245, eR_246, eR_247,
  eR_248, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274,
  eR_275, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322,
  eR_323, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355,
  eR_356, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_392, eR_393, eR_396, eR_400, eR_401, eR_402, eR_403,
  eR_405, eR_406, eR_408, eR_409, eR_411, eR_412, eR_414, eR_415, eR_417, eR_418, eR_420, eR_421, eR_435, eR_436, eR_438, eR_439,
  eR_442, eR_443, eR_445, eR_446, eR_447, eR_448, eR_450, eR_451, eR_453, eR_454, eR_460, eR_461, eR_470, eR_471, eR_472, eR_473,
  eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_496, eR_497, eR_498, eR_499,
  eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_520, eR_521, eR_522, eR_523,
  eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539, eR_540,
  eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_561, eR_562, eR_563, eR_564,
  eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_585, eR_586, eR_587, eR_588,
  eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_609, eR_610, eR_612, eR_613,
  eR_615, eR_616, eR_618, eR_619, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656,
  eR_657, eR_658, eR_659, eR_660, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687, eR_688,
  eR_689, eR_690, eR_691, eR_692, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728,
  eR_729, eR_730, eR_731, eR_732, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752,
  eR_753, eR_754, eR_755, eR_756, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779,
  eR_780, eR_781, eR_784, eR_785, eR_786, eR_787, eR_788, eR_789, eR_790, eR_791, eR_792, eR_793, eR_796, eR_797, eR_798, eR_799,
  eR_802, eR_803, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813, eR_816, eR_817, eR_828, eR_829, eR_832, eR_833, eR_834, eR_835,
  eR_836, eR_837, eR_840, eR_841, eR_842, eR_843, eR_846, eR_847, eR_848, eR_849, eR_856, eR_857, eR_864, eR_866, eR_867, eR_874,
  eR_875, eR_876, eR_877, eR_880, eR_882, eR_883, eR_886, eR_887, eR_892, eR_893, eR_896, eR_897, eR_901, eR_903, eR_907, eR_908,
  eR_910, eR_911, eR_912, eR_913, eR_914, eR_916, eR_917, eR_918, eR_919, eR_921, eR_922, eR_923, eR_924, eR_928, eR_932, eR_935,
  eR_936, eR_937, eR_940, eR_941, eR_944, eR_948, eR_952, eR_954, eR_955, eR_956, eR_958, eR_960, eR_961, eR_963, eR_964, eR_970,
  eR_977, eR_978, eR_979, eR_981, eR_983, eR_985, eR_986, eR_987, eR_988, eR_989, eR_990, eR_993, eR_995, eR_996, eR_1001, eR_1004,
  eR_1006, eR_1010, eR_1011, eR_1012, eR_1018, eR_1019, eR_1021, eR_1022, eR_1023]
theorem nbOKR_437 : nbR_437 = nbhd entsR eR_437 := by decide +kernel
theorem mkOKR_437 : mkEnt 32 1024 W rR_437 437 = eR_437 := by decide +kernel
theorem tR_437 : kTermA 4294967295 eR_437 nbR_437 = 117661464791248147970962212 := by decide +kernel


end RamseyCert
