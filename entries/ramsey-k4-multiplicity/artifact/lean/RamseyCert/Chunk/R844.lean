import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_844 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_16, eR_17, eR_18, eR_21, eR_22, eR_23,
  eR_24, eR_25, eR_26, eR_27, eR_30, eR_33, eR_36, eR_39, eR_42, eR_45, eR_48, eR_49, eR_50, eR_56, eR_58, eR_59,
  eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_92, eR_93, eR_94, eR_95,
  eR_97, eR_98, eR_100, eR_101, eR_103, eR_104, eR_106, eR_107, eR_109, eR_110, eR_112, eR_113, eR_115, eR_116, eR_118, eR_119,
  eR_121, eR_122, eR_124, eR_125, eR_127, eR_128, eR_130, eR_131, eR_136, eR_137, eR_138, eR_139, eR_142, eR_145, eR_148, eR_151,
  eR_154, eR_157, eR_160, eR_161, eR_162, eR_169, eR_170, eR_171, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190, eR_191,
  eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_207, eR_208, eR_209, eR_211, eR_212, eR_215, eR_216, eR_218, eR_219,
  eR_221, eR_222, eR_224, eR_225, eR_227, eR_228, eR_230, eR_231, eR_233, eR_234, eR_236, eR_237, eR_239, eR_240, eR_242, eR_243,
  eR_250, eR_251, eR_252, eR_253, eR_254, eR_255, eR_258, eR_264, eR_265, eR_266, eR_267, eR_272, eR_274, eR_275, eR_276, eR_277,
  eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303, eR_308, eR_309,
  eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335, eR_345, eR_346,
  eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_373, eR_374,
  eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_387, eR_388, eR_389, eR_390, eR_391, eR_394, eR_397, eR_398, eR_399, eR_402,
  eR_403, eR_405, eR_406, eR_408, eR_409, eR_411, eR_412, eR_414, eR_415, eR_417, eR_418, eR_420, eR_421, eR_423, eR_424, eR_425,
  eR_426, eR_431, eR_432, eR_433, eR_435, eR_436, eR_438, eR_439, eR_441, eR_444, eR_447, eR_448, eR_450, eR_451, eR_453, eR_454,
  eR_457, eR_458, eR_459, eR_466, eR_467, eR_469, eR_470, eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_493, eR_494,
  eR_495, eR_496, eR_497, eR_498, eR_499, eR_504, eR_505, eR_506, eR_507, eR_516, eR_517, eR_519, eR_520, eR_521, eR_522, eR_523,
  eR_528, eR_529, eR_530, eR_531, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_559, eR_560,
  eR_561, eR_562, eR_563, eR_564, eR_569, eR_570, eR_571, eR_572, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588,
  eR_593, eR_594, eR_595, eR_596, eR_605, eR_606, eR_607, eR_608, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619,
  eR_633, eR_634, eR_635, eR_636, eR_641, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655, eR_656, eR_665,
  eR_666, eR_667, eR_668, eR_673, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687, eR_688, eR_697, eR_698,
  eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_716, eR_717, eR_718, eR_719, eR_720, eR_725, eR_726, eR_727,
  eR_728, eR_737, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_761, eR_762, eR_763, eR_764,
  eR_765, eR_766, eR_767, eR_768, eR_769, eR_776, eR_777, eR_784, eR_785, eR_792, eR_793, eR_794, eR_795, eR_796, eR_797, eR_798,
  eR_799, eR_800, eR_801, eR_802, eR_803, eR_806, eR_807, eR_808, eR_809, eR_812, eR_813, eR_822, eR_823, eR_828, eR_829, eR_830,
  eR_831, eR_832, eR_833, eR_840, eR_841, eR_848, eR_849, eR_854, eR_855, eR_860, eR_861, eR_862, eR_863, eR_866, eR_867, eR_868,
  eR_869, eR_870, eR_871, eR_872, eR_873, eR_876, eR_877, eR_878, eR_879, eR_884, eR_885, eR_890, eR_891, eR_892, eR_893, eR_894,
  eR_895, eR_896, eR_897, eR_898, eR_900, eR_901, eR_907, eR_908, eR_911, eR_913, eR_914, eR_915, eR_916, eR_917, eR_918, eR_919,
  eR_920, eR_922, eR_923, eR_927, eR_928, eR_930, eR_931, eR_932, eR_933, eR_934, eR_935, eR_936, eR_937, eR_942, eR_943, eR_944,
  eR_945, eR_947, eR_955, eR_957, eR_958, eR_959, eR_960, eR_962, eR_964, eR_967, eR_968, eR_969, eR_970, eR_973, eR_974, eR_975,
  eR_977, eR_979, eR_980, eR_983, eR_987, eR_988, eR_989, eR_993, eR_994, eR_996, eR_997, eR_999, eR_1002, eR_1004, eR_1005, eR_1007,
  eR_1009, eR_1014, eR_1015, eR_1022]
theorem nbOKR_844 : nbR_844 = nbhd entsR eR_844 := by decide +kernel
theorem mkOKR_844 : mkEnt 32 1024 W rR_844 844 = eR_844 := by decide +kernel
theorem tR_844 : kTermA 4294967295 eR_844 nbR_844 = 95199184753247771597960352 := by decide +kernel


end RamseyCert
