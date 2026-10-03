import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_624 : List Ent := [
  eB_12, eB_16, eB_17, eB_18, eB_19, eB_20, eB_21, eB_23, eB_24, eB_25, eB_27, eB_28, eB_29, eB_33, eB_34, eB_35,
  eB_36, eB_37, eB_38, eB_39, eB_40, eB_41, eB_42, eB_43, eB_44, eB_80, eB_81, eB_82, eB_83, eB_84, eB_85, eB_86,
  eB_87, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_96, eB_100, eB_101, eB_102, eB_103, eB_104, eB_105,
  eB_106, eB_107, eB_108, eB_112, eB_113, eB_115, eB_116, eB_117, eB_120, eB_121, eB_122, eB_123, eB_124, eB_125, eB_126, eB_127,
  eB_128, eB_129, eB_130, eB_131, eB_132, eB_136, eB_137, eB_138, eB_148, eB_149, eB_150, eB_154, eB_155, eB_156, eB_192, eB_193,
  eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_200, eB_201, eB_202, eB_203, eB_204, eB_205, eB_206, eB_207, eB_211, eB_212,
  eB_213, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221, eB_222, eB_223, eB_224, eB_225, eB_226, eB_230, eB_231, eB_232,
  eB_233, eB_234, eB_235, eB_239, eB_242, eB_243, eB_244, eB_248, eB_249, eB_250, eB_251, eB_252, eB_254, eB_256, eB_257, eB_258,
  eB_259, eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298,
  eB_299, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_312, eB_313, eB_314,
  eB_315, eB_340, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362,
  eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378,
  eB_379, eB_380, eB_383, eB_385, eB_386, eB_388, eB_390, eB_391, eB_392, eB_393, eB_394, eB_395, eB_396, eB_398, eB_399, eB_400,
  eB_401, eB_402, eB_403, eB_404, eB_405, eB_406, eB_407, eB_411, eB_412, eB_413, eB_417, eB_418, eB_419, eB_423, eB_424, eB_426,
  eB_427, eB_428, eB_429, eB_430, eB_431, eB_432, eB_433, eB_434, eB_435, eB_436, eB_437, eB_438, eB_439, eB_440, eB_441, eB_442,
  eB_443, eB_444, eB_445, eB_446, eB_447, eB_448, eB_449, eB_450, eB_451, eB_452, eB_458, eB_459, eB_460, eB_461, eB_512, eB_513,
  eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_528, eB_529,
  eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_537, eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546,
  eB_547, eB_548, eB_549, eB_550, eB_551, eB_552, eB_553, eB_554, eB_555, eB_556, eB_557, eB_558, eB_559, eB_560, eB_585, eB_586,
  eB_587, eB_588, eB_589, eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602,
  eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_622, eB_624, eB_625, eB_627, eB_637, eB_638, eB_639, eB_640, eB_641, eB_642,
  eB_643, eB_644, eB_693, eB_694, eB_695, eB_696, eB_697, eB_698, eB_699, eB_700, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738,
  eB_739, eB_740, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754,
  eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_768, eB_769, eB_770, eB_771, eB_774, eB_775,
  eB_778, eB_779, eB_784, eB_785, eB_786, eB_787, eB_792, eB_793, eB_796, eB_797, eB_800, eB_801, eB_804, eB_805, eB_806, eB_807,
  eB_810, eB_811, eB_814, eB_815, eB_816, eB_817, eB_822, eB_823, eB_824, eB_825, eB_826, eB_827, eB_832, eB_833, eB_835, eB_836,
  eB_837, eB_840, eB_841, eB_842, eB_843, eB_844, eB_845, eB_848, eB_849, eB_852, eB_853, eB_854, eB_855, eB_862, eB_866, eB_867,
  eB_868, eB_869, eB_872, eB_873, eB_878, eB_879, eB_880, eB_881, eB_885, eB_886, eB_887, eB_888, eB_889, eB_894, eB_895, eB_897,
  eB_898, eB_899, eB_901, eB_905, eB_906, eB_908, eB_909, eB_911, eB_913, eB_920, eB_930, eB_931, eB_932, eB_935, eB_938, eB_939,
  eB_940, eB_942, eB_944, eB_945, eB_946, eB_947, eB_948, eB_949, eB_950, eB_952, eB_955, eB_958, eB_959, eB_964, eB_967, eB_968,
  eB_974, eB_979, eB_980, eB_981, eB_982, eB_986, eB_987, eB_989, eB_992, eB_995, eB_996, eB_997, eB_999, eB_1000, eB_1001, eB_1002,
  eB_1003, eB_1006, eB_1010, eB_1011, eB_1012, eB_1014, eB_1015, eB_1016, eB_1019, eB_1020, eB_1021, eB_1022, eB_1023]
theorem nbOKB_624 : nbB_624 = nbhd entsB eB_624 := by decide +kernel
theorem mkOKB_624 : mkEnt 32 1024 W rB_624 624 = eB_624 := by decide +kernel
theorem tB_624 : kTermA 4294967295 eB_624 nbB_624 = 119462829768496959745069440 := by decide +kernel


end RamseyCert
