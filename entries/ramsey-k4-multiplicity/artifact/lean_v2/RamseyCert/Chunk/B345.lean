import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_345 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_8, eB_9, eB_10, eB_11, eB_13, eB_14, eB_15, eB_16, eB_21, eB_23, eB_25, eB_27,
  eB_28, eB_29, eB_42, eB_43, eB_44, eB_48, eB_49, eB_50, eB_51, eB_56, eB_57, eB_58, eB_59, eB_64, eB_65, eB_66,
  eB_67, eB_73, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_90, eB_92, eB_93, eB_94, eB_95, eB_96,
  eB_100, eB_101, eB_102, eB_106, eB_107, eB_108, eB_115, eB_116, eB_117, eB_121, eB_122, eB_123, eB_133, eB_134, eB_135, eB_139,
  eB_140, eB_141, eB_142, eB_143, eB_144, eB_145, eB_146, eB_147, eB_148, eB_149, eB_150, eB_154, eB_155, eB_156, eB_160, eB_161,
  eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_184, eB_188, eB_189, eB_190, eB_191, eB_192,
  eB_193, eB_194, eB_195, eB_201, eB_204, eB_205, eB_206, eB_207, eB_211, eB_212, eB_213, eB_214, eB_230, eB_231, eB_232, eB_233,
  eB_234, eB_235, eB_242, eB_243, eB_244, eB_245, eB_246, eB_247, eB_251, eB_254, eB_255, eB_260, eB_261, eB_262, eB_263, eB_272,
  eB_273, eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299, eB_304,
  eB_305, eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326, eB_327, eB_332,
  eB_333, eB_334, eB_335, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_357, eB_358, eB_359, eB_360, eB_365,
  eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_381, eB_382, eB_383, eB_384, eB_388, eB_390, eB_398, eB_405, eB_406,
  eB_407, eB_411, eB_412, eB_413, eB_417, eB_418, eB_419, eB_424, eB_426, eB_427, eB_428, eB_429, eB_430, eB_434, eB_450, eB_451,
  eB_452, eB_456, eB_458, eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_486,
  eB_487, eB_488, eB_489, eB_490, eB_491, eB_496, eB_497, eB_498, eB_499, eB_502, eB_504, eB_505, eB_506, eB_507, eB_508, eB_516,
  eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537, eB_538, eB_539, eB_540,
  eB_545, eB_546, eB_547, eB_548, eB_553, eB_554, eB_555, eB_556, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576,
  eB_581, eB_582, eB_583, eB_584, eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608,
  eB_609, eB_610, eB_611, eB_612, eB_613, eB_614, eB_615, eB_616, eB_617, eB_618, eB_619, eB_620, eB_622, eB_624, eB_625, eB_627,
  eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_642, eB_645, eB_646, eB_647, eB_648, eB_653, eB_654, eB_655,
  eB_656, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684, eB_689, eB_690, eB_691,
  eB_692, eB_693, eB_694, eB_695, eB_696, eB_701, eB_704, eB_705, eB_706, eB_707, eB_708, eB_709, eB_710, eB_711, eB_712, eB_713,
  eB_717, eB_718, eB_719, eB_720, eB_723, eB_725, eB_726, eB_727, eB_728, eB_730, eB_737, eB_738, eB_739, eB_740, eB_745, eB_746,
  eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_770, eB_771, eB_776,
  eB_777, eB_784, eB_785, eB_786, eB_787, eB_788, eB_789, eB_794, eB_795, eB_798, eB_799, eB_800, eB_801, eB_802, eB_803, eB_806,
  eB_807, eB_808, eB_809, eB_820, eB_821, eB_824, eB_825, eB_830, eB_832, eB_833, eB_838, eB_839, eB_842, eB_843, eB_846, eB_847,
  eB_848, eB_849, eB_856, eB_857, eB_858, eB_859, eB_866, eB_867, eB_870, eB_871, eB_874, eB_875, eB_880, eB_881, eB_882, eB_883,
  eB_884, eB_885, eB_886, eB_887, eB_888, eB_889, eB_890, eB_894, eB_895, eB_898, eB_899, eB_900, eB_901, eB_902, eB_907, eB_909,
  eB_910, eB_911, eB_916, eB_919, eB_921, eB_922, eB_923, eB_924, eB_926, eB_929, eB_930, eB_932, eB_934, eB_937, eB_938, eB_939,
  eB_940, eB_942, eB_943, eB_947, eB_948, eB_949, eB_950, eB_951, eB_954, eB_955, eB_961, eB_962, eB_966, eB_967, eB_968, eB_969,
  eB_974, eB_977, eB_979, eB_982, eB_985, eB_986, eB_988, eB_989, eB_990, eB_994, eB_995, eB_997, eB_1000, eB_1001, eB_1004, eB_1005,
  eB_1006, eB_1007, eB_1008, eB_1009, eB_1013, eB_1019, eB_1020, eB_1023]
theorem nbOKB_345 : nbB_345 = nbhd entsB eB_345 := by decide +kernel
theorem mkOKB_345 : mkEnt 32 1024 W rB_345 345 = eB_345 := by decide +kernel
theorem tB_345 : kTermA 4294967295 eB_345 nbB_345 = 107569590251960161326566994 := by decide +kernel


end RamseyCert
