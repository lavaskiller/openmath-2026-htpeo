import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_545 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_14, eR_17, eR_18, eR_20, eR_22, eR_24, eR_26, eR_27,
  eR_29, eR_31, eR_33, eR_35, eR_36, eR_38, eR_39, eR_41, eR_42, eR_44, eR_46, eR_52, eR_53, eR_54, eR_55, eR_56,
  eR_58, eR_59, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_84, eR_85, eR_86, eR_87, eR_92, eR_93, eR_94,
  eR_95, eR_96, eR_97, eR_101, eR_102, eR_104, eR_105, eR_106, eR_108, eR_110, eR_113, eR_115, eR_117, eR_119, eR_121, eR_123,
  eR_124, eR_126, eR_127, eR_129, eR_130, eR_132, eR_133, eR_134, eR_135, eR_140, eR_143, eR_146, eR_148, eR_150, eR_152, eR_154,
  eR_156, eR_158, eR_164, eR_165, eR_166, eR_167, eR_169, eR_170, eR_171, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186,
  eR_187, eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_207, eR_208, eR_212, eR_213, eR_214, eR_215, eR_217, eR_218,
  eR_220, eR_221, eR_223, eR_224, eR_226, eR_228, eR_230, eR_232, eR_233, eR_235, eR_237, eR_240, eR_242, eR_244, eR_245, eR_246,
  eR_247, eR_249, eR_250, eR_252, eR_253, eR_255, eR_257, eR_258, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270, eR_271,
  eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303,
  eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_329, eR_330, eR_332, eR_333, eR_334, eR_335, eR_341, eR_342,
  eR_343, eR_344, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_377, eR_378,
  eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_387, eR_389, eR_391, eR_393, eR_394, eR_396, eR_397, eR_399, eR_401, eR_403,
  eR_404, eR_405, eR_407, eR_409, eR_411, eR_413, eR_415, eR_417, eR_419, eR_421, eR_423, eR_425, eR_427, eR_428, eR_429, eR_430,
  eR_435, eR_437, eR_438, eR_440, eR_441, eR_443, eR_444, eR_446, eR_448, eR_449, eR_450, eR_452, eR_454, eR_456, eR_457, eR_459,
  eR_461, eR_462, eR_463, eR_464, eR_465, eR_474, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_488, eR_489,
  eR_490, eR_491, eR_500, eR_501, eR_502, eR_504, eR_505, eR_506, eR_507, eR_516, eR_517, eR_519, eR_520, eR_521, eR_522, eR_523,
  eR_532, eR_534, eR_535, eR_536, eR_537, eR_538, eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556,
  eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588,
  eR_597, eR_598, eR_599, eR_600, eR_601, eR_602, eR_603, eR_604, eR_610, eR_613, eR_616, eR_619, eR_621, eR_623, eR_626, eR_628,
  eR_629, eR_630, eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656,
  eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_681, eR_682, eR_684, eR_685, eR_686, eR_687, eR_688, eR_697,
  eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_721, eR_723, eR_725, eR_726, eR_727,
  eR_728, eR_737, eR_738, eR_739, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_761, eR_762, eR_763, eR_764, eR_765,
  eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_780, eR_781, eR_790, eR_791,
  eR_794, eR_795, eR_796, eR_797, eR_798, eR_799, eR_804, eR_805, eR_806, eR_807, eR_810, eR_811, eR_812, eR_813, eR_820, eR_821,
  eR_824, eR_825, eR_826, eR_827, eR_828, eR_829, eR_832, eR_833, eR_836, eR_837, eR_840, eR_841, eR_842, eR_843, eR_844, eR_845,
  eR_854, eR_855, eR_856, eR_857, eR_858, eR_859, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_872, eR_873, eR_880, eR_881,
  eR_882, eR_883, eR_884, eR_885, eR_892, eR_893, eR_894, eR_895, eR_896, eR_901, eR_902, eR_904, eR_908, eR_909, eR_911, eR_912,
  eR_914, eR_915, eR_916, eR_920, eR_923, eR_924, eR_925, eR_926, eR_927, eR_931, eR_937, eR_938, eR_940, eR_944, eR_947, eR_949,
  eR_950, eR_951, eR_957, eR_960, eR_962, eR_963, eR_964, eR_965, eR_969, eR_970, eR_971, eR_972, eR_974, eR_975, eR_977, eR_979,
  eR_980, eR_982, eR_984, eR_985, eR_986, eR_987, eR_989, eR_990, eR_991, eR_993, eR_995, eR_997, eR_1005, eR_1008, eR_1010, eR_1014,
  eR_1015, eR_1016, eR_1018, eR_1019, eR_1020, eR_1021, eR_1022]
theorem nbOKR_545 : nbR_545 = nbhd entsR eR_545 := by decide +kernel
theorem mkOKR_545 : mkEnt 32 1024 W rR_545 545 = eR_545 := by decide +kernel
theorem tR_545 : kTermA 4294967295 eR_545 nbR_545 = 119712226426647337502346600 := by decide +kernel


end RamseyCert
