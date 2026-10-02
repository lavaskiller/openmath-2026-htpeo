import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_819 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_14, eR_16, eR_20, eR_21, eR_23, eR_25, eR_29, eR_30, eR_31, eR_35,
  eR_38, eR_41, eR_44, eR_45, eR_46, eR_48, eR_49, eR_51, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71,
  eR_72, eR_73, eR_74, eR_75, eR_84, eR_85, eR_86, eR_87, eR_92, eR_93, eR_94, eR_95, eR_96, eR_98, eR_100, eR_102,
  eR_103, eR_105, eR_107, eR_108, eR_109, eR_112, eR_116, eR_117, eR_118, eR_122, eR_123, eR_125, eR_126, eR_128, eR_129, eR_131,
  eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_150, eR_151, eR_152,
  eR_156, eR_157, eR_158, eR_160, eR_161, eR_163, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_184, eR_186,
  eR_187, eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_207, eR_209, eR_211, eR_213, eR_214, eR_216, eR_217, eR_219,
  eR_220, eR_222, eR_223, eR_225, eR_226, eR_227, eR_231, eR_232, eR_234, eR_235, eR_236, eR_239, eR_243, eR_244, eR_245, eR_246,
  eR_247, eR_248, eR_250, eR_252, eR_253, eR_255, eR_256, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274,
  eR_275, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302,
  eR_303, eR_312, eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334,
  eR_335, eR_340, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366,
  eR_367, eR_368, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_389, eR_391, eR_392,
  eR_394, eR_395, eR_397, eR_399, eR_400, eR_403, eR_405, eR_409, eR_410, eR_411, eR_415, eR_416, eR_417, eR_421, eR_422, eR_423,
  eR_425, eR_427, eR_428, eR_429, eR_430, eR_435, eR_438, eR_441, eR_442, eR_444, eR_445, eR_448, eR_450, eR_454, eR_455, eR_457,
  eR_459, eR_460, eR_462, eR_463, eR_464, eR_465, eR_470, eR_471, eR_472, eR_473, eR_482, eR_483, eR_485, eR_488, eR_489, eR_490,
  eR_491, eR_496, eR_497, eR_498, eR_499, eR_508, eR_509, eR_511, eR_516, eR_517, eR_519, eR_524, eR_526, eR_527, eR_528, eR_529,
  eR_530, eR_531, eR_538, eR_539, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566, eR_567, eR_568,
  eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_597, eR_598, eR_599, eR_600,
  eR_605, eR_606, eR_607, eR_608, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_622, eR_624, eR_625, eR_627,
  eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656,
  eR_661, eR_662, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_690, eR_691, eR_692, eR_693,
  eR_694, eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_729,
  eR_730, eR_731, eR_732, eR_737, eR_738, eR_740, eR_745, eR_746, eR_748, eR_749, eR_750, eR_751, eR_752, eR_757, eR_758, eR_759,
  eR_760, eR_765, eR_766, eR_767, eR_768, eR_769, eR_782, eR_783, eR_784, eR_785, eR_786, eR_787, eR_788, eR_789, eR_800, eR_801,
  eR_802, eR_803, eR_804, eR_805, eR_810, eR_811, eR_812, eR_813, eR_820, eR_821, eR_822, eR_823, eR_824, eR_825, eR_828, eR_829,
  eR_838, eR_839, eR_846, eR_847, eR_850, eR_851, eR_852, eR_853, eR_856, eR_857, eR_858, eR_859, eR_860, eR_861, eR_862, eR_863,
  eR_868, eR_869, eR_870, eR_871, eR_872, eR_873, eR_876, eR_877, eR_878, eR_879, eR_880, eR_881, eR_884, eR_885, eR_897, eR_898,
  eR_899, eR_900, eR_901, eR_902, eR_903, eR_906, eR_908, eR_910, eR_911, eR_912, eR_913, eR_914, eR_915, eR_917, eR_920, eR_922,
  eR_923, eR_926, eR_927, eR_928, eR_932, eR_935, eR_938, eR_939, eR_941, eR_942, eR_945, eR_947, eR_948, eR_949, eR_953, eR_958,
  eR_961, eR_964, eR_965, eR_966, eR_971, eR_973, eR_975, eR_977, eR_978, eR_979, eR_981, eR_982, eR_983, eR_985, eR_986, eR_987,
  eR_988, eR_989, eR_991, eR_993, eR_994, eR_995, eR_997, eR_998, eR_1001, eR_1003, eR_1005, eR_1009, eR_1010, eR_1012, eR_1016, eR_1017,
  eR_1019, eR_1020, eR_1021]
theorem nbOKR_819 : nbR_819 = nbhd entsR eR_819 := by decide +kernel
theorem mkOKR_819 : mkEnt 32 1024 W rR_819 819 = eR_819 := by decide +kernel
theorem tR_819 : kTermA 4294967295 eR_819 nbR_819 = 93492742404797480670263760 := by decide +kernel


end RamseyCert
