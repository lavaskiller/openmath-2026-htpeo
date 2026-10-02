import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_1011 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_9, eB_16, eB_17, eB_18, eB_19, eB_20, eB_21, eB_22,
  eB_23, eB_24, eB_25, eB_26, eB_33, eB_34, eB_35, eB_36, eB_37, eB_38, eB_39, eB_40, eB_41, eB_52, eB_53, eB_54,
  eB_55, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_76, eB_77, eB_78, eB_79, eB_84, eB_85, eB_86,
  eB_87, eB_88, eB_89, eB_92, eB_93, eB_94, eB_95, eB_160, eB_161, eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_176,
  eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187, eB_192, eB_193, eB_194, eB_195, eB_200, eB_201, eB_202, eB_203, eB_208,
  eB_209, eB_210, eB_211, eB_212, eB_213, eB_214, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221, eB_222, eB_223, eB_224,
  eB_225, eB_226, eB_227, eB_228, eB_229, eB_230, eB_231, eB_232, eB_233, eB_234, eB_235, eB_236, eB_237, eB_238, eB_239, eB_240,
  eB_241, eB_242, eB_243, eB_244, eB_245, eB_246, eB_247, eB_253, eB_254, eB_256, eB_257, eB_258, eB_259, eB_264, eB_265, eB_266,
  eB_267, eB_272, eB_273, eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298,
  eB_299, eB_304, eB_305, eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330,
  eB_331, eB_336, eB_337, eB_338, eB_339, eB_340, eB_341, eB_342, eB_343, eB_344, eB_347, eB_349, eB_350, eB_351, eB_352, eB_354,
  eB_357, eB_358, eB_359, eB_360, eB_365, eB_366, eB_367, eB_368, eB_371, eB_373, eB_374, eB_375, eB_376, eB_381, eB_382, eB_383,
  eB_384, eB_385, eB_386, eB_423, eB_424, eB_425, eB_426, eB_427, eB_428, eB_429, eB_430, eB_441, eB_442, eB_443, eB_444, eB_445,
  eB_446, eB_457, eB_458, eB_459, eB_460, eB_461, eB_462, eB_463, eB_464, eB_465, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479,
  eB_480, eB_481, eB_488, eB_489, eB_490, eB_491, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513,
  eB_514, eB_515, eB_520, eB_521, eB_522, eB_523, eB_528, eB_529, eB_530, eB_531, eB_537, eB_538, eB_539, eB_540, eB_545, eB_546,
  eB_547, eB_548, eB_553, eB_554, eB_555, eB_556, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_577, eB_578,
  eB_579, eB_580, eB_585, eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_609, eB_610,
  eB_611, eB_612, eB_613, eB_614, eB_615, eB_616, eB_617, eB_618, eB_619, eB_620, eB_621, eB_622, eB_623, eB_624, eB_625, eB_626,
  eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_641, eB_642, eB_643, eB_644, eB_646, eB_649, eB_650, eB_651, eB_652, eB_656,
  eB_657, eB_658, eB_659, eB_660, eB_661, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683,
  eB_684, eB_689, eB_690, eB_691, eB_692, eB_693, eB_697, eB_698, eB_699, eB_700, eB_702, eB_705, eB_706, eB_707, eB_708, eB_713,
  eB_714, eB_715, eB_716, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739, eB_740, eB_745,
  eB_746, eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_759, eB_761, eB_762, eB_763, eB_764, eB_768, eB_769, eB_772, eB_773,
  eB_774, eB_775, eB_778, eB_779, eB_780, eB_781, eB_786, eB_787, eB_788, eB_789, eB_794, eB_795, eB_798, eB_799, eB_802, eB_803,
  eB_804, eB_805, eB_814, eB_815, eB_816, eB_818, eB_819, eB_824, eB_825, eB_834, eB_835, eB_838, eB_839, eB_840, eB_842, eB_843,
  eB_844, eB_845, eB_846, eB_847, eB_848, eB_849, eB_850, eB_851, eB_854, eB_855, eB_860, eB_861, eB_866, eB_867, eB_870, eB_871,
  eB_872, eB_873, eB_876, eB_877, eB_878, eB_879, eB_882, eB_883, eB_886, eB_887, eB_890, eB_891, eB_892, eB_893, eB_894, eB_895,
  eB_898, eB_900, eB_902, eB_903, eB_906, eB_907, eB_908, eB_911, eB_912, eB_914, eB_915, eB_917, eB_919, eB_925, eB_926, eB_929,
  eB_930, eB_932, eB_935, eB_936, eB_937, eB_938, eB_939, eB_941, eB_944, eB_946, eB_949, eB_950, eB_954, eB_956, eB_957, eB_958,
  eB_960, eB_961, eB_966, eB_967, eB_974, eB_977, eB_979, eB_980, eB_981, eB_984, eB_986, eB_991, eB_993, eB_994, eB_996, eB_997,
  eB_998, eB_999, eB_1000, eB_1001, eB_1007, eB_1008, eB_1011, eB_1015, eB_1016, eB_1017, eB_1019, eB_1021, eB_1022]
theorem nbOKB_1011 : nbB_1011 = nbhd entsB eB_1011 := by decide +kernel
theorem mkOKB_1011 : mkEnt 32 1024 W rB_1011 1011 = eB_1011 := by decide +kernel
theorem tB_1011 : kTermA 4294967295 eB_1011 nbB_1011 = 77174353960835754197582086 := by decide +kernel


end RamseyCert
