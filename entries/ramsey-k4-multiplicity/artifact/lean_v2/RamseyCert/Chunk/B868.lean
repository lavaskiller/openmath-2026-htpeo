import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_868 : List Ent := [
  eB_1, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_13, eB_16, eB_17, eB_19, eB_20, eB_21,
  eB_22, eB_23, eB_24, eB_25, eB_26, eB_27, eB_28, eB_29, eB_31, eB_32, eB_34, eB_35, eB_36, eB_37, eB_38, eB_40,
  eB_41, eB_43, eB_44, eB_45, eB_46, eB_47, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_88, eB_89,
  eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_96, eB_97, eB_98, eB_100, eB_101, eB_105, eB_106, eB_107, eB_109, eB_110,
  eB_112, eB_113, eB_115, eB_116, eB_118, eB_119, eB_121, eB_122, eB_126, eB_129, eB_132, eB_133, eB_134, eB_135, eB_136, eB_137,
  eB_138, eB_139, eB_142, eB_145, eB_146, eB_147, eB_149, eB_150, eB_152, eB_153, eB_155, eB_156, eB_158, eB_159, eB_160, eB_161,
  eB_162, eB_163, eB_164, eB_165, eB_166, eB_167, eB_168, eB_169, eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_184, eB_185,
  eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_210, eB_213,
  eB_215, eB_216, eB_218, eB_219, eB_221, eB_222, eB_224, eB_225, eB_229, eB_232, eB_235, eB_238, eB_241, eB_244, eB_250, eB_253,
  eB_254, eB_255, eB_256, eB_257, eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287,
  eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_316, eB_317, eB_318, eB_319,
  eB_320, eB_321, eB_322, eB_323, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364, eB_391, eB_394, eB_399, eB_404,
  eB_405, eB_406, eB_408, eB_409, eB_411, eB_412, eB_414, eB_415, eB_416, eB_417, eB_418, eB_420, eB_421, eB_423, eB_424, eB_425,
  eB_426, eB_427, eB_428, eB_429, eB_430, eB_431, eB_432, eB_433, eB_434, eB_435, eB_437, eB_439, eB_440, eB_441, eB_442, eB_443,
  eB_445, eB_446, eB_449, eB_450, eB_451, eB_452, eB_453, eB_454, eB_456, eB_457, eB_458, eB_460, eB_461, eB_462, eB_463, eB_464,
  eB_465, eB_466, eB_467, eB_468, eB_469, eB_486, eB_487, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503, eB_504,
  eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_528,
  eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_536, eB_553, eB_554, eB_555, eB_556, eB_557, eB_558, eB_559, eB_560,
  eB_577, eB_578, eB_579, eB_580, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_589, eB_590, eB_591, eB_592,
  eB_593, eB_594, eB_595, eB_596, eB_597, eB_598, eB_599, eB_600, eB_609, eB_610, eB_612, eB_613, eB_615, eB_616, eB_618, eB_619,
  eB_621, eB_622, eB_623, eB_624, eB_625, eB_626, eB_627, eB_628, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668,
  eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692,
  eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740,
  eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_768, eB_769, eB_778, eB_779, eB_782,
  eB_783, eB_786, eB_787, eB_794, eB_795, eB_798, eB_799, eB_800, eB_801, eB_802, eB_803, eB_806, eB_807, eB_810, eB_811, eB_816,
  eB_817, eB_824, eB_825, eB_826, eB_827, eB_828, eB_829, eB_833, eB_834, eB_835, eB_838, eB_839, eB_840, eB_841, eB_852, eB_853,
  eB_858, eB_859, eB_862, eB_863, eB_866, eB_867, eB_868, eB_869, eB_872, eB_873, eB_876, eB_877, eB_878, eB_879, eB_882, eB_883,
  eB_884, eB_885, eB_886, eB_887, eB_888, eB_889, eB_890, eB_891, eB_894, eB_895, eB_903, eB_904, eB_906, eB_907, eB_911, eB_913,
  eB_915, eB_916, eB_918, eB_921, eB_922, eB_925, eB_926, eB_927, eB_929, eB_930, eB_931, eB_932, eB_933, eB_934, eB_938, eB_939,
  eB_940, eB_941, eB_944, eB_945, eB_946, eB_948, eB_950, eB_951, eB_955, eB_957, eB_958, eB_959, eB_960, eB_961, eB_962, eB_963,
  eB_964, eB_966, eB_970, eB_971, eB_976, eB_977, eB_978, eB_980, eB_981, eB_983, eB_985, eB_989, eB_990, eB_991, eB_992, eB_993,
  eB_994, eB_995, eB_996, eB_1004, eB_1012, eB_1016, eB_1017, eB_1019, eB_1020, eB_1023]
theorem nbOKB_868 : nbB_868 = nbhd entsB eB_868 := by decide +kernel
theorem mkOKB_868 : mkEnt 32 1024 W rB_868 868 = eB_868 := by decide +kernel
theorem tB_868 : kTermA 4294967295 eB_868 nbB_868 = 93002683710937208948191072 := by decide +kernel


end RamseyCert
