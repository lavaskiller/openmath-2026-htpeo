import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_960 : List Ent := [
  eR_12, eR_16, eR_18, eR_19, eR_20, eR_21, eR_23, eR_25, eR_27, eR_28, eR_29, eR_33, eR_34, eR_35, eR_36, eR_37,
  eR_38, eR_39, eR_40, eR_41, eR_42, eR_43, eR_44, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_56,
  eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_72,
  eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_96, eR_97, eR_98, eR_99, eR_110, eR_112, eR_114, eR_118, eR_119,
  eR_120, eR_133, eR_134, eR_136, eR_137, eR_138, eR_148, eR_149, eR_150, eR_154, eR_155, eR_156, eR_160, eR_161, eR_162, eR_163,
  eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179,
  eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_208, eR_209, eR_210, eR_228,
  eR_229, eR_236, eR_239, eR_240, eR_241, eR_245, eR_246, eR_247, eR_252, eR_255, eR_259, eR_260, eR_261, eR_262, eR_263, eR_264,
  eR_265, eR_266, eR_267, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303, eR_304,
  eR_305, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_340, eR_341, eR_342, eR_343, eR_344,
  eR_345, eR_346, eR_347, eR_348, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368,
  eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_382, eR_383, eR_384, eR_385,
  eR_386, eR_389, eR_397, eR_402, eR_403, eR_404, eR_405, eR_406, eR_407, eR_411, eR_412, eR_413, eR_417, eR_418, eR_419, eR_423,
  eR_425, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_447, eR_448, eR_449, eR_450, eR_451, eR_452, eR_457, eR_462, eR_463,
  eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479,
  eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497,
  eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_537, eR_538,
  eR_539, eR_540, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554,
  eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594,
  eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602, eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_624, eR_625,
  eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684,
  eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698, eR_699, eR_700,
  eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724,
  eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762, eR_763, eR_764,
  eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_774, eR_775, eR_776, eR_777, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785,
  eR_786, eR_787, eR_792, eR_793, eR_794, eR_795, eR_798, eR_799, eR_802, eR_803, eR_804, eR_805, eR_812, eR_813, eR_826, eR_827,
  eR_830, eR_831, eR_832, eR_833, eR_834, eR_835, eR_840, eR_841, eR_844, eR_845, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853,
  eR_854, eR_855, eR_858, eR_859, eR_861, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_871, eR_882, eR_883, eR_884, eR_885,
  eR_888, eR_889, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895, eR_899, eR_902, eR_904, eR_905, eR_906, eR_909, eR_910, eR_913,
  eR_917, eR_919, eR_920, eR_921, eR_924, eR_931, eR_932, eR_934, eR_935, eR_939, eR_941, eR_942, eR_945, eR_946, eR_949, eR_950,
  eR_952, eR_954, eR_955, eR_956, eR_961, eR_963, eR_965, eR_967, eR_969, eR_970, eR_975, eR_978, eR_979, eR_983, eR_984, eR_985,
  eR_986, eR_987, eR_988, eR_989, eR_991, eR_993, eR_994, eR_995, eR_996, eR_997, eR_1000, eR_1002, eR_1004, eR_1007, eR_1009, eR_1010,
  eR_1012, eR_1015, eR_1016, eR_1018, eR_1020, eR_1022, eR_1023]
theorem nbOKR_960 : nbR_960 = nbhd entsR eR_960 := by decide +kernel
theorem mkOKR_960 : mkEnt 32 1024 W rR_960 960 = eR_960 := by decide +kernel
theorem tR_960 : kTermA 4294967295 eR_960 nbR_960 = 71385055908230587129299840 := by decide +kernel


end RamseyCert
