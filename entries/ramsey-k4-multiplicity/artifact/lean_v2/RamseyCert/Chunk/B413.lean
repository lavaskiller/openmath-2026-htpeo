import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_413 : List Ent := [
  eB_12, eB_14, eB_15, eB_16, eB_18, eB_21, eB_23, eB_25, eB_27, eB_31, eB_32, eB_33, eB_36, eB_39, eB_42, eB_46,
  eB_47, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75, eB_76, eB_77, eB_78,
  eB_79, eB_96, eB_99, eB_100, eB_101, eB_103, eB_104, eB_106, eB_107, eB_111, eB_113, eB_114, eB_115, eB_116, eB_120, eB_121,
  eB_122, eB_124, eB_125, eB_126, eB_127, eB_128, eB_130, eB_131, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_140, eB_141,
  eB_143, eB_144, eB_146, eB_147, eB_148, eB_151, eB_152, eB_153, eB_154, eB_157, eB_158, eB_159, eB_176, eB_177, eB_178, eB_179,
  eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_208, eB_210, eB_211, eB_212,
  eB_214, eB_215, eB_216, eB_218, eB_219, eB_221, eB_222, eB_224, eB_225, eB_226, eB_229, eB_230, eB_231, eB_232, eB_233, eB_234,
  eB_236, eB_238, eB_241, eB_242, eB_243, eB_245, eB_246, eB_247, eB_248, eB_249, eB_252, eB_253, eB_255, eB_256, eB_257, eB_259,
  eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283,
  eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299,
  eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339,
  eB_340, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363,
  eB_364, eB_381, eB_382, eB_383, eB_384, eB_385, eB_386, eB_387, eB_388, eB_389, eB_392, eB_393, eB_394, eB_395, eB_396, eB_397,
  eB_400, eB_401, eB_404, eB_407, eB_408, eB_409, eB_413, eB_414, eB_415, eB_419, eB_420, eB_421, eB_423, eB_424, eB_425, eB_437,
  eB_440, eB_441, eB_442, eB_443, eB_445, eB_446, eB_449, eB_452, eB_453, eB_454, eB_457, eB_460, eB_461, eB_462, eB_463, eB_464,
  eB_465, eB_466, eB_467, eB_468, eB_469, eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495, eB_520, eB_521, eB_522,
  eB_523, eB_524, eB_525, eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_553, eB_554, eB_555,
  eB_556, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571,
  eB_572, eB_573, eB_574, eB_575, eB_576, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_609, eB_610, eB_612,
  eB_613, eB_615, eB_616, eB_618, eB_619, eB_622, eB_624, eB_625, eB_627, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651,
  eB_652, eB_653, eB_654, eB_655, eB_656, eB_657, eB_658, eB_659, eB_660, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674, eB_675,
  eB_676, eB_693, eB_694, eB_695, eB_696, eB_697, eB_698, eB_699, eB_700, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715,
  eB_716, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755,
  eB_756, eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_770, eB_771, eB_772, eB_773,
  eB_774, eB_775, eB_778, eB_779, eB_784, eB_785, eB_786, eB_787, eB_796, eB_797, eB_800, eB_801, eB_806, eB_807, eB_808, eB_809,
  eB_812, eB_813, eB_818, eB_819, eB_820, eB_821, eB_822, eB_823, eB_826, eB_827, eB_828, eB_829, eB_830, eB_831, eB_832, eB_833,
  eB_834, eB_835, eB_836, eB_837, eB_840, eB_841, eB_842, eB_843, eB_844, eB_845, eB_852, eB_853, eB_854, eB_855, eB_856, eB_857,
  eB_858, eB_859, eB_862, eB_864, eB_865, eB_866, eB_867, eB_869, eB_870, eB_871, eB_874, eB_875, eB_878, eB_879, eB_881, eB_884,
  eB_885, eB_890, eB_891, eB_894, eB_895, eB_897, eB_898, eB_899, eB_902, eB_906, eB_907, eB_909, eB_912, eB_913, eB_914, eB_915,
  eB_918, eB_919, eB_921, eB_923, eB_926, eB_927, eB_928, eB_929, eB_932, eB_933, eB_934, eB_935, eB_936, eB_939, eB_940, eB_941,
  eB_942, eB_943, eB_944, eB_945, eB_948, eB_950, eB_954, eB_958, eB_965, eB_971, eB_974, eB_975, eB_976, eB_977, eB_980, eB_981,
  eB_985, eB_986, eB_991, eB_993, eB_998, eB_1001, eB_1003, eB_1004, eB_1005, eB_1007, eB_1012, eB_1013, eB_1014, eB_1018, eB_1021, eB_1022]
theorem nbOKB_413 : nbB_413 = nbhd entsB eB_413 := by decide +kernel
theorem mkOKB_413 : mkEnt 32 1024 W rB_413 413 = eB_413 := by decide +kernel
theorem tB_413 : kTermA 4294967295 eB_413 nbB_413 = 118947036913892918714958080 := by decide +kernel


end RamseyCert
