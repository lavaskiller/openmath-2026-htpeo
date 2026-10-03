import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_529 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_14, eR_16, eR_18, eR_19, eR_21, eR_23,
  eR_25, eR_27, eR_28, eR_32, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_42, eR_43, eR_47, eR_52, eR_53, eR_54,
  eR_55, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_84, eR_85, eR_86,
  eR_87, eR_88, eR_89, eR_90, eR_91, eR_96, eR_97, eR_99, eR_101, eR_103, eR_105, eR_106, eR_110, eR_111, eR_113, eR_114,
  eR_115, eR_119, eR_120, eR_121, eR_125, eR_126, eR_128, eR_129, eR_131, eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138,
  eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_148, eR_149, eR_153, eR_154, eR_155, eR_159, eR_160, eR_161, eR_162, eR_163,
  eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195,
  eR_204, eR_205, eR_206, eR_207, eR_209, eR_211, eR_213, eR_215, eR_218, eR_221, eR_224, eR_227, eR_231, eR_232, eR_234, eR_235,
  eR_236, eR_239, eR_243, eR_244, eR_249, eR_252, eR_254, eR_256, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273,
  eR_274, eR_275, eR_280, eR_281, eR_282, eR_283, eR_284, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306,
  eR_307, eR_309, eR_310, eR_311, eR_316, eR_318, eR_319, eR_324, eR_326, eR_327, eR_336, eR_337, eR_338, eR_339, eR_340, eR_345,
  eR_346, eR_347, eR_348, eR_349, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374,
  eR_375, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_389, eR_393, eR_396, eR_397, eR_401, eR_402, eR_404, eR_405,
  eR_409, eR_410, eR_411, eR_415, eR_416, eR_417, eR_421, eR_422, eR_424, eR_426, eR_427, eR_428, eR_429, eR_430, eR_436, eR_437,
  eR_439, eR_440, eR_441, eR_442, eR_444, eR_445, eR_447, eR_449, eR_450, eR_454, eR_455, eR_456, eR_458, eR_459, eR_460, eR_462,
  eR_463, eR_464, eR_465, eR_470, eR_471, eR_472, eR_473, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494,
  eR_495, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522,
  eR_523, eR_532, eR_533, eR_534, eR_535, eR_536, eR_537, eR_538, eR_539, eR_540, eR_549, eR_551, eR_552, eR_557, eR_558, eR_559,
  eR_565, eR_566, eR_568, eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_589, eR_590, eR_591, eR_592, eR_593,
  eR_594, eR_595, eR_596, eR_601, eR_602, eR_603, eR_604, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_621,
  eR_623, eR_626, eR_628, eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_650, eR_651, eR_652, eR_653, eR_654,
  eR_655, eR_656, eR_661, eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686,
  eR_687, eR_688, eR_697, eR_698, eR_699, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719,
  eR_720, eR_729, eR_730, eR_731, eR_732, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_750, eR_751, eR_752,
  eR_757, eR_758, eR_759, eR_760, eR_782, eR_783, eR_784, eR_785, eR_788, eR_789, eR_792, eR_793, eR_798, eR_799, eR_806, eR_807,
  eR_810, eR_811, eR_812, eR_813, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_820, eR_821, eR_822, eR_823, eR_824, eR_825,
  eR_826, eR_827, eR_828, eR_829, eR_830, eR_831, eR_832, eR_833, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841, eR_844, eR_845,
  eR_846, eR_847, eR_852, eR_853, eR_854, eR_855, eR_856, eR_857, eR_858, eR_859, eR_860, eR_861, eR_864, eR_865, eR_866, eR_867,
  eR_870, eR_871, eR_872, eR_873, eR_882, eR_883, eR_886, eR_887, eR_888, eR_889, eR_898, eR_901, eR_905, eR_906, eR_908, eR_910,
  eR_912, eR_913, eR_914, eR_916, eR_917, eR_921, eR_922, eR_923, eR_925, eR_926, eR_927, eR_930, eR_931, eR_932, eR_935, eR_937,
  eR_938, eR_940, eR_944, eR_945, eR_946, eR_951, eR_953, eR_956, eR_963, eR_966, eR_967, eR_969, eR_970, eR_972, eR_975, eR_976,
  eR_977, eR_979, eR_980, eR_981, eR_984, eR_985, eR_988, eR_989, eR_990, eR_991, eR_994, eR_996, eR_999, eR_1000, eR_1001, eR_1002,
  eR_1004, eR_1007, eR_1008, eR_1010, eR_1017, eR_1018, eR_1019, eR_1022]
theorem nbOKR_529 : nbR_529 = nbhd entsR eR_529 := by decide +kernel
theorem mkOKR_529 : mkEnt 32 1024 W rR_529 529 = eR_529 := by decide +kernel
theorem tR_529 : kTermA 4294967295 eR_529 nbR_529 = 120606023714218663583929440 := by decide +kernel


end RamseyCert
