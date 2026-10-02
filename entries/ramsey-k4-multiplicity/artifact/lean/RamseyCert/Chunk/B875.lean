import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_875 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_12, eB_13, eB_15, eB_17, eB_19, eB_22, eB_24, eB_26, eB_27, eB_29, eB_31, eB_34,
  eB_37, eB_40, eB_42, eB_44, eB_46, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_60, eB_68, eB_69,
  eB_70, eB_71, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_86, eB_92, eB_93, eB_94, eB_95, eB_97,
  eB_101, eB_102, eB_103, eB_106, eB_108, eB_110, eB_113, eB_115, eB_117, eB_119, eB_121, eB_123, eB_125, eB_128, eB_131, eB_136,
  eB_137, eB_138, eB_139, eB_141, eB_142, eB_144, eB_145, eB_147, eB_148, eB_150, eB_152, eB_154, eB_156, eB_158, eB_164, eB_165,
  eB_166, eB_167, eB_168, eB_169, eB_170, eB_171, eB_180, eB_181, eB_182, eB_183, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193,
  eB_194, eB_195, eB_196, eB_204, eB_205, eB_206, eB_207, eB_208, eB_212, eB_213, eB_216, eB_219, eB_222, eB_225, eB_228, eB_230,
  eB_232, eB_233, eB_235, eB_237, eB_240, eB_242, eB_244, eB_248, eB_252, eB_253, eB_256, eB_259, eB_260, eB_261, eB_262, eB_263,
  eB_268, eB_269, eB_270, eB_271, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294, eB_295,
  eB_301, eB_302, eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325,
  eB_326, eB_327, eB_336, eB_337, eB_338, eB_339, eB_340, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_361,
  eB_362, eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_377, eB_378, eB_379, eB_380, eB_385, eB_386, eB_387, eB_389, eB_392,
  eB_395, eB_397, eB_400, eB_402, eB_405, eB_407, eB_409, eB_411, eB_413, eB_415, eB_417, eB_419, eB_421, eB_423, eB_425, eB_427,
  eB_428, eB_429, eB_430, eB_436, eB_439, eB_442, eB_445, eB_447, eB_450, eB_452, eB_454, eB_457, eB_460, eB_462, eB_463, eB_464,
  eB_465, eB_473, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_488, eB_492, eB_493, eB_494, eB_495, eB_496,
  eB_497, eB_498, eB_499, eB_507, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515, eB_521, eB_524, eB_525, eB_526,
  eB_527, eB_528, eB_529, eB_530, eB_531, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_557, eB_558, eB_559,
  eB_560, eB_561, eB_562, eB_563, eB_564, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579, eB_580, eB_585, eB_586, eB_587,
  eB_588, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_609, eB_611, eB_612, eB_614, eB_615, eB_617, eB_618,
  eB_620, eB_621, eB_623, eB_626, eB_628, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_649, eB_650, eB_651,
  eB_652, eB_653, eB_654, eB_655, eB_656, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_677, eB_681, eB_682,
  eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_705, eB_706, eB_707, eB_708, eB_710, eB_713,
  eB_714, eB_715, eB_716, eB_717, eB_718, eB_719, eB_720, eB_728, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736,
  eB_741, eB_744, eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_761, eB_762, eB_763, eB_764, eB_768, eB_769,
  eB_770, eB_771, eB_782, eB_784, eB_785, eB_788, eB_789, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_802, eB_803, eB_804,
  eB_805, eB_806, eB_807, eB_812, eB_813, eB_814, eB_815, eB_818, eB_819, eB_822, eB_823, eB_824, eB_825, eB_828, eB_829, eB_830,
  eB_831, eB_832, eB_833, eB_838, eB_839, eB_840, eB_841, eB_844, eB_845, eB_848, eB_849, eB_874, eB_875, eB_876, eB_877, eB_878,
  eB_879, eB_880, eB_881, eB_882, eB_883, eB_886, eB_887, eB_890, eB_891, eB_892, eB_893, eB_894, eB_895, eB_897, eB_899, eB_900,
  eB_901, eB_904, eB_906, eB_907, eB_909, eB_911, eB_912, eB_913, eB_915, eB_916, eB_919, eB_922, eB_923, eB_924, eB_925, eB_926,
  eB_927, eB_931, eB_936, eB_943, eB_944, eB_945, eB_946, eB_948, eB_952, eB_956, eB_957, eB_958, eB_960, eB_965, eB_969, eB_970,
  eB_971, eB_974, eB_975, eB_978, eB_981, eB_982, eB_984, eB_988, eB_989, eB_991, eB_992, eB_993, eB_995, eB_997, eB_1000, eB_1001,
  eB_1002, eB_1003, eB_1004, eB_1006, eB_1008, eB_1012, eB_1013, eB_1015, eB_1017, eB_1019, eB_1020]
theorem nbOKB_875 : nbB_875 = nbhd entsB eB_875 := by decide +kernel
theorem mkOKB_875 : mkEnt 32 1024 W rB_875 875 = eB_875 := by decide +kernel
theorem tB_875 : kTermA 4294967295 eB_875 nbB_875 = 89850259028056427563279690 := by decide +kernel


end RamseyCert
