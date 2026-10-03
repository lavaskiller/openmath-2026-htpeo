import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_415 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_14, eR_16, eR_18, eR_20,
  eR_21, eR_23, eR_25, eR_28, eR_30, eR_32, eR_33, eR_35, eR_36, eR_38, eR_39, eR_41, eR_45, eR_47, eR_48, eR_49,
  eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73,
  eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94, eR_95, eR_97, eR_106,
  eR_108, eR_113, eR_115, eR_117, eR_119, eR_121, eR_123, eR_125, eR_128, eR_131, eR_140, eR_143, eR_146, eR_151, eR_153, eR_155,
  eR_157, eR_159, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165, eR_166, eR_167, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181,
  eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205,
  eR_206, eR_207, eR_208, eR_212, eR_213, eR_216, eR_219, eR_222, eR_225, eR_228, eR_233, eR_235, eR_240, eR_242, eR_244, eR_252,
  eR_253, eR_256, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_300, eR_301, eR_302, eR_303, eR_304, eR_305,
  eR_306, eR_307, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337,
  eR_338, eR_339, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362,
  eR_363, eR_364, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_387, eR_389, eR_392, eR_395, eR_400, eR_403,
  eR_404, eR_406, eR_408, eR_410, eR_412, eR_414, eR_416, eR_418, eR_420, eR_422, eR_423, eR_425, eR_427, eR_428, eR_429, eR_430,
  eR_431, eR_432, eR_433, eR_434, eR_435, eR_437, eR_438, eR_440, eR_442, eR_445, eR_448, eR_449, eR_451, eR_453, eR_455, eR_456,
  eR_457, eR_460, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_478, eR_479, eR_480, eR_481, eR_482, eR_483,
  eR_484, eR_485, eR_486, eR_487, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_512, eR_513, eR_514, eR_515,
  eR_516, eR_517, eR_518, eR_519, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_536, eR_545, eR_546, eR_547,
  eR_548, eR_549, eR_550, eR_551, eR_552, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_577, eR_578, eR_579,
  eR_580, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_601, eR_602, eR_603,
  eR_604, eR_605, eR_606, eR_607, eR_608, eR_610, eR_613, eR_616, eR_619, eR_622, eR_624, eR_625, eR_627, eR_629, eR_630, eR_631,
  eR_632, eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_653, eR_654, eR_655,
  eR_656, eR_657, eR_658, eR_659, eR_660, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_685, eR_686, eR_687,
  eR_688, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698, eR_699, eR_700, eR_717, eR_718, eR_719,
  eR_720, eR_721, eR_722, eR_723, eR_724, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_749, eR_750, eR_751,
  eR_752, eR_753, eR_754, eR_755, eR_756, eR_768, eR_769, eR_772, eR_773, eR_774, eR_775, eR_780, eR_781, eR_784, eR_785, eR_786,
  eR_787, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_812, eR_813, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_820,
  eR_821, eR_822, eR_823, eR_824, eR_825, eR_826, eR_827, eR_840, eR_841, eR_842, eR_843, eR_844, eR_845, eR_848, eR_849, eR_854,
  eR_855, eR_856, eR_857, eR_876, eR_877, eR_880, eR_881, eR_888, eR_889, eR_892, eR_893, eR_897, eR_899, eR_901, eR_903, eR_904,
  eR_910, eR_911, eR_916, eR_918, eR_919, eR_920, eR_921, eR_923, eR_926, eR_928, eR_931, eR_932, eR_933, eR_934, eR_936, eR_937,
  eR_938, eR_939, eR_940, eR_941, eR_942, eR_947, eR_951, eR_953, eR_954, eR_955, eR_958, eR_959, eR_961, eR_962, eR_963, eR_965,
  eR_967, eR_970, eR_973, eR_974, eR_976, eR_977, eR_982, eR_984, eR_987, eR_988, eR_990, eR_991, eR_992, eR_993, eR_994, eR_999,
  eR_1000, eR_1003, eR_1004, eR_1005, eR_1007, eR_1008, eR_1009, eR_1010, eR_1011, eR_1015, eR_1016, eR_1017, eR_1018, eR_1019, eR_1022, eR_1023]
theorem nbOKR_415 : nbR_415 = nbhd entsR eR_415 := by decide +kernel
theorem mkOKR_415 : mkEnt 32 1024 W rR_415 415 = eR_415 := by decide +kernel
theorem tR_415 : kTermA 4294967295 eR_415 nbR_415 = 113571197546228596921135896 := by decide +kernel


end RamseyCert
