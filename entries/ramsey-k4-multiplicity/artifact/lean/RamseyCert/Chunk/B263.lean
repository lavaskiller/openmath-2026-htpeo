import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_263 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_12, eB_13, eB_14, eB_15, eB_18, eB_19, eB_20, eB_33,
  eB_34, eB_35, eB_36, eB_37, eB_38, eB_39, eB_40, eB_41, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63,
  eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75, eB_79, eB_80, eB_81, eB_82, eB_83, eB_87, eB_92, eB_93,
  eB_94, eB_95, eB_96, eB_103, eB_104, eB_105, eB_124, eB_125, eB_126, eB_127, eB_128, eB_129, eB_130, eB_131, eB_132, eB_133,
  eB_134, eB_135, eB_136, eB_137, eB_138, eB_139, eB_140, eB_141, eB_142, eB_143, eB_144, eB_145, eB_146, eB_147, eB_164, eB_165,
  eB_166, eB_167, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_189, eB_192,
  eB_193, eB_194, eB_195, eB_196, eB_204, eB_205, eB_206, eB_207, eB_214, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221,
  eB_222, eB_223, eB_224, eB_225, eB_226, eB_245, eB_246, eB_247, eB_251, eB_252, eB_253, eB_254, eB_260, eB_261, eB_262, eB_263,
  eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_296, eB_297, eB_298, eB_299,
  eB_304, eB_305, eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330, eB_331,
  eB_336, eB_337, eB_338, eB_339, eB_345, eB_346, eB_347, eB_348, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360,
  eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_387, eB_388, eB_389, eB_390, eB_397, eB_398, eB_405, eB_406,
  eB_407, eB_408, eB_409, eB_410, eB_411, eB_412, eB_413, eB_414, eB_415, eB_416, eB_417, eB_418, eB_419, eB_420, eB_421, eB_422,
  eB_423, eB_424, eB_425, eB_426, eB_431, eB_432, eB_433, eB_434, eB_450, eB_451, eB_452, eB_453, eB_454, eB_455, eB_457, eB_458,
  eB_464, eB_466, eB_467, eB_468, eB_469, eB_471, eB_474, eB_475, eB_476, eB_477, eB_479, eB_482, eB_483, eB_484, eB_485, eB_488,
  eB_489, eB_490, eB_491, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_520,
  eB_521, eB_522, eB_523, eB_528, eB_529, eB_530, eB_531, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552, eB_557,
  eB_558, eB_559, eB_560, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584, eB_585,
  eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_621, eB_622, eB_623, eB_624, eB_625,
  eB_626, eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_635, eB_636, eB_638, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646,
  eB_647, eB_648, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682,
  eB_683, eB_684, eB_687, eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707, eB_708, eB_709,
  eB_710, eB_711, eB_712, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736, eB_741,
  eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_768, eB_769, eB_770, eB_771, eB_776,
  eB_777, eB_782, eB_783, eB_784, eB_785, eB_786, eB_787, eB_790, eB_791, eB_796, eB_797, eB_798, eB_799, eB_802, eB_803, eB_808,
  eB_809, eB_810, eB_811, eB_812, eB_813, eB_814, eB_815, eB_818, eB_819, eB_820, eB_821, eB_822, eB_823, eB_825, eB_828, eB_829,
  eB_844, eB_845, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_856, eB_857, eB_858, eB_859, eB_866, eB_867, eB_874, eB_875,
  eB_876, eB_877, eB_878, eB_879, eB_882, eB_883, eB_886, eB_887, eB_892, eB_896, eB_897, eB_900, eB_901, eB_902, eB_903, eB_904,
  eB_909, eB_910, eB_911, eB_913, eB_915, eB_917, eB_918, eB_922, eB_923, eB_924, eB_925, eB_927, eB_930, eB_933, eB_934, eB_937,
  eB_939, eB_941, eB_944, eB_945, eB_946, eB_949, eB_952, eB_953, eB_955, eB_958, eB_959, eB_961, eB_962, eB_965, eB_966, eB_967,
  eB_968, eB_975, eB_980, eB_983, eB_984, eB_985, eB_986, eB_988, eB_989, eB_991, eB_992, eB_993, eB_996, eB_997, eB_998, eB_999,
  eB_1000, eB_1006, eB_1007, eB_1008, eB_1010, eB_1013, eB_1014, eB_1016, eB_1018, eB_1021, eB_1022]
theorem nbOKB_263 : nbB_263 = nbhd entsB eB_263 := by decide +kernel
theorem mkOKB_263 : mkEnt 32 1024 W rB_263 263 = eB_263 := by decide +kernel
theorem tB_263 : kTermA 4294967295 eB_263 nbB_263 = 124485670825314528088090680 := by decide +kernel


end RamseyCert
