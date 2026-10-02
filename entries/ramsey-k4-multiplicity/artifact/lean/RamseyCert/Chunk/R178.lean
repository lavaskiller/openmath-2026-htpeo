import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_178 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_16, eR_17, eR_19, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26,
  eR_28, eR_29, eR_31, eR_32, eR_34, eR_35, eR_37, eR_38, eR_40, eR_41, eR_43, eR_44, eR_46, eR_47, eR_52, eR_53,
  eR_54, eR_55, eR_60, eR_61, eR_62, eR_63, eR_64, eR_66, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87,
  eR_88, eR_89, eR_90, eR_91, eR_96, eR_97, eR_98, eR_100, eR_101, eR_105, eR_106, eR_107, eR_109, eR_110, eR_112, eR_113,
  eR_115, eR_116, eR_118, eR_119, eR_121, eR_122, eR_126, eR_129, eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139,
  eR_142, eR_145, eR_149, eR_150, eR_152, eR_153, eR_155, eR_156, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169,
  eR_170, eR_171, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205,
  eR_206, eR_207, eR_210, eR_213, eR_215, eR_216, eR_218, eR_219, eR_221, eR_222, eR_224, eR_225, eR_229, eR_232, eR_235, eR_238,
  eR_241, eR_244, eR_250, eR_253, eR_254, eR_255, eR_256, eR_257, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270, eR_271,
  eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_296, eR_297, eR_299, eR_300, eR_301, eR_302, eR_303, eR_308, eR_309, eR_310,
  eR_311, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335, eR_341, eR_342, eR_343, eR_344, eR_349,
  eR_350, eR_351, eR_352, eR_361, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_373, eR_374, eR_375, eR_376, eR_391, eR_394,
  eR_399, eR_404, eR_405, eR_406, eR_408, eR_409, eR_411, eR_412, eR_414, eR_415, eR_417, eR_418, eR_420, eR_421, eR_423, eR_424,
  eR_425, eR_426, eR_431, eR_432, eR_433, eR_434, eR_437, eR_440, eR_442, eR_443, eR_445, eR_446, eR_449, eR_450, eR_451, eR_453,
  eR_454, eR_456, eR_457, eR_458, eR_460, eR_461, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_478, eR_479,
  eR_480, eR_481, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_500, eR_501, eR_502, eR_503, eR_508, eR_509, eR_510, eR_511,
  eR_512, eR_513, eR_514, eR_515, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535, eR_536, eR_541, eR_542, eR_543,
  eR_544, eR_549, eR_550, eR_551, eR_552, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568, eR_573, eR_574, eR_575, eR_576,
  eR_577, eR_578, eR_579, eR_580, eR_585, eR_587, eR_588, eR_594, eR_595, eR_596, eR_605, eR_606, eR_607, eR_608, eR_609, eR_610,
  eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_633, eR_634,
  eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659, eR_660, eR_661, eR_662,
  eR_663, eR_669, eR_670, eR_671, eR_672, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691, eR_692, eR_697, eR_698, eR_699,
  eR_700, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_725, eR_726, eR_727,
  eR_728, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_757, eR_759, eR_760,
  eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_788,
  eR_789, eR_790, eR_791, eR_794, eR_795, eR_796, eR_797, eR_800, eR_801, eR_806, eR_807, eR_810, eR_811, eR_812, eR_813, eR_814,
  eR_815, eR_816, eR_817, eR_826, eR_827, eR_828, eR_829, eR_834, eR_835, eR_841, eR_850, eR_851, eR_852, eR_853, eR_854, eR_855,
  eR_856, eR_857, eR_862, eR_863, eR_866, eR_868, eR_869, eR_874, eR_875, eR_876, eR_877, eR_878, eR_879, eR_882, eR_883, eR_884,
  eR_885, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_892, eR_893, eR_897, eR_900, eR_901, eR_902, eR_907, eR_908, eR_912,
  eR_913, eR_915, eR_917, eR_918, eR_919, eR_920, eR_921, eR_922, eR_925, eR_926, eR_929, eR_930, eR_931, eR_932, eR_934, eR_938,
  eR_939, eR_940, eR_941, eR_942, eR_943, eR_946, eR_948, eR_950, eR_951, eR_952, eR_955, eR_959, eR_960, eR_961, eR_963, eR_965,
  eR_966, eR_967, eR_971, eR_973, eR_976, eR_977, eR_978, eR_980, eR_981, eR_982, eR_984, eR_985, eR_988, eR_989, eR_994, eR_996,
  eR_997, eR_1002, eR_1005, eR_1010, eR_1016, eR_1019, eR_1020]
theorem nbOKR_178 : nbR_178 = nbhd entsR eR_178 := by decide +kernel
theorem mkOKR_178 : mkEnt 32 1024 W rR_178 178 = eR_178 := by decide +kernel
theorem tR_178 : kTermA 4294967295 eR_178 nbR_178 = 75690954249400457327784060 := by decide +kernel


end RamseyCert
