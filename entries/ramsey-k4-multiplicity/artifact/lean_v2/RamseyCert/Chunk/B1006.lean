import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_1006 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_12, eB_17, eB_22, eB_24, eB_26, eB_27, eB_28, eB_29,
  eB_42, eB_43, eB_44, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_76,
  eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_100, eB_101, eB_102, eB_103, eB_104,
  eB_105, eB_106, eB_107, eB_108, eB_115, eB_116, eB_117, eB_121, eB_122, eB_123, eB_124, eB_125, eB_126, eB_127, eB_128, eB_129,
  eB_130, eB_131, eB_132, eB_136, eB_137, eB_138, eB_148, eB_149, eB_150, eB_154, eB_155, eB_156, eB_160, eB_161, eB_162, eB_163,
  eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187, eB_192, eB_194, eB_196, eB_197,
  eB_198, eB_199, eB_204, eB_205, eB_206, eB_207, eB_208, eB_209, eB_210, eB_214, eB_227, eB_228, eB_229, eB_236, eB_237, eB_238,
  eB_239, eB_240, eB_241, eB_245, eB_246, eB_247, eB_252, eB_254, eB_255, eB_256, eB_257, eB_258, eB_259, eB_260, eB_261, eB_262,
  eB_263, eB_266, eB_272, eB_273, eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293,
  eB_294, eB_295, eB_296, eB_298, eB_300, eB_301, eB_302, eB_303, eB_306, eB_308, eB_309, eB_310, eB_311, eB_315, eB_320, eB_321,
  eB_322, eB_323, eB_328, eB_329, eB_330, eB_331, eB_336, eB_337, eB_338, eB_339, eB_340, eB_345, eB_346, eB_347, eB_348, eB_349,
  eB_350, eB_351, eB_352, eB_356, eB_361, eB_362, eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380,
  eB_385, eB_386, eB_387, eB_389, eB_397, eB_408, eB_409, eB_410, eB_414, eB_415, eB_416, eB_420, eB_421, eB_422, eB_424, eB_426,
  eB_427, eB_428, eB_429, eB_430, eB_441, eB_442, eB_443, eB_444, eB_445, eB_446, eB_453, eB_454, eB_455, eB_456, eB_458, eB_459,
  eB_460, eB_461, eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487,
  eB_492, eB_493, eB_494, eB_495, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515,
  eB_520, eB_521, eB_522, eB_523, eB_528, eB_529, eB_530, eB_531, eB_536, eB_537, eB_538, eB_539, eB_540, eB_545, eB_546, eB_547,
  eB_548, eB_553, eB_554, eB_555, eB_556, eB_564, eB_565, eB_566, eB_567, eB_568, eB_572, eB_573, eB_574, eB_575, eB_576, eB_578,
  eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604,
  eB_622, eB_624, eB_625, eB_627, eB_631, eB_633, eB_634, eB_635, eB_636, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646, eB_647,
  eB_648, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_669, eB_670, eB_671, eB_672, eB_677, eB_678, eB_679,
  eB_680, eB_685, eB_686, eB_687, eB_688, eB_694, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_709, eB_710,
  eB_711, eB_712, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_737, eB_738, eB_739, eB_740, eB_745, eB_746,
  eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_760, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_768, eB_769,
  eB_770, eB_771, eB_776, eB_777, eB_778, eB_779, eB_784, eB_785, eB_788, eB_789, eB_794, eB_795, eB_800, eB_801, eB_804, eB_805,
  eB_806, eB_807, eB_808, eB_809, eB_810, eB_811, eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_822, eB_823, eB_824, eB_825,
  eB_828, eB_829, eB_830, eB_831, eB_832, eB_833, eB_834, eB_835, eB_840, eB_841, eB_842, eB_843, eB_844, eB_845, eB_846, eB_847,
  eB_848, eB_849, eB_850, eB_851, eB_852, eB_854, eB_855, eB_856, eB_857, eB_858, eB_859, eB_860, eB_861, eB_872, eB_873, eB_874,
  eB_875, eB_876, eB_877, eB_880, eB_881, eB_884, eB_885, eB_886, eB_888, eB_889, eB_894, eB_895, eB_899, eB_901, eB_903, eB_905,
  eB_906, eB_910, eB_913, eB_916, eB_918, eB_919, eB_920, eB_923, eB_924, eB_926, eB_929, eB_930, eB_934, eB_937, eB_938, eB_939,
  eB_941, eB_944, eB_950, eB_951, eB_953, eB_954, eB_958, eB_960, eB_962, eB_963, eB_964, eB_965, eB_966, eB_970, eB_972, eB_973,
  eB_975, eB_978, eB_979, eB_981, eB_983, eB_984, eB_986, eB_988, eB_993, eB_994, eB_996, eB_998, eB_999, eB_1001, eB_1002, eB_1006,
  eB_1008, eB_1012, eB_1014, eB_1015, eB_1020]
theorem nbOKB_1006 : nbB_1006 = nbhd entsB eB_1006 := by decide +kernel
theorem mkOKB_1006 : mkEnt 32 1024 W rB_1006 1006 = eB_1006 := by decide +kernel
theorem tB_1006 : kTermA 4294967295 eB_1006 nbB_1006 = 82019088878294099201275900 := by decide +kernel


end RamseyCert
