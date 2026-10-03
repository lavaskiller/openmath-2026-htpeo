import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_29 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_15, eB_16, eB_18, eB_19,
  eB_21, eB_23, eB_25, eB_29, eB_30, eB_31, eB_33, eB_34, eB_36, eB_37, eB_39, eB_40, eB_44, eB_45, eB_46, eB_48,
  eB_49, eB_50, eB_51, eB_52, eB_53, eB_54, eB_55, eB_80, eB_81, eB_82, eB_83, eB_84, eB_85, eB_86, eB_87, eB_96,
  eB_97, eB_99, eB_101, eB_103, eB_105, eB_106, eB_110, eB_111, eB_113, eB_114, eB_115, eB_116, eB_117, eB_118, eB_119, eB_120,
  eB_121, eB_124, eB_125, eB_126, eB_128, eB_129, eB_131, eB_132, eB_133, eB_134, eB_135, eB_141, eB_144, eB_147, eB_150, eB_151,
  eB_152, eB_156, eB_157, eB_158, eB_160, eB_161, eB_162, eB_163, eB_164, eB_165, eB_166, eB_167, eB_192, eB_193, eB_194, eB_195,
  eB_196, eB_197, eB_198, eB_199, eB_208, eB_210, eB_212, eB_214, eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_224, eB_225,
  eB_226, eB_228, eB_229, eB_230, eB_231, eB_233, eB_235, eB_236, eB_237, eB_238, eB_240, eB_241, eB_242, eB_245, eB_246, eB_247,
  eB_248, eB_250, eB_251, eB_252, eB_253, eB_254, eB_255, eB_256, eB_258, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290,
  eB_291, eB_308, eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322,
  eB_323, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347,
  eB_348, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371,
  eB_372, eB_381, eB_382, eB_383, eB_384, eB_388, eB_390, eB_391, eB_392, eB_393, eB_394, eB_395, eB_398, eB_399, eB_400, eB_402,
  eB_404, eB_405, eB_409, eB_410, eB_411, eB_415, eB_416, eB_417, eB_421, eB_422, eB_424, eB_426, eB_436, eB_437, eB_439, eB_440,
  eB_441, eB_442, eB_444, eB_445, eB_447, eB_449, eB_450, eB_453, eB_454, eB_455, eB_456, eB_458, eB_459, eB_460, eB_461, eB_478,
  eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494,
  eB_495, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534,
  eB_535, eB_536, eB_537, eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_569, eB_570, eB_571, eB_572, eB_573, eB_574,
  eB_575, eB_576, eB_577, eB_578, eB_579, eB_580, eB_581, eB_582, eB_583, eB_584, eB_593, eB_594, eB_595, eB_596, eB_597, eB_598,
  eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_609, eB_612, eB_615, eB_618, eB_622, eB_624,
  eB_625, eB_627, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650,
  eB_651, eB_652, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_697, eB_698,
  eB_699, eB_700, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_717, eB_718, eB_719, eB_720, eB_721, eB_722,
  eB_723, eB_724, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755, eB_756, eB_765, eB_766, eB_767, eB_774, eB_775, eB_780,
  eB_781, eB_784, eB_785, eB_786, eB_787, eB_792, eB_793, eB_800, eB_802, eB_803, eB_806, eB_807, eB_808, eB_809, eB_810, eB_811,
  eB_822, eB_823, eB_826, eB_827, eB_828, eB_829, eB_830, eB_831, eB_834, eB_835, eB_837, eB_840, eB_841, eB_842, eB_843, eB_844,
  eB_845, eB_854, eB_855, eB_858, eB_859, eB_864, eB_865, eB_868, eB_869, eB_870, eB_871, eB_872, eB_873, eB_874, eB_875, eB_876,
  eB_877, eB_878, eB_879, eB_880, eB_884, eB_885, eB_886, eB_887, eB_890, eB_891, eB_892, eB_893, eB_897, eB_899, eB_902, eB_903,
  eB_904, eB_905, eB_907, eB_908, eB_910, eB_912, eB_914, eB_915, eB_916, eB_918, eB_927, eB_928, eB_929, eB_930, eB_931, eB_932,
  eB_937, eB_939, eB_940, eB_942, eB_943, eB_946, eB_949, eB_951, eB_952, eB_953, eB_958, eB_961, eB_962, eB_963, eB_964, eB_968,
  eB_970, eB_971, eB_973, eB_974, eB_979, eB_981, eB_984, eB_985, eB_986, eB_988, eB_989, eB_990, eB_994, eB_995, eB_996, eB_997,
  eB_998, eB_1002, eB_1003, eB_1006, eB_1008, eB_1009, eB_1013, eB_1015, eB_1017, eB_1020, eB_1021, eB_1022]
theorem nbOKB_29 : nbB_29 = nbhd entsB eB_29 := by decide +kernel
theorem mkOKB_29 : mkEnt 32 1024 W rB_29 29 = eB_29 := by decide +kernel
theorem tB_29 : kTermA 4294967295 eB_29 nbB_29 = 71344530971327973472779003 := by decide +kernel


end RamseyCert
