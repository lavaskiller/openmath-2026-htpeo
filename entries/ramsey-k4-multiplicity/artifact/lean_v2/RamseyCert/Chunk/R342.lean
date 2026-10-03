import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_342 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_12, eR_17, eR_18, eR_19, eR_20, eR_22, eR_24, eR_26, eR_30, eR_31, eR_32, eR_33,
  eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_45, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51, eR_56,
  eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_76, eR_77, eR_78, eR_80, eR_81, eR_82, eR_83, eR_92, eR_93,
  eR_94, eR_95, eR_97, eR_98, eR_99, eR_103, eR_104, eR_105, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_118, eR_119,
  eR_120, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_136, eR_137, eR_138, eR_151, eR_152, eR_153,
  eR_157, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_188,
  eR_189, eR_190, eR_192, eR_193, eR_194, eR_195, eR_204, eR_206, eR_207, eR_208, eR_209, eR_210, eR_215, eR_216, eR_217, eR_218,
  eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229, eR_236, eR_237, eR_238, eR_239, eR_240,
  eR_241, eR_248, eR_249, eR_250, eR_252, eR_253, eR_256, eR_257, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273,
  eR_274, eR_275, eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305,
  eR_306, eR_307, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333,
  eR_334, eR_335, eR_340, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_365,
  eR_366, eR_367, eR_368, eR_373, eR_374, eR_375, eR_376, eR_385, eR_386, eR_387, eR_389, eR_391, eR_392, eR_393, eR_394, eR_395,
  eR_396, eR_397, eR_399, eR_400, eR_401, eR_402, eR_403, eR_404, eR_408, eR_409, eR_410, eR_414, eR_415, eR_416, eR_420, eR_421,
  eR_422, eR_423, eR_425, eR_427, eR_428, eR_430, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_441, eR_442, eR_443, eR_444,
  eR_445, eR_446, eR_447, eR_448, eR_449, eR_453, eR_454, eR_455, eR_457, eR_459, eR_460, eR_461, eR_466, eR_467, eR_468, eR_469,
  eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_489, eR_490, eR_491, eR_497, eR_498, eR_499, eR_504, eR_506,
  eR_507, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539,
  eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568, eR_573, eR_574, eR_575,
  eR_576, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606, eR_607,
  eR_608, eR_621, eR_623, eR_626, eR_628, eR_629, eR_630, eR_631, eR_632, eR_637, eR_638, eR_640, eR_645, eR_646, eR_647, eR_648,
  eR_653, eR_654, eR_655, eR_656, eR_661, eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684,
  eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_705, eR_706, eR_709, eR_710, eR_711, eR_718, eR_719, eR_720,
  eR_725, eR_726, eR_727, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_761,
  eR_762, eR_763, eR_764, eR_770, eR_771, eR_776, eR_777, eR_778, eR_779, eR_784, eR_785, eR_786, eR_787, eR_788, eR_789, eR_792,
  eR_793, eR_794, eR_795, eR_798, eR_799, eR_802, eR_803, eR_808, eR_809, eR_810, eR_811, eR_822, eR_823, eR_824, eR_825, eR_826,
  eR_827, eR_828, eR_829, eR_834, eR_835, eR_836, eR_837, eR_842, eR_843, eR_846, eR_847, eR_848, eR_849, eR_856, eR_857, eR_858,
  eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_872, eR_873, eR_874, eR_875, eR_878, eR_879,
  eR_882, eR_883, eR_886, eR_887, eR_894, eR_895, eR_899, eR_900, eR_901, eR_902, eR_906, eR_910, eR_913, eR_915, eR_916, eR_918,
  eR_919, eR_921, eR_923, eR_924, eR_925, eR_926, eR_928, eR_929, eR_931, eR_934, eR_938, eR_940, eR_942, eR_943, eR_946, eR_947,
  eR_948, eR_949, eR_950, eR_953, eR_954, eR_960, eR_961, eR_962, eR_966, eR_967, eR_969, eR_971, eR_975, eR_976, eR_979, eR_980,
  eR_981, eR_987, eR_990, eR_994, eR_995, eR_997, eR_1000, eR_1001, eR_1003, eR_1004, eR_1005, eR_1006, eR_1007, eR_1008, eR_1009, eR_1014,
  eR_1015, eR_1016, eR_1021, eR_1022, eR_1023]
theorem nbOKR_342 : nbR_342 = nbhd entsR eR_342 := by decide +kernel
theorem mkOKR_342 : mkEnt 32 1024 W rR_342 342 = eR_342 := by decide +kernel
theorem tR_342 : kTermA 4294967295 eR_342 nbR_342 = 50859538833051739245328452 := by decide +kernel


end RamseyCert
