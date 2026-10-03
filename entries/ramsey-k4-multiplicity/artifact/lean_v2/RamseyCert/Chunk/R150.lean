import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_150 : List Ent := [
  eR_12, eR_13, eR_14, eR_17, eR_20, eR_22, eR_24, eR_26, eR_27, eR_28, eR_32, eR_35, eR_38, eR_41, eR_42, eR_43,
  eR_47, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70,
  eR_71, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94,
  eR_95, eR_98, eR_100, eR_102, eR_104, eR_107, eR_108, eR_109, eR_116, eR_117, eR_118, eR_123, eR_124, eR_130, eR_136, eR_137,
  eR_138, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_148, eR_149, eR_153, eR_154, eR_155, eR_159, eR_168, eR_169, eR_170,
  eR_171, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186,
  eR_187, eR_188, eR_189, eR_190, eR_191, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205, eR_206, eR_207, eR_209, eR_213, eR_218,
  eR_221, eR_224, eR_227, eR_231, eR_234, eR_235, eR_236, eR_239, eR_243, eR_244, eR_249, eR_252, eR_253, eR_257, eR_259, eR_260,
  eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_276,
  eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_300,
  eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_340,
  eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380,
  eR_385, eR_386, eR_389, eR_393, eR_396, eR_397, eR_401, eR_403, eR_406, eR_407, eR_412, eR_413, eR_414, eR_418, eR_419, eR_423,
  eR_425, eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_435, eR_438, eR_443, eR_448, eR_451, eR_452, eR_453,
  eR_461, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475, eR_476,
  eR_477, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518,
  eR_519, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551,
  eR_552, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567,
  eR_568, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619,
  eR_620, eR_621, eR_623, eR_626, eR_628, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_653, eR_654, eR_655,
  eR_656, eR_657, eR_658, eR_659, eR_660, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671,
  eR_672, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_701, eR_702, eR_703,
  eR_704, eR_705, eR_706, eR_707, eR_708, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735,
  eR_736, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_757, eR_758, eR_759,
  eR_760, eR_761, eR_762, eR_763, eR_764, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_776, eR_777, eR_779, eR_782, eR_783,
  eR_788, eR_789, eR_790, eR_791, eR_794, eR_795, eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_804, eR_805, eR_812, eR_813,
  eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_820, eR_821, eR_824, eR_825, eR_832, eR_833, eR_837, eR_838, eR_839, eR_846,
  eR_847, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_856, eR_857, eR_861, eR_862, eR_866, eR_867, eR_880, eR_882, eR_883,
  eR_888, eR_889, eR_894, eR_895, eR_896, eR_898, eR_900, eR_901, eR_906, eR_909, eR_911, eR_913, eR_915, eR_917, eR_919, eR_920,
  eR_921, eR_922, eR_923, eR_924, eR_925, eR_926, eR_933, eR_934, eR_935, eR_936, eR_938, eR_941, eR_944, eR_945, eR_947, eR_948,
  eR_950, eR_954, eR_955, eR_956, eR_957, eR_959, eR_960, eR_965, eR_966, eR_967, eR_969, eR_972, eR_975, eR_976, eR_977, eR_978,
  eR_980, eR_982, eR_983, eR_987, eR_991, eR_992, eR_993, eR_999, eR_1000, eR_1001, eR_1004, eR_1005, eR_1007, eR_1010, eR_1011, eR_1012,
  eR_1014, eR_1016, eR_1018, eR_1019, eR_1023]
theorem nbOKR_150 : nbR_150 = nbhd entsR eR_150 := by decide +kernel
theorem mkOKR_150 : mkEnt 32 1024 W rR_150 150 = eR_150 := by decide +kernel
theorem tR_150 : kTermA 4294967295 eR_150 nbR_150 = 118057203042872606367091626 := by decide +kernel


end RamseyCert
