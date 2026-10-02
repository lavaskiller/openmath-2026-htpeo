import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_131 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_18, eR_20, eR_28, eR_31, eR_35, eR_36, eR_39, eR_41,
  eR_43, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70,
  eR_71, eR_98, eR_99, eR_101, eR_102, eR_104, eR_105, eR_106, eR_108, eR_109, eR_111, eR_112, eR_114, eR_115, eR_117, eR_118,
  eR_120, eR_121, eR_123, eR_124, eR_126, eR_127, eR_129, eR_130, eR_132, eR_136, eR_137, eR_138, eR_140, eR_143, eR_146, eR_149,
  eR_152, eR_158, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189,
  eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205,
  eR_206, eR_207, eR_208, eR_211, eR_214, eR_216, eR_225, eR_228, eR_231, eR_234, eR_237, eR_240, eR_243, eR_245, eR_246, eR_247,
  eR_249, eR_250, eR_253, eR_254, eR_256, eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_284, eR_285, eR_286,
  eR_287, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_308, eR_309, eR_310,
  eR_311, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_332, eR_333, eR_334,
  eR_335, eR_336, eR_337, eR_338, eR_339, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351,
  eR_352, eR_353, eR_354, eR_355, eR_356, eR_365, eR_366, eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_381, eR_382, eR_383,
  eR_384, eR_391, eR_393, eR_394, eR_396, eR_399, eR_401, eR_402, eR_406, eR_409, eR_412, eR_415, eR_418, eR_421, eR_423, eR_424,
  eR_425, eR_426, eR_436, eR_439, eR_442, eR_445, eR_447, eR_456, eR_457, eR_458, eR_460, eR_462, eR_463, eR_464, eR_465, eR_466,
  eR_467, eR_468, eR_469, eR_478, eR_479, eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_488, eR_489, eR_490,
  eR_491, eR_492, eR_493, eR_494, eR_495, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514,
  eR_515, eR_516, eR_517, eR_518, eR_519, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539,
  eR_540, eR_541, eR_542, eR_543, eR_544, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563,
  eR_564, eR_565, eR_566, eR_567, eR_568, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587,
  eR_588, eR_589, eR_590, eR_591, eR_592, eR_601, eR_602, eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_609, eR_614, eR_615,
  eR_617, eR_618, eR_620, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_653, eR_654, eR_655, eR_656, eR_657,
  eR_658, eR_659, eR_660, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_693, eR_694, eR_695, eR_696, eR_697,
  eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706, eR_707, eR_708, eR_717, eR_718, eR_719, eR_720, eR_721,
  eR_722, eR_723, eR_724, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_757, eR_758, eR_759, eR_760, eR_761,
  eR_762, eR_763, eR_764, eR_768, eR_769, eR_772, eR_773, eR_774, eR_775, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785, eR_788,
  eR_789, eR_790, eR_791, eR_794, eR_795, eR_796, eR_797, eR_798, eR_799, eR_806, eR_807, eR_810, eR_811, eR_814, eR_815, eR_818,
  eR_819, eR_820, eR_821, eR_828, eR_829, eR_830, eR_831, eR_836, eR_837, eR_838, eR_839, eR_844, eR_845, eR_846, eR_847, eR_852,
  eR_853, eR_854, eR_855, eR_856, eR_857, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_876,
  eR_877, eR_878, eR_879, eR_880, eR_881, eR_882, eR_883, eR_886, eR_887, eR_888, eR_892, eR_893, eR_894, eR_895, eR_896, eR_898,
  eR_899, eR_900, eR_901, eR_902, eR_903, eR_905, eR_910, eR_913, eR_915, eR_916, eR_921, eR_923, eR_927, eR_929, eR_930, eR_934,
  eR_936, eR_940, eR_941, eR_942, eR_945, eR_947, eR_949, eR_950, eR_951, eR_952, eR_955, eR_958, eR_962, eR_964, eR_972, eR_978,
  eR_979, eR_981, eR_982, eR_983, eR_984, eR_986, eR_988, eR_990, eR_991, eR_993, eR_997, eR_999, eR_1001, eR_1002, eR_1004, eR_1005,
  eR_1009, eR_1011, eR_1012, eR_1014, eR_1015, eR_1016, eR_1017, eR_1022, eR_1023]
theorem nbOKR_131 : nbR_131 = nbhd entsR eR_131 := by decide +kernel
theorem mkOKR_131 : mkEnt 32 1024 W rR_131 131 = eR_131 := by decide +kernel
theorem tR_131 : kTermA 4294967295 eR_131 nbR_131 = 118232449868505151425471672 := by decide +kernel


end RamseyCert
