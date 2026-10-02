import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_882 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_12, eB_14, eB_18, eB_20, eB_28, eB_31, eB_33, eB_35, eB_36, eB_38, eB_39, eB_41,
  eB_43, eB_46, eB_48, eB_49, eB_50, eB_51, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_76, eB_77,
  eB_78, eB_79, eB_84, eB_85, eB_86, eB_87, eB_92, eB_93, eB_94, eB_95, eB_98, eB_99, eB_101, eB_102, eB_104, eB_105,
  eB_106, eB_108, eB_109, eB_111, eB_112, eB_114, eB_115, eB_117, eB_118, eB_120, eB_121, eB_123, eB_124, eB_126, eB_127, eB_129,
  eB_130, eB_132, eB_136, eB_137, eB_138, eB_140, eB_143, eB_146, eB_149, eB_152, eB_155, eB_158, eB_164, eB_165, eB_166, eB_167,
  eB_168, eB_169, eB_170, eB_171, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_192, eB_193, eB_194, eB_195,
  eB_200, eB_201, eB_202, eB_203, eB_208, eB_211, eB_214, eB_216, eB_219, eB_222, eB_225, eB_228, eB_231, eB_234, eB_237, eB_240,
  eB_243, eB_245, eB_246, eB_247, eB_249, eB_250, eB_253, eB_254, eB_256, eB_260, eB_261, eB_262, eB_263, eB_265, eB_272, eB_273,
  eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_281, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299, eB_300,
  eB_301, eB_302, eB_303, eB_307, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327,
  eB_336, eB_337, eB_338, eB_339, eB_345, eB_346, eB_347, eB_348, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360,
  eB_364, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_377, eB_381, eB_382, eB_383, eB_384, eB_391, eB_393,
  eB_394, eB_396, eB_399, eB_401, eB_402, eB_406, eB_409, eB_412, eB_415, eB_418, eB_421, eB_423, eB_424, eB_425, eB_426, eB_427,
  eB_428, eB_429, eB_430, eB_436, eB_439, eB_442, eB_445, eB_447, eB_451, eB_454, eB_456, eB_457, eB_458, eB_460, eB_466, eB_467,
  eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_474, eB_477, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_492, eB_493,
  eB_494, eB_495, eB_496, eB_497, eB_498, eB_499, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521,
  eB_522, eB_523, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537, eB_538, eB_539, eB_540, eB_546, eB_549, eB_550, eB_551, eB_552,
  eB_553, eB_554, eB_555, eB_556, eB_561, eB_562, eB_563, eB_564, eB_571, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579,
  eB_580, eB_585, eB_586, eB_587, eB_588, eB_593, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_609, eB_611,
  eB_612, eB_614, eB_615, eB_617, eB_618, eB_620, eB_629, eB_633, eB_634, eB_635, eB_636, eB_641, eB_642, eB_643, eB_644, eB_648,
  eB_649, eB_650, eB_651, eB_652, eB_653, eB_654, eB_655, eB_656, eB_664, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671,
  eB_672, eB_681, eB_682, eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703,
  eB_704, eB_709, eB_710, eB_711, eB_712, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735,
  eB_736, eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_768, eB_769, eB_770,
  eB_771, eB_776, eB_777, eB_780, eB_781, eB_784, eB_785, eB_786, eB_787, eB_792, eB_793, eB_794, eB_795, eB_802, eB_803, eB_805,
  eB_806, eB_807, eB_810, eB_811, eB_812, eB_813, eB_818, eB_819, eB_820, eB_821, eB_824, eB_825, eB_828, eB_829, eB_830, eB_831,
  eB_836, eB_837, eB_838, eB_839, eB_844, eB_845, eB_846, eB_847, eB_850, eB_851, eB_852, eB_853, eB_858, eB_859, eB_862, eB_863,
  eB_864, eB_865, eB_866, eB_867, eB_868, eB_869, eB_870, eB_871, eB_874, eB_875, eB_876, eB_877, eB_878, eB_879, eB_880, eB_881,
  eB_882, eB_883, eB_886, eB_887, eB_888, eB_889, eB_896, eB_897, eB_898, eB_899, eB_904, eB_905, eB_907, eB_908, eB_910, eB_911,
  eB_912, eB_913, eB_915, eB_916, eB_917, eB_919, eB_920, eB_921, eB_923, eB_929, eB_930, eB_933, eB_934, eB_936, eB_940, eB_941,
  eB_943, eB_944, eB_947, eB_949, eB_950, eB_951, eB_955, eB_957, eB_965, eB_967, eB_970, eB_971, eB_972, eB_973, eB_978, eB_979,
  eB_981, eB_986, eB_992, eB_995, eB_998, eB_999, eB_1001, eB_1009, eB_1010, eB_1011, eB_1014, eB_1015, eB_1016, eB_1017, eB_1022]
theorem nbOKB_882 : nbB_882 = nbhd entsB eB_882 := by decide +kernel
theorem mkOKB_882 : mkEnt 32 1024 W rB_882 882 = eB_882 := by decide +kernel
theorem tB_882 : kTermA 4294967295 eB_882 nbB_882 = 90541299604599077517970610 := by decide +kernel


end RamseyCert
