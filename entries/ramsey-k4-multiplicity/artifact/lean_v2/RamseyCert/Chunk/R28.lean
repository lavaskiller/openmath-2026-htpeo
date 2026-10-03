import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_28 : List Ent := [
  eR_12, eR_13, eR_15, eR_17, eR_19, eR_22, eR_24, eR_26, eR_27, eR_29, eR_31, eR_34, eR_37, eR_40, eR_42, eR_44,
  eR_46, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70,
  eR_71, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94,
  eR_95, eR_97, eR_101, eR_102, eR_103, eR_106, eR_110, eR_113, eR_115, eR_117, eR_123, eR_125, eR_128, eR_136, eR_137, eR_138,
  eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_148, eR_150, eR_152, eR_154, eR_156, eR_158, eR_160, eR_161, eR_162, eR_163,
  eR_164, eR_165, eR_166, eR_167, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187,
  eR_188, eR_189, eR_190, eR_191, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205, eR_206, eR_207, eR_208, eR_212, eR_213, eR_216,
  eR_219, eR_222, eR_230, eR_232, eR_235, eR_237, eR_240, eR_242, eR_244, eR_248, eR_252, eR_256, eR_259, eR_260, eR_261, eR_262,
  eR_263, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_284, eR_285, eR_286,
  eR_287, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_308, eR_309, eR_310,
  eR_311, eR_312, eR_313, eR_314, eR_315, eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_340, eR_349, eR_350,
  eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_365, eR_366, eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_385, eR_386,
  eR_387, eR_389, eR_392, eR_397, eR_400, eR_402, eR_405, eR_407, eR_411, eR_413, eR_415, eR_417, eR_419, eR_423, eR_425, eR_427,
  eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_436, eR_439, eR_442, eR_447, eR_450, eR_452, eR_454, eR_457, eR_460,
  eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_478, eR_479, eR_480, eR_481, eR_482, eR_483, eR_484, eR_485,
  eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518, eR_519,
  eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539, eR_540, eR_541, eR_542, eR_543, eR_544,
  eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576,
  eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620,
  eR_621, eR_623, eR_626, eR_628, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648,
  eR_649, eR_650, eR_651, eR_652, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672,
  eR_673, eR_674, eR_675, eR_676, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_701, eR_702, eR_703, eR_704,
  eR_705, eR_706, eR_707, eR_708, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_733, eR_734, eR_735, eR_736,
  eR_737, eR_738, eR_739, eR_740, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760,
  eR_761, eR_762, eR_763, eR_764, eR_770, eR_771, eR_780, eR_781, eR_788, eR_789, eR_790, eR_791, eR_792, eR_793, eR_802, eR_803,
  eR_807, eR_808, eR_809, eR_812, eR_813, eR_814, eR_815, eR_816, eR_817, eR_822, eR_823, eR_824, eR_825, eR_829, eR_832, eR_833,
  eR_838, eR_839, eR_842, eR_843, eR_846, eR_847, eR_852, eR_853, eR_866, eR_867, eR_874, eR_875, eR_878, eR_879, eR_880, eR_881,
  eR_892, eR_893, eR_894, eR_895, eR_896, eR_897, eR_900, eR_901, eR_904, eR_905, eR_906, eR_907, eR_909, eR_910, eR_911, eR_912,
  eR_913, eR_914, eR_915, eR_919, eR_921, eR_922, eR_925, eR_927, eR_929, eR_931, eR_934, eR_935, eR_938, eR_940, eR_941, eR_943,
  eR_945, eR_946, eR_947, eR_949, eR_950, eR_952, eR_954, eR_957, eR_958, eR_959, eR_960, eR_961, eR_963, eR_965, eR_966, eR_970,
  eR_971, eR_972, eR_974, eR_979, eR_982, eR_984, eR_988, eR_989, eR_991, eR_992, eR_993, eR_994, eR_995, eR_996, eR_997, eR_998,
  eR_999, eR_1002, eR_1003, eR_1004, eR_1007, eR_1009, eR_1011, eR_1012, eR_1013, eR_1018, eR_1020]
theorem nbOKR_28 : nbR_28 = nbhd entsR eR_28 := by decide +kernel
theorem mkOKR_28 : mkEnt 32 1024 W rR_28 28 = eR_28 := by decide +kernel
theorem tR_28 : kTermA 4294967295 eR_28 nbR_28 = 96589262804156356318070346 := by decide +kernel


end RamseyCert
