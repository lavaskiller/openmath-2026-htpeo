import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_501 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_14, eB_16, eB_19, eB_21, eB_23, eB_25, eB_27, eB_29, eB_31, eB_34, eB_37, eB_40,
  eB_42, eB_44, eB_46, eB_48, eB_49, eB_50, eB_51, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_76,
  eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_98, eB_99, eB_100, eB_103, eB_107,
  eB_109, eB_111, eB_112, eB_114, eB_116, eB_118, eB_120, eB_122, eB_125, eB_128, eB_131, eB_140, eB_143, eB_146, eB_148, eB_150,
  eB_152, eB_154, eB_156, eB_158, eB_164, eB_165, eB_166, eB_167, eB_168, eB_169, eB_170, eB_171, eB_180, eB_181, eB_182, eB_183,
  eB_184, eB_185, eB_186, eB_187, eB_196, eB_197, eB_198, eB_199, eB_204, eB_205, eB_206, eB_207, eB_208, eB_212, eB_213, eB_214,
  eB_215, eB_217, eB_218, eB_220, eB_221, eB_223, eB_224, eB_226, eB_228, eB_230, eB_232, eB_233, eB_235, eB_237, eB_240, eB_242,
  eB_244, eB_245, eB_246, eB_247, eB_249, eB_250, eB_252, eB_254, eB_255, eB_256, eB_264, eB_265, eB_266, eB_267, eB_272, eB_273,
  eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_283, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_299,
  eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327,
  eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_348, eB_353, eB_354, eB_355, eB_356, eB_361, eB_362, eB_363,
  eB_364, eB_365, eB_366, eB_367, eB_368, eB_371, eB_377, eB_378, eB_379, eB_380, eB_387, eB_389, eB_391, eB_393, eB_394, eB_396,
  eB_397, eB_399, eB_401, eB_402, eB_406, eB_408, eB_410, eB_412, eB_414, eB_416, eB_418, eB_420, eB_422, eB_424, eB_426, eB_427,
  eB_428, eB_429, eB_430, eB_436, eB_439, eB_442, eB_445, eB_447, eB_451, eB_453, eB_455, eB_458, eB_460, eB_462, eB_463, eB_464,
  eB_465, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_488, eB_489, eB_490, eB_491, eB_500, eB_501, eB_502,
  eB_503, eB_504, eB_505, eB_506, eB_507, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521, eB_522, eB_523, eB_532, eB_533, eB_534,
  eB_535, eB_537, eB_538, eB_539, eB_540, eB_548, eB_549, eB_550, eB_551, eB_552, eB_553, eB_554, eB_555, eB_556, eB_564, eB_565,
  eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_578, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588,
  eB_594, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_610, eB_613, eB_616, eB_619, eB_621, eB_623, eB_626,
  eB_628, eB_629, eB_630, eB_631, eB_632, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646, eB_647, eB_648, eB_654, eB_657, eB_658,
  eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_677, eB_678, eB_679, eB_680, eB_689, eB_690,
  eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_704, eB_705, eB_706, eB_707, eB_708, eB_713, eB_714, eB_715, eB_716, eB_717,
  eB_718, eB_719, eB_720, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_745, eB_746, eB_747,
  eB_748, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_765, eB_766, eB_767, eB_768, eB_769, eB_772, eB_773,
  eB_774, eB_775, eB_781, eB_785, eB_792, eB_793, eB_794, eB_795, eB_798, eB_799, eB_800, eB_801, eB_804, eB_805, eB_808, eB_809,
  eB_812, eB_813, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_822, eB_823, eB_824, eB_825, eB_832, eB_833, eB_836, eB_837,
  eB_840, eB_841, eB_844, eB_845, eB_846, eB_847, eB_850, eB_851, eB_852, eB_853, eB_856, eB_857, eB_862, eB_863, eB_864, eB_865,
  eB_868, eB_869, eB_876, eB_877, eB_884, eB_885, eB_890, eB_891, eB_892, eB_893, eB_896, eB_897, eB_899, eB_900, eB_901, eB_902,
  eB_904, eB_914, eB_916, eB_918, eB_919, eB_921, eB_924, eB_925, eB_926, eB_929, eB_930, eB_932, eB_933, eB_935, eB_940, eB_941,
  eB_943, eB_944, eB_946, eB_947, eB_949, eB_950, eB_953, eB_955, eB_956, eB_961, eB_962, eB_963, eB_964, eB_966, eB_971, eB_972,
  eB_974, eB_975, eB_977, eB_979, eB_980, eB_981, eB_983, eB_986, eB_988, eB_991, eB_992, eB_995, eB_997, eB_998, eB_999, eB_1000,
  eB_1001, eB_1002, eB_1006, eB_1007, eB_1008, eB_1009, eB_1010, eB_1012, eB_1015, eB_1019, eB_1020, eB_1021]
theorem nbOKB_501 : nbB_501 = nbhd entsB eB_501 := by decide +kernel
theorem mkOKB_501 : mkEnt 32 1024 W rB_501 501 = eB_501 := by decide +kernel
theorem tB_501 : kTermA 4294967295 eB_501 nbB_501 = 75446413586681917009817184 := by decide +kernel


end RamseyCert
