import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_1004 : List Ent := [
  eR_4, eR_5, eR_6, eR_13, eR_14, eR_15, eR_17, eR_18, eR_19, eR_20, eR_22, eR_24, eR_26, eR_27, eR_28, eR_29,
  eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_42, eR_43, eR_44, eR_48, eR_49, eR_50, eR_51,
  eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_77, eR_78, eR_80, eR_81, eR_82, eR_83, eR_92, eR_93,
  eR_94, eR_95, eR_97, eR_98, eR_99, eR_103, eR_104, eR_105, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_118, eR_119,
  eR_120, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144,
  eR_145, eR_146, eR_147, eR_148, eR_149, eR_150, eR_154, eR_155, eR_156, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174,
  eR_175, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202,
  eR_203, eR_211, eR_212, eR_213, eR_214, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_242, eR_243, eR_244, eR_245, eR_246,
  eR_247, eR_251, eR_253, eR_255, eR_256, eR_257, eR_258, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274, eR_275, eR_280, eR_281,
  eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307, eR_312, eR_313,
  eR_314, eR_315, eR_317, eR_318, eR_319, eR_324, eR_325, eR_327, eR_333, eR_334, eR_335, eR_341, eR_342, eR_344, eR_353, eR_354,
  eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378, eR_379, eR_380, eR_388, eR_390,
  eR_398, eR_402, eR_403, eR_404, eR_408, eR_409, eR_410, eR_414, eR_415, eR_416, eR_420, eR_421, eR_422, eR_423, eR_425, eR_431,
  eR_432, eR_433, eR_434, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_441, eR_442, eR_443, eR_444, eR_445, eR_446, eR_447,
  eR_448, eR_449, eR_453, eR_454, eR_455, eR_457, eR_459, eR_460, eR_461, eR_462, eR_463, eR_464, eR_465, eR_470, eR_471, eR_472,
  eR_473, eR_478, eR_479, eR_480, eR_481, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502, eR_503, eR_508, eR_509, eR_510,
  eR_511, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_541, eR_542, eR_544,
  eR_549, eR_550, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570, eR_571, eR_572, eR_577,
  eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_601, eR_602, eR_603, eR_604, eR_609,
  eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_622, eR_624, eR_625, eR_627, eR_633,
  eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655, eR_656, eR_661, eR_662,
  eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694,
  eR_695, eR_696, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_725, eR_726, eR_727,
  eR_728, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_761, eR_763, eR_764,
  eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_782, eR_783, eR_792,
  eR_793, eR_804, eR_805, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813, eR_814, eR_815, eR_820, eR_821, eR_822, eR_823, eR_826,
  eR_827, eR_828, eR_829, eR_830, eR_831, eR_832, eR_833, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_844, eR_845, eR_846,
  eR_847, eR_858, eR_859, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_872, eR_873, eR_882, eR_883, eR_884, eR_885, eR_888,
  eR_889, eR_892, eR_893, eR_894, eR_895, eR_896, eR_898, eR_899, eR_900, eR_903, eR_904, eR_905, eR_907, eR_911, eR_914, eR_915,
  eR_917, eR_918, eR_921, eR_922, eR_923, eR_926, eR_929, eR_931, eR_936, eR_938, eR_939, eR_941, eR_943, eR_944, eR_946, eR_949,
  eR_952, eR_953, eR_958, eR_959, eR_960, eR_961, eR_963, eR_964, eR_966, eR_968, eR_969, eR_973, eR_974, eR_977, eR_978, eR_981,
  eR_982, eR_986, eR_987, eR_988, eR_990, eR_991, eR_996, eR_1000, eR_1001, eR_1005, eR_1006, eR_1007, eR_1009, eR_1010, eR_1011, eR_1013,
  eR_1014, eR_1016, eR_1017, eR_1019, eR_1020, eR_1022]
theorem nbOKR_1004 : nbR_1004 = nbhd entsR eR_1004 := by decide +kernel
theorem mkOKR_1004 : mkEnt 32 1024 W rR_1004 1004 = eR_1004 := by decide +kernel
theorem tR_1004 : kTermA 4294967295 eR_1004 nbR_1004 = 71328416990916356023411152 := by decide +kernel


end RamseyCert
