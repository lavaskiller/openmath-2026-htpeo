import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_703 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_17, eB_18, eB_19, eB_20, eB_22, eB_24, eB_26, eB_30, eB_31, eB_32, eB_33,
  eB_34, eB_35, eB_36, eB_37, eB_38, eB_39, eB_40, eB_41, eB_45, eB_46, eB_47, eB_48, eB_49, eB_50, eB_51, eB_56,
  eB_57, eB_58, eB_59, eB_64, eB_65, eB_66, eB_67, eB_75, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83,
  eB_89, eB_92, eB_93, eB_94, eB_95, eB_96, eB_100, eB_101, eB_102, eB_106, eB_107, eB_108, eB_115, eB_116, eB_117, eB_121,
  eB_122, eB_123, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_151, eB_152, eB_153, eB_157, eB_158, eB_159, eB_160, eB_161,
  eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_187, eB_188, eB_189, eB_190, eB_191, eB_192,
  eB_193, eB_194, eB_195, eB_203, eB_204, eB_205, eB_206, eB_207, eB_211, eB_212, eB_213, eB_214, eB_230, eB_231, eB_232, eB_233,
  eB_234, eB_235, eB_242, eB_243, eB_244, eB_245, eB_246, eB_247, eB_251, eB_254, eB_255, eB_259, eB_264, eB_265, eB_266, eB_267,
  eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294, eB_295,
  eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330, eB_331,
  eB_336, eB_337, eB_338, eB_339, eB_340, eB_341, eB_342, eB_343, eB_344, eB_347, eB_348, eB_353, eB_354, eB_355, eB_356, eB_361,
  eB_362, eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_385,
  eB_386, eB_388, eB_390, eB_398, eB_402, eB_403, eB_404, eB_408, eB_409, eB_410, eB_414, eB_415, eB_416, eB_420, eB_421, eB_422,
  eB_424, eB_426, eB_427, eB_428, eB_429, eB_430, eB_434, eB_435, eB_436, eB_437, eB_438, eB_439, eB_440, eB_447, eB_448, eB_449,
  eB_453, eB_454, eB_455, eB_458, eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485,
  eB_488, eB_489, eB_490, eB_491, eB_494, eB_496, eB_497, eB_498, eB_499, eB_500, eB_504, eB_505, eB_506, eB_507, eB_510, eB_516,
  eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_541, eB_542, eB_543, eB_544, eB_549,
  eB_550, eB_551, eB_552, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_577,
  eB_578, eB_579, eB_580, eB_585, eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_621,
  eB_623, eB_626, eB_628, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_643, eB_649, eB_650, eB_651, eB_652,
  eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684,
  eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_709, eB_710, eB_711, eB_712,
  eB_714, eB_717, eB_718, eB_719, eB_720, eB_721, eB_725, eB_726, eB_727, eB_728, eB_732, eB_737, eB_738, eB_739, eB_740, eB_745,
  eB_746, eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_765, eB_766, eB_767, eB_768, eB_769,
  eB_772, eB_773, eB_774, eB_775, eB_776, eB_777, eB_785, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_798, eB_799, eB_800,
  eB_801, eB_802, eB_803, eB_804, eB_805, eB_806, eB_807, eB_818, eB_819, eB_824, eB_825, eB_826, eB_827, eB_828, eB_829, eB_831,
  eB_840, eB_841, eB_842, eB_843, eB_844, eB_845, eB_852, eB_853, eB_854, eB_855, eB_858, eB_859, eB_870, eB_871, eB_876, eB_877,
  eB_880, eB_881, eB_882, eB_883, eB_884, eB_885, eB_886, eB_887, eB_896, eB_898, eB_901, eB_902, eB_903, eB_905, eB_906, eB_910,
  eB_911, eB_912, eB_913, eB_914, eB_918, eB_919, eB_920, eB_921, eB_924, eB_925, eB_927, eB_928, eB_930, eB_933, eB_934, eB_935,
  eB_936, eB_938, eB_940, eB_945, eB_946, eB_947, eB_948, eB_952, eB_953, eB_954, eB_957, eB_960, eB_961, eB_968, eB_969, eB_971,
  eB_972, eB_973, eB_974, eB_976, eB_982, eB_985, eB_986, eB_987, eB_988, eB_994, eB_996, eB_998, eB_1001, eB_1002, eB_1004, eB_1006,
  eB_1007, eB_1009, eB_1010, eB_1012, eB_1016, eB_1017, eB_1019, eB_1022]
theorem nbOKB_703 : nbB_703 = nbhd entsB eB_703 := by decide +kernel
theorem mkOKB_703 : mkEnt 32 1024 W rB_703 703 = eB_703 := by decide +kernel
theorem tB_703 : kTermA 4294967295 eB_703 nbB_703 = 119261418620957948222499654 := by decide +kernel


end RamseyCert
