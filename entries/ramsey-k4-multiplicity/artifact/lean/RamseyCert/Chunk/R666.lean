import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_666 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_18, eR_28, eR_29, eR_31, eR_32, eR_33,
  eR_36, eR_39, eR_43, eR_44, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_68, eR_70,
  eR_71, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83, eR_93, eR_94, eR_95, eR_96, eR_97, eR_98, eR_100,
  eR_101, eR_105, eR_106, eR_107, eR_109, eR_110, eR_112, eR_113, eR_115, eR_116, eR_118, eR_119, eR_121, eR_122, eR_126, eR_129,
  eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_142, eR_145, eR_149, eR_150, eR_152, eR_153, eR_155, eR_156,
  eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_180, eR_181, eR_182, eR_184, eR_185, eR_186,
  eR_187, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205, eR_206, eR_208, eR_209, eR_211, eR_212, eR_214, eR_217, eR_220, eR_223,
  eR_226, eR_227, eR_228, eR_230, eR_231, eR_233, eR_234, eR_236, eR_237, eR_239, eR_240, eR_242, eR_243, eR_245, eR_246, eR_247,
  eR_248, eR_249, eR_251, eR_252, eR_253, eR_254, eR_256, eR_257, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270, eR_271,
  eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303,
  eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335,
  eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378,
  eR_379, eR_380, eR_387, eR_388, eR_389, eR_390, eR_392, eR_393, eR_395, eR_396, eR_397, eR_398, eR_400, eR_401, eR_402, eR_403,
  eR_407, eR_410, eR_413, eR_416, eR_419, eR_422, eR_423, eR_424, eR_425, eR_426, eR_431, eR_432, eR_433, eR_434, eR_435, eR_436,
  eR_438, eR_439, eR_442, eR_443, eR_445, eR_446, eR_447, eR_448, eR_452, eR_455, eR_457, eR_458, eR_460, eR_461, eR_466, eR_467,
  eR_468, eR_469, eR_470, eR_471, eR_472, eR_478, eR_480, eR_481, eR_489, eR_490, eR_491, eR_500, eR_501, eR_502, eR_503, eR_508,
  eR_509, eR_510, eR_511, eR_512, eR_514, eR_515, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538,
  eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570,
  eR_571, eR_572, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602,
  eR_603, eR_604, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626,
  eR_627, eR_628, eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658,
  eR_659, eR_660, eR_661, eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686,
  eR_687, eR_688, eR_697, eR_698, eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_709, eR_711, eR_712, eR_721, eR_722, eR_723,
  eR_724, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756,
  eR_757, eR_758, eR_759, eR_760, eR_770, eR_771, eR_772, eR_773, eR_778, eR_779, eR_780, eR_781, eR_784, eR_785, eR_786, eR_790,
  eR_791, eR_792, eR_793, eR_794, eR_795, eR_800, eR_801, eR_804, eR_805, eR_806, eR_807, eR_810, eR_811, eR_812, eR_813, eR_814,
  eR_815, eR_836, eR_837, eR_842, eR_843, eR_844, eR_845, eR_848, eR_849, eR_852, eR_853, eR_854, eR_855, eR_858, eR_859, eR_860,
  eR_861, eR_862, eR_863, eR_866, eR_867, eR_876, eR_877, eR_886, eR_887, eR_888, eR_889, eR_893, eR_896, eR_898, eR_900, eR_901,
  eR_902, eR_903, eR_905, eR_907, eR_909, eR_911, eR_912, eR_913, eR_914, eR_915, eR_917, eR_920, eR_922, eR_925, eR_926, eR_929,
  eR_930, eR_931, eR_934, eR_936, eR_937, eR_939, eR_940, eR_941, eR_943, eR_945, eR_948, eR_953, eR_956, eR_959, eR_962, eR_963,
  eR_966, eR_968, eR_969, eR_971, eR_974, eR_975, eR_976, eR_977, eR_978, eR_979, eR_981, eR_985, eR_986, eR_987, eR_992, eR_993,
  eR_994, eR_995, eR_999, eR_1001, eR_1002, eR_1003, eR_1005, eR_1006, eR_1007, eR_1008, eR_1009, eR_1015, eR_1018, eR_1020, eR_1021, eR_1022,
  eR_1023]
theorem nbOKR_666 : nbR_666 = nbhd entsR eR_666 := by decide +kernel
theorem mkOKR_666 : mkEnt 32 1024 W rR_666 666 = eR_666 := by decide +kernel
theorem tR_666 : kTermA 4294967295 eR_666 nbR_666 = 76294488341472846215699052 := by decide +kernel


end RamseyCert
