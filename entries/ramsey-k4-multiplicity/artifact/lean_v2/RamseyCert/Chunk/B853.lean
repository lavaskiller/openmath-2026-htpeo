import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_853 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_8, eB_10, eB_48, eB_52, eB_53, eB_54, eB_55, eB_58, eB_60, eB_61, eB_62, eB_63,
  eB_64, eB_68, eB_69, eB_70, eB_71, eB_74, eB_76, eB_77, eB_78, eB_79, eB_82, eB_84, eB_85, eB_86, eB_87, eB_88,
  eB_92, eB_93, eB_94, eB_95, eB_160, eB_164, eB_165, eB_166, eB_167, eB_168, eB_172, eB_173, eB_174, eB_175, eB_177, eB_180,
  eB_181, eB_182, eB_183, eB_185, eB_188, eB_189, eB_190, eB_191, eB_192, eB_196, eB_197, eB_198, eB_199, eB_204, eB_205, eB_206,
  eB_207, eB_248, eB_249, eB_250, eB_251, eB_252, eB_253, eB_254, eB_255, eB_256, eB_257, eB_258, eB_259, eB_260, eB_261, eB_262,
  eB_263, eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294,
  eB_295, eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326,
  eB_327, eB_332, eB_333, eB_334, eB_335, eB_340, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352, eB_357, eB_358,
  eB_359, eB_360, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_381, eB_382, eB_383, eB_384, eB_385, eB_386,
  eB_387, eB_388, eB_389, eB_390, eB_391, eB_392, eB_393, eB_394, eB_395, eB_396, eB_397, eB_398, eB_399, eB_400, eB_401, eB_402,
  eB_403, eB_404, eB_405, eB_406, eB_407, eB_408, eB_409, eB_410, eB_411, eB_412, eB_413, eB_414, eB_415, eB_416, eB_417, eB_418,
  eB_419, eB_420, eB_421, eB_422, eB_423, eB_424, eB_425, eB_426, eB_431, eB_432, eB_433, eB_434, eB_435, eB_436, eB_437, eB_438,
  eB_439, eB_440, eB_441, eB_442, eB_443, eB_444, eB_445, eB_446, eB_447, eB_448, eB_449, eB_450, eB_451, eB_452, eB_453, eB_454,
  eB_455, eB_456, eB_457, eB_458, eB_459, eB_460, eB_461, eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_482,
  eB_483, eB_484, eB_485, eB_486, eB_487, eB_492, eB_493, eB_494, eB_495, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510,
  eB_511, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537, eB_538,
  eB_539, eB_540, eB_545, eB_546, eB_547, eB_548, eB_553, eB_554, eB_555, eB_556, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570,
  eB_571, eB_572, eB_577, eB_578, eB_579, eB_580, eB_585, eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602,
  eB_603, eB_604, eB_609, eB_610, eB_611, eB_612, eB_613, eB_614, eB_615, eB_616, eB_617, eB_618, eB_619, eB_620, eB_621, eB_622,
  eB_623, eB_624, eB_625, eB_626, eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646,
  eB_647, eB_648, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682,
  eB_683, eB_684, eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704, eB_713, eB_714,
  eB_715, eB_716, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739, eB_740, eB_745, eB_746,
  eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_765, eB_766, eB_767, eB_768, eB_769, eB_770,
  eB_771, eB_774, eB_775, eB_778, eB_779, eB_780, eB_781, eB_782, eB_783, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_792,
  eB_793, eB_808, eB_809, eB_812, eB_813, eB_816, eB_826, eB_827, eB_828, eB_829, eB_830, eB_831, eB_836, eB_837, eB_838, eB_839,
  eB_842, eB_843, eB_844, eB_845, eB_848, eB_849, eB_850, eB_851, eB_852, eB_853, eB_868, eB_869, eB_870, eB_871, eB_872, eB_873,
  eB_882, eB_883, eB_884, eB_885, eB_887, eB_890, eB_891, eB_899, eB_901, eB_903, eB_904, eB_906, eB_907, eB_908, eB_909, eB_910,
  eB_911, eB_914, eB_915, eB_918, eB_919, eB_920, eB_923, eB_924, eB_925, eB_927, eB_930, eB_933, eB_934, eB_936, eB_938, eB_939,
  eB_940, eB_943, eB_947, eB_948, eB_950, eB_951, eB_953, eB_955, eB_956, eB_959, eB_961, eB_963, eB_964, eB_966, eB_967, eB_968,
  eB_972, eB_975, eB_977, eB_978, eB_979, eB_981, eB_984, eB_987, eB_989, eB_990, eB_993, eB_996, eB_997, eB_999, eB_1001, eB_1002,
  eB_1003, eB_1004, eB_1005, eB_1007, eB_1008, eB_1011, eB_1012, eB_1017]
theorem nbOKB_853 : nbB_853 = nbhd entsB eB_853 := by decide +kernel
theorem mkOKB_853 : mkEnt 32 1024 W rB_853 853 = eB_853 := by decide +kernel
theorem tB_853 : kTermA 4294967295 eB_853 nbB_853 = 87523816931607626108968490 := by decide +kernel


end RamseyCert
