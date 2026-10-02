import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_278 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_12, eB_14, eB_16, eB_17, eB_19, eB_21, eB_22, eB_23,
  eB_24, eB_25, eB_26, eB_28, eB_31, eB_34, eB_37, eB_40, eB_43, eB_46, eB_48, eB_49, eB_50, eB_51, eB_54, eB_60,
  eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_70, eB_76, eB_77, eB_78, eB_79, eB_84, eB_85, eB_86, eB_87,
  eB_92, eB_93, eB_94, eB_95, eB_96, eB_97, eB_100, eB_103, eB_107, eB_110, eB_113, eB_116, eB_119, eB_122, eB_125, eB_128,
  eB_131, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_140, eB_143, eB_146, eB_149, eB_152, eB_155, eB_158, eB_160, eB_161,
  eB_162, eB_163, eB_164, eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179, eB_183, eB_188, eB_189, eB_190, eB_191,
  eB_196, eB_197, eB_198, eB_199, eB_204, eB_205, eB_206, eB_207, eB_208, eB_211, eB_214, eB_216, eB_219, eB_222, eB_225, eB_228,
  eB_231, eB_234, eB_237, eB_240, eB_243, eB_245, eB_246, eB_247, eB_249, eB_250, eB_257, eB_258, eB_260, eB_261, eB_262, eB_263,
  eB_272, eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299,
  eB_300, eB_301, eB_302, eB_303, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327,
  eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352, eB_361, eB_362, eB_363, eB_364,
  eB_365, eB_366, eB_367, eB_368, eB_377, eB_378, eB_379, eB_380, eB_391, eB_393, eB_394, eB_396, eB_399, eB_401, eB_403, eB_404,
  eB_405, eB_407, eB_408, eB_410, eB_411, eB_413, eB_414, eB_416, eB_417, eB_419, eB_420, eB_422, eB_427, eB_431, eB_432, eB_433,
  eB_434, eB_435, eB_437, eB_438, eB_440, eB_441, eB_443, eB_444, eB_446, eB_448, eB_449, eB_450, eB_452, eB_453, eB_455, eB_459,
  eB_461, eB_462, eB_463, eB_464, eB_465, eB_470, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_488, eB_489,
  eB_490, eB_491, eB_497, eB_500, eB_501, eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_522,
  eB_524, eB_525, eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548,
  eB_557, eB_558, eB_559, eB_560, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_581, eB_582, eB_583, eB_584,
  eB_589, eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_609, eB_611,
  eB_612, eB_614, eB_615, eB_617, eB_618, eB_620, eB_629, eB_630, eB_631, eB_632, eB_638, eB_641, eB_642, eB_643, eB_644, eB_649,
  eB_650, eB_651, eB_652, eB_653, eB_654, eB_655, eB_656, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_679,
  eB_681, eB_682, eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704,
  eB_709, eB_710, eB_711, eB_712, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736,
  eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_770, eB_771, eB_774, eB_775,
  eB_776, eB_777, eB_778, eB_779, eB_780, eB_781, eB_782, eB_783, eB_788, eB_789, eB_797, eB_798, eB_799, eB_800, eB_801, eB_802,
  eB_804, eB_805, eB_814, eB_815, eB_818, eB_819, eB_820, eB_821, eB_822, eB_823, eB_825, eB_826, eB_827, eB_836, eB_837, eB_838,
  eB_839, eB_840, eB_841, eB_846, eB_847, eB_848, eB_849, eB_850, eB_851, eB_852, eB_853, eB_856, eB_857, eB_858, eB_859, eB_866,
  eB_867, eB_868, eB_869, eB_872, eB_873, eB_876, eB_877, eB_878, eB_879, eB_882, eB_883, eB_888, eB_889, eB_892, eB_893, eB_897,
  eB_898, eB_899, eB_901, eB_902, eB_903, eB_904, eB_907, eB_908, eB_909, eB_911, eB_912, eB_913, eB_914, eB_918, eB_919, eB_920,
  eB_921, eB_923, eB_924, eB_929, eB_931, eB_932, eB_933, eB_937, eB_942, eB_943, eB_945, eB_946, eB_948, eB_949, eB_952, eB_953,
  eB_954, eB_957, eB_958, eB_959, eB_960, eB_962, eB_963, eB_964, eB_965, eB_970, eB_971, eB_972, eB_983, eB_985, eB_986, eB_987,
  eB_988, eB_989, eB_991, eB_992, eB_994, eB_996, eB_997, eB_999, eB_1001, eB_1004, eB_1008, eB_1009, eB_1015, eB_1023]
theorem nbOKB_278 : nbB_278 = nbhd entsB eB_278 := by decide +kernel
theorem mkOKB_278 : mkEnt 32 1024 W rB_278 278 = eB_278 := by decide +kernel
theorem tB_278 : kTermA 4294967295 eB_278 nbB_278 = 119207320256485577949553152 := by decide +kernel


end RamseyCert
