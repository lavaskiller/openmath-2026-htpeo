import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_483 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_13, eR_14, eR_16, eR_17, eR_20, eR_21, eR_22, eR_23,
  eR_24, eR_25, eR_26, eR_27, eR_28, eR_30, eR_31, eR_35, eR_38, eR_41, eR_42, eR_43, eR_45, eR_46, eR_52, eR_53,
  eR_54, eR_55, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85,
  eR_86, eR_87, eR_92, eR_93, eR_94, eR_95, eR_97, eR_99, eR_100, eR_102, eR_103, eR_105, eR_107, eR_108, eR_110, eR_111,
  eR_113, eR_114, eR_116, eR_117, eR_119, eR_120, eR_122, eR_123, eR_125, eR_126, eR_128, eR_129, eR_131, eR_132, eR_139, eR_140,
  eR_142, eR_143, eR_145, eR_146, eR_148, eR_149, eR_151, eR_152, eR_154, eR_155, eR_157, eR_158, eR_160, eR_161, eR_162, eR_163,
  eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_192, eR_193, eR_194, eR_195,
  eR_200, eR_201, eR_202, eR_203, eR_209, eR_212, eR_214, eR_215, eR_218, eR_221, eR_224, eR_227, eR_230, eR_233, eR_236, eR_239,
  eR_242, eR_245, eR_246, eR_247, eR_248, eR_250, eR_253, eR_254, eR_257, eR_259, eR_264, eR_265, eR_267, eR_268, eR_269, eR_270,
  eR_271, eR_276, eR_277, eR_278, eR_279, eR_288, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303,
  eR_312, eR_313, eR_315, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_336, eR_338, eR_339, eR_340, eR_341,
  eR_342, eR_343, eR_344, eR_349, eR_350, eR_351, eR_352, eR_361, eR_364, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376,
  eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_391, eR_392, eR_394, eR_395, eR_399, eR_400, eR_402, eR_404, eR_406, eR_407,
  eR_409, eR_410, eR_412, eR_413, eR_415, eR_416, eR_418, eR_419, eR_421, eR_422, eR_423, eR_424, eR_425, eR_426, eR_427, eR_428,
  eR_429, eR_430, eR_436, eR_437, eR_439, eR_440, eR_443, eR_446, eR_447, eR_449, eR_451, eR_452, eR_454, eR_455, eR_457, eR_458,
  eR_461, eR_466, eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_492, eR_493, eR_494,
  eR_495, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526,
  eR_527, eR_528, eR_529, eR_530, eR_531, eR_538, eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560,
  eR_561, eR_562, eR_563, eR_564, eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_597,
  eR_598, eR_599, eR_600, eR_605, eR_606, eR_607, eR_608, eR_609, eR_612, eR_615, eR_618, eR_621, eR_622, eR_623, eR_624, eR_625,
  eR_626, eR_627, eR_628, eR_629, eR_630, eR_631, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654,
  eR_656, eR_661, eR_662, eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_690, eR_692, eR_697, eR_698,
  eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_729, eR_730,
  eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762,
  eR_763, eR_764, eR_768, eR_769, eR_774, eR_775, eR_778, eR_779, eR_782, eR_783, eR_788, eR_789, eR_790, eR_791, eR_792, eR_793,
  eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_810, eR_811, eR_812, eR_813, eR_818, eR_819, eR_820, eR_821, eR_822, eR_823,
  eR_824, eR_825, eR_826, eR_827, eR_828, eR_829, eR_830, eR_831, eR_832, eR_833, eR_840, eR_841, eR_842, eR_843, eR_854, eR_855,
  eR_858, eR_859, eR_860, eR_861, eR_864, eR_865, eR_868, eR_869, eR_870, eR_871, eR_874, eR_875, eR_880, eR_881, eR_886, eR_887,
  eR_888, eR_889, eR_892, eR_893, eR_894, eR_895, eR_900, eR_903, eR_905, eR_906, eR_907, eR_908, eR_909, eR_911, eR_912, eR_915,
  eR_919, eR_920, eR_921, eR_922, eR_923, eR_924, eR_925, eR_928, eR_929, eR_930, eR_931, eR_932, eR_933, eR_934, eR_935, eR_937,
  eR_939, eR_941, eR_942, eR_943, eR_945, eR_947, eR_948, eR_949, eR_953, eR_955, eR_956, eR_958, eR_960, eR_961, eR_962, eR_963,
  eR_965, eR_966, eR_967, eR_969, eR_971, eR_974, eR_979, eR_980, eR_983, eR_984, eR_986, eR_988, eR_990, eR_992, eR_994, eR_995,
  eR_999, eR_1003, eR_1008, eR_1010, eR_1011, eR_1012, eR_1016]
theorem nbOKR_483 : nbR_483 = nbhd entsR eR_483 := by decide +kernel
theorem mkOKR_483 : mkEnt 32 1024 W rR_483 483 = eR_483 := by decide +kernel
theorem tR_483 : kTermA 4294967295 eR_483 nbR_483 = 78728768710874218306699260 := by decide +kernel


end RamseyCert
