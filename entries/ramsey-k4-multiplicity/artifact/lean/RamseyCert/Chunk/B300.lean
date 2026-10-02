import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_300 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_14, eB_16, eB_18, eB_20, eB_21, eB_23, eB_25, eB_28,
  eB_30, eB_32, eB_33, eB_35, eB_36, eB_38, eB_39, eB_41, eB_43, eB_45, eB_47, eB_52, eB_53, eB_54, eB_55, eB_56,
  eB_57, eB_58, eB_59, eB_63, eB_68, eB_69, eB_70, eB_71, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83,
  eB_87, eB_92, eB_93, eB_94, eB_95, eB_97, eB_101, eB_102, eB_103, eB_106, eB_108, eB_110, eB_113, eB_115, eB_117, eB_119,
  eB_121, eB_123, eB_125, eB_128, eB_131, eB_140, eB_143, eB_146, eB_149, eB_151, eB_153, eB_155, eB_157, eB_159, eB_164, eB_165,
  eB_166, eB_167, eB_168, eB_169, eB_170, eB_171, eB_174, eB_180, eB_181, eB_182, eB_183, eB_188, eB_189, eB_190, eB_191, eB_192,
  eB_193, eB_194, eB_195, eB_199, eB_204, eB_205, eB_206, eB_207, eB_208, eB_212, eB_213, eB_216, eB_219, eB_222, eB_225, eB_228,
  eB_230, eB_232, eB_233, eB_235, eB_237, eB_240, eB_242, eB_244, eB_248, eB_252, eB_253, eB_256, eB_264, eB_265, eB_266, eB_267,
  eB_272, eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299,
  eB_300, eB_301, eB_302, eB_303, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_328, eB_329, eB_330, eB_331,
  eB_332, eB_333, eB_334, eB_335, eB_341, eB_342, eB_343, eB_344, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360,
  eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_387, eB_389, eB_392, eB_395, eB_397, eB_400, eB_403, eB_404,
  eB_406, eB_408, eB_410, eB_412, eB_414, eB_416, eB_418, eB_420, eB_422, eB_423, eB_425, eB_427, eB_428, eB_429, eB_430, eB_435,
  eB_437, eB_438, eB_440, eB_442, eB_445, eB_448, eB_449, eB_451, eB_453, eB_455, eB_456, eB_457, eB_460, eB_462, eB_463, eB_464,
  eB_465, eB_471, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487, eB_488, eB_492, eB_493, eB_494,
  eB_495, eB_496, eB_497, eB_498, eB_499, eB_506, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515, eB_520, eB_524,
  eB_525, eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_536, eB_537, eB_538, eB_539, eB_540, eB_549, eB_550, eB_551, eB_552,
  eB_553, eB_554, eB_555, eB_556, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_574, eB_581, eB_582, eB_583,
  eB_584, eB_589, eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_605, eB_606, eB_607, eB_608, eB_610, eB_613, eB_616,
  eB_619, eB_622, eB_624, eB_625, eB_627, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_645, eB_646, eB_647,
  eB_648, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_669, eB_670, eB_671, eB_672, eB_681, eB_682, eB_683,
  eB_684, eB_685, eB_686, eB_687, eB_688, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_709, eB_713, eB_714,
  eB_715, eB_716, eB_717, eB_718, eB_719, eB_720, eB_726, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_743,
  eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_772, eB_773, eB_774, eB_775,
  eB_783, eB_786, eB_787, eB_794, eB_795, eB_802, eB_803, eB_806, eB_807, eB_808, eB_809, eB_812, eB_813, eB_814, eB_815, eB_820,
  eB_821, eB_822, eB_823, eB_824, eB_825, eB_826, eB_827, eB_830, eB_831, eB_846, eB_847, eB_851, eB_852, eB_853, eB_854, eB_855,
  eB_856, eB_857, eB_866, eB_867, eB_874, eB_878, eB_879, eB_880, eB_881, eB_882, eB_883, eB_886, eB_887, eB_888, eB_889, eB_890,
  eB_891, eB_892, eB_893, eB_896, eB_897, eB_901, eB_903, eB_904, eB_905, eB_911, eB_914, eB_915, eB_917, eB_918, eB_919, eB_920,
  eB_924, eB_928, eB_929, eB_931, eB_932, eB_933, eB_935, eB_937, eB_939, eB_942, eB_948, eB_949, eB_950, eB_951, eB_953, eB_955,
  eB_956, eB_958, eB_962, eB_964, eB_965, eB_966, eB_967, eB_969, eB_970, eB_972, eB_973, eB_974, eB_975, eB_976, eB_977, eB_978,
  eB_979, eB_981, eB_982, eB_983, eB_984, eB_987, eB_988, eB_990, eB_991, eB_992, eB_993, eB_996, eB_998, eB_1001, eB_1003, eB_1004,
  eB_1005, eB_1006, eB_1010, eB_1015, eB_1016, eB_1019, eB_1022, eB_1023]
theorem nbOKB_300 : nbB_300 = nbhd entsB eB_300 := by decide +kernel
theorem mkOKB_300 : mkEnt 32 1024 W rB_300 300 = eB_300 := by decide +kernel
theorem tB_300 : kTermA 4294967295 eB_300 nbB_300 = 122837656864799979531355433 := by decide +kernel


end RamseyCert
