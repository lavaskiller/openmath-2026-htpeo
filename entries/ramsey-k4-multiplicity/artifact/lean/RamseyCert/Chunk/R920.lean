import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_920 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_15, eR_17, eR_19, eR_22, eR_24, eR_26, eR_27, eR_29, eR_31, eR_34,
  eR_37, eR_40, eR_42, eR_44, eR_46, eR_48, eR_49, eR_50, eR_51, eR_60, eR_61, eR_63, eR_64, eR_65, eR_66, eR_67,
  eR_72, eR_73, eR_74, eR_75, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_96, eR_98, eR_99, eR_100,
  eR_104, eR_105, eR_107, eR_109, eR_111, eR_112, eR_114, eR_116, eR_118, eR_120, eR_122, eR_124, eR_126, eR_127, eR_129, eR_130,
  eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_148, eR_150, eR_152,
  eR_154, eR_156, eR_158, eR_160, eR_161, eR_162, eR_163, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185,
  eR_186, eR_187, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_209, eR_210, eR_211, eR_214, eR_215, eR_217, eR_218,
  eR_220, eR_221, eR_223, eR_224, eR_226, eR_227, eR_229, eR_231, eR_234, eR_236, eR_238, eR_239, eR_241, eR_243, eR_245, eR_246,
  eR_247, eR_249, eR_250, eR_251, eR_254, eR_255, eR_257, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270,
  eR_271, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_304, eR_305, eR_306,
  eR_307, eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338,
  eR_339, eR_340, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366,
  eR_367, eR_368, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_388, eR_390, eR_391, eR_393,
  eR_394, eR_396, eR_398, eR_399, eR_401, eR_402, eR_405, eR_407, eR_409, eR_411, eR_413, eR_415, eR_417, eR_419, eR_421, eR_424,
  eR_426, eR_431, eR_432, eR_433, eR_434, eR_436, eR_439, eR_441, eR_443, eR_444, eR_446, eR_447, eR_450, eR_452, eR_454, eR_458,
  eR_459, eR_461, eR_466, eR_467, eR_468, eR_469, eR_471, eR_472, eR_473, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489, eR_491,
  eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_532, eR_533,
  eR_534, eR_535, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562,
  eR_563, eR_564, eR_574, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_597, eR_598, eR_599, eR_600, eR_601,
  eR_602, eR_603, eR_604, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_621, eR_623, eR_626, eR_628, eR_629,
  eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_665,
  eR_666, eR_667, eR_668, eR_673, eR_674, eR_675, eR_676, eR_678, eR_679, eR_680, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694,
  eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727,
  eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762, eR_763, eR_764,
  eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_776, eR_777, eR_778, eR_779, eR_780, eR_781, eR_783, eR_784, eR_785,
  eR_788, eR_789, eR_790, eR_791, eR_792, eR_793, eR_796, eR_798, eR_800, eR_801, eR_804, eR_805, eR_810, eR_811, eR_816, eR_817,
  eR_818, eR_819, eR_828, eR_829, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843,
  eR_844, eR_845, eR_848, eR_849, eR_850, eR_851, eR_858, eR_859, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_868, eR_869,
  eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_884, eR_885, eR_894, eR_895, eR_898, eR_899, eR_900, eR_906,
  eR_907, eR_909, eR_910, eR_912, eR_913, eR_916, eR_917, eR_921, eR_922, eR_923, eR_925, eR_926, eR_927, eR_930, eR_934, eR_936,
  eR_938, eR_940, eR_941, eR_943, eR_944, eR_945, eR_946, eR_947, eR_952, eR_954, eR_957, eR_959, eR_960, eR_961, eR_963, eR_964,
  eR_968, eR_971, eR_980, eR_983, eR_985, eR_986, eR_989, eR_994, eR_995, eR_997, eR_999, eR_1000, eR_1002, eR_1007, eR_1008, eR_1009,
  eR_1011, eR_1012, eR_1013, eR_1014, eR_1017, eR_1018, eR_1020, eR_1021]
theorem nbOKR_920 : nbR_920 = nbhd entsR eR_920 := by decide +kernel
theorem mkOKR_920 : mkEnt 32 1024 W rR_920 920 = eR_920 := by decide +kernel
theorem tR_920 : kTermA 4294967295 eR_920 nbR_920 = 76652874414188862000991104 := by decide +kernel


end RamseyCert
