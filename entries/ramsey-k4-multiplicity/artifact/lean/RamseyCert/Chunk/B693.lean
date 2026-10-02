import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_693 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_16, eB_18, eB_19, eB_20, eB_21, eB_23, eB_25, eB_27, eB_28, eB_29, eB_33,
  eB_34, eB_35, eB_36, eB_37, eB_38, eB_39, eB_40, eB_41, eB_42, eB_43, eB_44, eB_48, eB_49, eB_50, eB_51, eB_56,
  eB_57, eB_58, eB_59, eB_64, eB_65, eB_66, eB_67, eB_72, eB_73, eB_74, eB_75, eB_82, eB_84, eB_85, eB_86, eB_87,
  eB_88, eB_92, eB_93, eB_94, eB_95, eB_96, eB_97, eB_98, eB_99, eB_109, eB_110, eB_111, eB_112, eB_113, eB_114, eB_118,
  eB_119, eB_120, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_148, eB_149, eB_150, eB_154, eB_155, eB_156, eB_160, eB_161,
  eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187, eB_193, eB_196,
  eB_197, eB_198, eB_199, eB_200, eB_204, eB_205, eB_206, eB_207, eB_208, eB_209, eB_210, eB_214, eB_227, eB_228, eB_229, eB_236,
  eB_237, eB_238, eB_239, eB_240, eB_241, eB_245, eB_246, eB_247, eB_252, eB_253, eB_255, eB_259, eB_264, eB_265, eB_266, eB_267,
  eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_296, eB_297, eB_298, eB_299,
  eB_304, eB_305, eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326, eB_327,
  eB_332, eB_333, eB_334, eB_335, eB_340, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_353, eB_355, eB_361,
  eB_362, eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_385,
  eB_386, eB_387, eB_389, eB_397, eB_402, eB_403, eB_404, eB_405, eB_406, eB_407, eB_411, eB_412, eB_413, eB_417, eB_418, eB_419,
  eB_423, eB_425, eB_427, eB_428, eB_429, eB_430, eB_431, eB_435, eB_436, eB_437, eB_438, eB_439, eB_440, eB_447, eB_448, eB_449,
  eB_450, eB_451, eB_452, eB_457, eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485,
  eB_492, eB_493, eB_494, eB_495, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515,
  eB_516, eB_520, eB_521, eB_522, eB_523, eB_526, eB_528, eB_529, eB_530, eB_531, eB_532, eB_537, eB_538, eB_539, eB_540, eB_545,
  eB_546, eB_547, eB_548, eB_553, eB_554, eB_555, eB_556, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576, eB_581,
  eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_622,
  eB_624, eB_625, eB_627, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_644, eB_649, eB_650, eB_651, eB_652,
  eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684,
  eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_705, eB_706, eB_707, eB_708, eB_713, eB_714, eB_715, eB_716,
  eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_739, eB_741, eB_742, eB_743,
  eB_744, eB_748, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_765, eB_766, eB_767, eB_768, eB_769, eB_772,
  eB_773, eB_780, eB_781, eB_784, eB_785, eB_788, eB_789, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_796, eB_797, eB_804,
  eB_805, eB_814, eB_815, eB_824, eB_825, eB_826, eB_827, eB_830, eB_831, eB_832, eB_833, eB_834, eB_835, eB_840, eB_841, eB_842,
  eB_844, eB_845, eB_848, eB_849, eB_852, eB_853, eB_856, eB_857, eB_860, eB_861, eB_862, eB_863, eB_864, eB_865, eB_866, eB_867,
  eB_870, eB_871, eB_874, eB_875, eB_882, eB_883, eB_884, eB_885, eB_888, eB_889, eB_890, eB_891, eB_897, eB_899, eB_900, eB_901,
  eB_903, eB_905, eB_906, eB_908, eB_909, eB_910, eB_911, eB_912, eB_913, eB_915, eB_921, eB_924, eB_927, eB_931, eB_932, eB_933,
  eB_934, eB_935, eB_939, eB_941, eB_943, eB_944, eB_946, eB_948, eB_949, eB_950, eB_954, eB_955, eB_956, eB_957, eB_958, eB_961,
  eB_962, eB_963, eB_964, eB_969, eB_973, eB_975, eB_978, eB_979, eB_982, eB_985, eB_986, eB_987, eB_989, eB_990, eB_992, eB_994,
  eB_996, eB_1000, eB_1005, eB_1007, eB_1009, eB_1011, eB_1015, eB_1016, eB_1018, eB_1020, eB_1022]
theorem nbOKB_693 : nbB_693 = nbhd entsB eB_693 := by decide +kernel
theorem mkOKB_693 : mkEnt 32 1024 W rB_693 693 = eB_693 := by decide +kernel
theorem tB_693 : kTermA 4294967295 eB_693 nbB_693 = 122312125210245867293598626 := by decide +kernel


end RamseyCert
