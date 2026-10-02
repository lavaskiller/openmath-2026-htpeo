import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_26 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_13, eB_14, eB_15, eB_17,
  eB_22, eB_24, eB_26, eB_30, eB_31, eB_32, eB_45, eB_46, eB_47, eB_80, eB_81, eB_82, eB_83, eB_84, eB_85, eB_86,
  eB_87, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_96, eB_98, eB_100, eB_101, eB_102, eB_103, eB_104,
  eB_105, eB_106, eB_107, eB_108, eB_115, eB_116, eB_117, eB_119, eB_121, eB_122, eB_123, eB_124, eB_125, eB_126, eB_127, eB_128,
  eB_129, eB_130, eB_131, eB_132, eB_139, eB_140, eB_141, eB_142, eB_143, eB_144, eB_145, eB_146, eB_147, eB_151, eB_152, eB_153,
  eB_157, eB_158, eB_159, eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_200, eB_201, eB_202, eB_203, eB_204,
  eB_205, eB_206, eB_207, eB_211, eB_212, eB_213, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221, eB_222, eB_223, eB_224,
  eB_225, eB_226, eB_228, eB_229, eB_230, eB_231, eB_232, eB_233, eB_234, eB_235, eB_236, eB_242, eB_243, eB_244, eB_245, eB_248,
  eB_249, eB_250, eB_251, eB_254, eB_255, eB_256, eB_257, eB_258, eB_268, eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275,
  eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291,
  eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331,
  eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_349, eB_350, eB_351, eB_352, eB_353, eB_354, eB_355, eB_356,
  eB_382, eB_388, eB_390, eB_391, eB_392, eB_393, eB_394, eB_395, eB_396, eB_397, eB_398, eB_399, eB_400, eB_401, eB_408, eB_409,
  eB_410, eB_414, eB_415, eB_416, eB_420, eB_421, eB_422, eB_424, eB_425, eB_426, eB_427, eB_428, eB_429, eB_430, eB_431, eB_432,
  eB_433, eB_434, eB_441, eB_442, eB_443, eB_444, eB_445, eB_446, eB_453, eB_454, eB_455, eB_456, eB_458, eB_459, eB_460, eB_461,
  eB_486, eB_487, eB_512, eB_513, eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525,
  eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_536, eB_561, eB_562, eB_563, eB_564, eB_565,
  eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579, eB_580, eB_581,
  eB_582, eB_583, eB_584, eB_609, eB_610, eB_611, eB_612, eB_613, eB_614, eB_615, eB_616, eB_617, eB_618, eB_619, eB_620, eB_621,
  eB_622, eB_623, eB_625, eB_626, eB_628, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639,
  eB_640, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652, eB_653, eB_654, eB_655,
  eB_656, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_701, eB_702, eB_703,
  eB_704, eB_705, eB_706, eB_707, eB_708, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740, eB_741, eB_742, eB_743,
  eB_744, eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755, eB_756, eB_766, eB_772, eB_773,
  eB_778, eB_779, eB_788, eB_789, eB_790, eB_791, eB_796, eB_797, eB_800, eB_801, eB_806, eB_807, eB_808, eB_809, eB_810, eB_811,
  eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_822, eB_823, eB_824, eB_825, eB_828, eB_829, eB_836, eB_837,
  eB_838, eB_839, eB_842, eB_843, eB_846, eB_847, eB_856, eB_857, eB_865, eB_868, eB_869, eB_872, eB_873, eB_874, eB_875, eB_876,
  eB_877, eB_878, eB_879, eB_880, eB_881, eB_886, eB_887, eB_896, eB_897, eB_898, eB_900, eB_901, eB_903, eB_907, eB_908, eB_911,
  eB_912, eB_914, eB_916, eB_918, eB_922, eB_923, eB_925, eB_926, eB_927, eB_928, eB_929, eB_930, eB_933, eB_936, eB_937, eB_938,
  eB_939, eB_940, eB_943, eB_944, eB_947, eB_948, eB_951, eB_953, eB_957, eB_958, eB_959, eB_960, eB_962, eB_964, eB_966, eB_968,
  eB_971, eB_972, eB_973, eB_974, eB_976, eB_977, eB_980, eB_981, eB_982, eB_990, eB_992, eB_998, eB_999, eB_1001, eB_1003, eB_1005,
  eB_1006, eB_1008, eB_1011, eB_1013, eB_1014, eB_1015, eB_1017, eB_1019, eB_1021]
theorem nbOKB_26 : nbB_26 = nbhd entsB eB_26 := by decide +kernel
theorem mkOKB_26 : mkEnt 32 1024 W rB_26 26 = eB_26 := by decide +kernel
theorem tB_26 : kTermA 4294967295 eB_26 nbB_26 = 119051677595478569261663890 := by decide +kernel


end RamseyCert
