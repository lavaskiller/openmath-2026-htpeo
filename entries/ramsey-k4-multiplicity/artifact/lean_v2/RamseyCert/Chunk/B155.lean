import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_155 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_14, eB_16, eB_18, eB_20,
  eB_21, eB_23, eB_25, eB_28, eB_30, eB_32, eB_33, eB_35, eB_36, eB_38, eB_39, eB_41, eB_43, eB_45, eB_47, eB_56,
  eB_57, eB_58, eB_59, eB_60, eB_61, eB_62, eB_63, eB_80, eB_81, eB_82, eB_83, eB_84, eB_85, eB_86, eB_87, eB_96,
  eB_97, eB_98, eB_99, eB_100, eB_104, eB_105, eB_107, eB_109, eB_111, eB_112, eB_114, eB_115, eB_116, eB_117, eB_118, eB_120,
  eB_121, eB_122, eB_124, eB_125, eB_126, eB_127, eB_129, eB_130, eB_132, eB_133, eB_134, eB_135, eB_140, eB_143, eB_146, eB_149,
  eB_151, eB_153, eB_155, eB_157, eB_159, eB_168, eB_169, eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_192, eB_193, eB_194,
  eB_195, eB_196, eB_197, eB_198, eB_199, eB_209, eB_210, eB_211, eB_213, eB_214, eB_215, eB_217, eB_218, eB_219, eB_220, eB_221,
  eB_223, eB_224, eB_226, eB_227, eB_228, eB_229, eB_231, eB_234, eB_236, eB_238, eB_239, eB_241, eB_243, eB_245, eB_246, eB_247,
  eB_249, eB_250, eB_251, eB_252, eB_254, eB_255, eB_257, eB_258, eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283,
  eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323,
  eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348,
  eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378, eB_379, eB_380,
  eB_381, eB_382, eB_383, eB_384, eB_388, eB_390, eB_391, eB_393, eB_394, eB_396, eB_398, eB_399, eB_401, eB_403, eB_404, eB_406,
  eB_408, eB_409, eB_410, eB_412, eB_414, eB_416, eB_418, eB_420, eB_422, eB_424, eB_425, eB_426, eB_435, eB_437, eB_438, eB_440,
  eB_441, eB_443, eB_444, eB_446, eB_448, eB_449, eB_451, eB_453, eB_454, eB_455, eB_456, eB_458, eB_459, eB_461, eB_470, eB_471,
  eB_472, eB_473, eB_474, eB_475, eB_476, eB_477, eB_486, eB_487, eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495,
  eB_504, eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527,
  eB_536, eB_545, eB_546, eB_547, eB_548, eB_549, eB_550, eB_551, eB_552, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567,
  eB_568, eB_577, eB_578, eB_579, eB_580, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_589, eB_590, eB_591,
  eB_592, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_610, eB_613, eB_616, eB_619, eB_622, eB_624, eB_625,
  eB_627, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_653, eB_654, eB_655, eB_656, eB_657, eB_658, eB_659,
  eB_660, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684, eB_693, eB_694, eB_695, eB_696, eB_697, eB_698, eB_699,
  eB_700, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731,
  eB_732, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_765, eB_766, eB_767, eB_768, eB_769, eB_772, eB_773,
  eB_774, eB_775, eB_776, eB_777, eB_778, eB_779, eB_782, eB_783, eB_784, eB_785, eB_786, eB_787, eB_794, eB_795, eB_796, eB_797,
  eB_798, eB_799, eB_800, eB_801, eB_804, eB_805, eB_810, eB_811, eB_818, eB_819, eB_820, eB_821, eB_823, eB_826, eB_827, eB_829,
  eB_830, eB_831, eB_834, eB_835, eB_836, eB_837, eB_840, eB_841, eB_844, eB_845, eB_848, eB_849, eB_850, eB_851, eB_854, eB_855,
  eB_856, eB_857, eB_858, eB_859, eB_860, eB_861, eB_862, eB_863, eB_864, eB_865, eB_868, eB_869, eB_870, eB_871, eB_872, eB_873,
  eB_876, eB_877, eB_880, eB_882, eB_883, eB_884, eB_885, eB_886, eB_887, eB_888, eB_889, eB_890, eB_891, eB_898, eB_899, eB_902,
  eB_903, eB_908, eB_915, eB_916, eB_917, eB_918, eB_920, eB_923, eB_924, eB_926, eB_928, eB_930, eB_932, eB_933, eB_936, eB_937,
  eB_939, eB_942, eB_944, eB_948, eB_951, eB_953, eB_955, eB_956, eB_962, eB_964, eB_967, eB_968, eB_969, eB_973, eB_974, eB_976,
  eB_977, eB_978, eB_980, eB_981, eB_983, eB_985, eB_986, eB_987, eB_990, eB_1000, eB_1001, eB_1003, eB_1005, eB_1006, eB_1008, eB_1010,
  eB_1014, eB_1016, eB_1017, eB_1021, eB_1022, eB_1023]
theorem nbOKB_155 : nbB_155 = nbhd entsB eB_155 := by decide +kernel
theorem mkOKB_155 : mkEnt 32 1024 W rB_155 155 = eB_155 := by decide +kernel
theorem tB_155 : kTermA 4294967295 eB_155 nbB_155 = 45979819650898900092090882 := by decide +kernel


end RamseyCert
