import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_1010 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_14, eR_17, eR_18, eR_20, eR_22, eR_24, eR_26, eR_27,
  eR_29, eR_31, eR_33, eR_35, eR_36, eR_38, eR_39, eR_41, eR_42, eR_44, eR_46, eR_48, eR_49, eR_50, eR_51, eR_60,
  eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82, eR_83, eR_88, eR_89, eR_90,
  eR_91, eR_96, eR_97, eR_101, eR_102, eR_104, eR_105, eR_106, eR_108, eR_110, eR_113, eR_115, eR_117, eR_119, eR_121, eR_123,
  eR_124, eR_126, eR_127, eR_129, eR_130, eR_132, eR_133, eR_134, eR_135, eR_140, eR_143, eR_146, eR_148, eR_150, eR_152, eR_154,
  eR_156, eR_158, eR_160, eR_161, eR_162, eR_163, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_188, eR_190,
  eR_191, eR_192, eR_193, eR_194, eR_195, eR_200, eR_201, eR_202, eR_203, eR_208, eR_212, eR_213, eR_214, eR_215, eR_217, eR_218,
  eR_220, eR_221, eR_223, eR_224, eR_226, eR_228, eR_230, eR_232, eR_233, eR_235, eR_237, eR_240, eR_242, eR_244, eR_245, eR_246,
  eR_247, eR_249, eR_250, eR_252, eR_253, eR_255, eR_257, eR_258, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275,
  eR_276, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_304, eR_305, eR_306, eR_307,
  eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346,
  eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374,
  eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_387, eR_389, eR_391, eR_393, eR_394, eR_396, eR_397, eR_399, eR_401, eR_403,
  eR_404, eR_405, eR_407, eR_409, eR_411, eR_413, eR_415, eR_417, eR_419, eR_421, eR_423, eR_425, eR_431, eR_432, eR_433, eR_434,
  eR_435, eR_437, eR_438, eR_440, eR_441, eR_443, eR_444, eR_446, eR_448, eR_449, eR_450, eR_452, eR_454, eR_456, eR_457, eR_459,
  eR_461, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493,
  eR_494, eR_495, eR_496, eR_498, eR_499, eR_508, eR_509, eR_510, eR_511, eR_512, eR_514, eR_515, eR_524, eR_525, eR_526, eR_527,
  eR_528, eR_529, eR_530, eR_536, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_559, eR_560,
  eR_561, eR_562, eR_563, eR_564, eR_573, eR_574, eR_575, eR_576, eR_577, eR_578, eR_579, eR_580, eR_589, eR_590, eR_591, eR_592,
  eR_593, eR_594, eR_595, eR_596, eR_605, eR_606, eR_607, eR_608, eR_610, eR_613, eR_616, eR_619, eR_621, eR_623, eR_626, eR_628,
  eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658, eR_659, eR_660,
  eR_661, eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_689, eR_690, eR_691, eR_692, eR_693,
  eR_694, eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_729,
  eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_757, eR_758, eR_759,
  eR_760, eR_765, eR_766, eR_767, eR_772, eR_773, eR_778, eR_779, eR_782, eR_784, eR_785, eR_786, eR_787, eR_788, eR_789, eR_803,
  eR_806, eR_807, eR_808, eR_809, eR_810, eR_811, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_820, eR_821, eR_826, eR_827,
  eR_828, eR_829, eR_830, eR_831, eR_832, eR_833, eR_836, eR_837, eR_846, eR_847, eR_848, eR_849, eR_850, eR_852, eR_853, eR_868,
  eR_869, eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_880, eR_881, eR_884, eR_885, eR_886, eR_887, eR_890,
  eR_891, eR_897, eR_899, eR_900, eR_903, eR_905, eR_909, eR_910, eR_915, eR_917, eR_919, eR_921, eR_925, eR_929, eR_931, eR_933,
  eR_934, eR_935, eR_936, eR_937, eR_942, eR_943, eR_945, eR_948, eR_951, eR_952, eR_954, eR_956, eR_958, eR_959, eR_960, eR_961,
  eR_966, eR_967, eR_971, eR_973, eR_974, eR_975, eR_977, eR_978, eR_980, eR_983, eR_985, eR_986, eR_987, eR_989, eR_992, eR_994,
  eR_996, eR_999, eR_1000, eR_1001, eR_1002, eR_1004, eR_1006, eR_1007, eR_1009, eR_1011, eR_1012, eR_1014, eR_1015, eR_1016, eR_1017, eR_1019,
  eR_1020, eR_1021, eR_1022, eR_1023]
theorem nbOKR_1010 : nbR_1010 = nbhd entsR eR_1010 := by decide +kernel
theorem mkOKR_1010 : mkEnt 32 1024 W rR_1010 1010 = eR_1010 := by decide +kernel
theorem tR_1010 : kTermA 4294967295 eR_1010 nbR_1010 = 74650744674818227118371386 := by decide +kernel


end RamseyCert
