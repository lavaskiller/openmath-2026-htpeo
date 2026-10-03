import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_679 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_14, eB_18, eB_20, eB_28, eB_31, eB_33, eB_35, eB_36, eB_38, eB_39, eB_41,
  eB_43, eB_46, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_68, eB_69, eB_70, eB_71, eB_72, eB_73,
  eB_74, eB_75, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_98, eB_99, eB_101, eB_102, eB_104, eB_105,
  eB_106, eB_108, eB_109, eB_111, eB_112, eB_114, eB_115, eB_117, eB_118, eB_120, eB_121, eB_123, eB_124, eB_126, eB_127, eB_129,
  eB_130, eB_132, eB_136, eB_137, eB_138, eB_140, eB_143, eB_146, eB_149, eB_152, eB_155, eB_158, eB_160, eB_161, eB_162, eB_163,
  eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179, eB_188, eB_189, eB_190, eB_191, eB_196, eB_197, eB_198, eB_199,
  eB_204, eB_205, eB_206, eB_207, eB_208, eB_211, eB_214, eB_216, eB_219, eB_222, eB_225, eB_228, eB_231, eB_234, eB_237, eB_240,
  eB_243, eB_245, eB_246, eB_247, eB_249, eB_250, eB_253, eB_254, eB_256, eB_263, eB_264, eB_265, eB_266, eB_267, eB_268, eB_269,
  eB_270, eB_271, eB_278, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294, eB_295, eB_300,
  eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_326, eB_328, eB_329, eB_330,
  eB_331, eB_332, eB_333, eB_334, eB_335, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352, eB_360, eB_361, eB_362,
  eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_373, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_391,
  eB_393, eB_394, eB_396, eB_399, eB_401, eB_402, eB_406, eB_409, eB_412, eB_415, eB_418, eB_421, eB_423, eB_424, eB_425, eB_426,
  eB_431, eB_432, eB_433, eB_434, eB_436, eB_439, eB_442, eB_445, eB_447, eB_451, eB_454, eB_456, eB_457, eB_458, eB_460, eB_462,
  eB_463, eB_464, eB_465, eB_470, eB_471, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487, eB_488,
  eB_489, eB_490, eB_491, eB_500, eB_501, eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_524,
  eB_525, eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_536, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548,
  eB_549, eB_557, eB_558, eB_559, eB_560, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_581, eB_582, eB_583,
  eB_584, eB_589, eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_605, eB_606, eB_607, eB_608, eB_609, eB_611, eB_612,
  eB_614, eB_615, eB_617, eB_618, eB_620, eB_629, eB_630, eB_631, eB_632, eB_634, eB_637, eB_638, eB_639, eB_640, eB_645, eB_646,
  eB_647, eB_648, eB_650, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_668, eB_673, eB_674, eB_675, eB_676,
  eB_677, eB_678, eB_679, eB_680, eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707, eB_708,
  eB_713, eB_714, eB_715, eB_716, eB_717, eB_718, eB_719, eB_720, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739, eB_740,
  eB_741, eB_742, eB_743, eB_744, eB_753, eB_754, eB_755, eB_756, eB_761, eB_762, eB_763, eB_764, eB_772, eB_773, eB_774, eB_775,
  eB_782, eB_783, eB_788, eB_789, eB_790, eB_791, eB_792, eB_793, eB_796, eB_797, eB_798, eB_799, eB_804, eB_805, eB_806, eB_807,
  eB_808, eB_809, eB_810, eB_811, eB_814, eB_815, eB_816, eB_817, eB_820, eB_821, eB_828, eB_829, eB_836, eB_837, eB_838, eB_839,
  eB_840, eB_841, eB_842, eB_843, eB_848, eB_849, eB_854, eB_855, eB_856, eB_857, eB_862, eB_863, eB_864, eB_865, eB_868, eB_869,
  eB_870, eB_871, eB_874, eB_878, eB_879, eB_880, eB_881, eB_888, eB_889, eB_890, eB_891, eB_892, eB_893, eB_894, eB_895, eB_898,
  eB_900, eB_901, eB_902, eB_903, eB_907, eB_913, eB_914, eB_915, eB_917, eB_924, eB_926, eB_927, eB_930, eB_935, eB_938, eB_942,
  eB_945, eB_948, eB_951, eB_952, eB_954, eB_955, eB_956, eB_958, eB_959, eB_961, eB_962, eB_963, eB_964, eB_966, eB_969, eB_971,
  eB_981, eB_982, eB_983, eB_984, eB_986, eB_988, eB_990, eB_991, eB_993, eB_994, eB_995, eB_996, eB_997, eB_998, eB_1000, eB_1002,
  eB_1004, eB_1005, eB_1006, eB_1007, eB_1008, eB_1012, eB_1014, eB_1015, eB_1016, eB_1018, eB_1022, eB_1023]
theorem nbOKB_679 : nbB_679 = nbhd entsB eB_679 := by decide +kernel
theorem mkOKB_679 : mkEnt 32 1024 W rB_679 679 = eB_679 := by decide +kernel
theorem tB_679 : kTermA 4294967295 eB_679 nbB_679 = 74631715173430421566677912 := by decide +kernel


end RamseyCert
