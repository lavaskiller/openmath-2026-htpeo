import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_450 : List Ent := [
  eB_12, eB_13, eB_14, eB_16, eB_20, eB_21, eB_23, eB_25, eB_29, eB_30, eB_31, eB_32, eB_35, eB_38, eB_41, eB_44,
  eB_45, eB_46, eB_48, eB_49, eB_50, eB_51, eB_52, eB_53, eB_54, eB_55, eB_72, eB_73, eB_74, eB_75, eB_76, eB_77,
  eB_78, eB_79, eB_96, eB_98, eB_99, eB_100, eB_102, eB_103, eB_104, eB_105, eB_107, eB_108, eB_109, eB_112, eB_116, eB_117,
  eB_118, eB_119, eB_122, eB_123, eB_125, eB_126, eB_128, eB_129, eB_131, eB_132, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138,
  eB_139, eB_140, eB_142, eB_143, eB_145, eB_146, eB_150, eB_151, eB_152, eB_153, eB_156, eB_157, eB_158, eB_160, eB_161, eB_162,
  eB_163, eB_164, eB_165, eB_166, eB_167, eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_209, eB_211, eB_213,
  eB_214, eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_224, eB_225, eB_226, eB_227, eB_231, eB_232, eB_234, eB_235, eB_236,
  eB_237, eB_238, eB_239, eB_243, eB_244, eB_245, eB_246, eB_247, eB_248, eB_250, eB_252, eB_253, eB_255, eB_256, eB_258, eB_259,
  eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_268, eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275,
  eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_308, eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315,
  eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331,
  eB_340, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378, eB_379,
  eB_380, eB_381, eB_382, eB_383, eB_384, eB_385, eB_386, eB_387, eB_389, eB_391, eB_392, eB_394, eB_395, eB_396, eB_397, eB_398,
  eB_399, eB_400, eB_403, eB_405, eB_409, eB_410, eB_411, eB_415, eB_416, eB_417, eB_421, eB_422, eB_423, eB_425, eB_435, eB_438,
  eB_441, eB_442, eB_444, eB_445, eB_448, eB_450, eB_454, eB_455, eB_457, eB_458, eB_459, eB_460, eB_478, eB_479, eB_480, eB_481,
  eB_482, eB_483, eB_484, eB_485, eB_504, eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515,
  eB_516, eB_517, eB_518, eB_519, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_537, eB_538, eB_539, eB_540,
  eB_541, eB_542, eB_543, eB_544, eB_569, eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579, eB_580,
  eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_589, eB_590, eB_591, eB_592, eB_610, eB_611, eB_613, eB_614,
  eB_616, eB_617, eB_619, eB_620, eB_622, eB_624, eB_625, eB_627, eB_653, eB_654, eB_655, eB_656, eB_657, eB_658, eB_659, eB_660,
  eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692,
  eB_693, eB_694, eB_695, eB_696, eB_697, eB_698, eB_699, eB_700, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731, eB_732,
  eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748,
  eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_768, eB_769, eB_770, eB_771, eB_772,
  eB_773, eB_774, eB_775, eB_776, eB_777, eB_778, eB_784, eB_785, eB_790, eB_791, eB_796, eB_797, eB_798, eB_799, eB_800, eB_801,
  eB_804, eB_805, eB_806, eB_807, eB_810, eB_811, eB_814, eB_815, eB_820, eB_821, eB_822, eB_823, eB_828, eB_829, eB_834, eB_838,
  eB_839, eB_846, eB_847, eB_852, eB_853, eB_854, eB_855, eB_860, eB_861, eB_862, eB_863, eB_868, eB_869, eB_870, eB_871, eB_872,
  eB_873, eB_874, eB_875, eB_876, eB_877, eB_878, eB_879, eB_880, eB_881, eB_884, eB_885, eB_892, eB_893, eB_894, eB_895, eB_898,
  eB_899, eB_904, eB_906, eB_910, eB_913, eB_914, eB_915, eB_919, eB_922, eB_923, eB_926, eB_928, eB_932, eB_933, eB_935, eB_938,
  eB_939, eB_941, eB_943, eB_944, eB_947, eB_948, eB_949, eB_952, eB_953, eB_956, eB_957, eB_961, eB_962, eB_966, eB_967, eB_970,
  eB_971, eB_974, eB_975, eB_976, eB_977, eB_978, eB_979, eB_981, eB_984, eB_985, eB_986, eB_987, eB_989, eB_990, eB_992, eB_994,
  eB_998, eB_1001, eB_1002, eB_1003, eB_1004, eB_1009, eB_1016, eB_1017, eB_1018, eB_1019, eB_1020, eB_1021, eB_1023]
theorem nbOKB_450 : nbB_450 = nbhd entsB eB_450 := by decide +kernel
theorem mkOKB_450 : mkEnt 32 1024 W rB_450 450 = eB_450 := by decide +kernel
theorem tB_450 : kTermA 4294967295 eB_450 nbB_450 = 67897832088128998193672264 := by decide +kernel


end RamseyCert
