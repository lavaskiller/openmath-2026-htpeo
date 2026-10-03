import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_32 : List Ent := [
  eR_12, eR_13, eR_14, eR_16, eR_20, eR_21, eR_23, eR_25, eR_29, eR_30, eR_31, eR_35, eR_38, eR_41, eR_44, eR_45,
  eR_46, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70,
  eR_71, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94,
  eR_95, eR_97, eR_99, eR_101, eR_104, eR_106, eR_110, eR_111, eR_114, eR_119, eR_120, eR_121, eR_124, eR_127, eR_136, eR_137,
  eR_138, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_150, eR_151, eR_152, eR_156, eR_157, eR_158, eR_168, eR_169, eR_170,
  eR_171, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_192, eR_193, eR_194,
  eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205, eR_206, eR_207, eR_208, eR_210, eR_212,
  eR_218, eR_221, eR_224, eR_228, eR_229, eR_230, eR_233, eR_237, eR_238, eR_240, eR_242, eR_249, eR_251, eR_254, eR_257, eR_259,
  eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275,
  eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315,
  eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331,
  eR_340, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379,
  eR_380, eR_385, eR_386, eR_388, eR_393, eR_398, eR_401, eR_403, eR_409, eR_410, eR_411, eR_415, eR_416, eR_417, eR_421, eR_422,
  eR_424, eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_435, eR_438, eR_443, eR_446, eR_448, eR_454, eR_455,
  eR_458, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475, eR_476,
  eR_477, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502,
  eR_503, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539, eR_540, eR_541, eR_542, eR_543,
  eR_544, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583,
  eR_584, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619,
  eR_620, eR_622, eR_624, eR_625, eR_627, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_653, eR_654, eR_655,
  eR_656, eR_657, eR_658, eR_659, eR_660, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671,
  eR_672, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_693, eR_694, eR_695,
  eR_696, eR_697, eR_698, eR_699, eR_700, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719,
  eR_720, eR_721, eR_722, eR_723, eR_724, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759,
  eR_760, eR_761, eR_762, eR_763, eR_764, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_778, eR_779, eR_780,
  eR_781, eR_782, eR_783, eR_784, eR_785, eR_790, eR_791, eR_794, eR_795, eR_802, eR_803, eR_804, eR_805, eR_807, eR_812, eR_813,
  eR_816, eR_817, eR_820, eR_821, eR_824, eR_825, eR_828, eR_829, eR_830, eR_831, eR_835, eR_836, eR_837, eR_838, eR_839, eR_842,
  eR_843, eR_846, eR_847, eR_850, eR_851, eR_852, eR_853, eR_854, eR_855, eR_858, eR_859, eR_874, eR_875, eR_876, eR_877, eR_882,
  eR_883, eR_886, eR_887, eR_890, eR_891, eR_894, eR_895, eR_897, eR_899, eR_901, eR_902, eR_906, eR_908, eR_911, eR_913, eR_914,
  eR_917, eR_921, eR_922, eR_923, eR_924, eR_926, eR_928, eR_930, eR_932, eR_933, eR_934, eR_935, eR_939, eR_940, eR_943, eR_949,
  eR_952, eR_953, eR_954, eR_957, eR_958, eR_959, eR_962, eR_963, eR_964, eR_965, eR_966, eR_967, eR_968, eR_969, eR_971, eR_977,
  eR_979, eR_980, eR_982, eR_983, eR_987, eR_988, eR_990, eR_991, eR_993, eR_998, eR_999, eR_1002, eR_1006, eR_1007, eR_1011, eR_1014,
  eR_1016, eR_1017, eR_1020, eR_1023]
theorem nbOKR_32 : nbR_32 = nbhd entsR eR_32 := by decide +kernel
theorem mkOKR_32 : mkEnt 32 1024 W rR_32 32 = eR_32 := by decide +kernel
theorem tR_32 : kTermA 4294967295 eR_32 nbR_32 = 92236391437616262035255340 := by decide +kernel


end RamseyCert
