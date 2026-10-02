import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_280 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_13, eR_15, eR_18, eR_20, eR_27, eR_29, eR_30, eR_32, eR_33, eR_35, eR_36, eR_38,
  eR_39, eR_41, eR_42, eR_44, eR_45, eR_47, eR_48, eR_49, eR_50, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66,
  eR_67, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_92, eR_93, eR_94, eR_95, eR_98, eR_99, eR_101,
  eR_102, eR_104, eR_105, eR_106, eR_108, eR_109, eR_111, eR_112, eR_114, eR_115, eR_117, eR_118, eR_120, eR_121, eR_123, eR_124,
  eR_126, eR_127, eR_129, eR_130, eR_132, eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_148, eR_150, eR_151, eR_153, eR_154,
  eR_156, eR_157, eR_159, eR_161, eR_162, eR_163, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_179, eR_188, eR_189, eR_190,
  eR_191, eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_207, eR_209, eR_210, eR_212, eR_213, eR_215, eR_217, eR_218,
  eR_220, eR_221, eR_223, eR_224, eR_226, eR_227, eR_229, eR_230, eR_232, eR_233, eR_235, eR_236, eR_238, eR_239, eR_241, eR_242,
  eR_244, eR_248, eR_251, eR_252, eR_253, eR_254, eR_255, eR_256, eR_259, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274,
  eR_275, eR_276, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302,
  eR_303, eR_312, eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338,
  eR_339, eR_340, eR_341, eR_342, eR_343, eR_344, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366,
  eR_367, eR_368, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_388, eR_389, eR_390,
  eR_392, eR_395, eR_397, eR_398, eR_400, eR_402, eR_406, eR_409, eR_412, eR_415, eR_418, eR_421, eR_423, eR_424, eR_425, eR_426,
  eR_431, eR_433, eR_434, eR_436, eR_439, eR_442, eR_445, eR_447, eR_451, eR_454, eR_456, eR_457, eR_458, eR_460, eR_462, eR_463,
  eR_464, eR_465, eR_474, eR_475, eR_476, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_500,
  eR_501, eR_503, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_524, eR_525, eR_527, eR_528, eR_529, eR_530,
  eR_531, eR_536, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566,
  eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_593, eR_596,
  eR_605, eR_606, eR_607, eR_608, eR_610, eR_613, eR_616, eR_619, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628,
  eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_665,
  eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_681, eR_683, eR_684, eR_685, eR_686, eR_687, eR_688, eR_693, eR_694,
  eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726,
  eR_727, eR_728, eR_733, eR_734, eR_735, eR_736, eR_745, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_757, eR_758, eR_759,
  eR_760, eR_765, eR_766, eR_767, eR_770, eR_771, eR_774, eR_775, eR_776, eR_777, eR_780, eR_782, eR_783, eR_788, eR_789, eR_792,
  eR_793, eR_798, eR_799, eR_804, eR_805, eR_806, eR_807, eR_810, eR_811, eR_814, eR_815, eR_818, eR_819, eR_828, eR_829, eR_832,
  eR_833, eR_834, eR_835, eR_840, eR_841, eR_846, eR_847, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_856, eR_857, eR_858,
  eR_859, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_870, eR_871, eR_876, eR_877, eR_880, eR_881, eR_882,
  eR_883, eR_884, eR_885, eR_892, eR_893, eR_897, eR_899, eR_901, eR_902, eR_903, eR_906, eR_908, eR_911, eR_912, eR_914, eR_915,
  eR_919, eR_920, eR_922, eR_923, eR_924, eR_925, eR_928, eR_929, eR_930, eR_933, eR_939, eR_942, eR_943, eR_945, eR_949, eR_951,
  eR_952, eR_955, eR_957, eR_958, eR_959, eR_962, eR_963, eR_964, eR_965, eR_968, eR_970, eR_972, eR_974, eR_975, eR_976, eR_977,
  eR_980, eR_981, eR_991, eR_992, eR_994, eR_996, eR_997, eR_999, eR_1001, eR_1003, eR_1004, eR_1008, eR_1009, eR_1013, eR_1014, eR_1016,
  eR_1019, eR_1020, eR_1021, eR_1022, eR_1023]
theorem nbOKR_280 : nbR_280 = nbhd entsR eR_280 := by decide +kernel
theorem mkOKR_280 : mkEnt 32 1024 W rR_280 280 = eR_280 := by decide +kernel
theorem tR_280 : kTermA 4294967295 eR_280 nbR_280 = 122317626653638990831029600 := by decide +kernel


end RamseyCert
