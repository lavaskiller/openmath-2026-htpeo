import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_465 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_14, eR_15, eR_16, eR_17, eR_18, eR_21, eR_22, eR_23,
  eR_24, eR_25, eR_26, eR_28, eR_29, eR_31, eR_32, eR_33, eR_36, eR_39, eR_43, eR_44, eR_46, eR_47, eR_52, eR_53,
  eR_54, eR_55, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81,
  eR_82, eR_83, eR_88, eR_89, eR_90, eR_91, eR_97, eR_98, eR_100, eR_101, eR_103, eR_104, eR_106, eR_107, eR_109, eR_110,
  eR_112, eR_113, eR_115, eR_116, eR_118, eR_119, eR_121, eR_122, eR_124, eR_125, eR_127, eR_128, eR_130, eR_131, eR_140, eR_141,
  eR_143, eR_144, eR_146, eR_147, eR_149, eR_150, eR_152, eR_153, eR_155, eR_156, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163,
  eR_168, eR_169, eR_170, eR_171, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190, eR_191, eR_196, eR_197, eR_198, eR_199,
  eR_204, eR_205, eR_206, eR_207, eR_210, eR_213, eR_214, eR_217, eR_220, eR_223, eR_226, eR_229, eR_232, eR_235, eR_238, eR_241,
  eR_244, eR_245, eR_246, eR_247, eR_248, eR_249, eR_253, eR_254, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268, eR_270,
  eR_271, eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_304, eR_305, eR_306, eR_307,
  eR_312, eR_313, eR_314, eR_315, eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_340,
  eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_365, eR_367, eR_368, eR_373,
  eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_392, eR_393, eR_395, eR_396, eR_400, eR_401, eR_402, eR_403,
  eR_405, eR_406, eR_408, eR_409, eR_411, eR_412, eR_414, eR_415, eR_417, eR_418, eR_420, eR_421, eR_423, eR_424, eR_425, eR_426,
  eR_431, eR_432, eR_433, eR_434, eR_435, eR_436, eR_438, eR_439, eR_441, eR_444, eR_447, eR_448, eR_450, eR_451, eR_453, eR_454,
  eR_457, eR_458, eR_459, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_492,
  eR_493, eR_494, eR_495, eR_496, eR_497, eR_498, eR_499, eR_504, eR_505, eR_506, eR_507, eR_516, eR_517, eR_518, eR_519, eR_520,
  eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_557,
  eR_558, eR_560, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570, eR_571, eR_572, eR_581, eR_582, eR_584, eR_585, eR_586, eR_587,
  eR_588, eR_593, eR_594, eR_595, eR_596, eR_606, eR_607, eR_608, eR_611, eR_614, eR_617, eR_620, eR_621, eR_622, eR_623, eR_624,
  eR_625, eR_626, eR_627, eR_628, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_649, eR_651, eR_652, eR_657, eR_658,
  eR_659, eR_661, eR_662, eR_663, eR_664, eR_669, eR_672, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691, eR_692, eR_693,
  eR_694, eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722, eR_723, eR_724, eR_729,
  eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_757,
  eR_758, eR_759, eR_760, eR_768, eR_769, eR_772, eR_773, eR_780, eR_781, eR_784, eR_785, eR_790, eR_791, eR_792, eR_793, eR_794,
  eR_795, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_806, eR_807, eR_812, eR_813, eR_816, eR_817, eR_818, eR_819, eR_820,
  eR_821, eR_822, eR_823, eR_828, eR_829, eR_830, eR_831, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841, eR_842,
  eR_843, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_858, eR_859, eR_862, eR_863, eR_870, eR_871, eR_872, eR_873, eR_882,
  eR_883, eR_888, eR_889, eR_892, eR_893, eR_896, eR_899, eR_901, eR_906, eR_912, eR_914, eR_915, eR_916, eR_917, eR_918, eR_921,
  eR_925, eR_926, eR_929, eR_930, eR_931, eR_932, eR_934, eR_936, eR_937, eR_939, eR_942, eR_944, eR_945, eR_947, eR_949, eR_955,
  eR_956, eR_958, eR_959, eR_960, eR_961, eR_962, eR_964, eR_965, eR_966, eR_967, eR_971, eR_972, eR_973, eR_976, eR_979, eR_982,
  eR_984, eR_986, eR_987, eR_989, eR_990, eR_992, eR_994, eR_996, eR_997, eR_998, eR_1000, eR_1001, eR_1003, eR_1004, eR_1006, eR_1013,
  eR_1014, eR_1018, eR_1019, eR_1020, eR_1021, eR_1022]
theorem nbOKR_465 : nbR_465 = nbhd entsR eR_465 := by decide +kernel
theorem mkOKR_465 : mkEnt 32 1024 W rR_465 465 = eR_465 := by decide +kernel
theorem tR_465 : kTermA 4294967295 eR_465 nbR_465 = 119756474595539612616581772 := by decide +kernel


end RamseyCert
