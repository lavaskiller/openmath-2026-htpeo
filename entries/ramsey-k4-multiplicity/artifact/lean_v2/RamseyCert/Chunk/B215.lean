import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_215 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_13, eB_14, eB_16, eB_17, eB_20, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_27,
  eB_28, eB_30, eB_31, eB_32, eB_34, eB_35, eB_36, eB_38, eB_41, eB_42, eB_43, eB_45, eB_46, eB_56, eB_57, eB_58,
  eB_59, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_97, eB_99, eB_100,
  eB_102, eB_103, eB_104, eB_105, eB_107, eB_108, eB_110, eB_111, eB_113, eB_114, eB_116, eB_117, eB_119, eB_120, eB_122, eB_123,
  eB_125, eB_126, eB_127, eB_128, eB_129, eB_131, eB_132, eB_138, eB_139, eB_140, eB_142, eB_143, eB_144, eB_145, eB_146, eB_148,
  eB_149, eB_150, eB_151, eB_152, eB_154, eB_155, eB_157, eB_158, eB_160, eB_161, eB_162, eB_163, eB_164, eB_165, eB_166, eB_167,
  eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199,
  eB_200, eB_201, eB_202, eB_203, eB_204, eB_205, eB_206, eB_207, eB_209, eB_212, eB_214, eB_215, eB_218, eB_221, eB_224, eB_227,
  eB_230, eB_233, eB_236, eB_239, eB_242, eB_245, eB_246, eB_247, eB_248, eB_250, eB_253, eB_254, eB_257, eB_259, eB_260, eB_261,
  eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_308, eB_309,
  eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_340, eB_357,
  eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_381,
  eB_382, eB_383, eB_384, eB_385, eB_386, eB_391, eB_392, eB_394, eB_395, eB_399, eB_400, eB_402, eB_403, eB_404, eB_405, eB_406,
  eB_407, eB_409, eB_410, eB_412, eB_413, eB_414, eB_415, eB_416, eB_418, eB_419, eB_421, eB_422, eB_423, eB_424, eB_425, eB_426,
  eB_436, eB_437, eB_439, eB_440, eB_443, eB_446, eB_447, eB_449, eB_451, eB_452, eB_454, eB_455, eB_457, eB_458, eB_461, eB_462,
  eB_463, eB_464, eB_465, eB_466, eB_467, eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_474, eB_475, eB_476, eB_477, eB_487,
  eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503,
  eB_512, eB_513, eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527,
  eB_537, eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568,
  eB_585, eB_586, eB_587, eB_588, eB_589, eB_590, eB_591, eB_592, eB_609, eB_612, eB_615, eB_616, eB_618, eB_620, eB_621, eB_622,
  eB_623, eB_624, eB_625, eB_626, eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638,
  eB_639, eB_640, eB_641, eB_642, eB_643, eB_644, eB_653, eB_654, eB_655, eB_656, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662,
  eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692, eB_725, eB_726,
  eB_727, eB_728, eB_729, eB_730, eB_731, eB_732, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755, eB_756, eB_768, eB_769,
  eB_770, eB_771, eB_772, eB_773, eB_776, eB_777, eB_778, eB_779, eB_786, eB_787, eB_792, eB_793, eB_800, eB_801, eB_802, eB_803,
  eB_810, eB_811, eB_814, eB_815, eB_818, eB_819, eB_820, eB_821, eB_822, eB_823, eB_826, eB_827, eB_828, eB_829, eB_830, eB_831,
  eB_832, eB_833, eB_840, eB_841, eB_842, eB_843, eB_850, eB_851, eB_856, eB_857, eB_860, eB_861, eB_864, eB_865, eB_868, eB_869,
  eB_870, eB_871, eB_880, eB_881, eB_886, eB_887, eB_888, eB_889, eB_897, eB_901, eB_902, eB_904, eB_905, eB_906, eB_907, eB_909,
  eB_915, eB_917, eB_921, eB_922, eB_923, eB_924, eB_925, eB_927, eB_928, eB_929, eB_930, eB_931, eB_932, eB_934, eB_935, eB_936,
  eB_937, eB_939, eB_941, eB_944, eB_947, eB_948, eB_949, eB_952, eB_953, eB_955, eB_956, eB_957, eB_960, eB_961, eB_963, eB_964,
  eB_966, eB_969, eB_970, eB_971, eB_973, eB_974, eB_979, eB_980, eB_982, eB_986, eB_991, eB_993, eB_994, eB_997, eB_999, eB_1002,
  eB_1003, eB_1004, eB_1005, eB_1008, eB_1011, eB_1013, eB_1016, eB_1023]
theorem nbOKB_215 : nbB_215 = nbhd entsB eB_215 := by decide +kernel
theorem mkOKB_215 : mkEnt 32 1024 W rB_215 215 = eB_215 := by decide +kernel
theorem tB_215 : kTermA 4294967295 eB_215 nbB_215 = 80635741691109441986788815 := by decide +kernel


end RamseyCert
