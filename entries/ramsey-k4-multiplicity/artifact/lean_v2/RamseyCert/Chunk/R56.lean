import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_56 : List Ent := [
  eR_8, eR_10, eR_11, eR_12, eR_14, eR_16, eR_17, eR_18, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27,
  eR_29, eR_30, eR_32, eR_33, eR_35, eR_36, eR_38, eR_39, eR_41, eR_42, eR_44, eR_45, eR_47, eR_48, eR_49, eR_50,
  eR_51, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82,
  eR_83, eR_92, eR_93, eR_94, eR_95, eR_97, eR_100, eR_104, eR_105, eR_107, eR_110, eR_113, eR_116, eR_119, eR_122, eR_124,
  eR_126, eR_127, eR_129, eR_130, eR_132, eR_136, eR_137, eR_138, eR_140, eR_143, eR_146, eR_148, eR_150, eR_151, eR_153, eR_154,
  eR_156, eR_157, eR_159, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190,
  eR_191, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_209, eR_210, eR_212, eR_213, eR_214, eR_216, eR_219,
  eR_222, eR_225, eR_227, eR_229, eR_230, eR_232, eR_233, eR_235, eR_236, eR_238, eR_239, eR_241, eR_242, eR_244, eR_245, eR_246,
  eR_247, eR_249, eR_250, eR_251, eR_252, eR_256, eR_260, eR_261, eR_262, eR_263, eR_273, eR_274, eR_275, eR_276, eR_277, eR_278,
  eR_279, eR_288, eR_289, eR_291, eR_292, eR_293, eR_294, eR_295, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311,
  eR_316, eR_317, eR_318, eR_319, eR_328, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335, eR_341, eR_342, eR_343, eR_344, eR_349,
  eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_381, eR_382,
  eR_383, eR_384, eR_387, eR_388, eR_389, eR_390, eR_391, eR_393, eR_394, eR_396, eR_397, eR_398, eR_399, eR_401, eR_402, eR_405,
  eR_407, eR_408, eR_410, eR_411, eR_413, eR_414, eR_416, eR_417, eR_419, eR_420, eR_422, eR_427, eR_428, eR_429, eR_430, eR_436,
  eR_439, eR_442, eR_445, eR_447, eR_450, eR_452, eR_453, eR_455, eR_456, eR_460, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471,
  eR_472, eR_473, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_500, eR_501, eR_502, eR_503,
  eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531,
  eR_536, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566, eR_567,
  eR_568, eR_569, eR_570, eR_572, eR_581, eR_582, eR_583, eR_584, eR_585, eR_587, eR_588, eR_597, eR_598, eR_599, eR_600, eR_601,
  eR_602, eR_603, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626,
  eR_627, eR_628, eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654,
  eR_655, eR_656, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686,
  eR_687, eR_688, eR_697, eR_698, eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718,
  eR_719, eR_720, eR_729, eR_730, eR_731, eR_732, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754,
  eR_755, eR_756, eR_757, eR_758, eR_760, eR_768, eR_769, eR_770, eR_771, eR_774, eR_775, eR_786, eR_787, eR_788, eR_789, eR_792,
  eR_793, eR_795, eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_810, eR_811, eR_812, eR_813, eR_814, eR_815, eR_820, eR_821,
  eR_824, eR_825, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_842, eR_843, eR_844, eR_845, eR_846, eR_847,
  eR_850, eR_851, eR_852, eR_853, eR_854, eR_855, eR_856, eR_857, eR_860, eR_861, eR_868, eR_869, eR_870, eR_871, eR_878, eR_879,
  eR_882, eR_883, eR_890, eR_891, eR_900, eR_902, eR_904, eR_905, eR_907, eR_909, eR_910, eR_911, eR_912, eR_913, eR_914, eR_916,
  eR_917, eR_918, eR_921, eR_925, eR_928, eR_929, eR_931, eR_932, eR_933, eR_934, eR_938, eR_939, eR_945, eR_948, eR_951, eR_952,
  eR_953, eR_956, eR_957, eR_958, eR_960, eR_962, eR_963, eR_964, eR_965, eR_967, eR_968, eR_970, eR_973, eR_974, eR_975, eR_976,
  eR_981, eR_986, eR_988, eR_989, eR_990, eR_995, eR_998, eR_999, eR_1002, eR_1004, eR_1005, eR_1006, eR_1009, eR_1011, eR_1012, eR_1014,
  eR_1016, eR_1018, eR_1019, eR_1020, eR_1022]
theorem nbOKR_56 : nbR_56 = nbhd entsR eR_56 := by decide +kernel
theorem mkOKR_56 : mkEnt 32 1024 W rR_56 56 = eR_56 := by decide +kernel
theorem tR_56 : kTermA 4294967295 eR_56 nbR_56 = 71174413055343801008061090 := by decide +kernel


end RamseyCert
