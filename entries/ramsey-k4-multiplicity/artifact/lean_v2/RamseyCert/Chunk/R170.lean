import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_170 : List Ent := [
  eR_8, eR_10, eR_11, eR_12, eR_14, eR_16, eR_17, eR_18, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27,
  eR_29, eR_30, eR_32, eR_33, eR_35, eR_36, eR_38, eR_39, eR_41, eR_42, eR_44, eR_45, eR_47, eR_52, eR_53, eR_54,
  eR_55, eR_58, eR_59, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_88,
  eR_89, eR_90, eR_91, eR_96, eR_98, eR_99, eR_101, eR_102, eR_103, eR_106, eR_108, eR_109, eR_111, eR_112, eR_114, eR_115,
  eR_117, eR_118, eR_120, eR_121, eR_123, eR_125, eR_128, eR_131, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_140, eR_143,
  eR_146, eR_148, eR_150, eR_151, eR_153, eR_154, eR_156, eR_157, eR_159, eR_160, eR_161, eR_162, eR_163, eR_172, eR_173, eR_174,
  eR_175, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186, eR_187, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205, eR_206,
  eR_207, eR_208, eR_211, eR_215, eR_217, eR_218, eR_220, eR_221, eR_223, eR_224, eR_226, eR_228, eR_231, eR_234, eR_237, eR_240,
  eR_243, eR_248, eR_253, eR_254, eR_255, eR_257, eR_258, eR_260, eR_261, eR_262, eR_263, eR_273, eR_274, eR_275, eR_276, eR_277,
  eR_278, eR_279, eR_288, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_304, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311,
  eR_316, eR_317, eR_318, eR_319, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335, eR_341, eR_342, eR_343, eR_344, eR_349,
  eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_392, eR_395,
  eR_400, eR_402, eR_405, eR_407, eR_408, eR_410, eR_411, eR_413, eR_414, eR_416, eR_417, eR_419, eR_420, eR_422, eR_423, eR_424,
  eR_425, eR_426, eR_431, eR_432, eR_433, eR_434, eR_436, eR_439, eR_441, eR_443, eR_444, eR_446, eR_447, eR_450, eR_452, eR_453,
  eR_455, eR_456, eR_457, eR_458, eR_459, eR_461, eR_462, eR_463, eR_464, eR_465, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479,
  eR_480, eR_481, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497, eR_498, eR_499, eR_508, eR_509, eR_510, eR_511,
  eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_532, eR_533, eR_534, eR_535, eR_536, eR_541, eR_542, eR_543,
  eR_544, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_572,
  eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_588, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602, eR_603, eR_609, eR_611,
  eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_633, eR_634,
  eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_654, eR_655, eR_656, eR_665, eR_666, eR_667,
  eR_668, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_689, eR_690, eR_691, eR_692, eR_697, eR_698, eR_699,
  eR_700, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727,
  eR_728, eR_733, eR_734, eR_735, eR_736, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_758, eR_759, eR_760,
  eR_765, eR_766, eR_767, eR_768, eR_770, eR_771, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_780, eR_781, eR_782, eR_783,
  eR_786, eR_787, eR_788, eR_789, eR_792, eR_793, eR_802, eR_803, eR_806, eR_807, eR_816, eR_817, eR_820, eR_821, eR_822, eR_823,
  eR_830, eR_831, eR_832, eR_833, eR_838, eR_839, eR_844, eR_845, eR_846, eR_847, eR_848, eR_852, eR_853, eR_854, eR_855, eR_856,
  eR_857, eR_858, eR_859, eR_862, eR_863, eR_864, eR_865, eR_872, eR_873, eR_880, eR_881, eR_884, eR_885, eR_886, eR_887, eR_892,
  eR_893, eR_897, eR_898, eR_900, eR_901, eR_905, eR_907, eR_908, eR_909, eR_912, eR_913, eR_914, eR_915, eR_916, eR_918, eR_919,
  eR_923, eR_924, eR_925, eR_928, eR_929, eR_930, eR_932, eR_933, eR_939, eR_940, eR_941, eR_944, eR_945, eR_947, eR_951, eR_952,
  eR_953, eR_954, eR_957, eR_959, eR_960, eR_961, eR_962, eR_967, eR_973, eR_976, eR_978, eR_980, eR_982, eR_983, eR_984, eR_985,
  eR_989, eR_990, eR_991, eR_992, eR_993, eR_994, eR_995, eR_998, eR_1001, eR_1002, eR_1003, eR_1005, eR_1007, eR_1012, eR_1015, eR_1016,
  eR_1020, eR_1021, eR_1022]
theorem nbOKR_170 : nbR_170 = nbhd entsR eR_170 := by decide +kernel
theorem mkOKR_170 : mkEnt 32 1024 W rR_170 170 = eR_170 := by decide +kernel
theorem tR_170 : kTermA 4294967295 eR_170 nbR_170 = 114619639279382623968606144 := by decide +kernel


end RamseyCert
