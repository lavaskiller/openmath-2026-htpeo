import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_141 : List Ent := [
  eR_13, eR_14, eR_18, eR_19, eR_27, eR_28, eR_30, eR_31, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_42, eR_43,
  eR_45, eR_46, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77,
  eR_78, eR_79, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93,
  eR_94, eR_95, eR_96, eR_98, eR_104, eR_106, eR_109, eR_112, eR_115, eR_118, eR_121, eR_124, eR_127, eR_130, eR_133, eR_134,
  eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_148, eR_149, eR_151, eR_152, eR_154, eR_155, eR_157, eR_158, eR_160, eR_161,
  eR_162, eR_163, eR_164, eR_165, eR_166, eR_167, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193,
  eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205, eR_206, eR_207, eR_209, eR_212,
  eR_214, eR_215, eR_218, eR_224, eR_227, eR_230, eR_233, eR_236, eR_239, eR_242, eR_245, eR_246, eR_250, eR_256, eR_258, eR_259,
  eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283,
  eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307,
  eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331,
  eR_340, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_369, eR_370, eR_371,
  eR_372, eR_385, eR_386, eR_391, eR_392, eR_394, eR_395, eR_400, eR_403, eR_405, eR_408, eR_411, eR_414, eR_417, eR_420, eR_435,
  eR_441, eR_442, eR_444, eR_445, eR_450, eR_453, eR_456, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_470,
  eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494,
  eR_495, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518,
  eR_519, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_536, eR_537, eR_538, eR_539, eR_540, eR_541, eR_542,
  eR_543, eR_544, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590,
  eR_591, eR_592, eR_609, eR_612, eR_615, eR_618, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_629, eR_630,
  eR_631, eR_632, eR_633, eR_634, eR_635, eR_636, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652, eR_669, eR_670,
  eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_693, eR_694,
  eR_695, eR_696, eR_697, eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710,
  eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_733, eR_734,
  eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_757, eR_758,
  eR_759, eR_760, eR_761, eR_762, eR_763, eR_764, eR_768, eR_769, eR_780, eR_781, eR_786, eR_787, eR_790, eR_791, eR_796, eR_797,
  eR_802, eR_803, eR_806, eR_807, eR_808, eR_809, eR_814, eR_815, eR_816, eR_817, eR_820, eR_821, eR_830, eR_831, eR_832, eR_833,
  eR_840, eR_841, eR_846, eR_847, eR_852, eR_853, eR_854, eR_855, eR_856, eR_857, eR_858, eR_859, eR_860, eR_866, eR_867, eR_868,
  eR_872, eR_876, eR_877, eR_882, eR_883, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_894, eR_895, eR_899, eR_900, eR_901,
  eR_902, eR_904, eR_905, eR_906, eR_907, eR_908, eR_911, eR_912, eR_917, eR_918, eR_919, eR_920, eR_922, eR_924, eR_925, eR_926,
  eR_928, eR_933, eR_934, eR_936, eR_938, eR_939, eR_941, eR_943, eR_944, eR_946, eR_947, eR_948, eR_951, eR_952, eR_963, eR_964,
  eR_965, eR_971, eR_972, eR_973, eR_979, eR_980, eR_981, eR_983, eR_984, eR_985, eR_986, eR_988, eR_989, eR_990, eR_991, eR_992,
  eR_994, eR_997, eR_998, eR_1000, eR_1001, eR_1003, eR_1004, eR_1006, eR_1007, eR_1008, eR_1009, eR_1011, eR_1012, eR_1018, eR_1022, eR_1023]
theorem nbOKR_141 : nbR_141 = nbhd entsR eR_141 := by decide +kernel
theorem mkOKR_141 : mkEnt 32 1024 W rR_141 141 = eR_141 := by decide +kernel
theorem tR_141 : kTermA 4294967295 eR_141 nbR_141 = 127205673129426065952787194 := by decide +kernel


end RamseyCert
