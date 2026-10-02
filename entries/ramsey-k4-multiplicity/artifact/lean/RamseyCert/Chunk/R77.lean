import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_77 : List Ent := [
  eR_4, eR_5, eR_6, eR_13, eR_14, eR_15, eR_17, eR_18, eR_19, eR_20, eR_22, eR_24, eR_26, eR_27, eR_28, eR_29,
  eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_42, eR_43, eR_44, eR_52, eR_53, eR_54, eR_55,
  eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_84, eR_85, eR_86, eR_87,
  eR_88, eR_89, eR_90, eR_91, eR_96, eR_100, eR_101, eR_102, eR_106, eR_107, eR_108, eR_115, eR_116, eR_117, eR_121, eR_122,
  eR_123, eR_133, eR_134, eR_135, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_148, eR_149, eR_150,
  eR_154, eR_155, eR_156, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_189,
  eR_191, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205, eR_206, eR_207, eR_208, eR_209, eR_210, eR_215, eR_216, eR_217, eR_218,
  eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229, eR_236, eR_237, eR_238, eR_239, eR_240,
  eR_241, eR_248, eR_249, eR_250, eR_252, eR_254, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274, eR_275, eR_280, eR_281,
  eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307, eR_312, eR_313,
  eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_325, eR_326, eR_327, eR_332, eR_334, eR_335, eR_342, eR_343, eR_344, eR_353,
  eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378, eR_379, eR_380, eR_381,
  eR_382, eR_383, eR_384, eR_387, eR_389, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_397, eR_399, eR_400, eR_401, eR_402,
  eR_403, eR_404, eR_408, eR_409, eR_410, eR_414, eR_415, eR_416, eR_420, eR_421, eR_422, eR_424, eR_426, eR_427, eR_428, eR_429,
  eR_430, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_447, eR_448, eR_449, eR_453, eR_454, eR_455, eR_458, eR_466, eR_467,
  eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497,
  eR_498, eR_499, eR_504, eR_505, eR_506, eR_507, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533,
  eR_534, eR_535, eR_541, eR_543, eR_544, eR_549, eR_551, eR_552, eR_557, eR_558, eR_560, eR_561, eR_562, eR_563, eR_564, eR_569,
  eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_601,
  eR_602, eR_603, eR_604, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_622,
  eR_624, eR_625, eR_627, eR_633, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654,
  eR_655, eR_656, eR_661, eR_662, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686,
  eR_687, eR_688, eR_693, eR_694, eR_695, eR_696, eR_705, eR_706, eR_707, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723,
  eR_724, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751,
  eR_752, eR_762, eR_763, eR_764, eR_768, eR_769, eR_770, eR_774, eR_775, eR_780, eR_781, eR_792, eR_793, eR_794, eR_795, eR_796,
  eR_797, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_816, eR_817, eR_820,
  eR_821, eR_824, eR_825, eR_826, eR_827, eR_828, eR_829, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_840,
  eR_841, eR_844, eR_845, eR_846, eR_847, eR_850, eR_851, eR_860, eR_861, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_878,
  eR_879, eR_880, eR_881, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_894, eR_895, eR_896, eR_897, eR_899, eR_900, eR_901,
  eR_902, eR_903, eR_905, eR_907, eR_908, eR_910, eR_914, eR_918, eR_922, eR_923, eR_924, eR_926, eR_929, eR_930, eR_934, eR_936,
  eR_939, eR_940, eR_943, eR_945, eR_946, eR_947, eR_948, eR_949, eR_952, eR_953, eR_954, eR_956, eR_960, eR_965, eR_966, eR_970,
  eR_973, eR_975, eR_977, eR_980, eR_983, eR_984, eR_985, eR_987, eR_992, eR_993, eR_994, eR_996, eR_999, eR_1000, eR_1003, eR_1004,
  eR_1005, eR_1010, eR_1013, eR_1015, eR_1016, eR_1017, eR_1018, eR_1020, eR_1021, eR_1022]
theorem nbOKR_77 : nbR_77 = nbhd entsR eR_77 := by decide +kernel
theorem mkOKR_77 : mkEnt 32 1024 W rR_77 77 = eR_77 := by decide +kernel
theorem tR_77 : kTermA 4294967295 eR_77 nbR_77 = 119111359566041440155934860 := by decide +kernel


end RamseyCert
