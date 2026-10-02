import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_440 : List Ent := [
  eB_13, eB_14, eB_15, eB_19, eB_20, eB_28, eB_29, eB_31, eB_32, eB_34, eB_35, eB_37, eB_38, eB_40, eB_41, eB_43,
  eB_44, eB_46, eB_47, eB_48, eB_49, eB_50, eB_51, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_60,
  eB_61, eB_62, eB_63, eB_97, eB_98, eB_100, eB_101, eB_103, eB_104, eB_106, eB_107, eB_109, eB_110, eB_112, eB_113, eB_114,
  eB_115, eB_116, eB_118, eB_119, eB_121, eB_122, eB_124, eB_125, eB_127, eB_128, eB_130, eB_131, eB_132, eB_133, eB_139, eB_140,
  eB_141, eB_143, eB_144, eB_146, eB_147, eB_149, eB_150, eB_152, eB_153, eB_155, eB_156, eB_158, eB_159, eB_160, eB_161, eB_162,
  eB_163, eB_164, eB_165, eB_166, eB_167, eB_168, eB_169, eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_208, eB_209, eB_210,
  eB_211, eB_212, eB_215, eB_216, eB_218, eB_219, eB_221, eB_222, eB_224, eB_225, eB_226, eB_227, eB_228, eB_230, eB_231, eB_233,
  eB_234, eB_236, eB_237, eB_239, eB_240, eB_242, eB_243, eB_244, eB_247, eB_248, eB_249, eB_250, eB_251, eB_252, eB_253, eB_254,
  eB_255, eB_258, eB_259, eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_288,
  eB_289, eB_290, eB_291, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_312,
  eB_313, eB_314, eB_315, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_336,
  eB_337, eB_338, eB_339, eB_340, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376,
  eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_385, eB_386, eB_387, eB_388, eB_389, eB_390, eB_391, eB_394,
  eB_397, eB_398, eB_399, eB_404, eB_407, eB_410, eB_413, eB_416, eB_419, eB_422, eB_423, eB_424, eB_425, eB_426, eB_427, eB_428,
  eB_429, eB_430, eB_431, eB_432, eB_433, eB_434, eB_437, eB_440, eB_441, eB_444, eB_449, eB_452, eB_455, eB_456, eB_457, eB_458,
  eB_459, eB_461, eB_462, eB_463, eB_464, eB_465, eB_466, eB_467, eB_468, eB_469, eB_486, eB_487, eB_488, eB_489, eB_490, eB_491,
  eB_492, eB_493, eB_494, eB_495, eB_512, eB_513, eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_536, eB_553, eB_554, eB_555,
  eB_556, eB_557, eB_558, eB_559, eB_560, eB_577, eB_578, eB_579, eB_580, eB_581, eB_582, eB_583, eB_584, eB_601, eB_602, eB_603,
  eB_604, eB_605, eB_606, eB_607, eB_608, eB_611, eB_614, eB_617, eB_620, eB_621, eB_622, eB_623, eB_624, eB_625, eB_626, eB_627,
  eB_628, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_641, eB_642, eB_643,
  eB_644, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674, eB_675,
  eB_676, eB_693, eB_694, eB_695, eB_696, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_705, eB_706, eB_707,
  eB_708, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739,
  eB_740, eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_782, eB_783, eB_794, eB_795,
  eB_800, eB_801, eB_804, eB_805, eB_806, eB_807, eB_811, eB_814, eB_815, eB_818, eB_819, eB_820, eB_821, eB_822, eB_823, eB_824,
  eB_825, eB_826, eB_827, eB_830, eB_831, eB_838, eB_839, eB_844, eB_845, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_858,
  eB_859, eB_860, eB_861, eB_862, eB_863, eB_864, eB_868, eB_869, eB_870, eB_871, eB_872, eB_873, eB_878, eB_879, eB_880, eB_884,
  eB_885, eB_888, eB_889, eB_890, eB_891, eB_894, eB_895, eB_898, eB_899, eB_900, eB_902, eB_904, eB_905, eB_906, eB_909, eB_915,
  eB_920, eB_922, eB_925, eB_926, eB_927, eB_929, eB_930, eB_931, eB_933, eB_934, eB_938, eB_939, eB_942, eB_943, eB_945, eB_946,
  eB_947, eB_949, eB_950, eB_951, eB_953, eB_957, eB_959, eB_962, eB_965, eB_966, eB_967, eB_968, eB_969, eB_971, eB_972, eB_973,
  eB_974, eB_975, eB_976, eB_980, eB_981, eB_982, eB_984, eB_986, eB_991, eB_992, eB_994, eB_997, eB_998, eB_999, eB_1000, eB_1002,
  eB_1005, eB_1007, eB_1008, eB_1009, eB_1013, eB_1014, eB_1015, eB_1016, eB_1017, eB_1019, eB_1020]
theorem nbOKB_440 : nbB_440 = nbhd entsB eB_440 := by decide +kernel
theorem mkOKB_440 : mkEnt 32 1024 W rB_440 440 = eB_440 := by decide +kernel
theorem tB_440 : kTermA 4294967295 eB_440 nbB_440 = 94710434951293306333457940 := by decide +kernel


end RamseyCert
