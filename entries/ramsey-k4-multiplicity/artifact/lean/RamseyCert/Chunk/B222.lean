import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_222 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_13, eB_14, eB_15, eB_16, eB_17, eB_19, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26,
  eB_27, eB_29, eB_30, eB_32, eB_33, eB_34, eB_37, eB_38, eB_40, eB_42, eB_44, eB_45, eB_47, eB_48, eB_49, eB_50,
  eB_51, eB_52, eB_53, eB_54, eB_55, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_98, eB_99, eB_101,
  eB_102, eB_104, eB_105, eB_106, eB_108, eB_109, eB_111, eB_112, eB_114, eB_115, eB_117, eB_118, eB_120, eB_121, eB_123, eB_124,
  eB_126, eB_127, eB_129, eB_130, eB_131, eB_132, eB_138, eB_139, eB_141, eB_142, eB_144, eB_145, eB_147, eB_148, eB_149, eB_150,
  eB_151, eB_152, eB_153, eB_154, eB_156, eB_157, eB_159, eB_168, eB_169, eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_184,
  eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_200,
  eB_201, eB_202, eB_203, eB_204, eB_205, eB_206, eB_207, eB_208, eB_211, eB_214, eB_216, eB_219, eB_222, eB_225, eB_228, eB_231,
  eB_234, eB_237, eB_240, eB_243, eB_245, eB_246, eB_247, eB_249, eB_250, eB_253, eB_254, eB_256, eB_259, eB_260, eB_261, eB_262,
  eB_263, eB_264, eB_265, eB_266, eB_267, eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_300, eB_301, eB_302,
  eB_303, eB_304, eB_305, eB_306, eB_307, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_340, eB_357, eB_358,
  eB_359, eB_360, eB_361, eB_362, eB_363, eB_364, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382,
  eB_383, eB_384, eB_385, eB_386, eB_391, eB_393, eB_394, eB_396, eB_399, eB_401, eB_402, eB_403, eB_404, eB_405, eB_407, eB_408,
  eB_410, eB_411, eB_413, eB_414, eB_416, eB_417, eB_419, eB_420, eB_422, eB_423, eB_424, eB_425, eB_426, eB_435, eB_437, eB_438,
  eB_440, eB_442, eB_445, eB_448, eB_449, eB_450, eB_451, eB_452, eB_453, eB_454, eB_455, eB_457, eB_458, eB_460, eB_462, eB_463,
  eB_464, eB_465, eB_466, eB_467, eB_468, eB_469, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485, eB_487, eB_488,
  eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495, eB_504, eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_512,
  eB_513, eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_545,
  eB_546, eB_547, eB_548, eB_549, eB_550, eB_551, eB_552, eB_569, eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_593,
  eB_594, eB_595, eB_596, eB_597, eB_598, eB_599, eB_600, eB_610, eB_612, eB_613, eB_616, eB_619, eB_621, eB_622, eB_623, eB_624,
  eB_625, eB_626, eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640,
  eB_641, eB_642, eB_643, eB_644, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652, eB_661, eB_662, eB_663, eB_664,
  eB_665, eB_666, eB_667, eB_668, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684, eB_717, eB_718, eB_719, eB_720,
  eB_721, eB_722, eB_723, eB_724, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_770, eB_771, eB_780, eB_781,
  eB_782, eB_783, eB_786, eB_787, eB_794, eB_795, eB_796, eB_797, eB_798, eB_799, eB_804, eB_805, eB_806, eB_807, eB_808, eB_809,
  eB_810, eB_811, eB_814, eB_815, eB_822, eB_823, eB_826, eB_827, eB_830, eB_831, eB_832, eB_833, eB_836, eB_837, eB_839, eB_840,
  eB_841, eB_848, eB_849, eB_862, eB_863, eB_864, eB_865, eB_868, eB_869, eB_870, eB_871, eB_874, eB_875, eB_878, eB_879, eB_880,
  eB_881, eB_882, eB_883, eB_886, eB_887, eB_892, eB_893, eB_898, eB_901, eB_902, eB_906, eB_909, eB_910, eB_912, eB_914, eB_915,
  eB_918, eB_920, eB_921, eB_922, eB_925, eB_926, eB_928, eB_930, eB_932, eB_933, eB_934, eB_935, eB_937, eB_939, eB_940, eB_941,
  eB_943, eB_946, eB_947, eB_953, eB_957, eB_958, eB_960, eB_964, eB_966, eB_967, eB_973, eB_976, eB_977, eB_978, eB_981, eB_982,
  eB_983, eB_984, eB_986, eB_987, eB_988, eB_989, eB_991, eB_993, eB_995, eB_996, eB_998, eB_999, eB_1000, eB_1001, eB_1004, eB_1008,
  eB_1009, eB_1010, eB_1011, eB_1013, eB_1014, eB_1015, eB_1016, eB_1020]
theorem nbOKB_222 : nbB_222 = nbhd entsB eB_222 := by decide +kernel
theorem mkOKB_222 : mkEnt 32 1024 W rB_222 222 = eB_222 := by decide +kernel
theorem tB_222 : kTermA 4294967295 eB_222 nbB_222 = 118622683781385242863048899 := by decide +kernel


end RamseyCert
