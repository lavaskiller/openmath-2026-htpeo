import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_700 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_13, eR_14, eR_15, eR_17, eR_22, eR_24, eR_26, eR_30,
  eR_31, eR_32, eR_45, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66,
  eR_67, eR_72, eR_73, eR_74, eR_75, eR_84, eR_86, eR_87, eR_92, eR_93, eR_94, eR_95, eR_100, eR_101, eR_102, eR_103,
  eR_104, eR_105, eR_106, eR_107, eR_108, eR_115, eR_116, eR_117, eR_121, eR_122, eR_123, eR_124, eR_125, eR_126, eR_127, eR_128,
  eR_129, eR_130, eR_131, eR_132, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_151, eR_152, eR_153,
  eR_157, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184,
  eR_185, eR_186, eR_187, eR_196, eR_197, eR_199, eR_204, eR_206, eR_207, eR_211, eR_212, eR_213, eR_215, eR_216, eR_217, eR_218,
  eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_242, eR_243,
  eR_244, eR_248, eR_249, eR_250, eR_251, eR_254, eR_256, eR_257, eR_258, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270,
  eR_271, eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306,
  eR_307, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334,
  eR_335, eR_345, eR_346, eR_347, eR_348, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_377,
  eR_378, eR_379, eR_380, eR_388, eR_390, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_398, eR_399, eR_400, eR_401, eR_408,
  eR_409, eR_410, eR_414, eR_415, eR_416, eR_420, eR_421, eR_422, eR_424, eR_426, eR_427, eR_429, eR_430, eR_441, eR_442, eR_443,
  eR_444, eR_445, eR_446, eR_453, eR_454, eR_455, eR_456, eR_458, eR_459, eR_460, eR_461, eR_466, eR_467, eR_468, eR_469, eR_474,
  eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502,
  eR_503, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_520, eR_521, eR_523, eR_528, eR_530, eR_531, eR_536, eR_537,
  eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568, eR_573,
  eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_601,
  eR_602, eR_603, eR_604, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_621,
  eR_623, eR_626, eR_628, eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_657,
  eR_658, eR_659, eR_660, eR_665, eR_666, eR_667, eR_668, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_689,
  eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_721,
  eR_722, eR_723, eR_724, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750,
  eR_751, eR_752, eR_757, eR_758, eR_759, eR_760, eR_768, eR_769, eR_772, eR_773, eR_778, eR_779, eR_780, eR_781, eR_784, eR_785,
  eR_788, eR_789, eR_790, eR_791, eR_794, eR_795, eR_796, eR_800, eR_801, eR_804, eR_805, eR_806, eR_807, eR_810, eR_811, eR_815,
  eR_820, eR_821, eR_822, eR_823, eR_824, eR_825, eR_828, eR_829, eR_830, eR_831, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841,
  eR_844, eR_845, eR_848, eR_849, eR_852, eR_853, eR_856, eR_857, eR_866, eR_867, eR_868, eR_869, eR_872, eR_873, eR_874, eR_875,
  eR_878, eR_879, eR_880, eR_881, eR_882, eR_883, eR_890, eR_891, eR_898, eR_899, eR_900, eR_901, eR_903, eR_905, eR_907, eR_910,
  eR_912, eR_918, eR_921, eR_922, eR_924, eR_925, eR_927, eR_928, eR_930, eR_933, eR_934, eR_935, eR_937, eR_941, eR_943, eR_944,
  eR_949, eR_950, eR_951, eR_953, eR_954, eR_956, eR_957, eR_958, eR_960, eR_961, eR_962, eR_963, eR_964, eR_968, eR_969, eR_971,
  eR_973, eR_974, eR_976, eR_977, eR_978, eR_979, eR_980, eR_981, eR_990, eR_992, eR_994, eR_996, eR_1000, eR_1003, eR_1005, eR_1007,
  eR_1009, eR_1013, eR_1014, eR_1018, eR_1019, eR_1021]
theorem nbOKR_700 : nbR_700 = nbhd entsR eR_700 := by decide +kernel
theorem mkOKR_700 : mkEnt 32 1024 W rR_700 700 = eR_700 := by decide +kernel
theorem tR_700 : kTermA 4294967295 eR_700 nbR_700 = 122227310071598826304246932 := by decide +kernel


end RamseyCert
