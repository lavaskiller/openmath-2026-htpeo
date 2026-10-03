import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_770 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_16, eR_17, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27, eR_28, eR_29, eR_30,
  eR_31, eR_32, eR_42, eR_43, eR_44, eR_45, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59,
  eR_64, eR_65, eR_66, eR_67, eR_77, eR_78, eR_79, eR_84, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_97, eR_98,
  eR_99, eR_100, eR_101, eR_102, eR_106, eR_107, eR_108, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_115, eR_116, eR_117,
  eR_118, eR_119, eR_120, eR_121, eR_122, eR_123, eR_148, eR_149, eR_150, eR_151, eR_152, eR_153, eR_154, eR_155, eR_156, eR_157,
  eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_188, eR_189,
  eR_190, eR_196, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_208, eR_209, eR_210, eR_211, eR_212, eR_213, eR_227, eR_228,
  eR_229, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238, eR_239, eR_240, eR_241, eR_242, eR_243, eR_244,
  eR_248, eR_249, eR_250, eR_255, eR_256, eR_257, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275,
  eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303,
  eR_308, eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335,
  eR_340, eR_341, eR_342, eR_343, eR_344, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371,
  eR_372, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_391, eR_392, eR_393, eR_394, eR_395,
  eR_396, eR_399, eR_400, eR_401, eR_402, eR_403, eR_404, eR_427, eR_428, eR_430, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440,
  eR_441, eR_442, eR_443, eR_444, eR_445, eR_446, eR_447, eR_448, eR_449, eR_456, eR_459, eR_460, eR_461, eR_462, eR_463, eR_464,
  eR_470, eR_471, eR_472, eR_480, eR_481, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502, eR_503, eR_508,
  eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535, eR_536,
  eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_561, eR_562, eR_563, eR_564,
  eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600,
  eR_605, eR_606, eR_607, eR_608, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620,
  eR_634, eR_635, eR_637, eR_638, eR_639, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659, eR_660, eR_665, eR_666, eR_667,
  eR_668, eR_669, eR_670, eR_672, eR_677, eR_679, eR_680, eR_685, eR_686, eR_687, eR_688, eR_693, eR_694, eR_695, eR_696, eR_701,
  eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_729, eR_730, eR_731, eR_732, eR_737,
  eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762, eR_763, eR_764, eR_765,
  eR_766, eR_767, eR_772, eR_773, eR_774, eR_775, eR_778, eR_779, eR_780, eR_781, eR_788, eR_789, eR_792, eR_793, eR_794, eR_795,
  eR_800, eR_801, eR_804, eR_805, eR_806, eR_807, eR_816, eR_817, eR_824, eR_825, eR_826, eR_827, eR_830, eR_831, eR_832, eR_833,
  eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_846, eR_847, eR_848, eR_849, eR_860, eR_861,
  eR_862, eR_863, eR_864, eR_865, eR_868, eR_869, eR_870, eR_871, eR_872, eR_873, eR_880, eR_881, eR_884, eR_885, eR_888, eR_889,
  eR_890, eR_891, eR_892, eR_893, eR_894, eR_895, eR_898, eR_899, eR_905, eR_906, eR_907, eR_908, eR_912, eR_914, eR_916, eR_917,
  eR_919, eR_920, eR_921, eR_926, eR_928, eR_929, eR_931, eR_932, eR_935, eR_936, eR_938, eR_940, eR_942, eR_943, eR_947, eR_948,
  eR_950, eR_951, eR_954, eR_956, eR_957, eR_960, eR_963, eR_964, eR_965, eR_969, eR_971, eR_972, eR_973, eR_974, eR_976, eR_977,
  eR_978, eR_979, eR_981, eR_982, eR_983, eR_987, eR_990, eR_991, eR_994, eR_995, eR_1001, eR_1002, eR_1003, eR_1004, eR_1005, eR_1009,
  eR_1011, eR_1012, eR_1015, eR_1017, eR_1019, eR_1020, eR_1023]
theorem nbOKR_770 : nbR_770 = nbhd entsR eR_770 := by decide +kernel
theorem mkOKR_770 : mkEnt 32 1024 W rR_770 770 = eR_770 := by decide +kernel
theorem tR_770 : kTermA 4294967295 eR_770 nbR_770 = 48484501738911507636938328 := by decide +kernel


end RamseyCert
