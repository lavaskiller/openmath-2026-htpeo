import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_33 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_13, eB_18, eB_28,
  eB_29, eB_31, eB_32, eB_33, eB_36, eB_39, eB_43, eB_44, eB_46, eB_47, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69,
  eB_70, eB_71, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_96, eB_97, eB_98, eB_100, eB_101, eB_105,
  eB_106, eB_107, eB_109, eB_110, eB_111, eB_112, eB_113, eB_115, eB_116, eB_118, eB_119, eB_121, eB_122, eB_126, eB_127, eB_129,
  eB_131, eB_132, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_139, eB_142, eB_145, eB_149, eB_150, eB_152, eB_153, eB_155,
  eB_156, eB_158, eB_159, eB_176, eB_177, eB_178, eB_179, eB_180, eB_181, eB_182, eB_183, eB_200, eB_201, eB_202, eB_203, eB_204,
  eB_205, eB_206, eB_207, eB_208, eB_209, eB_210, eB_211, eB_212, eB_214, eB_217, eB_220, eB_221, eB_222, eB_223, eB_226, eB_227,
  eB_228, eB_230, eB_231, eB_232, eB_233, eB_234, eB_236, eB_237, eB_239, eB_240, eB_242, eB_243, eB_245, eB_246, eB_247, eB_248,
  eB_249, eB_251, eB_252, eB_253, eB_254, eB_255, eB_256, eB_257, eB_258, eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266,
  eB_267, eB_268, eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306,
  eB_307, eB_308, eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330,
  eB_331, eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363,
  eB_364, eB_381, eB_387, eB_388, eB_389, eB_390, eB_392, eB_393, eB_395, eB_396, eB_397, eB_398, eB_399, eB_400, eB_401, eB_402,
  eB_403, eB_407, eB_410, eB_413, eB_416, eB_419, eB_422, eB_423, eB_424, eB_425, eB_426, eB_435, eB_436, eB_438, eB_439, eB_442,
  eB_443, eB_445, eB_446, eB_447, eB_448, eB_452, eB_455, eB_457, eB_458, eB_460, eB_461, eB_470, eB_471, eB_472, eB_473, eB_474,
  eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485, eB_488, eB_489, eB_490, eB_491, eB_492,
  eB_493, eB_494, eB_495, eB_512, eB_513, eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_553, eB_554, eB_555, eB_556, eB_557,
  eB_558, eB_559, eB_560, eB_577, eB_578, eB_579, eB_580, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_589,
  eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_597, eB_598, eB_599, eB_600, eB_609, eB_610, eB_612, eB_613, eB_615,
  eB_616, eB_617, eB_618, eB_619, eB_621, eB_622, eB_623, eB_624, eB_625, eB_626, eB_627, eB_628, eB_645, eB_646, eB_647, eB_648,
  eB_649, eB_650, eB_651, eB_652, eB_653, eB_654, eB_655, eB_656, eB_657, eB_658, eB_659, eB_660, eB_677, eB_678, eB_679, eB_680,
  eB_681, eB_682, eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696,
  eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_705, eB_706, eB_707, eB_708, eB_709, eB_710, eB_711, eB_712,
  eB_713, eB_714, eB_715, eB_716, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740, eB_766, eB_768, eB_769, eB_770,
  eB_771, eB_772, eB_773, eB_778, eB_779, eB_786, eB_787, eB_790, eB_791, eB_792, eB_793, eB_800, eB_801, eB_806, eB_807, eB_808,
  eB_809, eB_810, eB_811, eB_812, eB_813, eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_830, eB_831, eB_836, eB_837, eB_839,
  eB_840, eB_841, eB_846, eB_847, eB_854, eB_855, eB_858, eB_859, eB_860, eB_861, eB_862, eB_863, eB_869, eB_870, eB_881, eB_882,
  eB_883, eB_888, eB_889, eB_890, eB_891, eB_892, eB_893, eB_898, eB_899, eB_900, eB_901, eB_902, eB_903, eB_907, eB_909, eB_910,
  eB_911, eB_912, eB_913, eB_915, eB_916, eB_917, eB_920, eB_921, eB_922, eB_923, eB_924, eB_925, eB_930, eB_931, eB_935, eB_937,
  eB_938, eB_939, eB_943, eB_945, eB_947, eB_949, eB_950, eB_953, eB_954, eB_961, eB_962, eB_968, eB_970, eB_971, eB_972, eB_974,
  eB_975, eB_976, eB_977, eB_981, eB_983, eB_985, eB_986, eB_987, eB_992, eB_993, eB_995, eB_996, eB_998, eB_1000, eB_1002, eB_1003,
  eB_1005, eB_1011, eB_1015, eB_1017, eB_1020, eB_1021, eB_1022, eB_1023]
theorem nbOKB_33 : nbB_33 = nbhd entsB eB_33 := by decide +kernel
theorem mkOKB_33 : mkEnt 32 1024 W rB_33 33 = eB_33 := by decide +kernel
theorem tB_33 : kTermA 4294967295 eB_33 nbB_33 = 121827562174185584818105323 := by decide +kernel


end RamseyCert
