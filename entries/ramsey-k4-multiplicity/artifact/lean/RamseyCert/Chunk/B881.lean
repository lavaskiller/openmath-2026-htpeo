import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_881 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_12, eB_14, eB_15, eB_16, eB_17, eB_19, eB_20, eB_22, eB_24, eB_26, eB_27, eB_30,
  eB_31, eB_32, eB_33, eB_34, eB_35, eB_37, eB_38, eB_40, eB_41, eB_42, eB_43, eB_46, eB_47, eB_48, eB_49, eB_50,
  eB_51, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_60, eB_61, eB_62, eB_63, eB_80, eB_81, eB_82,
  eB_83, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_97, eB_98, eB_102,
  eB_105, eB_108, eB_109, eB_110, eB_112, eB_113, eB_117, eB_118, eB_119, eB_123, eB_126, eB_129, eB_132, eB_136, eB_137, eB_138,
  eB_139, eB_140, eB_141, eB_143, eB_144, eB_146, eB_147, eB_148, eB_150, eB_152, eB_153, eB_154, eB_158, eB_159, eB_176, eB_177,
  eB_178, eB_179, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_210, eB_211,
  eB_212, eB_213, eB_214, eB_215, eB_216, eB_218, eB_219, eB_221, eB_222, eB_224, eB_225, eB_229, eB_230, eB_231, eB_232, eB_233,
  eB_234, eB_238, eB_241, eB_242, eB_243, eB_245, eB_246, eB_247, eB_248, eB_249, eB_252, eB_254, eB_255, eB_258, eB_259, eB_268,
  eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_308,
  eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_340,
  eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364,
  eB_385, eB_386, eB_387, eB_389, eB_392, eB_393, eB_395, eB_396, eB_397, eB_400, eB_401, eB_402, eB_403, eB_405, eB_406, eB_407,
  eB_410, eB_411, eB_412, eB_416, eB_417, eB_418, eB_421, eB_422, eB_424, eB_426, eB_435, eB_436, eB_438, eB_439, eB_441, eB_444,
  eB_447, eB_448, eB_449, eB_450, eB_451, eB_455, eB_456, eB_458, eB_459, eB_462, eB_463, eB_464, eB_465, eB_466, eB_467, eB_468,
  eB_469, eB_486, eB_487, eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495, eB_520, eB_521, eB_522, eB_523, eB_524,
  eB_525, eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_536, eB_553, eB_554, eB_555, eB_556,
  eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572,
  eB_573, eB_574, eB_575, eB_576, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_609, eB_610, eB_612, eB_613,
  eB_615, eB_616, eB_617, eB_618, eB_619, eB_622, eB_624, eB_625, eB_626, eB_627, eB_637, eB_638, eB_639, eB_640, eB_641, eB_642,
  eB_643, eB_644, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682,
  eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692, eB_701, eB_702, eB_703, eB_704, eB_705, eB_706,
  eB_707, eB_708, eB_717, eB_718, eB_719, eB_720, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730,
  eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740, eB_765, eB_766, eB_767, eB_774, eB_775, eB_776,
  eB_777, eB_780, eB_781, eB_784, eB_785, eB_786, eB_787, eB_790, eB_791, eB_792, eB_793, eB_810, eB_811, eB_812, eB_813, eB_816,
  eB_817, eB_820, eB_821, eB_830, eB_831, eB_832, eB_833, eB_834, eB_835, eB_836, eB_837, eB_840, eB_841, eB_844, eB_845, eB_846,
  eB_847, eB_850, eB_851, eB_856, eB_857, eB_862, eB_863, eB_872, eB_873, eB_874, eB_875, eB_876, eB_877, eB_878, eB_879, eB_880,
  eB_881, eB_882, eB_883, eB_884, eB_885, eB_898, eB_900, eB_902, eB_906, eB_907, eB_908, eB_911, eB_913, eB_914, eB_918, eB_920,
  eB_925, eB_930, eB_931, eB_934, eB_936, eB_937, eB_938, eB_939, eB_940, eB_941, eB_942, eB_944, eB_945, eB_946, eB_948, eB_949,
  eB_950, eB_951, eB_953, eB_954, eB_955, eB_956, eB_957, eB_958, eB_960, eB_961, eB_966, eB_969, eB_970, eB_971, eB_972, eB_974,
  eB_975, eB_976, eB_977, eB_980, eB_982, eB_983, eB_984, eB_986, eB_987, eB_988, eB_989, eB_990, eB_991, eB_992, eB_999, eB_1000,
  eB_1002, eB_1003, eB_1004, eB_1006, eB_1009, eB_1013, eB_1016]
theorem nbOKB_881 : nbB_881 = nbhd entsB eB_881 := by decide +kernel
theorem mkOKB_881 : mkEnt 32 1024 W rB_881 881 = eB_881 := by decide +kernel
theorem tB_881 : kTermA 4294967295 eB_881 nbB_881 = 109258795577894444953784416 := by decide +kernel


end RamseyCert
