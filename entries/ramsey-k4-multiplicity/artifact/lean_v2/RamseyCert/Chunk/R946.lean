import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_946 : List Ent := [
  eR_13, eR_15, eR_16, eR_17, eR_18, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_28, eR_31, eR_33, eR_35,
  eR_36, eR_38, eR_39, eR_41, eR_43, eR_46, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_64, eR_65,
  eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81,
  eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_97, eR_100, eR_104, eR_105, eR_107, eR_110, eR_113, eR_116, eR_126, eR_127,
  eR_130, eR_132, eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_149, eR_152, eR_155, eR_158, eR_160, eR_161, eR_162, eR_163,
  eR_164, eR_165, eR_166, eR_167, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187,
  eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_208, eR_211, eR_215, eR_217,
  eR_221, eR_223, eR_224, eR_226, eR_228, eR_234, eR_237, eR_240, eR_243, eR_248, eR_256, eR_259, eR_268, eR_269, eR_270, eR_271,
  eR_272, eR_273, eR_274, eR_275, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_300, eR_301, eR_302, eR_303,
  eR_304, eR_305, eR_306, eR_307, eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_340, eR_341, eR_342, eR_343,
  eR_344, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359,
  eR_360, eR_361, eR_362, eR_363, eR_364, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383,
  eR_385, eR_386, eR_392, eR_395, eR_402, eR_405, eR_407, eR_408, eR_410, eR_411, eR_413, eR_414, eR_416, eR_417, eR_419, eR_420,
  eR_422, eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_436, eR_439, eR_442, eR_445, eR_447, eR_450, eR_452,
  eR_453, eR_455, eR_456, eR_460, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_486, eR_487, eR_488, eR_489,
  eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513,
  eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_536, eR_537,
  eR_538, eR_539, eR_540, eR_541, eR_542, eR_543, eR_544, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_561,
  eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_593,
  eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_610, eR_616, eR_629, eR_630, eR_631, eR_632, eR_633, eR_634, eR_635,
  eR_636, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659,
  eR_660, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715,
  eR_716, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739,
  eR_740, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762, eR_763,
  eR_764, eR_765, eR_766, eR_767, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_784, eR_785, eR_786, eR_787, eR_788, eR_789,
  eR_790, eR_791, eR_792, eR_793, eR_798, eR_799, eR_800, eR_801, eR_804, eR_805, eR_810, eR_811, eR_812, eR_813, eR_814, eR_815,
  eR_824, eR_825, eR_830, eR_831, eR_840, eR_841, eR_842, eR_843, eR_846, eR_847, eR_852, eR_853, eR_856, eR_857, eR_858, eR_859,
  eR_870, eR_871, eR_882, eR_883, eR_885, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_894, eR_895, eR_896, eR_897, eR_902,
  eR_904, eR_906, eR_908, eR_909, eR_917, eR_918, eR_919, eR_920, eR_921, eR_922, eR_923, eR_924, eR_927, eR_929, eR_931, eR_932,
  eR_936, eR_938, eR_940, eR_941, eR_943, eR_945, eR_947, eR_950, eR_951, eR_952, eR_953, eR_954, eR_956, eR_958, eR_959, eR_960,
  eR_962, eR_964, eR_967, eR_971, eR_973, eR_977, eR_978, eR_979, eR_980, eR_982, eR_983, eR_984, eR_989, eR_992, eR_993, eR_994,
  eR_995, eR_996, eR_998, eR_999, eR_1000, eR_1003, eR_1004, eR_1006, eR_1008, eR_1009, eR_1013, eR_1014, eR_1016, eR_1017, eR_1018, eR_1021,
  eR_1022]
theorem nbOKR_946 : nbR_946 = nbhd entsR eR_946 := by decide +kernel
theorem mkOKR_946 : mkEnt 32 1024 W rR_946 946 = eR_946 := by decide +kernel
theorem tR_946 : kTermA 4294967295 eR_946 nbR_946 = 80571473646607681459398690 := by decide +kernel


end RamseyCert
