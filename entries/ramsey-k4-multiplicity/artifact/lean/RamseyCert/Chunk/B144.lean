import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_144 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_15, eB_16, eB_17,
  eB_20, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_29, eB_32, eB_35, eB_38, eB_41, eB_44, eB_47, eB_56, eB_57,
  eB_58, eB_59, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_97, eB_98,
  eB_99, eB_100, eB_102, eB_103, eB_105, eB_107, eB_108, eB_110, eB_111, eB_113, eB_114, eB_116, eB_117, eB_119, eB_120, eB_122,
  eB_123, eB_125, eB_126, eB_128, eB_129, eB_131, eB_132, eB_134, eB_136, eB_137, eB_138, eB_141, eB_144, eB_147, eB_150, eB_153,
  eB_156, eB_159, eB_168, eB_169, eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179, eB_180, eB_181,
  eB_182, eB_183, eB_208, eB_209, eB_210, eB_211, eB_213, eB_214, eB_215, eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_225,
  eB_226, eB_227, eB_228, eB_229, eB_230, eB_231, eB_232, eB_234, eB_235, eB_237, eB_238, eB_240, eB_241, eB_243, eB_244, eB_249,
  eB_251, eB_252, eB_253, eB_254, eB_255, eB_257, eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_284, eB_285,
  eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_308, eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_332, eB_333,
  eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350,
  eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382,
  eB_383, eB_384, eB_387, eB_388, eB_389, eB_390, eB_393, eB_394, eB_396, eB_397, eB_398, eB_400, eB_401, eB_402, eB_403, eB_404,
  eB_406, eB_407, eB_409, eB_410, eB_412, eB_413, eB_415, eB_416, eB_418, eB_419, eB_421, eB_422, eB_423, eB_424, eB_425, eB_426,
  eB_427, eB_428, eB_429, eB_430, eB_431, eB_432, eB_433, eB_434, eB_436, eB_437, eB_439, eB_440, eB_443, eB_444, eB_446, eB_447,
  eB_449, eB_451, eB_452, eB_454, eB_455, eB_457, eB_458, eB_461, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485,
  eB_504, eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535,
  eB_545, eB_546, eB_547, eB_548, eB_549, eB_550, eB_551, eB_552, eB_553, eB_554, eB_555, eB_556, eB_557, eB_558, eB_559, eB_560,
  eB_569, eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579, eB_580, eB_581, eB_582, eB_583, eB_584,
  eB_593, eB_594, eB_595, eB_596, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608,
  eB_610, eB_611, eB_613, eB_614, eB_616, eB_617, eB_619, eB_620, eB_637, eB_638, eB_639, eB_640, eB_641, eB_642, eB_643, eB_644,
  eB_653, eB_654, eB_655, eB_656, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668,
  eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731, eB_732,
  eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755, eB_756, eB_765, eB_766, eB_767, eB_770, eB_771, eB_772, eB_773, eB_774,
  eB_775, eB_776, eB_777, eB_778, eB_779, eB_782, eB_783, eB_784, eB_785, eB_788, eB_789, eB_792, eB_793, eB_794, eB_795, eB_798,
  eB_799, eB_800, eB_801, eB_804, eB_805, eB_806, eB_807, eB_810, eB_811, eB_812, eB_813, eB_818, eB_819, eB_822, eB_823, eB_824,
  eB_825, eB_826, eB_827, eB_828, eB_829, eB_834, eB_835, eB_836, eB_837, eB_838, eB_839, eB_842, eB_843, eB_844, eB_845, eB_848,
  eB_849, eB_850, eB_851, eB_864, eB_865, eB_870, eB_871, eB_874, eB_875, eB_878, eB_879, eB_880, eB_881, eB_884, eB_885, eB_892,
  eB_893, eB_896, eB_897, eB_898, eB_903, eB_909, eB_910, eB_913, eB_914, eB_915, eB_916, eB_921, eB_923, eB_927, eB_929, eB_930,
  eB_931, eB_932, eB_935, eB_937, eB_940, eB_942, eB_945, eB_949, eB_950, eB_953, eB_954, eB_955, eB_956, eB_957, eB_958, eB_959,
  eB_960, eB_961, eB_962, eB_966, eB_967, eB_968, eB_969, eB_970, eB_975, eB_976, eB_977, eB_978, eB_980, eB_981, eB_982, eB_985,
  eB_987, eB_993, eB_995, eB_996, eB_999, eB_1002, eB_1005, eB_1010, eB_1013, eB_1014, eB_1015, eB_1016, eB_1017, eB_1019, eB_1020, eB_1021]
theorem nbOKB_144 : nbB_144 = nbhd entsB eB_144 := by decide +kernel
theorem mkOKB_144 : mkEnt 32 1024 W rB_144 144 = eB_144 := by decide +kernel
theorem tB_144 : kTermA 4294967295 eB_144 nbB_144 = 85771931363700975151721976 := by decide +kernel


end RamseyCert
