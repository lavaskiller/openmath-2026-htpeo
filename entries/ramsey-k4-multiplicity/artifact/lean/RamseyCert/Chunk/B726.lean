import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_726 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_15, eB_16, eB_20, eB_21, eB_23, eB_25, eB_27, eB_28, eB_32, eB_35, eB_38, eB_41,
  eB_42, eB_43, eB_47, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_64, eB_65, eB_66, eB_67, eB_76,
  eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_96, eB_98, eB_100, eB_102, eB_103,
  eB_105, eB_107, eB_108, eB_109, eB_112, eB_116, eB_117, eB_118, eB_122, eB_123, eB_125, eB_126, eB_128, eB_129, eB_131, eB_132,
  eB_133, eB_134, eB_135, eB_141, eB_144, eB_147, eB_148, eB_149, eB_153, eB_154, eB_155, eB_159, eB_160, eB_161, eB_162, eB_163,
  eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_196, eB_197, eB_198, eB_199,
  eB_204, eB_205, eB_206, eB_207, eB_208, eB_210, eB_212, eB_215, eB_218, eB_221, eB_224, eB_228, eB_229, eB_230, eB_233, eB_237,
  eB_238, eB_240, eB_241, eB_242, eB_249, eB_251, eB_253, eB_256, eB_258, eB_260, eB_261, eB_262, eB_263, eB_268, eB_269, eB_270,
  eB_271, eB_276, eB_277, eB_278, eB_279, eB_285, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299, eB_300, eB_304,
  eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326, eB_327, eB_333,
  eB_336, eB_337, eB_338, eB_339, eB_341, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_357, eB_358, eB_359,
  eB_360, eB_365, eB_366, eB_367, eB_368, eB_373, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_388, eB_390,
  eB_393, eB_396, eB_398, eB_401, eB_403, eB_405, eB_409, eB_410, eB_411, eB_415, eB_416, eB_417, eB_421, eB_422, eB_423, eB_425,
  eB_427, eB_428, eB_429, eB_430, eB_435, eB_438, eB_441, eB_442, eB_444, eB_445, eB_448, eB_450, eB_454, eB_455, eB_457, eB_459,
  eB_460, eB_462, eB_463, eB_464, eB_465, eB_470, eB_471, eB_472, eB_473, eB_482, eB_483, eB_484, eB_485, eB_488, eB_489, eB_490,
  eB_491, eB_496, eB_497, eB_498, eB_499, eB_506, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525,
  eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_537, eB_538, eB_539, eB_540, eB_542, eB_549, eB_550, eB_551, eB_552, eB_557,
  eB_558, eB_559, eB_560, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_574, eB_577, eB_578, eB_579, eB_580,
  eB_582, eB_585, eB_586, eB_587, eB_588, eB_592, eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_609, eB_612,
  eB_615, eB_618, eB_621, eB_623, eB_626, eB_628, eB_633, eB_634, eB_635, eB_636, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646,
  eB_647, eB_648, eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682,
  eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_708, eB_713,
  eB_714, eB_715, eB_716, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736, eB_741,
  eB_742, eB_743, eB_744, eB_753, eB_754, eB_755, eB_756, eB_761, eB_762, eB_763, eB_764, eB_768, eB_769, eB_770, eB_771, eB_772,
  eB_773, eB_776, eB_777, eB_780, eB_781, eB_782, eB_783, eB_784, eB_785, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_796,
  eB_797, eB_798, eB_799, eB_800, eB_801, eB_802, eB_803, eB_804, eB_805, eB_808, eB_809, eB_810, eB_811, eB_812, eB_813, eB_816,
  eB_817, eB_818, eB_819, eB_822, eB_823, eB_824, eB_825, eB_828, eB_829, eB_832, eB_833, eB_834, eB_835, eB_836, eB_837, eB_842,
  eB_843, eB_854, eB_855, eB_856, eB_857, eB_862, eB_863, eB_866, eB_867, eB_870, eB_871, eB_872, eB_873, eB_880, eB_881, eB_882,
  eB_883, eB_888, eB_889, eB_890, eB_891, eB_894, eB_895, eB_901, eB_902, eB_903, eB_907, eB_910, eB_912, eB_914, eB_915, eB_917,
  eB_919, eB_921, eB_925, eB_929, eB_932, eB_933, eB_941, eB_942, eB_943, eB_945, eB_947, eB_948, eB_953, eB_957, eB_958, eB_962,
  eB_964, eB_968, eB_969, eB_970, eB_972, eB_973, eB_974, eB_976, eB_978, eB_979, eB_980, eB_981, eB_984, eB_985, eB_987, eB_989,
  eB_990, eB_991, eB_992, eB_994, eB_995, eB_997, eB_999, eB_1000, eB_1002, eB_1006, eB_1007, eB_1010, eB_1012, eB_1013, eB_1015, eB_1016,
  eB_1017]
theorem nbOKB_726 : nbB_726 = nbhd entsB eB_726 := by decide +kernel
theorem mkOKB_726 : mkEnt 32 1024 W rB_726 726 = eB_726 := by decide +kernel
theorem tB_726 : kTermA 4294967295 eB_726 nbB_726 = 95978335201049499523732818 := by decide +kernel


end RamseyCert
