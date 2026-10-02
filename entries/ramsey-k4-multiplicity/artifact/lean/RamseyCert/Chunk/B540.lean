import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_540 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_13, eB_14, eB_16, eB_20, eB_21, eB_23, eB_25, eB_29, eB_30, eB_31, eB_35,
  eB_38, eB_41, eB_44, eB_45, eB_46, eB_49, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_64, eB_65,
  eB_66, eB_67, eB_74, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_97,
  eB_99, eB_101, eB_104, eB_106, eB_110, eB_111, eB_113, eB_114, eB_115, eB_119, eB_120, eB_121, eB_124, eB_127, eB_130, eB_136,
  eB_137, eB_138, eB_139, eB_140, eB_142, eB_143, eB_145, eB_146, eB_150, eB_151, eB_152, eB_156, eB_157, eB_158, eB_162, eB_164,
  eB_165, eB_166, eB_167, eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_185, eB_188, eB_189, eB_190, eB_191,
  eB_192, eB_193, eB_194, eB_195, eB_200, eB_201, eB_202, eB_203, eB_208, eB_210, eB_212, eB_215, eB_218, eB_221, eB_224, eB_228,
  eB_229, eB_230, eB_233, eB_237, eB_238, eB_240, eB_241, eB_242, eB_249, eB_251, eB_254, eB_257, eB_259, eB_264, eB_265, eB_266,
  eB_267, eB_272, eB_273, eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294,
  eB_295, eB_300, eB_301, eB_302, eB_303, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330,
  eB_331, eB_332, eB_333, eB_334, eB_335, eB_338, eB_340, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_357,
  eB_358, eB_359, eB_360, eB_365, eB_366, eB_367, eB_368, eB_377, eB_378, eB_379, eB_380, eB_385, eB_386, eB_388, eB_390, eB_393,
  eB_396, eB_398, eB_401, eB_403, eB_405, eB_409, eB_410, eB_411, eB_415, eB_416, eB_417, eB_421, eB_422, eB_424, eB_426, eB_431,
  eB_432, eB_433, eB_434, eB_435, eB_438, eB_443, eB_446, eB_448, eB_450, eB_454, eB_455, eB_458, eB_461, eB_466, eB_467, eB_468,
  eB_469, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_485, eB_492, eB_493, eB_494, eB_495, eB_500, eB_501,
  eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_510, eB_512, eB_513, eB_514, eB_515, eB_518, eB_520, eB_521, eB_522, eB_523,
  eB_527, eB_532, eB_533, eB_534, eB_535, eB_537, eB_538, eB_539, eB_540, eB_549, eB_550, eB_551, eB_552, eB_557, eB_558, eB_559,
  eB_560, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_577, eB_578, eB_579, eB_580, eB_585, eB_586, eB_587,
  eB_588, eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_610, eB_611, eB_613, eB_614, eB_616, eB_617, eB_619,
  eB_620, eB_622, eB_624, eB_625, eB_627, eB_633, eB_634, eB_635, eB_636, eB_641, eB_642, eB_643, eB_644, eB_649, eB_650, eB_651,
  eB_652, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683,
  eB_684, eB_685, eB_686, eB_687, eB_688, eB_692, eB_693, eB_694, eB_695, eB_696, eB_705, eB_706, eB_707, eB_708, eB_713, eB_714,
  eB_715, eB_716, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_731, eB_733, eB_734, eB_735, eB_736, eB_737,
  eB_741, eB_742, eB_743, eB_744, eB_747, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_768, eB_769, eB_776,
  eB_777, eB_778, eB_779, eB_780, eB_781, eB_784, eB_785, eB_786, eB_787, eB_788, eB_789, eB_794, eB_795, eB_796, eB_797, eB_798,
  eB_799, eB_804, eB_805, eB_806, eB_807, eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_828, eB_829, eB_830,
  eB_831, eB_834, eB_835, eB_836, eB_837, eB_838, eB_839, eB_842, eB_843, eB_846, eB_847, eB_852, eB_853, eB_856, eB_857, eB_864,
  eB_865, eB_876, eB_877, eB_882, eB_883, eB_886, eB_887, eB_890, eB_891, eB_892, eB_893, eB_899, eB_900, eB_903, eB_904, eB_906,
  eB_912, eB_913, eB_914, eB_919, eB_920, eB_921, eB_922, eB_923, eB_924, eB_926, eB_927, eB_928, eB_930, eB_931, eB_932, eB_934,
  eB_935, eB_939, eB_940, eB_942, eB_944, eB_945, eB_949, eB_953, eB_954, eB_959, eB_963, eB_966, eB_968, eB_969, eB_970, eB_971,
  eB_973, eB_974, eB_977, eB_979, eB_980, eB_984, eB_987, eB_989, eB_992, eB_995, eB_997, eB_998, eB_999, eB_1004, eB_1005, eB_1006,
  eB_1007, eB_1010, eB_1011, eB_1012, eB_1014, eB_1015, eB_1016, eB_1017, eB_1020]
theorem nbOKB_540 : nbB_540 = nbhd entsB eB_540 := by decide +kernel
theorem mkOKB_540 : mkEnt 32 1024 W rB_540 540 = eB_540 := by decide +kernel
theorem tB_540 : kTermA 4294967295 eB_540 nbB_540 = 117869062728677423636283114 := by decide +kernel


end RamseyCert
