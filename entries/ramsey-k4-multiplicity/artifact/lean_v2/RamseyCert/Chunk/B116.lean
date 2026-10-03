import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_116 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_12, eB_13, eB_15, eB_17, eB_18, eB_20, eB_22, eB_23, eB_24, eB_26, eB_28, eB_29,
  eB_30, eB_32, eB_33, eB_35, eB_36, eB_37, eB_38, eB_39, eB_41, eB_43, eB_45, eB_47, eB_48, eB_49, eB_50, eB_51,
  eB_52, eB_53, eB_54, eB_55, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_80, eB_81, eB_82, eB_83,
  eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_98, eB_99, eB_100, eB_103,
  eB_107, eB_109, eB_111, eB_112, eB_114, eB_116, eB_118, eB_120, eB_122, eB_125, eB_128, eB_131, eB_136, eB_137, eB_138, eB_139,
  eB_141, eB_142, eB_144, eB_145, eB_147, eB_148, eB_149, eB_151, eB_152, eB_153, eB_155, eB_157, eB_159, eB_168, eB_169, eB_170,
  eB_171, eB_172, eB_173, eB_174, eB_175, eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_208, eB_212, eB_213,
  eB_214, eB_215, eB_217, eB_218, eB_220, eB_221, eB_223, eB_224, eB_226, eB_228, eB_230, eB_232, eB_233, eB_234, eB_235, eB_237,
  eB_240, eB_242, eB_244, eB_245, eB_246, eB_247, eB_249, eB_250, eB_252, eB_254, eB_255, eB_256, eB_259, eB_276, eB_277, eB_278,
  eB_279, eB_280, eB_281, eB_282, eB_283, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_308, eB_309, eB_310,
  eB_311, eB_312, eB_313, eB_314, eB_315, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_340, eB_341, eB_342,
  eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_385, eB_386,
  eB_387, eB_389, eB_391, eB_393, eB_394, eB_396, eB_397, eB_399, eB_401, eB_403, eB_404, eB_405, eB_407, eB_409, eB_411, eB_413,
  eB_415, eB_416, eB_417, eB_419, eB_421, eB_424, eB_426, eB_435, eB_437, eB_438, eB_440, eB_442, eB_445, eB_447, eB_448, eB_449,
  eB_450, eB_451, eB_452, eB_453, eB_454, eB_456, eB_458, eB_460, eB_470, eB_471, eB_472, eB_473, eB_474, eB_475, eB_476, eB_477,
  eB_486, eB_487, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503, eB_512, eB_513, eB_514, eB_515, eB_516, eB_517,
  eB_518, eB_519, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_536, eB_545, eB_546, eB_547, eB_548, eB_549,
  eB_550, eB_551, eB_552, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_577, eB_578, eB_579, eB_580, eB_581,
  eB_582, eB_583, eB_584, eB_593, eB_594, eB_595, eB_596, eB_597, eB_598, eB_599, eB_600, eB_609, eB_611, eB_612, eB_614, eB_615,
  eB_616, eB_617, eB_618, eB_620, eB_622, eB_624, eB_625, eB_626, eB_627, eB_637, eB_638, eB_639, eB_640, eB_641, eB_642, eB_643,
  eB_644, eB_653, eB_654, eB_655, eB_656, eB_657, eB_658, eB_659, eB_660, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674, eB_675,
  eB_676, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692, eB_701, eB_702, eB_703, eB_704, eB_705, eB_706, eB_707,
  eB_708, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731,
  eB_732, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_765, eB_766, eB_767, eB_772, eB_773, eB_774, eB_775,
  eB_776, eB_777, eB_782, eB_783, eB_784, eB_785, eB_792, eB_794, eB_795, eB_796, eB_797, eB_800, eB_801, eB_802, eB_803, eB_814,
  eB_815, eB_816, eB_817, eB_821, eB_822, eB_823, eB_826, eB_827, eB_828, eB_829, eB_836, eB_837, eB_838, eB_839, eB_848, eB_849,
  eB_856, eB_857, eB_858, eB_859, eB_862, eB_863, eB_864, eB_865, eB_866, eB_867, eB_868, eB_869, eB_884, eB_885, eB_888, eB_889,
  eB_890, eB_891, eB_898, eB_900, eB_905, eB_906, eB_907, eB_908, eB_909, eB_911, eB_913, eB_917, eB_921, eB_922, eB_923, eB_924,
  eB_925, eB_926, eB_928, eB_930, eB_933, eB_936, eB_937, eB_939, eB_940, eB_941, eB_943, eB_947, eB_949, eB_951, eB_956, eB_958,
  eB_960, eB_961, eB_962, eB_963, eB_965, eB_970, eB_972, eB_974, eB_975, eB_976, eB_980, eB_981, eB_982, eB_984, eB_986, eB_987,
  eB_989, eB_993, eB_995, eB_996, eB_997, eB_998, eB_999, eB_1001, eB_1002, eB_1004, eB_1006, eB_1007, eB_1009, eB_1010, eB_1012, eB_1013,
  eB_1015, eB_1016, eB_1017, eB_1019, eB_1020, eB_1021, eB_1022]
theorem nbOKB_116 : nbB_116 = nbhd entsB eB_116 := by decide +kernel
theorem mkOKB_116 : mkEnt 32 1024 W rB_116 116 = eB_116 := by decide +kernel
theorem tB_116 : kTermA 4294967295 eB_116 nbB_116 = 85573190872274594217073658 := by decide +kernel


end RamseyCert
