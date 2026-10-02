import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_1022 : List Ent := [
  eR_14, eR_15, eR_16, eR_17, eR_19, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27, eR_30, eR_34, eR_35,
  eR_37, eR_38, eR_40, eR_41, eR_42, eR_45, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_56, eR_57,
  eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81,
  eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_99, eR_102, eR_103, eR_111, eR_117, eR_120, eR_123, eR_124, eR_125, eR_127,
  eR_130, eR_131, eR_140, eR_141, eR_143, eR_144, eR_146, eR_147, eR_148, eR_151, eR_154, eR_157, eR_160, eR_161, eR_162, eR_163,
  eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175, eR_184, eR_185, eR_186, eR_187,
  eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_210, eR_215, eR_218, eR_221,
  eR_222, eR_225, eR_232, eR_235, eR_238, eR_241, eR_244, eR_255, eR_258, eR_259, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281,
  eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297,
  eR_298, eR_299, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_340, eR_341, eR_342, eR_343, eR_344, eR_345,
  eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_365, eR_366, eR_367, eR_368, eR_369,
  eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_381, eR_383, eR_384, eR_385, eR_386,
  eR_391, eR_394, eR_399, eR_404, eR_405, eR_406, eR_408, eR_409, eR_411, eR_412, eR_414, eR_415, eR_417, eR_418, eR_420, eR_421,
  eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_437, eR_440, eR_441, eR_444, eR_449, eR_450, eR_451, eR_453,
  eR_454, eR_456, eR_459, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_486, eR_487, eR_496, eR_497, eR_498,
  eR_499, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_520, eR_521, eR_522,
  eR_523, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_536, eR_537, eR_538,
  eR_539, eR_540, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_561, eR_562,
  eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_601, eR_602,
  eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_611, eR_617, eR_620, eR_629, eR_630, eR_631, eR_632, eR_633, eR_634, eR_635,
  eR_636, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667,
  eR_668, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723,
  eR_724, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747,
  eR_748, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762, eR_763,
  eR_764, eR_766, eR_767, eR_774, eR_775, eR_776, eR_777, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785, eR_788, eR_789, eR_794,
  eR_795, eR_796, eR_797, eR_798, eR_799, eR_802, eR_803, eR_804, eR_805, eR_820, eR_821, eR_822, eR_823, eR_824, eR_825, eR_826,
  eR_827, eR_828, eR_829, eR_832, eR_833, eR_835, eR_842, eR_843, eR_844, eR_845, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853,
  eR_856, eR_857, eR_865, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_872, eR_874, eR_875, eR_876, eR_877, eR_878, eR_879,
  eR_880, eR_881, eR_884, eR_885, eR_886, eR_887, eR_894, eR_895, eR_896, eR_897, eR_904, eR_905, eR_906, eR_908, eR_914, eR_918,
  eR_919, eR_926, eR_927, eR_928, eR_929, eR_932, eR_933, eR_934, eR_936, eR_940, eR_941, eR_942, eR_944, eR_946, eR_948, eR_951,
  eR_952, eR_955, eR_956, eR_957, eR_958, eR_959, eR_960, eR_963, eR_964, eR_965, eR_966, eR_967, eR_969, eR_973, eR_978, eR_979,
  eR_980, eR_982, eR_984, eR_988, eR_989, eR_990, eR_991, eR_994, eR_997, eR_999, eR_1001, eR_1004, eR_1006, eR_1007, eR_1008, eR_1009,
  eR_1010, eR_1012, eR_1013, eR_1014, eR_1016, eR_1018, eR_1019]
theorem nbOKR_1022 : nbR_1022 = nbhd entsR eR_1022 := by decide +kernel
theorem mkOKR_1022 : mkEnt 32 1024 W rR_1022 1022 = eR_1022 := by decide +kernel
theorem tR_1022 : kTermA 4294967295 eR_1022 nbR_1022 = 80357476113806900785199700 := by decide +kernel


end RamseyCert
