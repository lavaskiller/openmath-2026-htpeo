import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_670 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_13, eB_19, eB_20, eB_27, eB_30, eB_34, eB_35, eB_37, eB_38, eB_40, eB_41,
  eB_42, eB_45, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_72, eB_73,
  eB_74, eB_75, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_97, eB_98, eB_100, eB_101, eB_103, eB_104,
  eB_106, eB_107, eB_109, eB_110, eB_112, eB_113, eB_115, eB_116, eB_118, eB_119, eB_121, eB_122, eB_124, eB_125, eB_127, eB_128,
  eB_130, eB_131, eB_136, eB_137, eB_138, eB_139, eB_142, eB_145, eB_148, eB_151, eB_154, eB_157, eB_160, eB_161, eB_162, eB_163,
  eB_168, eB_169, eB_170, eB_171, eB_180, eB_181, eB_182, eB_183, eB_188, eB_189, eB_190, eB_191, eB_196, eB_197, eB_198, eB_199,
  eB_204, eB_205, eB_206, eB_207, eB_210, eB_213, eB_214, eB_217, eB_220, eB_223, eB_226, eB_229, eB_232, eB_235, eB_238, eB_241,
  eB_244, eB_245, eB_246, eB_247, eB_248, eB_249, eB_253, eB_254, eB_258, eB_261, eB_264, eB_265, eB_266, eB_267, eB_269, eB_272,
  eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_293, eB_296, eB_297, eB_298, eB_299,
  eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_317, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326,
  eB_327, eB_332, eB_333, eB_334, eB_335, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352, eB_357, eB_358, eB_359,
  eB_360, eB_366, eB_369, eB_370, eB_371, eB_372, eB_375, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_392,
  eB_393, eB_395, eB_396, eB_400, eB_401, eB_404, eB_407, eB_410, eB_413, eB_416, eB_419, eB_422, eB_423, eB_424, eB_425, eB_426,
  eB_431, eB_432, eB_433, eB_434, eB_437, eB_440, eB_441, eB_444, eB_449, eB_452, eB_455, eB_456, eB_457, eB_458, eB_459, eB_462,
  eB_465, eB_466, eB_467, eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487, eB_492,
  eB_493, eB_494, eB_495, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_516, eB_517, eB_518, eB_519, eB_520,
  eB_521, eB_522, eB_523, eB_528, eB_529, eB_530, eB_531, eB_536, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552,
  eB_553, eB_554, eB_555, eB_556, eB_557, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579,
  eB_580, eB_583, eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_607, eB_609,
  eB_610, eB_612, eB_613, eB_615, eB_616, eB_618, eB_619, eB_629, eB_630, eB_631, eB_632, eB_633, eB_637, eB_638, eB_639, eB_640,
  eB_645, eB_646, eB_647, eB_648, eB_653, eB_654, eB_655, eB_656, eB_657, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671,
  eB_672, eB_681, eB_682, eB_683, eB_684, eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707,
  eB_708, eB_709, eB_710, eB_711, eB_712, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735,
  eB_736, eB_745, eB_746, eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_761, eB_762, eB_763, eB_764, eB_774, eB_775, eB_780,
  eB_781, eB_786, eB_787, eB_788, eB_789, eB_794, eB_795, eB_798, eB_799, eB_800, eB_801, eB_802, eB_803, eB_804, eB_805, eB_806,
  eB_807, eB_808, eB_809, eB_812, eB_813, eB_816, eB_817, eB_822, eB_823, eB_826, eB_827, eB_830, eB_831, eB_832, eB_833, eB_834,
  eB_835, eB_836, eB_837, eB_842, eB_843, eB_844, eB_845, eB_846, eB_847, eB_850, eB_851, eB_854, eB_855, eB_856, eB_857, eB_858,
  eB_859, eB_862, eB_863, eB_866, eB_867, eB_870, eB_871, eB_872, eB_873, eB_874, eB_875, eB_876, eB_877, eB_882, eB_883, eB_892,
  eB_893, eB_894, eB_895, eB_900, eB_901, eB_903, eB_905, eB_907, eB_909, eB_912, eB_913, eB_915, eB_917, eB_920, eB_921, eB_922,
  eB_923, eB_927, eB_928, eB_930, eB_931, eB_933, eB_934, eB_935, eB_943, eB_944, eB_945, eB_946, eB_947, eB_950, eB_951, eB_952,
  eB_953, eB_956, eB_957, eB_958, eB_959, eB_961, eB_964, eB_965, eB_973, eB_977, eB_982, eB_984, eB_986, eB_992, eB_994, eB_995,
  eB_997, eB_1001, eB_1002, eB_1003, eB_1004, eB_1005, eB_1006, eB_1008, eB_1010, eB_1014, eB_1016, eB_1017, eB_1018, eB_1019, eB_1021, eB_1023]
theorem nbOKB_670 : nbB_670 = nbhd entsB eB_670 := by decide +kernel
theorem mkOKB_670 : mkEnt 32 1024 W rB_670 670 = eB_670 := by decide +kernel
theorem tB_670 : kTermA 4294967295 eB_670 nbB_670 = 123386963449092929336112901 := by decide +kernel


end RamseyCert
