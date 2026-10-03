import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_685 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_15, eB_18, eB_19, eB_29, eB_32, eB_33, eB_34, eB_36, eB_37, eB_39, eB_40,
  eB_44, eB_47, eB_48, eB_49, eB_50, eB_51, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_72, eB_73,
  eB_74, eB_75, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_97, eB_99, eB_100, eB_102, eB_103, eB_105,
  eB_107, eB_108, eB_110, eB_111, eB_113, eB_114, eB_116, eB_117, eB_119, eB_120, eB_122, eB_123, eB_125, eB_126, eB_128, eB_129,
  eB_131, eB_132, eB_136, eB_137, eB_138, eB_141, eB_144, eB_147, eB_150, eB_153, eB_156, eB_159, eB_164, eB_165, eB_166, eB_167,
  eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_188, eB_189, eB_190, eB_191, eB_196, eB_197, eB_198, eB_199,
  eB_204, eB_205, eB_206, eB_207, eB_209, eB_212, eB_214, eB_215, eB_218, eB_221, eB_224, eB_227, eB_230, eB_233, eB_236, eB_239,
  eB_242, eB_245, eB_246, eB_247, eB_248, eB_250, eB_253, eB_254, eB_257, eB_260, eB_264, eB_265, eB_266, eB_267, eB_268, eB_269,
  eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_286, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_300,
  eB_301, eB_302, eB_303, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326, eB_327, eB_333,
  eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352, eB_358, eB_361, eB_362, eB_363,
  eB_364, eB_367, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_381, eB_382, eB_383, eB_384, eB_391, eB_392,
  eB_394, eB_395, eB_399, eB_400, eB_403, eB_405, eB_408, eB_411, eB_414, eB_417, eB_420, eB_423, eB_424, eB_425, eB_426, eB_431,
  eB_432, eB_433, eB_434, eB_435, eB_438, eB_443, eB_446, eB_448, eB_450, eB_453, eB_456, eB_457, eB_458, eB_461, eB_462, eB_463,
  eB_464, eB_465, eB_470, eB_471, eB_472, eB_473, eB_479, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_488, eB_489, eB_490,
  eB_491, eB_496, eB_497, eB_498, eB_499, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515, eB_520, eB_521, eB_522,
  eB_523, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537, eB_538, eB_539, eB_540, eB_542, eB_549, eB_550, eB_551, eB_552, eB_557,
  eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_568, eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584,
  eB_585, eB_586, eB_587, eB_588, eB_591, eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_610, eB_611, eB_613,
  eB_614, eB_616, eB_617, eB_619, eB_620, eB_629, eB_630, eB_631, eB_632, eB_633, eB_637, eB_638, eB_639, eB_640, eB_649, eB_650,
  eB_651, eB_652, eB_653, eB_654, eB_655, eB_656, eB_660, eB_661, eB_662, eB_663, eB_664, eB_666, eB_673, eB_674, eB_675, eB_676,
  eB_681, eB_682, eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707, eB_708,
  eB_713, eB_714, eB_715, eB_716, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_737, eB_738, eB_739, eB_740,
  eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_761, eB_762, eB_763, eB_764, eB_768, eB_769, eB_774, eB_775,
  eB_776, eB_777, eB_778, eB_779, eB_780, eB_781, eB_786, eB_788, eB_789, eB_790, eB_791, eB_794, eB_795, eB_800, eB_801, eB_802,
  eB_803, eB_810, eB_811, eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_822, eB_823, eB_838, eB_839, eB_840, eB_841, eB_850,
  eB_851, eB_854, eB_855, eB_856, eB_860, eB_861, eB_864, eB_865, eB_868, eB_869, eB_870, eB_871, eB_874, eB_875, eB_880, eB_881,
  eB_882, eB_883, eB_890, eB_891, eB_892, eB_893, eB_894, eB_895, eB_897, eB_900, eB_901, eB_902, eB_903, eB_904, eB_905, eB_910,
  eB_912, eB_913, eB_915, eB_917, eB_918, eB_920, eB_923, eB_929, eB_930, eB_931, eB_933, eB_935, eB_936, eB_938, eB_940, eB_942,
  eB_943, eB_944, eB_945, eB_946, eB_949, eB_951, eB_954, eB_959, eB_962, eB_964, eB_966, eB_967, eB_970, eB_973, eB_974, eB_976,
  eB_977, eB_978, eB_979, eB_980, eB_982, eB_986, eB_987, eB_989, eB_990, eB_991, eB_993, eB_995, eB_1001, eB_1002, eB_1003, eB_1004,
  eB_1006, eB_1007, eB_1008, eB_1009, eB_1010, eB_1012, eB_1013, eB_1018, eB_1020, eB_1022]
theorem nbOKB_685 : nbB_685 = nbhd entsB eB_685 := by decide +kernel
theorem mkOKB_685 : mkEnt 32 1024 W rB_685 685 = eB_685 := by decide +kernel
theorem tB_685 : kTermA 4294967295 eB_685 nbB_685 = 78715414015067554812184656 := by decide +kernel


end RamseyCert
