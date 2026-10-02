import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_8 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_48, eR_49, eR_50, eR_56, eR_57, eR_59, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74,
  eR_80, eR_81, eR_83, eR_88, eR_90, eR_91, eR_96, eR_97, eR_98, eR_99, eR_100, eR_101, eR_102, eR_103, eR_104, eR_105,
  eR_106, eR_107, eR_108, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_115, eR_116, eR_117, eR_118, eR_119, eR_120, eR_121,
  eR_122, eR_123, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_133, eR_134, eR_135, eR_160, eR_161,
  eR_162, eR_168, eR_169, eR_170, eR_171, eR_176, eR_178, eR_179, eR_184, eR_185, eR_186, eR_187, eR_192, eR_194, eR_195, eR_200,
  eR_202, eR_203, eR_208, eR_209, eR_210, eR_211, eR_212, eR_213, eR_214, eR_215, eR_216, eR_217, eR_218, eR_219, eR_220, eR_221,
  eR_222, eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237,
  eR_238, eR_239, eR_240, eR_241, eR_242, eR_243, eR_244, eR_245, eR_246, eR_247, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268,
  eR_269, eR_270, eR_271, eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300,
  eR_301, eR_302, eR_303, eR_308, eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332,
  eR_333, eR_334, eR_335, eR_340, eR_341, eR_342, eR_343, eR_344, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360,
  eR_365, eR_366, eR_367, eR_368, eR_373, eR_374, eR_375, eR_376, eR_385, eR_386, eR_402, eR_403, eR_404, eR_405, eR_406, eR_407,
  eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416, eR_417, eR_418, eR_419, eR_420, eR_421, eR_422, eR_427,
  eR_428, eR_429, eR_430, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_447, eR_448, eR_449, eR_450, eR_451, eR_452, eR_453,
  eR_454, eR_455, eR_456, eR_462, eR_463, eR_464, eR_465, eR_470, eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_486,
  eR_487, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514,
  eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_536, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546,
  eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570, eR_571, eR_572, eR_577, eR_578,
  eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_601, eR_602, eR_603, eR_604, eR_609, eR_610,
  eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626,
  eR_627, eR_628, eR_629, eR_630, eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654,
  eR_655, eR_656, eR_661, eR_662, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686,
  eR_687, eR_688, eR_693, eR_694, eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718,
  eR_719, eR_720, eR_725, eR_726, eR_727, eR_728, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750,
  eR_751, eR_752, eR_757, eR_759, eR_768, eR_769, eR_770, eR_771, eR_774, eR_775, eR_776, eR_777, eR_786, eR_787, eR_788, eR_789,
  eR_790, eR_791, eR_792, eR_793, eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_806, eR_807, eR_808, eR_809,
  eR_810, eR_811, eR_814, eR_815, eR_816, eR_817, eR_822, eR_823, eR_824, eR_825, eR_826, eR_827, eR_828, eR_829, eR_834, eR_835,
  eR_838, eR_839, eR_844, eR_845, eR_848, eR_849, eR_852, eR_858, eR_859, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_878,
  eR_879, eR_880, eR_881, eR_886, eR_887, eR_892, eR_893, eR_897, eR_898, eR_899, eR_902, eR_903, eR_906, eR_907, eR_909, eR_914,
  eR_917, eR_918, eR_920, eR_921, eR_923, eR_925, eR_927, eR_931, eR_933, eR_936, eR_939, eR_943, eR_944, eR_950, eR_951, eR_953,
  eR_954, eR_955, eR_958, eR_965, eR_966, eR_967, eR_969, eR_970, eR_972, eR_974, eR_977, eR_979, eR_980, eR_982, eR_983, eR_985,
  eR_986, eR_987, eR_988, eR_989, eR_990, eR_991, eR_992, eR_994, eR_996, eR_997, eR_1002, eR_1005, eR_1006, eR_1008, eR_1009, eR_1011,
  eR_1012, eR_1014, eR_1015, eR_1017, eR_1018, eR_1019, eR_1021]
theorem nbOKR_8 : nbR_8 = nbhd entsR eR_8 := by decide +kernel
theorem mkOKR_8 : mkEnt 32 1024 W rR_8 8 = eR_8 := by decide +kernel
theorem tR_8 : kTermA 4294967295 eR_8 nbR_8 = 126094535009421393385605126 := by decide +kernel


end RamseyCert
