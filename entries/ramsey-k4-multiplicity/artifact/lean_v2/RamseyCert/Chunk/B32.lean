import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_32 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_15, eB_17, eB_18, eB_19,
  eB_22, eB_24, eB_26, eB_27, eB_28, eB_32, eB_33, eB_34, eB_36, eB_37, eB_39, eB_40, eB_42, eB_43, eB_47, eB_48,
  eB_49, eB_50, eB_51, eB_52, eB_53, eB_54, eB_55, eB_72, eB_73, eB_74, eB_75, eB_76, eB_77, eB_78, eB_79, eB_96,
  eB_98, eB_100, eB_102, eB_103, eB_105, eB_107, eB_108, eB_109, eB_112, eB_113, eB_115, eB_116, eB_117, eB_118, eB_122, eB_123,
  eB_125, eB_126, eB_128, eB_129, eB_130, eB_131, eB_132, eB_133, eB_134, eB_135, eB_141, eB_144, eB_147, eB_148, eB_149, eB_153,
  eB_154, eB_155, eB_159, eB_160, eB_161, eB_162, eB_163, eB_164, eB_165, eB_166, eB_167, eB_184, eB_185, eB_186, eB_187, eB_188,
  eB_189, eB_190, eB_191, eB_209, eB_211, eB_213, eB_214, eB_215, eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_225, eB_226,
  eB_227, eB_231, eB_232, eB_234, eB_235, eB_236, eB_239, eB_241, eB_243, eB_244, eB_245, eB_246, eB_247, eB_248, eB_250, eB_252,
  eB_253, eB_255, eB_256, eB_258, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295,
  eB_296, eB_297, eB_298, eB_299, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_332, eB_333, eB_334, eB_335,
  eB_336, eB_337, eB_338, eB_339, eB_349, eB_350, eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360,
  eB_361, eB_362, eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_381, eB_382, eB_383, eB_384,
  eB_387, eB_389, eB_390, eB_391, eB_392, eB_394, eB_395, eB_396, eB_397, eB_399, eB_400, eB_402, eB_404, eB_405, eB_406, eB_407,
  eB_408, eB_412, eB_413, eB_414, eB_418, eB_419, eB_420, eB_423, eB_425, eB_426, eB_436, eB_437, eB_439, eB_440, eB_441, eB_442,
  eB_444, eB_445, eB_447, eB_449, eB_450, eB_451, eB_452, eB_453, eB_456, eB_457, eB_459, eB_460, eB_461, eB_478, eB_479, eB_480,
  eB_481, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_504, eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_512,
  eB_513, eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_536,
  eB_545, eB_546, eB_547, eB_548, eB_549, eB_550, eB_551, eB_552, eB_553, eB_554, eB_555, eB_556, eB_557, eB_558, eB_559, eB_560,
  eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_593, eB_594, eB_595, eB_596, eB_597, eB_598, eB_599, eB_600,
  eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_609, eB_612, eB_615, eB_618, eB_621, eB_623, eB_626, eB_628,
  eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652,
  eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692, eB_701, eB_702, eB_703, eB_704, eB_705, eB_706, eB_707, eB_708,
  eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740,
  eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_765, eB_766, eB_767, eB_776, eB_777, eB_786, eB_787, eB_788,
  eB_789, eB_792, eB_793, eB_796, eB_797, eB_798, eB_799, eB_800, eB_801, eB_806, eB_808, eB_809, eB_810, eB_811, eB_814, eB_815,
  eB_818, eB_819, eB_822, eB_823, eB_826, eB_827, eB_832, eB_833, eB_834, eB_840, eB_841, eB_844, eB_845, eB_848, eB_849, eB_856,
  eB_857, eB_860, eB_861, eB_862, eB_863, eB_864, eB_865, eB_866, eB_867, eB_868, eB_869, eB_870, eB_871, eB_872, eB_873, eB_878,
  eB_879, eB_880, eB_881, eB_884, eB_885, eB_888, eB_889, eB_892, eB_893, eB_896, eB_898, eB_900, eB_903, eB_904, eB_905, eB_907,
  eB_909, eB_910, eB_912, eB_915, eB_916, eB_918, eB_919, eB_920, eB_925, eB_927, eB_929, eB_931, eB_936, eB_937, eB_938, eB_941,
  eB_942, eB_944, eB_945, eB_946, eB_947, eB_948, eB_950, eB_951, eB_955, eB_956, eB_960, eB_961, eB_970, eB_972, eB_973, eB_974,
  eB_975, eB_976, eB_978, eB_981, eB_984, eB_985, eB_986, eB_989, eB_992, eB_994, eB_995, eB_996, eB_997, eB_1000, eB_1001, eB_1003,
  eB_1004, eB_1005, eB_1008, eB_1009, eB_1010, eB_1012, eB_1013, eB_1015, eB_1018, eB_1019, eB_1021, eB_1022]
theorem nbOKB_32 : nbB_32 = nbhd entsB eB_32 := by decide +kernel
theorem mkOKB_32 : mkEnt 32 1024 W rB_32 32 = eB_32 := by decide +kernel
theorem tB_32 : kTermA 4294967295 eB_32 nbB_32 = 92442558641899564901576766 := by decide +kernel


end RamseyCert
