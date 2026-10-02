import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_289 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_13, eR_14, eR_18, eR_19, eR_27, eR_28, eR_30, eR_31, eR_33, eR_34, eR_36, eR_37,
  eR_39, eR_40, eR_42, eR_43, eR_45, eR_46, eR_52, eR_53, eR_54, eR_55, eR_56, eR_58, eR_59, eR_64, eR_65, eR_66,
  eR_67, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_92, eR_93, eR_94, eR_95, eR_97, eR_99, eR_100,
  eR_102, eR_103, eR_105, eR_107, eR_108, eR_110, eR_111, eR_113, eR_114, eR_116, eR_117, eR_119, eR_120, eR_122, eR_123, eR_125,
  eR_126, eR_128, eR_129, eR_131, eR_132, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_148, eR_149, eR_151, eR_152, eR_154,
  eR_155, eR_157, eR_158, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_171, eR_176, eR_178, eR_179, eR_188, eR_189, eR_190,
  eR_191, eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_207, eR_208, eR_210, eR_211, eR_213, eR_216, eR_217, eR_219,
  eR_220, eR_222, eR_223, eR_225, eR_226, eR_228, eR_229, eR_231, eR_232, eR_234, eR_235, eR_237, eR_238, eR_240, eR_241, eR_243,
  eR_244, eR_249, eR_251, eR_252, eR_253, eR_254, eR_255, eR_257, eR_259, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274,
  eR_275, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306,
  eR_307, eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334,
  eR_335, eR_340, eR_341, eR_342, eR_343, eR_344, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370,
  eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_388, eR_389, eR_390,
  eR_393, eR_396, eR_397, eR_398, eR_401, eR_403, eR_405, eR_408, eR_411, eR_414, eR_417, eR_420, eR_423, eR_424, eR_425, eR_426,
  eR_432, eR_433, eR_434, eR_435, eR_438, eR_443, eR_446, eR_448, eR_450, eR_453, eR_456, eR_457, eR_458, eR_461, eR_462, eR_463,
  eR_464, eR_465, eR_470, eR_471, eR_472, eR_473, eR_482, eR_484, eR_485, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_496,
  eR_497, eR_498, eR_499, eR_508, eR_509, eR_511, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_532, eR_533,
  eR_535, eR_536, eR_537, eR_538, eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562,
  eR_563, eR_564, eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_586, eR_587, eR_597, eR_598, eR_599, eR_600,
  eR_605, eR_606, eR_607, eR_608, eR_609, eR_612, eR_615, eR_618, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628,
  eR_629, eR_630, eR_631, eR_632, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658, eR_659, eR_660, eR_665,
  eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_690, eR_691, eR_692, eR_693, eR_694,
  eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_729, eR_730,
  eR_731, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_756, eR_757, eR_758, eR_759, eR_760,
  eR_765, eR_766, eR_767, eR_768, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_778, eR_779, eR_788, eR_789, eR_794, eR_795,
  eR_796, eR_797, eR_800, eR_801, eR_802, eR_803, eR_808, eR_809, eR_810, eR_811, eR_814, eR_815, eR_820, eR_821, eR_822, eR_823,
  eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_840, eR_841, eR_842, eR_843, eR_846, eR_847, eR_852, eR_853, eR_858, eR_859,
  eR_864, eR_865, eR_866, eR_867, eR_870, eR_871, eR_874, eR_875, eR_876, eR_877, eR_878, eR_879, eR_880, eR_881, eR_884, eR_885,
  eR_888, eR_889, eR_898, eR_899, eR_901, eR_902, eR_903, eR_904, eR_905, eR_906, eR_907, eR_908, eR_910, eR_911, eR_915, eR_917,
  eR_918, eR_919, eR_922, eR_925, eR_926, eR_927, eR_928, eR_930, eR_931, eR_936, eR_939, eR_942, eR_944, eR_945, eR_946, eR_951,
  eR_954, eR_956, eR_957, eR_959, eR_961, eR_962, eR_964, eR_965, eR_967, eR_968, eR_969, eR_971, eR_972, eR_975, eR_978, eR_979,
  eR_983, eR_984, eR_987, eR_988, eR_989, eR_991, eR_992, eR_995, eR_998, eR_999, eR_1000, eR_1002, eR_1004, eR_1005, eR_1008, eR_1010,
  eR_1015, eR_1019, eR_1021, eR_1022]
theorem nbOKR_289 : nbR_289 = nbhd entsR eR_289 := by decide +kernel
theorem mkOKR_289 : mkEnt 32 1024 W rR_289 289 = eR_289 := by decide +kernel
theorem tR_289 : kTermA 4294967295 eR_289 nbR_289 = 117643089746736299314775520 := by decide +kernel


end RamseyCert
