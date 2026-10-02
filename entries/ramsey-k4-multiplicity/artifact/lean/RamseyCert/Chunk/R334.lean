import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_334 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_14, eR_16, eR_20, eR_21, eR_23, eR_25, eR_29, eR_30, eR_31, eR_35,
  eR_38, eR_41, eR_44, eR_45, eR_46, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67,
  eR_76, eR_77, eR_79, eR_80, eR_81, eR_82, eR_83, eR_88, eR_89, eR_90, eR_91, eR_96, eR_98, eR_100, eR_102, eR_103,
  eR_105, eR_107, eR_108, eR_109, eR_112, eR_116, eR_117, eR_118, eR_122, eR_123, eR_125, eR_126, eR_128, eR_129, eR_131, eR_132,
  eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_150, eR_151, eR_152, eR_156,
  eR_157, eR_158, eR_164, eR_165, eR_167, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_188, eR_190, eR_191,
  eR_192, eR_193, eR_194, eR_195, eR_200, eR_201, eR_202, eR_203, eR_209, eR_211, eR_213, eR_214, eR_216, eR_217, eR_219, eR_220,
  eR_222, eR_223, eR_225, eR_226, eR_227, eR_231, eR_232, eR_234, eR_235, eR_236, eR_239, eR_243, eR_244, eR_245, eR_246, eR_247,
  eR_248, eR_250, eR_252, eR_253, eR_255, eR_256, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270, eR_271,
  eR_276, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307,
  eR_308, eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338, eR_339,
  eR_340, eR_341, eR_342, eR_343, eR_344, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371,
  eR_372, eR_373, eR_374, eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_389, eR_391, eR_392, eR_394,
  eR_395, eR_397, eR_399, eR_400, eR_403, eR_405, eR_409, eR_410, eR_411, eR_415, eR_416, eR_417, eR_421, eR_422, eR_423, eR_425,
  eR_431, eR_432, eR_433, eR_434, eR_435, eR_438, eR_441, eR_442, eR_444, eR_445, eR_448, eR_450, eR_454, eR_455, eR_457, eR_459,
  eR_460, eR_466, eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_492, eR_493, eR_494, eR_495,
  eR_500, eR_501, eR_502, eR_503, eR_504, eR_506, eR_507, eR_512, eR_513, eR_515, eR_520, eR_521, eR_523, eR_532, eR_533, eR_534,
  eR_535, eR_542, eR_543, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_561, eR_562, eR_563, eR_564, eR_573,
  eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_601,
  eR_602, eR_603, eR_604, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_622, eR_624, eR_625, eR_627, eR_629,
  eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658, eR_659, eR_660, eR_665,
  eR_666, eR_667, eR_668, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_688, eR_697, eR_698,
  eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_726, eR_727,
  eR_728, eR_733, eR_734, eR_735, eR_736, eR_742, eR_743, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762, eR_763, eR_764, eR_765,
  eR_766, eR_767, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_777, eR_780, eR_781, eR_790, eR_791, eR_794, eR_795, eR_796,
  eR_797, eR_798, eR_799, eR_800, eR_801, eR_808, eR_809, eR_810, eR_811, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_820,
  eR_821, eR_822, eR_823, eR_828, eR_829, eR_830, eR_831, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_844, eR_845, eR_848,
  eR_849, eR_854, eR_855, eR_860, eR_861, eR_862, eR_863, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_872, eR_873, eR_874,
  eR_875, eR_878, eR_879, eR_880, eR_881, eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_890, eR_891, eR_892, eR_893, eR_894,
  eR_895, eR_896, eR_898, eR_904, eR_905, eR_906, eR_913, eR_915, eR_916, eR_919, eR_921, eR_922, eR_924, eR_928, eR_929, eR_932,
  eR_933, eR_934, eR_936, eR_939, eR_940, eR_943, eR_944, eR_950, eR_952, eR_953, eR_954, eR_957, eR_959, eR_962, eR_963, eR_967,
  eR_969, eR_970, eR_971, eR_972, eR_975, eR_977, eR_981, eR_984, eR_985, eR_986, eR_987, eR_989, eR_990, eR_996, eR_999, eR_1000,
  eR_1002, eR_1003, eR_1004, eR_1006, eR_1007, eR_1008, eR_1011, eR_1016, eR_1019, eR_1020, eR_1021, eR_1023]
theorem nbOKR_334 : nbR_334 = nbhd entsR eR_334 := by decide +kernel
theorem mkOKR_334 : mkEnt 32 1024 W rR_334 334 = eR_334 := by decide +kernel
theorem tR_334 : kTermA 4294967295 eR_334 nbR_334 = 120646615146156111898974816 := by decide +kernel


end RamseyCert
