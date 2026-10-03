import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_707 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_13, eR_14, eR_15, eR_16, eR_21, eR_23, eR_25, eR_27,
  eR_28, eR_29, eR_42, eR_43, eR_44, eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66,
  eR_67, eR_76, eR_77, eR_79, eR_80, eR_81, eR_82, eR_83, eR_92, eR_93, eR_94, eR_95, eR_97, eR_98, eR_99, eR_103,
  eR_104, eR_105, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_118, eR_119, eR_120, eR_124, eR_125, eR_126, eR_127, eR_128,
  eR_129, eR_130, eR_131, eR_132, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_148, eR_149, eR_150,
  eR_154, eR_155, eR_156, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_188,
  eR_189, eR_190, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205, eR_206, eR_208, eR_209, eR_210, eR_215, eR_216, eR_217, eR_218,
  eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229, eR_236, eR_237, eR_238, eR_239, eR_240,
  eR_241, eR_248, eR_249, eR_250, eR_252, eR_253, eR_256, eR_257, eR_258, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270,
  eR_271, eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302,
  eR_303, eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338,
  eR_339, eR_341, eR_343, eR_344, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372,
  eR_377, eR_378, eR_379, eR_380, eR_387, eR_389, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_397, eR_399, eR_400, eR_401,
  eR_405, eR_406, eR_407, eR_411, eR_412, eR_413, eR_417, eR_418, eR_419, eR_423, eR_425, eR_427, eR_429, eR_430, eR_441, eR_442,
  eR_443, eR_444, eR_445, eR_446, eR_450, eR_451, eR_452, eR_456, eR_457, eR_459, eR_460, eR_461, eR_466, eR_467, eR_468, eR_469,
  eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_488, eR_490, eR_491, eR_496, eR_497, eR_498,
  eR_499, eR_504, eR_506, eR_507, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535,
  eR_536, eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563,
  eR_564, eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595,
  eR_596, eR_601, eR_602, eR_603, eR_604, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619,
  eR_620, eR_622, eR_624, eR_625, eR_627, eR_633, eR_634, eR_635, eR_636, eR_637, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652,
  eR_657, eR_658, eR_659, eR_660, eR_665, eR_666, eR_667, eR_668, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684,
  eR_689, eR_690, eR_691, eR_692, eR_697, eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_717,
  eR_718, eR_719, eR_720, eR_725, eR_726, eR_727, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754,
  eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_768, eR_769, eR_772, eR_773, eR_776, eR_777, eR_778, eR_779, eR_790, eR_791,
  eR_794, eR_795, eR_799, eR_804, eR_805, eR_810, eR_811, eR_818, eR_819, eR_820, eR_821, eR_822, eR_823, eR_824, eR_825, eR_832,
  eR_833, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_844, eR_845, eR_852, eR_853, eR_854,
  eR_855, eR_858, eR_859, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_868, eR_869, eR_872, eR_873, eR_876, eR_877, eR_878,
  eR_879, eR_882, eR_883, eR_886, eR_887, eR_888, eR_889, eR_896, eR_901, eR_902, eR_903, eR_905, eR_907, eR_909, eR_910, eR_912,
  eR_914, eR_915, eR_919, eR_920, eR_921, eR_922, eR_924, eR_927, eR_931, eR_932, eR_933, eR_934, eR_935, eR_936, eR_937, eR_938,
  eR_939, eR_940, eR_945, eR_947, eR_948, eR_951, eR_952, eR_954, eR_955, eR_957, eR_961, eR_969, eR_972, eR_973, eR_975, eR_977,
  eR_980, eR_981, eR_982, eR_989, eR_994, eR_996, eR_998, eR_1001, eR_1002, eR_1003, eR_1004, eR_1006, eR_1007, eR_1009, eR_1010, eR_1012,
  eR_1013, eR_1014, eR_1015, eR_1017, eR_1020, eR_1021]
theorem nbOKR_707 : nbR_707 = nbhd entsR eR_707 := by decide +kernel
theorem mkOKR_707 : mkEnt 32 1024 W rR_707 707 = eR_707 := by decide +kernel
theorem tR_707 : kTermA 4294967295 eR_707 nbR_707 = 77354330632635458530700838 := by decide +kernel


end RamseyCert
