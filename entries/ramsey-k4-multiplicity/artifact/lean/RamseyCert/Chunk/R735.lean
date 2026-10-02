import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_735 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_12, eR_14, eR_15, eR_16, eR_19, eR_20, eR_21, eR_23,
  eR_25, eR_28, eR_29, eR_30, eR_34, eR_35, eR_37, eR_38, eR_40, eR_41, eR_43, eR_44, eR_45, eR_52, eR_53, eR_54,
  eR_55, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82,
  eR_83, eR_92, eR_93, eR_94, eR_95, eR_99, eR_100, eR_101, eR_105, eR_106, eR_107, eR_111, eR_114, eR_115, eR_116, eR_120,
  eR_121, eR_122, eR_126, eR_129, eR_132, eR_136, eR_137, eR_138, eR_140, eR_141, eR_143, eR_144, eR_146, eR_147, eR_149, eR_150,
  eR_151, eR_155, eR_156, eR_157, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_180, eR_181, eR_182, eR_183,
  eR_184, eR_185, eR_186, eR_187, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_208, eR_209, eR_213, eR_214,
  eR_215, eR_216, eR_218, eR_219, eR_221, eR_222, eR_224, eR_225, eR_227, eR_228, eR_232, eR_235, eR_236, eR_237, eR_239, eR_240,
  eR_244, eR_245, eR_246, eR_247, eR_248, eR_249, eR_251, eR_253, eR_255, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_269,
  eR_270, eR_271, eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_292, eR_294, eR_295, eR_304, eR_305, eR_306,
  eR_307, eR_312, eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_332, eR_334, eR_335, eR_340,
  eR_345, eR_346, eR_347, eR_348, eR_349, eR_351, eR_352, eR_358, eR_359, eR_360, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378,
  eR_379, eR_380, eR_385, eR_386, eR_388, eR_390, eR_392, eR_393, eR_395, eR_396, eR_398, eR_400, eR_401, eR_402, eR_403, eR_407,
  eR_408, eR_409, eR_413, eR_414, eR_415, eR_419, eR_420, eR_421, eR_423, eR_425, eR_431, eR_432, eR_433, eR_434, eR_435, eR_436,
  eR_438, eR_439, eR_441, eR_444, eR_447, eR_448, eR_452, eR_453, eR_454, eR_456, eR_457, eR_459, eR_462, eR_463, eR_464, eR_465,
  eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497,
  eR_498, eR_499, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534,
  eR_535, eR_536, eR_541, eR_543, eR_544, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_561, eR_562, eR_563, eR_564,
  eR_569, eR_570, eR_571, eR_572, eR_581, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_606,
  eR_607, eR_608, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_621, eR_623, eR_626, eR_628, eR_629, eR_630,
  eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655, eR_656, eR_665, eR_666,
  eR_667, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687, eR_688, eR_697, eR_698, eR_699,
  eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722, eR_723, eR_724, eR_729, eR_730, eR_731, eR_732,
  eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_757, eR_758, eR_759, eR_760,
  eR_765, eR_766, eR_767, eR_768, eR_769, eR_780, eR_781, eR_784, eR_785, eR_786, eR_787, eR_789, eR_790, eR_792, eR_793, eR_794,
  eR_795, eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_810,
  eR_811, eR_812, eR_813, eR_820, eR_821, eR_828, eR_829, eR_830, eR_831, eR_836, eR_837, eR_850, eR_851, eR_852, eR_853, eR_854,
  eR_855, eR_858, eR_859, eR_860, eR_861, eR_864, eR_865, eR_872, eR_873, eR_876, eR_877, eR_878, eR_879, eR_884, eR_885, eR_888,
  eR_889, eR_897, eR_905, eR_906, eR_907, eR_909, eR_910, eR_911, eR_913, eR_914, eR_915, eR_916, eR_918, eR_919, eR_921, eR_923,
  eR_924, eR_925, eR_926, eR_928, eR_929, eR_932, eR_935, eR_936, eR_937, eR_938, eR_940, eR_941, eR_942, eR_943, eR_946, eR_948,
  eR_949, eR_950, eR_951, eR_952, eR_956, eR_957, eR_959, eR_962, eR_964, eR_968, eR_970, eR_972, eR_977, eR_980, eR_982, eR_983,
  eR_984, eR_986, eR_987, eR_991, eR_994, eR_996, eR_1000, eR_1003, eR_1005, eR_1006, eR_1007, eR_1008, eR_1010, eR_1011, eR_1012, eR_1013,
  eR_1015, eR_1016, eR_1019, eR_1020]
theorem nbOKR_735 : nbR_735 = nbhd entsR eR_735 := by decide +kernel
theorem mkOKR_735 : mkEnt 32 1024 W rR_735 735 = eR_735 := by decide +kernel
theorem tR_735 : kTermA 4294967295 eR_735 nbR_735 = 123844998826887832452259752 := by decide +kernel


end RamseyCert
