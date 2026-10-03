import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_220 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_14, eB_15, eB_16, eB_17, eB_18, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_27,
  eB_28, eB_29, eB_31, eB_32, eB_33, eB_36, eB_37, eB_39, eB_41, eB_43, eB_44, eB_46, eB_47, eB_48, eB_49, eB_50,
  eB_51, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_60, eB_61, eB_62, eB_63, eB_97, eB_98, eB_100,
  eB_101, eB_103, eB_104, eB_106, eB_107, eB_109, eB_110, eB_112, eB_113, eB_115, eB_116, eB_118, eB_119, eB_121, eB_122, eB_124,
  eB_125, eB_126, eB_127, eB_128, eB_130, eB_131, eB_132, eB_140, eB_141, eB_142, eB_143, eB_144, eB_146, eB_147, eB_149, eB_150,
  eB_152, eB_153, eB_155, eB_156, eB_157, eB_158, eB_159, eB_176, eB_177, eB_178, eB_179, eB_180, eB_181, eB_182, eB_183, eB_184,
  eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_200,
  eB_201, eB_202, eB_203, eB_204, eB_205, eB_206, eB_207, eB_210, eB_213, eB_214, eB_217, eB_220, eB_223, eB_226, eB_229, eB_232,
  eB_235, eB_238, eB_241, eB_244, eB_245, eB_246, eB_247, eB_248, eB_249, eB_253, eB_254, eB_258, eB_259, eB_260, eB_261, eB_262,
  eB_263, eB_264, eB_265, eB_266, eB_267, eB_268, eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275, eB_292, eB_293, eB_294,
  eB_295, eB_296, eB_297, eB_298, eB_299, eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_340, eB_365, eB_366,
  eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382,
  eB_383, eB_384, eB_385, eB_386, eB_392, eB_393, eB_395, eB_396, eB_400, eB_401, eB_402, eB_403, eB_404, eB_405, eB_406, eB_408,
  eB_409, eB_410, eB_411, eB_412, eB_414, eB_415, eB_417, eB_418, eB_419, eB_420, eB_421, eB_423, eB_424, eB_425, eB_426, eB_435,
  eB_436, eB_438, eB_439, eB_441, eB_444, eB_447, eB_448, eB_450, eB_451, eB_453, eB_454, eB_457, eB_458, eB_459, eB_470, eB_471,
  eB_472, eB_473, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485, eB_486, eB_496,
  eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_520,
  eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_553,
  eB_554, eB_555, eB_556, eB_557, eB_558, eB_559, eB_560, eB_577, eB_578, eB_579, eB_580, eB_581, eB_582, eB_583, eB_584, eB_601,
  eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_611, eB_612, eB_614, eB_617, eB_619, eB_620, eB_621, eB_622, eB_623,
  eB_624, eB_625, eB_626, eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639,
  eB_640, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652, eB_653, eB_654, eB_655,
  eB_656, eB_657, eB_658, eB_659, eB_660, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674, eB_675, eB_676, eB_709, eB_710, eB_711,
  eB_712, eB_713, eB_714, eB_715, eB_716, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740, eB_770, eB_771, eB_772,
  eB_773, eB_790, eB_791, eB_792, eB_793, eB_798, eB_799, eB_800, eB_801, eB_802, eB_803, eB_804, eB_805, eB_806, eB_807, eB_808,
  eB_809, eB_811, eB_812, eB_813, eB_820, eB_821, eB_822, eB_823, eB_828, eB_829, eB_833, eB_834, eB_835, eB_836, eB_837, eB_838,
  eB_839, eB_844, eB_845, eB_846, eB_847, eB_850, eB_851, eB_858, eB_859, eB_862, eB_863, eB_866, eB_867, eB_870, eB_871, eB_872,
  eB_873, eB_876, eB_877, eB_886, eB_887, eB_888, eB_889, eB_890, eB_891, eB_892, eB_893, eB_901, eB_905, eB_906, eB_909, eB_910,
  eB_912, eB_913, eB_915, eB_917, eB_918, eB_923, eB_924, eB_925, eB_930, eB_931, eB_932, eB_935, eB_937, eB_938, eB_939, eB_940,
  eB_941, eB_942, eB_944, eB_945, eB_946, eB_948, eB_950, eB_954, eB_955, eB_958, eB_960, eB_962, eB_963, eB_964, eB_965, eB_967,
  eB_969, eB_971, eB_973, eB_976, eB_978, eB_982, eB_984, eB_986, eB_987, eB_989, eB_990, eB_992, eB_997, eB_999, eB_1003, eB_1004,
  eB_1007, eB_1008, eB_1009, eB_1011, eB_1012, eB_1013, eB_1014, eB_1017, eB_1019, eB_1020, eB_1021, eB_1022]
theorem nbOKB_220 : nbB_220 = nbhd entsB eB_220 := by decide +kernel
theorem mkOKB_220 : mkEnt 32 1024 W rB_220 220 = eB_220 := by decide +kernel
theorem tB_220 : kTermA 4294967295 eB_220 nbB_220 = 125465042142946942504620174 := by decide +kernel


end RamseyCert
