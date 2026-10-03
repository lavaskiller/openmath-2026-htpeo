import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_455 : List Ent := [
  eB_12, eB_14, eB_15, eB_17, eB_18, eB_22, eB_24, eB_26, eB_27, eB_28, eB_29, eB_30, eB_33, eB_36, eB_39, eB_43,
  eB_44, eB_45, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_80, eB_81, eB_82, eB_83, eB_84, eB_85,
  eB_86, eB_87, eB_96, eB_97, eB_98, eB_102, eB_103, eB_104, eB_108, eB_109, eB_110, eB_112, eB_113, eB_117, eB_118, eB_119,
  eB_120, eB_121, eB_122, eB_123, eB_124, eB_125, eB_126, eB_127, eB_128, eB_130, eB_131, eB_133, eB_134, eB_135, eB_136, eB_137,
  eB_138, eB_140, eB_141, eB_143, eB_144, eB_146, eB_147, eB_149, eB_150, eB_151, eB_154, eB_155, eB_156, eB_157, eB_176, eB_177,
  eB_178, eB_179, eB_180, eB_181, eB_182, eB_183, eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_208, eB_209,
  eB_210, eB_213, eB_214, eB_215, eB_216, eB_218, eB_219, eB_221, eB_222, eB_224, eB_225, eB_226, eB_227, eB_228, eB_230, eB_232,
  eB_235, eB_236, eB_237, eB_239, eB_240, eB_243, eB_244, eB_245, eB_246, eB_247, eB_248, eB_249, eB_251, eB_254, eB_255, eB_256,
  eB_257, eB_258, eB_259, eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_276, eB_277, eB_278, eB_279, eB_280,
  eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_300, eB_301, eB_302, eB_303, eB_304,
  eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_320,
  eB_321, eB_322, eB_323, eB_340, eB_349, eB_350, eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360,
  eB_361, eB_362, eB_363, eB_364, eB_381, eB_382, eB_383, eB_384, eB_385, eB_386, eB_388, eB_390, eB_392, eB_393, eB_394, eB_395,
  eB_396, eB_397, eB_398, eB_399, eB_400, eB_401, eB_404, eB_405, eB_406, eB_410, eB_411, eB_412, eB_416, eB_417, eB_418, eB_422,
  eB_424, eB_426, eB_437, eB_440, eB_442, eB_443, eB_445, eB_446, eB_449, eB_450, eB_451, eB_455, eB_458, eB_460, eB_461, eB_462,
  eB_463, eB_464, eB_465, eB_466, eB_467, eB_468, eB_469, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503, eB_504,
  eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_537,
  eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_549, eB_550, eB_551, eB_552, eB_577,
  eB_578, eB_579, eB_580, eB_581, eB_582, eB_583, eB_584, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_609,
  eB_610, eB_612, eB_613, eB_615, eB_616, eB_618, eB_619, eB_621, eB_623, eB_626, eB_628, eB_645, eB_646, eB_647, eB_648, eB_649,
  eB_650, eB_651, eB_652, eB_653, eB_654, eB_655, eB_656, eB_657, eB_658, eB_659, eB_660, eB_669, eB_670, eB_671, eB_672, eB_673,
  eB_674, eB_675, eB_676, eB_701, eB_702, eB_703, eB_704, eB_705, eB_706, eB_707, eB_708, eB_717, eB_718, eB_719, eB_720, eB_721,
  eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_737,
  eB_738, eB_739, eB_740, eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_770, eB_771,
  eB_772, eB_773, eB_776, eB_777, eB_778, eB_779, eB_780, eB_781, eB_786, eB_787, eB_788, eB_789, eB_798, eB_799, eB_802, eB_803,
  eB_808, eB_809, eB_812, eB_813, eB_814, eB_815, eB_820, eB_821, eB_822, eB_823, eB_826, eB_827, eB_833, eB_836, eB_837, eB_840,
  eB_841, eB_844, eB_845, eB_848, eB_849, eB_852, eB_853, eB_860, eB_861, eB_862, eB_863, eB_870, eB_871, eB_876, eB_877, eB_878,
  eB_879, eB_880, eB_881, eB_884, eB_885, eB_886, eB_887, eB_888, eB_889, eB_894, eB_895, eB_896, eB_900, eB_906, eB_907, eB_908,
  eB_912, eB_913, eB_915, eB_920, eB_921, eB_923, eB_925, eB_926, eB_927, eB_928, eB_929, eB_930, eB_931, eB_933, eB_934, eB_935,
  eB_938, eB_942, eB_947, eB_949, eB_952, eB_953, eB_954, eB_955, eB_956, eB_960, eB_962, eB_963, eB_964, eB_965, eB_968, eB_972,
  eB_975, eB_977, eB_978, eB_979, eB_980, eB_981, eB_985, eB_986, eB_988, eB_989, eB_990, eB_991, eB_992, eB_993, eB_1000, eB_1002,
  eB_1003, eB_1006, eB_1007, eB_1010, eB_1013, eB_1014, eB_1015, eB_1017, eB_1019, eB_1020, eB_1021, eB_1022]
theorem nbOKB_455 : nbB_455 = nbhd entsB eB_455 := by decide +kernel
theorem mkOKB_455 : mkEnt 32 1024 W rB_455 455 = eB_455 := by decide +kernel
theorem tB_455 : kTermA 4294967295 eB_455 nbB_455 = 121619465686295281717960160 := by decide +kernel


end RamseyCert
