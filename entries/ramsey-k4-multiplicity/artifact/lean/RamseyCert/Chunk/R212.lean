import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_212 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_21, eR_23, eR_25, eR_27, eR_28, eR_32, eR_35, eR_38,
  eR_41, eR_43, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69,
  eR_70, eR_71, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93,
  eR_94, eR_95, eR_97, eR_99, eR_101, eR_104, eR_110, eR_111, eR_113, eR_114, eR_115, eR_119, eR_120, eR_121, eR_124, eR_127,
  eR_130, eR_141, eR_144, eR_147, eR_148, eR_149, eR_153, eR_154, eR_155, eR_159, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165,
  eR_166, eR_167, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_209, eR_211, eR_213, eR_214, eR_216, eR_217,
  eR_219, eR_220, eR_222, eR_223, eR_225, eR_226, eR_227, eR_231, eR_232, eR_234, eR_235, eR_236, eR_239, eR_243, eR_244, eR_245,
  eR_246, eR_247, eR_248, eR_250, eR_252, eR_254, eR_255, eR_257, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267,
  eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283,
  eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323,
  eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356,
  eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_369, eR_370, eR_371, eR_372,
  eR_387, eR_389, eR_391, eR_392, eR_394, eR_395, eR_397, eR_399, eR_400, eR_410, eR_411, eR_415, eR_416, eR_417, eR_421, eR_424,
  eR_426, eR_435, eR_438, eR_443, eR_446, eR_448, eR_450, eR_454, eR_455, eR_458, eR_461, eR_478, eR_479, eR_480, eR_481, eR_482,
  eR_483, eR_484, eR_485, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_516,
  eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_545, eR_546, eR_547, eR_548, eR_549,
  eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_565,
  eR_566, eR_567, eR_568, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602, eR_603, eR_604, eR_605,
  eR_606, eR_607, eR_608, eR_609, eR_612, eR_615, eR_618, eR_621, eR_623, eR_626, eR_628, eR_629, eR_630, eR_631, eR_632, eR_633,
  eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_653, eR_654, eR_655, eR_656, eR_657,
  eR_658, eR_659, eR_660, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_673,
  eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_693, eR_694, eR_695, eR_696, eR_697,
  eR_698, eR_699, eR_700, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_721,
  eR_722, eR_723, eR_724, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761,
  eR_762, eR_763, eR_764, eR_765, eR_766, eR_767, eR_770, eR_771, eR_772, eR_773, eR_778, eR_779, eR_780, eR_781, eR_786, eR_787,
  eR_788, eR_789, eR_790, eR_791, eR_798, eR_799, eR_806, eR_814, eR_815, eR_816, eR_817, eR_828, eR_832, eR_833, eR_840, eR_841,
  eR_842, eR_843, eR_844, eR_845, eR_846, eR_847, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_854, eR_855, eR_856, eR_857,
  eR_858, eR_859, eR_860, eR_861, eR_864, eR_865, eR_868, eR_869, eR_876, eR_877, eR_878, eR_879, eR_882, eR_883, eR_884, eR_885,
  eR_888, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895, eR_896, eR_897, eR_898, eR_899, eR_903, eR_904, eR_905, eR_908, eR_910,
  eR_911, eR_916, eR_921, eR_923, eR_926, eR_930, eR_931, eR_932, eR_933, eR_935, eR_936, eR_941, eR_942, eR_943, eR_944, eR_945,
  eR_947, eR_948, eR_949, eR_950, eR_957, eR_965, eR_966, eR_969, eR_973, eR_975, eR_976, eR_978, eR_982, eR_983, eR_986, eR_987,
  eR_988, eR_989, eR_990, eR_993, eR_994, eR_995, eR_996, eR_997, eR_998, eR_999, eR_1002, eR_1003, eR_1004, eR_1006, eR_1007, eR_1008,
  eR_1010, eR_1013, eR_1014, eR_1016, eR_1019, eR_1021]
theorem nbOKR_212 : nbR_212 = nbhd entsR eR_212 := by decide +kernel
theorem mkOKR_212 : mkEnt 32 1024 W rR_212 212 = eR_212 := by decide +kernel
theorem tR_212 : kTermA 4294967295 eR_212 nbR_212 = 125757088777802763079392792 := by decide +kernel


end RamseyCert
