import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_7 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_12, eB_13, eB_14, eB_15, eB_16, eB_17, eB_18, eB_19,
  eB_20, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_27, eB_28, eB_29, eB_30, eB_31, eB_32, eB_33, eB_34, eB_35,
  eB_36, eB_37, eB_38, eB_39, eB_40, eB_41, eB_42, eB_43, eB_44, eB_45, eB_46, eB_47, eB_48, eB_49, eB_50, eB_51,
  eB_52, eB_56, eB_57, eB_58, eB_59, eB_61, eB_64, eB_65, eB_66, eB_67, eB_70, eB_72, eB_73, eB_74, eB_75, eB_77,
  eB_80, eB_81, eB_82, eB_83, eB_87, eB_88, eB_89, eB_90, eB_91, eB_94, eB_136, eB_137, eB_138, eB_139, eB_140, eB_141,
  eB_142, eB_143, eB_144, eB_145, eB_146, eB_147, eB_148, eB_149, eB_150, eB_151, eB_152, eB_153, eB_154, eB_155, eB_156, eB_157,
  eB_158, eB_159, eB_160, eB_161, eB_162, eB_163, eB_165, eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_181,
  eB_184, eB_185, eB_186, eB_187, eB_190, eB_192, eB_193, eB_194, eB_195, eB_196, eB_200, eB_201, eB_202, eB_203, eB_204, eB_248,
  eB_249, eB_250, eB_251, eB_252, eB_253, eB_254, eB_255, eB_256, eB_257, eB_258, eB_260, eB_261, eB_262, eB_263, eB_268, eB_269,
  eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294, eB_295, eB_300, eB_301,
  eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326, eB_327, eB_332, eB_333,
  eB_334, eB_335, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352, eB_357, eB_358, eB_359, eB_360, eB_365, eB_366,
  eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_381, eB_382, eB_383, eB_384, eB_387, eB_388, eB_389, eB_390, eB_391, eB_392,
  eB_393, eB_394, eB_395, eB_396, eB_397, eB_398, eB_399, eB_400, eB_401, eB_423, eB_424, eB_425, eB_426, eB_427, eB_428, eB_429,
  eB_430, eB_441, eB_442, eB_443, eB_444, eB_445, eB_446, eB_457, eB_458, eB_459, eB_460, eB_461, eB_462, eB_463, eB_464, eB_465,
  eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_488, eB_489, eB_490, eB_491, eB_496, eB_497, eB_498, eB_499,
  eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_520, eB_521, eB_522, eB_523, eB_528, eB_529, eB_530, eB_531,
  eB_537, eB_538, eB_539, eB_540, eB_545, eB_546, eB_547, eB_548, eB_553, eB_554, eB_555, eB_556, eB_561, eB_562, eB_563, eB_564,
  eB_569, eB_570, eB_571, eB_572, eB_577, eB_578, eB_579, eB_580, eB_585, eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596,
  eB_601, eB_602, eB_603, eB_604, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_645, eB_646, eB_647, eB_648,
  eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_669, eB_670, eB_671, eB_672, eB_677, eB_678, eB_679, eB_680,
  eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704, eB_709, eB_710, eB_711, eB_712,
  eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736, eB_741, eB_742, eB_743, eB_744,
  eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_765, eB_766, eB_767, eB_768, eB_769, eB_770,
  eB_771, eB_774, eB_775, eB_776, eB_777, eB_778, eB_779, eB_783, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_794, eB_795,
  eB_796, eB_797, eB_798, eB_799, eB_802, eB_803, eB_808, eB_809, eB_814, eB_815, eB_816, eB_817, eB_820, eB_821, eB_824, eB_825,
  eB_832, eB_833, eB_836, eB_837, eB_844, eB_845, eB_848, eB_849, eB_851, eB_852, eB_853, eB_858, eB_859, eB_868, eB_869, eB_870,
  eB_871, eB_872, eB_873, eB_884, eB_885, eB_886, eB_887, eB_888, eB_889, eB_892, eB_893, eB_897, eB_899, eB_901, eB_902, eB_903,
  eB_913, eB_914, eB_915, eB_917, eB_920, eB_921, eB_922, eB_923, eB_927, eB_928, eB_930, eB_932, eB_933, eB_936, eB_937, eB_941,
  eB_943, eB_944, eB_946, eB_950, eB_954, eB_958, eB_960, eB_965, eB_966, eB_967, eB_968, eB_969, eB_970, eB_971, eB_972, eB_975,
  eB_976, eB_979, eB_981, eB_982, eB_983, eB_988, eB_990, eB_991, eB_992, eB_993, eB_994, eB_996, eB_997, eB_1002, eB_1003, eB_1005,
  eB_1006, eB_1008, eB_1009, eB_1011, eB_1012, eB_1013, eB_1016, eB_1017, eB_1018, eB_1020, eB_1022]
theorem nbOKB_7 : nbB_7 = nbhd entsB eB_7 := by decide +kernel
theorem mkOKB_7 : mkEnt 32 1024 W rB_7 7 = eB_7 := by decide +kernel
theorem tB_7 : kTermA 4294967295 eB_7 nbB_7 = 119730109637968977465400509 := by decide +kernel


end RamseyCert
