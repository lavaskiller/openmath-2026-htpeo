import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_990 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_13, eB_17, eB_19, eB_20, eB_22, eB_24, eB_26, eB_28,
  eB_29, eB_30, eB_34, eB_35, eB_37, eB_38, eB_40, eB_41, eB_43, eB_44, eB_45, eB_52, eB_53, eB_54, eB_55, eB_60,
  eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_68, eB_72, eB_73, eB_74, eB_75, eB_77, eB_84, eB_85, eB_86,
  eB_87, eB_92, eB_93, eB_94, eB_95, eB_97, eB_98, eB_102, eB_105, eB_108, eB_109, eB_110, eB_112, eB_113, eB_117, eB_118,
  eB_119, eB_123, eB_126, eB_129, eB_132, eB_139, eB_142, eB_145, eB_149, eB_150, eB_151, eB_155, eB_156, eB_157, eB_164, eB_165,
  eB_166, eB_167, eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179, eB_180, eB_184, eB_185, eB_186, eB_187, eB_188,
  eB_196, eB_197, eB_198, eB_199, eB_204, eB_205, eB_206, eB_207, eB_208, eB_209, eB_213, eB_217, eB_220, eB_223, eB_226, eB_227,
  eB_228, eB_232, eB_235, eB_236, eB_237, eB_239, eB_240, eB_244, eB_250, eB_251, eB_254, eB_258, eB_264, eB_265, eB_266, eB_267,
  eB_268, eB_269, eB_270, eB_271, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299,
  eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_328, eB_329, eB_330, eB_331,
  eB_336, eB_337, eB_338, eB_339, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_361, eB_362, eB_363, eB_364,
  eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_388, eB_390, eB_391, eB_394, eB_398, eB_399, eB_402, eB_403,
  eB_405, eB_406, eB_410, eB_411, eB_412, eB_416, eB_417, eB_418, eB_422, eB_424, eB_426, eB_427, eB_428, eB_429, eB_430, eB_435,
  eB_436, eB_438, eB_439, eB_441, eB_444, eB_447, eB_448, eB_450, eB_451, eB_455, eB_456, eB_458, eB_459, eB_464, eB_466, eB_467,
  eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487, eB_491, eB_492, eB_493, eB_494,
  eB_495, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_521, eB_524, eB_525,
  eB_526, eB_527, eB_528, eB_532, eB_533, eB_534, eB_535, eB_536, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552,
  eB_553, eB_554, eB_555, eB_556, eB_558, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_581, eB_582, eB_583,
  eB_584, eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_611, eB_614, eB_617,
  eB_620, eB_621, eB_623, eB_626, eB_628, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_645, eB_646, eB_647,
  eB_648, eB_653, eB_654, eB_655, eB_656, eB_665, eB_666, eB_667, eB_668, eB_671, eB_673, eB_674, eB_675, eB_676, eB_677, eB_678,
  eB_679, eB_680, eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_705, eB_706, eB_707, eB_708, eB_709, eB_713,
  eB_714, eB_715, eB_716, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736, eB_745,
  eB_746, eB_747, eB_748, eB_752, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_776, eB_777, eB_782, eB_783,
  eB_784, eB_785, eB_788, eB_789, eB_790, eB_791, eB_792, eB_793, eB_796, eB_798, eB_799, eB_802, eB_803, eB_808, eB_809, eB_810,
  eB_811, eB_812, eB_814, eB_815, eB_818, eB_819, eB_824, eB_825, eB_830, eB_831, eB_838, eB_839, eB_840, eB_841, eB_842, eB_843,
  eB_844, eB_845, eB_850, eB_851, eB_852, eB_853, eB_860, eB_861, eB_862, eB_863, eB_866, eB_867, eB_868, eB_869, eB_872, eB_873,
  eB_880, eB_881, eB_888, eB_889, eB_890, eB_891, eB_892, eB_893, eB_899, eB_900, eB_901, eB_903, eB_904, eB_908, eB_911, eB_914,
  eB_917, eB_920, eB_921, eB_922, eB_923, eB_925, eB_926, eB_928, eB_929, eB_930, eB_931, eB_934, eB_935, eB_936, eB_937, eB_940,
  eB_941, eB_944, eB_945, eB_946, eB_948, eB_950, eB_951, eB_952, eB_953, eB_954, eB_955, eB_957, eB_960, eB_962, eB_964, eB_967,
  eB_968, eB_970, eB_973, eB_982, eB_983, eB_984, eB_987, eB_988, eB_989, eB_990, eB_992, eB_995, eB_997, eB_998, eB_1001, eB_1002,
  eB_1007, eB_1010, eB_1015, eB_1016, eB_1018, eB_1019, eB_1020, eB_1021, eB_1023]
theorem nbOKB_990 : nbB_990 = nbhd entsB eB_990 := by decide +kernel
theorem mkOKB_990 : mkEnt 32 1024 W rB_990 990 = eB_990 := by decide +kernel
theorem tB_990 : kTermA 4294967295 eB_990 nbB_990 = 75902524037529041690398697 := by decide +kernel


end RamseyCert
