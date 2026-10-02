import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_180 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_6, eB_8, eB_9, eB_10, eB_11, eB_14, eB_15, eB_18, eB_27, eB_30, eB_33, eB_36,
  eB_39, eB_42, eB_45, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_68,
  eB_69, eB_76, eB_77, eB_78, eB_79, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_99, eB_102, eB_103,
  eB_104, eB_108, eB_111, eB_114, eB_117, eB_120, eB_123, eB_124, eB_125, eB_127, eB_128, eB_130, eB_131, eB_140, eB_141, eB_143,
  eB_144, eB_146, eB_147, eB_148, eB_151, eB_154, eB_157, eB_160, eB_161, eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_180,
  eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_192, eB_193, eB_194, eB_195, eB_204, eB_205, eB_206, eB_207, eB_208,
  eB_209, eB_211, eB_212, eB_214, eB_217, eB_220, eB_223, eB_226, eB_227, eB_228, eB_230, eB_231, eB_233, eB_234, eB_236, eB_237,
  eB_239, eB_240, eB_242, eB_243, eB_245, eB_246, eB_247, eB_248, eB_249, eB_251, eB_252, eB_258, eB_259, eB_260, eB_261, eB_262,
  eB_263, eB_268, eB_269, eB_270, eB_271, eB_276, eB_280, eB_281, eB_282, eB_283, eB_286, eB_288, eB_289, eB_290, eB_291, eB_295,
  eB_296, eB_297, eB_298, eB_299, eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_319, eB_320, eB_321, eB_322,
  eB_323, eB_324, eB_325, eB_326, eB_327, eB_332, eB_333, eB_334, eB_335, eB_340, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350,
  eB_351, eB_352, eB_358, eB_361, eB_362, eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_381,
  eB_382, eB_383, eB_384, eB_385, eB_386, eB_387, eB_388, eB_389, eB_390, eB_392, eB_393, eB_395, eB_396, eB_397, eB_398, eB_400,
  eB_401, eB_402, eB_403, eB_407, eB_410, eB_413, eB_416, eB_419, eB_422, eB_431, eB_432, eB_433, eB_434, eB_435, eB_436, eB_438,
  eB_439, eB_441, eB_444, eB_447, eB_448, eB_452, eB_455, eB_459, eB_466, eB_467, eB_468, eB_469, eB_470, eB_471, eB_472, eB_473,
  eB_478, eB_479, eB_480, eB_481, eB_488, eB_489, eB_490, eB_491, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511,
  eB_512, eB_513, eB_514, eB_515, eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_541, eB_542, eB_543, eB_544,
  eB_549, eB_550, eB_551, eB_552, eB_553, eB_554, eB_555, eB_556, eB_558, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575,
  eB_576, eB_577, eB_578, eB_579, eB_580, eB_583, eB_585, eB_586, eB_587, eB_588, eB_591, eB_593, eB_594, eB_595, eB_596, eB_605,
  eB_606, eB_607, eB_608, eB_611, eB_614, eB_617, eB_620, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_649,
  eB_650, eB_651, eB_652, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_669, eB_670, eB_671, eB_672, eB_681,
  eB_682, eB_683, eB_684, eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707, eB_708, eB_713,
  eB_714, eB_715, eB_716, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_737, eB_738, eB_739, eB_740, eB_741,
  eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_764, eB_768, eB_769, eB_770, eB_771,
  eB_772, eB_773, eB_774, eB_775, eB_776, eB_777, eB_788, eB_789, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_796, eB_797,
  eB_812, eB_813, eB_814, eB_815, eB_816, eB_817, eB_820, eB_821, eB_822, eB_823, eB_832, eB_833, eB_836, eB_837, eB_838, eB_839,
  eB_840, eB_841, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_856, eB_857, eB_860, eB_861, eB_864, eB_865, eB_866, eB_867,
  eB_870, eB_871, eB_872, eB_873, eB_874, eB_875, eB_876, eB_877, eB_880, eB_881, eB_882, eB_883, eB_886, eB_887, eB_890, eB_891,
  eB_892, eB_893, eB_894, eB_897, eB_898, eB_900, eB_901, eB_902, eB_906, eB_908, eB_909, eB_912, eB_916, eB_917, eB_919, eB_920,
  eB_921, eB_926, eB_928, eB_929, eB_933, eB_934, eB_937, eB_938, eB_940, eB_941, eB_942, eB_943, eB_948, eB_950, eB_952, eB_953,
  eB_957, eB_959, eB_961, eB_963, eB_965, eB_966, eB_967, eB_968, eB_973, eB_974, eB_975, eB_978, eB_982, eB_984, eB_986, eB_987,
  eB_988, eB_990, eB_994, eB_995, eB_996, eB_997, eB_1002, eB_1003, eB_1005, eB_1010, eB_1013, eB_1014, eB_1015, eB_1017, eB_1021, eB_1022]
theorem nbOKB_180 : nbB_180 = nbhd entsB eB_180 := by decide +kernel
theorem mkOKB_180 : mkEnt 32 1024 W rB_180 180 = eB_180 := by decide +kernel
theorem tB_180 : kTermA 4294967295 eB_180 nbB_180 = 103729043328735358998956296 := by decide +kernel


end RamseyCert
