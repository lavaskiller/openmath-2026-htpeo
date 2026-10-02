import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_354 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_12, eR_16, eR_18, eR_19, eR_20, eR_21, eR_23, eR_25, eR_27, eR_28, eR_29, eR_33,
  eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_42, eR_43, eR_44, eR_52, eR_53, eR_54, eR_55, eR_60,
  eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82, eR_89, eR_90,
  eR_91, eR_100, eR_101, eR_102, eR_103, eR_104, eR_105, eR_106, eR_107, eR_108, eR_115, eR_116, eR_117, eR_121, eR_122, eR_123,
  eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_136, eR_137, eR_138, eR_148, eR_149, eR_150, eR_154,
  eR_155, eR_156, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189,
  eR_190, eR_191, eR_192, eR_193, eR_194, eR_200, eR_201, eR_202, eR_203, eR_211, eR_212, eR_213, eR_215, eR_216, eR_217, eR_218,
  eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_242, eR_243,
  eR_244, eR_248, eR_249, eR_250, eR_251, eR_254, eR_256, eR_257, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269,
  eR_270, eR_271, eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305,
  eR_306, eR_307, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333,
  eR_334, eR_335, eR_340, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369,
  eR_370, eR_371, eR_372, eR_377, eR_378, eR_379, eR_380, eR_385, eR_386, eR_388, eR_390, eR_391, eR_392, eR_393, eR_394, eR_395,
  eR_396, eR_398, eR_399, eR_400, eR_401, eR_402, eR_403, eR_404, eR_405, eR_406, eR_407, eR_411, eR_412, eR_413, eR_417, eR_418,
  eR_419, eR_424, eR_426, eR_431, eR_433, eR_434, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_441, eR_442, eR_443, eR_444,
  eR_445, eR_446, eR_447, eR_448, eR_449, eR_450, eR_451, eR_452, eR_458, eR_459, eR_460, eR_461, eR_462, eR_463, eR_464, eR_465,
  eR_470, eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499,
  eR_504, eR_505, eR_506, eR_507, eR_516, eR_517, eR_518, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538,
  eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568, eR_573, eR_574,
  eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_601, eR_602,
  eR_603, eR_604, eR_622, eR_624, eR_625, eR_627, eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_644, eR_649, eR_650, eR_651,
  eR_652, eR_657, eR_658, eR_659, eR_660, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679,
  eR_680, eR_685, eR_686, eR_687, eR_688, eR_693, eR_694, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717,
  eR_718, eR_719, eR_720, eR_725, eR_726, eR_727, eR_728, eR_737, eR_738, eR_740, eR_746, eR_747, eR_748, eR_753, eR_754, eR_756,
  eR_757, eR_758, eR_759, eR_760, eR_768, eR_769, eR_772, eR_773, eR_776, eR_777, eR_778, eR_779, eR_782, eR_783, eR_784, eR_785,
  eR_788, eR_789, eR_790, eR_791, eR_792, eR_793, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807,
  eR_810, eR_811, eR_812, eR_813, eR_817, eR_822, eR_823, eR_826, eR_827, eR_832, eR_833, eR_836, eR_837, eR_840, eR_841, eR_842,
  eR_843, eR_844, eR_845, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_856, eR_857, eR_858, eR_859, eR_866, eR_867, eR_868,
  eR_869, eR_872, eR_873, eR_874, eR_875, eR_878, eR_879, eR_880, eR_881, eR_886, eR_887, eR_888, eR_889, eR_892, eR_893, eR_898,
  eR_899, eR_900, eR_902, eR_903, eR_904, eR_905, eR_906, eR_909, eR_912, eR_913, eR_917, eR_919, eR_927, eR_930, eR_932, eR_933,
  eR_935, eR_938, eR_939, eR_943, eR_946, eR_947, eR_948, eR_949, eR_950, eR_955, eR_957, eR_959, eR_962, eR_965, eR_968, eR_970,
  eR_973, eR_974, eR_979, eR_980, eR_981, eR_983, eR_984, eR_987, eR_988, eR_989, eR_990, eR_991, eR_993, eR_996, eR_999, eR_1000,
  eR_1001, eR_1003, eR_1004, eR_1005, eR_1006, eR_1014, eR_1016, eR_1019, eR_1020, eR_1021, eR_1022]
theorem nbOKR_354 : nbR_354 = nbhd entsR eR_354 := by decide +kernel
theorem mkOKR_354 : mkEnt 32 1024 W rR_354 354 = eR_354 := by decide +kernel
theorem tR_354 : kTermA 4294967295 eR_354 nbR_354 = 118265553219945874246027110 := by decide +kernel


end RamseyCert
