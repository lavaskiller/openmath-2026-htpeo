import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_317 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_12, eR_14, eR_15, eR_16, eR_18, eR_21, eR_23, eR_25, eR_27, eR_31, eR_32, eR_33,
  eR_36, eR_39, eR_42, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_68, eR_69, eR_70,
  eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82, eR_83, eR_88, eR_89, eR_90, eR_91, eR_96, eR_99, eR_100, eR_101,
  eR_103, eR_104, eR_106, eR_107, eR_111, eR_114, eR_115, eR_116, eR_120, eR_121, eR_122, eR_124, eR_125, eR_127, eR_128, eR_130,
  eR_131, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_140, eR_141, eR_143, eR_144, eR_146, eR_147, eR_148, eR_152, eR_153,
  eR_154, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_180, eR_181, eR_182, eR_188, eR_189,
  eR_190, eR_192, eR_193, eR_194, eR_195, eR_200, eR_201, eR_202, eR_203, eR_210, eR_211, eR_212, eR_214, eR_215, eR_216, eR_218,
  eR_219, eR_221, eR_222, eR_224, eR_225, eR_229, eR_230, eR_231, eR_233, eR_234, eR_238, eR_241, eR_242, eR_243, eR_245, eR_246,
  eR_247, eR_248, eR_249, eR_252, eR_253, eR_255, eR_256, eR_257, eR_259, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274,
  eR_275, eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_304, eR_305, eR_306,
  eR_307, eR_312, eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334,
  eR_335, eR_340, eR_341, eR_342, eR_343, eR_344, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_369, eR_370,
  eR_371, eR_372, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_389, eR_392, eR_393,
  eR_395, eR_396, eR_397, eR_400, eR_401, eR_404, eR_407, eR_408, eR_409, eR_413, eR_414, eR_415, eR_419, eR_420, eR_421, eR_423,
  eR_425, eR_431, eR_432, eR_433, eR_434, eR_437, eR_440, eR_442, eR_443, eR_445, eR_446, eR_449, eR_452, eR_453, eR_454, eR_457,
  eR_460, eR_461, eR_463, eR_464, eR_465, eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489, eR_490,
  eR_491, eR_500, eR_501, eR_502, eR_503, eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522,
  eR_528, eR_530, eR_531, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_558, eR_559, eR_565, eR_566, eR_567,
  eR_568, eR_573, eR_574, eR_575, eR_576, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595,
  eR_596, eR_605, eR_606, eR_607, eR_608, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_622, eR_624, eR_625,
  eR_627, eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659,
  eR_660, eR_661, eR_662, eR_663, eR_664, eR_669, eR_671, eR_672, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691, eR_692,
  eR_697, eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722, eR_723, eR_724,
  eR_729, eR_730, eR_731, eR_732, eR_737, eR_738, eR_739, eR_740, eR_742, eR_743, eR_749, eR_751, eR_752, eR_761, eR_762, eR_763,
  eR_764, eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_778, eR_779, eR_780, eR_781,
  eR_786, eR_787, eR_794, eR_795, eR_796, eR_797, eR_800, eR_801, eR_804, eR_805, eR_806, eR_807, eR_812, eR_813, eR_816, eR_817,
  eR_820, eR_821, eR_822, eR_823, eR_826, eR_827, eR_828, eR_829, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_846, eR_847,
  eR_848, eR_849, eR_854, eR_855, eR_856, eR_857, eR_864, eR_865, eR_870, eR_871, eR_874, eR_875, eR_876, eR_877, eR_878, eR_879,
  eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_894, eR_895, eR_896, eR_897, eR_898, eR_905, eR_906, eR_907, eR_909, eR_910,
  eR_912, eR_913, eR_915, eR_916, eR_918, eR_924, eR_927, eR_932, eR_933, eR_938, eR_939, eR_942, eR_943, eR_944, eR_947, eR_949,
  eR_956, eR_958, eR_959, eR_961, eR_963, eR_965, eR_966, eR_969, eR_971, eR_972, eR_974, eR_975, eR_976, eR_977, eR_978, eR_979,
  eR_980, eR_981, eR_985, eR_986, eR_991, eR_993, eR_994, eR_996, eR_999, eR_1000, eR_1003, eR_1004, eR_1005, eR_1006, eR_1008, eR_1009,
  eR_1011, eR_1012, eR_1013, eR_1014, eR_1017, eR_1022]
theorem nbOKR_317 : nbR_317 = nbhd entsR eR_317 := by decide +kernel
theorem mkOKR_317 : mkEnt 32 1024 W rR_317 317 = eR_317 := by decide +kernel
theorem tR_317 : kTermA 4294967295 eR_317 nbR_317 = 121189610635576896016556712 := by decide +kernel


end RamseyCert
