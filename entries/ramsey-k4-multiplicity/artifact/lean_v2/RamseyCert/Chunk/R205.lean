import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_205 : List Ent := [
  eR_4, eR_6, eR_7, eR_12, eR_13, eR_14, eR_15, eR_27, eR_28, eR_29, eR_30, eR_31, eR_32, eR_42, eR_43, eR_44,
  eR_45, eR_46, eR_47, eR_52, eR_53, eR_54, eR_55, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_76,
  eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_92, eR_94, eR_95, eR_96, eR_97, eR_98, eR_99, eR_100, eR_101,
  eR_102, eR_103, eR_104, eR_105, eR_106, eR_107, eR_108, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_115, eR_116, eR_117,
  eR_118, eR_119, eR_120, eR_121, eR_122, eR_123, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_133,
  eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_148, eR_149,
  eR_150, eR_151, eR_152, eR_153, eR_154, eR_155, eR_156, eR_157, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169,
  eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186, eR_187, eR_192, eR_193, eR_194, eR_195, eR_200, eR_201,
  eR_202, eR_203, eR_248, eR_249, eR_250, eR_251, eR_252, eR_255, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275,
  eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307,
  eR_312, eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339,
  eR_341, eR_343, eR_349, eR_351, eR_352, eR_357, eR_359, eR_360, eR_365, eR_366, eR_367, eR_373, eR_374, eR_375, eR_387, eR_388,
  eR_389, eR_390, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_397, eR_398, eR_399, eR_400, eR_401, eR_402, eR_403, eR_404,
  eR_405, eR_406, eR_407, eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416, eR_417, eR_418, eR_419, eR_420,
  eR_421, eR_422, eR_427, eR_428, eR_429, eR_430, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_447, eR_448, eR_449, eR_450,
  eR_451, eR_452, eR_453, eR_454, eR_455, eR_456, eR_462, eR_463, eR_464, eR_465, eR_470, eR_471, eR_472, eR_473, eR_478, eR_479,
  eR_480, eR_481, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_504, eR_505, eR_506, eR_507,
  eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_536, eR_537, eR_538, eR_539,
  eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570, eR_571,
  eR_572, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_601, eR_602, eR_603,
  eR_604, eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_657, eR_658, eR_659, eR_660,
  eR_665, eR_666, eR_668, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691, eR_692, eR_697,
  eR_698, eR_699, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_729, eR_730, eR_731,
  eR_732, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762, eR_763,
  eR_765, eR_766, eR_767, eR_768, eR_769, eR_774, eR_775, eR_780, eR_781, eR_786, eR_787, eR_788, eR_789, eR_792, eR_793, eR_794,
  eR_795, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_806, eR_807, eR_810, eR_811, eR_814, eR_815, eR_818, eR_819, eR_820,
  eR_821, eR_822, eR_823, eR_824, eR_825, eR_826, eR_827, eR_828, eR_829, eR_832, eR_833, eR_836, eR_837, eR_842, eR_843, eR_844,
  eR_845, eR_846, eR_847, eR_848, eR_849, eR_850, eR_851, eR_854, eR_855, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_868,
  eR_869, eR_876, eR_877, eR_880, eR_881, eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_892,
  eR_893, eR_894, eR_895, eR_900, eR_902, eR_903, eR_908, eR_909, eR_912, eR_913, eR_914, eR_917, eR_918, eR_919, eR_922, eR_926,
  eR_928, eR_929, eR_931, eR_935, eR_936, eR_938, eR_941, eR_944, eR_949, eR_950, eR_951, eR_953, eR_954, eR_955, eR_956, eR_957,
  eR_958, eR_961, eR_967, eR_968, eR_971, eR_975, eR_976, eR_979, eR_984, eR_985, eR_987, eR_989, eR_991, eR_993, eR_994, eR_996,
  eR_997, eR_998, eR_999, eR_1000, eR_1001, eR_1003, eR_1007, eR_1008, eR_1011, eR_1013, eR_1014, eR_1017, eR_1020]
theorem nbOKR_205 : nbR_205 = nbhd entsR eR_205 := by decide +kernel
theorem mkOKR_205 : mkEnt 32 1024 W rR_205 205 = eR_205 := by decide +kernel
theorem tR_205 : kTermA 4294967295 eR_205 nbR_205 = 125347337701789283287303584 := by decide +kernel


end RamseyCert
