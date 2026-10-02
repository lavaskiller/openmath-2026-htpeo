import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_202 : List Ent := [
  eR_8, eR_9, eR_11, eR_12, eR_13, eR_14, eR_15, eR_27, eR_28, eR_29, eR_30, eR_31, eR_32, eR_42, eR_43, eR_44,
  eR_45, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_72,
  eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83, eR_90, eR_91, eR_96, eR_97, eR_98, eR_99, eR_100, eR_101, eR_102,
  eR_103, eR_104, eR_105, eR_106, eR_107, eR_108, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_115, eR_116, eR_117, eR_118,
  eR_119, eR_120, eR_121, eR_122, eR_123, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_133, eR_134,
  eR_135, eR_136, eR_137, eR_138, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_148, eR_149, eR_150,
  eR_151, eR_152, eR_153, eR_154, eR_155, eR_156, eR_157, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174,
  eR_175, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190, eR_191, eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206,
  eR_207, eR_248, eR_249, eR_250, eR_251, eR_252, eR_255, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270, eR_271, eR_276,
  eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303, eR_308,
  eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335, eR_345,
  eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_377, eR_378, eR_380,
  eR_387, eR_388, eR_389, eR_390, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_397, eR_398, eR_399, eR_400, eR_401, eR_402,
  eR_403, eR_404, eR_405, eR_406, eR_407, eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416, eR_417, eR_418,
  eR_419, eR_420, eR_421, eR_422, eR_431, eR_432, eR_433, eR_434, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_447, eR_448,
  eR_449, eR_450, eR_451, eR_452, eR_453, eR_454, eR_455, eR_456, eR_466, eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477,
  eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502, eR_503, eR_508, eR_509,
  eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535, eR_536, eR_541,
  eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566, eR_567, eR_568, eR_573,
  eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_605,
  eR_606, eR_607, eR_608, eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_654, eR_655,
  eR_656, eR_661, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687, eR_688,
  eR_693, eR_694, eR_695, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_725, eR_726,
  eR_727, eR_728, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_757, eR_759,
  eR_760, eR_765, eR_766, eR_767, eR_770, eR_771, eR_776, eR_777, eR_782, eR_783, eR_785, eR_790, eR_791, eR_792, eR_793, eR_796,
  eR_797, eR_800, eR_801, eR_804, eR_805, eR_806, eR_807, eR_808, eR_810, eR_811, eR_812, eR_813, eR_816, eR_820, eR_821, eR_822,
  eR_823, eR_826, eR_827, eR_828, eR_829, eR_830, eR_831, eR_832, eR_833, eR_836, eR_837, eR_840, eR_852, eR_853, eR_856, eR_857,
  eR_858, eR_859, eR_862, eR_863, eR_864, eR_865, eR_868, eR_869, eR_874, eR_875, eR_880, eR_881, eR_884, eR_885, eR_888, eR_889,
  eR_896, eR_897, eR_899, eR_901, eR_904, eR_905, eR_909, eR_910, eR_913, eR_916, eR_918, eR_920, eR_921, eR_922, eR_924, eR_927,
  eR_928, eR_931, eR_933, eR_934, eR_940, eR_942, eR_943, eR_945, eR_947, eR_948, eR_951, eR_952, eR_953, eR_955, eR_959, eR_962,
  eR_963, eR_964, eR_965, eR_966, eR_968, eR_969, eR_970, eR_971, eR_972, eR_973, eR_975, eR_976, eR_978, eR_982, eR_983, eR_985,
  eR_987, eR_988, eR_989, eR_990, eR_992, eR_995, eR_1002, eR_1003, eR_1004, eR_1005, eR_1006, eR_1009, eR_1010, eR_1012, eR_1013, eR_1014,
  eR_1018, eR_1020, eR_1023]
theorem nbOKR_202 : nbR_202 = nbhd entsR eR_202 := by decide +kernel
theorem mkOKR_202 : mkEnt 32 1024 W rR_202 202 = eR_202 := by decide +kernel
theorem tR_202 : kTermA 4294967295 eR_202 nbR_202 = 122138838440183875136999424 := by decide +kernel


end RamseyCert
