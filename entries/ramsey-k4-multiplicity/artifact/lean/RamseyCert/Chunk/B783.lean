import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_783 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_7, eB_8, eB_9, eB_10, eB_11, eB_13, eB_15, eB_19, eB_28, eB_31, eB_34, eB_37,
  eB_40, eB_43, eB_46, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_62, eB_63, eB_68, eB_69, eB_70,
  eB_71, eB_76, eB_77, eB_78, eB_79, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_97, eB_100, eB_104,
  eB_105, eB_107, eB_110, eB_113, eB_116, eB_119, eB_122, eB_124, eB_126, eB_127, eB_129, eB_130, eB_132, eB_139, eB_141, eB_142,
  eB_144, eB_145, eB_147, eB_149, eB_152, eB_155, eB_158, eB_160, eB_161, eB_162, eB_163, eB_172, eB_173, eB_174, eB_175, eB_176,
  eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187, eB_192, eB_193, eB_194, eB_195, eB_204, eB_205, eB_206, eB_207, eB_209,
  eB_210, eB_212, eB_213, eB_214, eB_216, eB_219, eB_222, eB_225, eB_227, eB_229, eB_230, eB_232, eB_233, eB_235, eB_236, eB_238,
  eB_239, eB_241, eB_242, eB_244, eB_245, eB_246, eB_247, eB_249, eB_250, eB_251, eB_252, eB_256, eB_259, eB_260, eB_261, eB_262,
  eB_263, eB_268, eB_272, eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_287, eB_288, eB_289, eB_290, eB_291, eB_292,
  eB_293, eB_294, eB_295, eB_300, eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319,
  eB_325, eB_328, eB_329, eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_340, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350,
  eB_351, eB_352, eB_357, eB_358, eB_359, eB_360, eB_366, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_381,
  eB_382, eB_383, eB_384, eB_385, eB_386, eB_387, eB_388, eB_389, eB_390, eB_391, eB_393, eB_394, eB_396, eB_397, eB_398, eB_399,
  eB_401, eB_403, eB_404, eB_406, eB_409, eB_412, eB_415, eB_418, eB_421, eB_431, eB_432, eB_433, eB_434, eB_435, eB_437, eB_438,
  eB_440, eB_442, eB_445, eB_448, eB_449, eB_451, eB_454, eB_460, eB_462, eB_463, eB_464, eB_465, eB_474, eB_475, eB_476, eB_477,
  eB_478, eB_479, eB_480, eB_481, eB_492, eB_493, eB_494, eB_495, eB_496, eB_497, eB_498, eB_499, eB_508, eB_509, eB_510, eB_511,
  eB_516, eB_517, eB_518, eB_519, eB_520, eB_521, eB_522, eB_523, eB_532, eB_533, eB_534, eB_535, eB_541, eB_542, eB_543, eB_544,
  eB_545, eB_546, eB_547, eB_548, eB_552, eB_557, eB_558, eB_559, eB_560, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571,
  eB_572, eB_574, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_591, eB_597, eB_598, eB_599, eB_600, eB_601,
  eB_602, eB_603, eB_604, eB_607, eB_610, eB_613, eB_616, eB_619, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640,
  eB_649, eB_650, eB_651, eB_652, eB_653, eB_654, eB_655, eB_656, eB_657, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675,
  eB_676, eB_677, eB_678, eB_679, eB_680, eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707,
  eB_708, eB_709, eB_710, eB_711, eB_712, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735,
  eB_736, eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_762, eB_768, eB_769,
  eB_770, eB_771, eB_774, eB_775, eB_776, eB_777, eB_780, eB_781, eB_782, eB_783, eB_786, eB_787, eB_788, eB_789, eB_790, eB_800,
  eB_801, eB_802, eB_803, eB_810, eB_811, eB_816, eB_817, eB_826, eB_827, eB_828, eB_829, eB_830, eB_831, eB_834, eB_835, eB_836,
  eB_837, eB_844, eB_845, eB_846, eB_847, eB_848, eB_849, eB_851, eB_852, eB_853, eB_854, eB_855, eB_856, eB_857, eB_858, eB_859,
  eB_860, eB_861, eB_868, eB_869, eB_870, eB_871, eB_878, eB_879, eB_886, eB_887, eB_888, eB_889, eB_892, eB_893, eB_897, eB_900,
  eB_901, eB_905, eB_906, eB_908, eB_912, eB_914, eB_916, eB_919, eB_922, eB_923, eB_924, eB_927, eB_929, eB_931, eB_933, eB_937,
  eB_940, eB_941, eB_944, eB_945, eB_946, eB_947, eB_952, eB_954, eB_955, eB_957, eB_959, eB_961, eB_962, eB_967, eB_968, eB_969,
  eB_971, eB_973, eB_974, eB_975, eB_977, eB_978, eB_981, eB_982, eB_983, eB_984, eB_986, eB_987, eB_990, eB_991, eB_992, eB_993,
  eB_994, eB_995, eB_997, eB_998, eB_1000, eB_1001, eB_1002, eB_1005, eB_1007, eB_1012, eB_1013, eB_1014, eB_1019]
theorem nbOKB_783 : nbB_783 = nbhd entsB eB_783 := by decide +kernel
theorem mkOKB_783 : mkEnt 32 1024 W rB_783 783 = eB_783 := by decide +kernel
theorem tB_783 : kTermA 4294967295 eB_783 nbB_783 = 96580260912316592285208984 := by decide +kernel


end RamseyCert
