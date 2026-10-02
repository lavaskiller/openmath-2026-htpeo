import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_660 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_12, eR_14, eR_19, eR_27, eR_29, eR_30, eR_32, eR_34,
  eR_37, eR_40, eR_42, eR_44, eR_45, eR_47, eR_48, eR_49, eR_50, eR_51, eR_60, eR_61, eR_62, eR_64, eR_65, eR_66,
  eR_67, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83, eR_92, eR_93, eR_94, eR_96, eR_98, eR_99, eR_101,
  eR_102, eR_103, eR_106, eR_108, eR_109, eR_111, eR_112, eR_114, eR_115, eR_117, eR_118, eR_120, eR_121, eR_123, eR_125, eR_128,
  eR_131, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_140, eR_143, eR_146, eR_148, eR_150, eR_151, eR_153, eR_154, eR_156,
  eR_157, eR_159, eR_160, eR_161, eR_162, eR_163, eR_172, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186,
  eR_187, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205, eR_207, eR_209, eR_210, eR_212, eR_213, eR_214, eR_216, eR_219, eR_222,
  eR_225, eR_227, eR_229, eR_230, eR_232, eR_233, eR_235, eR_236, eR_238, eR_239, eR_241, eR_242, eR_244, eR_245, eR_246, eR_247,
  eR_249, eR_250, eR_251, eR_252, eR_253, eR_254, eR_257, eR_258, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274, eR_275,
  eR_276, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_304, eR_305, eR_306, eR_307,
  eR_308, eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335,
  eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_365, eR_367, eR_377, eR_378,
  eR_379, eR_380, eR_387, eR_388, eR_389, eR_390, eR_391, eR_393, eR_394, eR_396, eR_397, eR_398, eR_399, eR_401, eR_403, eR_404,
  eR_406, eR_409, eR_412, eR_415, eR_418, eR_421, eR_423, eR_424, eR_425, eR_426, eR_431, eR_432, eR_433, eR_434, eR_435, eR_437,
  eR_438, eR_440, eR_441, eR_443, eR_444, eR_446, eR_448, eR_449, eR_451, eR_454, eR_457, eR_458, eR_459, eR_461, eR_462, eR_463,
  eR_464, eR_474, eR_475, eR_476, eR_477, eR_478, eR_480, eR_481, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497, eR_499, eR_508,
  eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_523, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538,
  eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_561, eR_562, eR_563, eR_564, eR_573, eR_574,
  eR_575, eR_576, eR_577, eR_578, eR_579, eR_580, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_605, eR_606,
  eR_607, eR_608, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626,
  eR_627, eR_628, eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654,
  eR_655, eR_656, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_672, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687,
  eR_688, eR_697, eR_698, eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_717, eR_719, eR_720,
  eR_729, eR_730, eR_731, eR_732, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756,
  eR_757, eR_758, eR_759, eR_760, eR_770, eR_771, eR_778, eR_779, eR_782, eR_783, eR_784, eR_785, eR_797, eR_802, eR_803, eR_804,
  eR_805, eR_806, eR_807, eR_820, eR_821, eR_822, eR_823, eR_826, eR_827, eR_828, eR_829, eR_830, eR_831, eR_832, eR_833, eR_834,
  eR_835, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_846, eR_847, eR_851, eR_852, eR_853, eR_854, eR_855,
  eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_868, eR_869, eR_872, eR_873, eR_874, eR_875, eR_878, eR_879, eR_880, eR_881,
  eR_882, eR_883, eR_886, eR_887, eR_890, eR_891, eR_893, eR_896, eR_900, eR_901, eR_903, eR_907, eR_911, eR_912, eR_913, eR_915,
  eR_921, eR_923, eR_924, eR_925, eR_928, eR_929, eR_930, eR_933, eR_936, eR_937, eR_938, eR_939, eR_940, eR_941, eR_942, eR_944,
  eR_946, eR_947, eR_950, eR_954, eR_955, eR_956, eR_957, eR_959, eR_965, eR_968, eR_974, eR_975, eR_976, eR_978, eR_979, eR_985,
  eR_986, eR_987, eR_988, eR_990, eR_991, eR_994, eR_996, eR_997, eR_998, eR_999, eR_1000, eR_1002, eR_1005, eR_1006, eR_1008, eR_1009,
  eR_1010, eR_1012, eR_1017, eR_1018, eR_1019, eR_1020, eR_1023]
theorem nbOKR_660 : nbR_660 = nbhd entsR eR_660 := by decide +kernel
theorem mkOKR_660 : mkEnt 32 1024 W rR_660 660 = eR_660 := by decide +kernel
theorem tR_660 : kTermA 4294967295 eR_660 nbR_660 = 122646347859336102141639558 := by decide +kernel


end RamseyCert
