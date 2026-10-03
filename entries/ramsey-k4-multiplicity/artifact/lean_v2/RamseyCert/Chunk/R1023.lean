import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_1023 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_12, eR_15, eR_16, eR_17, eR_20, eR_21, eR_22, eR_23,
  eR_24, eR_25, eR_26, eR_29, eR_32, eR_35, eR_38, eR_41, eR_44, eR_47, eR_48, eR_49, eR_50, eR_51, eR_61, eR_62,
  eR_63, eR_68, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83, eR_88, eR_89, eR_90, eR_91,
  eR_97, eR_99, eR_100, eR_102, eR_103, eR_105, eR_107, eR_108, eR_110, eR_111, eR_113, eR_114, eR_116, eR_117, eR_119, eR_120,
  eR_122, eR_123, eR_125, eR_126, eR_128, eR_129, eR_131, eR_132, eR_136, eR_137, eR_138, eR_141, eR_144, eR_147, eR_150, eR_153,
  eR_156, eR_159, eR_160, eR_161, eR_162, eR_163, eR_173, eR_175, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_192,
  eR_193, eR_194, eR_195, eR_200, eR_201, eR_202, eR_203, eR_208, eR_210, eR_211, eR_213, eR_216, eR_217, eR_219, eR_220, eR_222,
  eR_223, eR_225, eR_226, eR_228, eR_229, eR_231, eR_232, eR_234, eR_235, eR_237, eR_238, eR_240, eR_241, eR_243, eR_244, eR_249,
  eR_251, eR_252, eR_253, eR_254, eR_255, eR_257, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274, eR_275, eR_280, eR_281,
  eR_282, eR_283, eR_284, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310,
  eR_311, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335, eR_341, eR_342, eR_343,
  eR_344, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375,
  eR_376, eR_381, eR_382, eR_383, eR_384, eR_387, eR_388, eR_389, eR_390, eR_393, eR_396, eR_397, eR_398, eR_401, eR_402, eR_404,
  eR_406, eR_407, eR_409, eR_410, eR_412, eR_413, eR_415, eR_416, eR_418, eR_419, eR_421, eR_422, eR_423, eR_424, eR_425, eR_426,
  eR_428, eR_429, eR_430, eR_436, eR_437, eR_439, eR_440, eR_443, eR_446, eR_447, eR_449, eR_451, eR_452, eR_454, eR_455, eR_457,
  eR_458, eR_461, eR_466, eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_492, eR_493, eR_494,
  eR_495, eR_500, eR_501, eR_502, eR_503, eR_505, eR_506, eR_507, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527,
  eR_528, eR_530, eR_531, eR_537, eR_538, eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561,
  eR_562, eR_563, eR_564, eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_597,
  eR_598, eR_599, eR_600, eR_605, eR_606, eR_607, eR_608, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_629,
  eR_630, eR_631, eR_632, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658, eR_659, eR_660, eR_665, eR_666,
  eR_667, eR_668, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_685, eR_687, eR_688, eR_693, eR_694, eR_695,
  eR_696, eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_728,
  eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_749, eR_751, eR_752, eR_757, eR_758, eR_759, eR_760, eR_765,
  eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_780, eR_781,
  eR_782, eR_783, eR_788, eR_789, eR_792, eR_793, eR_798, eR_799, eR_800, eR_801, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813,
  eR_816, eR_817, eR_822, eR_823, eR_825, eR_826, eR_827, eR_828, eR_829, eR_830, eR_831, eR_834, eR_835, eR_836, eR_837, eR_838,
  eR_839, eR_840, eR_841, eR_846, eR_847, eR_850, eR_851, eR_852, eR_853, eR_864, eR_865, eR_866, eR_867, eR_870, eR_871, eR_874,
  eR_875, eR_876, eR_877, eR_878, eR_879, eR_880, eR_881, eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_890, eR_891, eR_892,
  eR_893, eR_898, eR_899, eR_903, eR_905, eR_909, eR_913, eR_915, eR_924, eR_926, eR_930, eR_931, eR_932, eR_934, eR_936, eR_937,
  eR_938, eR_941, eR_942, eR_945, eR_947, eR_948, eR_953, eR_955, eR_957, eR_958, eR_960, eR_962, eR_963, eR_967, eR_968, eR_970,
  eR_972, eR_975, eR_976, eR_977, eR_979, eR_982, eR_993, eR_994, eR_995, eR_998, eR_1000, eR_1001, eR_1002, eR_1005, eR_1006, eR_1007,
  eR_1008, eR_1009, eR_1010, eR_1011, eR_1013, eR_1015, eR_1016, eR_1018, eR_1019, eR_1020, eR_1021]
theorem nbOKR_1023 : nbR_1023 = nbhd entsR eR_1023 := by decide +kernel
theorem mkOKR_1023 : mkEnt 32 1024 W rR_1023 1023 = eR_1023 := by decide +kernel
theorem tR_1023 : kTermA 4294967295 eR_1023 nbR_1023 = 74933493064165417057234410 := by decide +kernel


end RamseyCert
