import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_256 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_14, eB_16, eB_17, eB_18, eB_20, eB_21, eB_22,
  eB_23, eB_24, eB_25, eB_26, eB_27, eB_29, eB_30, eB_31, eB_32, eB_33, eB_34, eB_35, eB_36, eB_38, eB_39, eB_41,
  eB_42, eB_44, eB_45, eB_47, eB_48, eB_49, eB_50, eB_51, eB_52, eB_53, eB_54, eB_55, eB_64, eB_65, eB_66, eB_67,
  eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83,
  eB_84, eB_85, eB_86, eB_87, eB_97, eB_100, eB_104, eB_105, eB_107, eB_110, eB_113, eB_116, eB_119, eB_122, eB_124, eB_126,
  eB_127, eB_129, eB_130, eB_132, eB_136, eB_137, eB_138, eB_140, eB_143, eB_145, eB_146, eB_147, eB_148, eB_149, eB_150, eB_151,
  eB_153, eB_154, eB_156, eB_157, eB_159, eB_168, eB_169, eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_200, eB_201, eB_202,
  eB_203, eB_204, eB_205, eB_206, eB_207, eB_209, eB_210, eB_212, eB_213, eB_214, eB_216, eB_219, eB_222, eB_225, eB_227, eB_229,
  eB_230, eB_232, eB_233, eB_235, eB_236, eB_238, eB_239, eB_241, eB_242, eB_244, eB_245, eB_246, eB_247, eB_249, eB_250, eB_251,
  eB_252, eB_256, eB_268, eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289,
  eB_290, eB_291, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329,
  eB_330, eB_331, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_381, eB_382, eB_383, eB_384, eB_385, eB_387,
  eB_388, eB_389, eB_390, eB_391, eB_393, eB_394, eB_395, eB_396, eB_397, eB_398, eB_399, eB_400, eB_401, eB_402, eB_405, eB_407,
  eB_408, eB_410, eB_411, eB_412, eB_413, eB_414, eB_416, eB_417, eB_419, eB_420, eB_422, eB_435, eB_436, eB_437, eB_439, eB_442,
  eB_445, eB_447, eB_450, eB_452, eB_453, eB_454, eB_455, eB_456, eB_460, eB_462, eB_463, eB_464, eB_465, eB_466, eB_467, eB_468,
  eB_469, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_496, eB_497, eB_498, eB_499, eB_500,
  eB_501, eB_502, eB_503, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_536, eB_545, eB_546, eB_547, eB_548,
  eB_549, eB_550, eB_551, eB_552, eB_569, eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_585, eB_586, eB_587, eB_588,
  eB_589, eB_590, eB_591, eB_592, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_609, eB_611, eB_612, eB_614,
  eB_615, eB_616, eB_617, eB_618, eB_620, eB_621, eB_622, eB_623, eB_624, eB_625, eB_626, eB_627, eB_628, eB_637, eB_638, eB_639,
  eB_640, eB_641, eB_642, eB_643, eB_644, eB_653, eB_654, eB_655, eB_656, eB_657, eB_658, eB_659, eB_660, eB_677, eB_678, eB_679,
  eB_680, eB_681, eB_682, eB_683, eB_684, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_725, eB_726, eB_727,
  eB_728, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740, eB_749, eB_750, eB_751,
  eB_752, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_768, eB_769, eB_772,
  eB_773, eB_776, eB_777, eB_782, eB_783, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_800, eB_801, eB_802, eB_803, eB_810,
  eB_811, eB_820, eB_821, eB_832, eB_833, eB_834, eB_835, eB_836, eB_837, eB_838, eB_839, eB_842, eB_843, eB_844, eB_845, eB_846,
  eB_847, eB_848, eB_849, eB_852, eB_853, eB_858, eB_859, eB_860, eB_861, eB_868, eB_869, eB_870, eB_871, eB_874, eB_875, eB_878,
  eB_879, eB_882, eB_883, eB_890, eB_891, eB_892, eB_893, eB_894, eB_895, eB_897, eB_901, eB_903, eB_905, eB_907, eB_908, eB_909,
  eB_910, eB_913, eB_914, eB_916, eB_918, eB_919, eB_920, eB_921, eB_923, eB_925, eB_927, eB_928, eB_929, eB_931, eB_932, eB_934,
  eB_937, eB_938, eB_939, eB_942, eB_943, eB_944, eB_948, eB_951, eB_953, eB_956, eB_960, eB_963, eB_968, eB_974, eB_975, eB_976,
  eB_981, eB_982, eB_983, eB_984, eB_986, eB_989, eB_991, eB_992, eB_993, eB_997, eB_998, eB_999, eB_1000, eB_1003, eB_1006, eB_1009,
  eB_1010, eB_1011, eB_1014, eB_1016, eB_1018, eB_1019, eB_1020, eB_1022, eB_1023]
theorem nbOKB_256 : nbB_256 = nbhd entsB eB_256 := by decide +kernel
theorem mkOKB_256 : mkEnt 32 1024 W rB_256 256 = eB_256 := by decide +kernel
theorem tB_256 : kTermA 4294967295 eB_256 nbB_256 = 119950956475075078898540832 := by decide +kernel


end RamseyCert
