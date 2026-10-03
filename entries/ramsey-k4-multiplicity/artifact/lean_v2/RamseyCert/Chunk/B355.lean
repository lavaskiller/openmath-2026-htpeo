import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_355 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_8, eB_9, eB_10, eB_11, eB_13, eB_14, eB_15, eB_17, eB_22, eB_24, eB_26, eB_30,
  eB_31, eB_32, eB_45, eB_46, eB_47, eB_48, eB_49, eB_50, eB_51, eB_56, eB_57, eB_58, eB_59, eB_64, eB_65, eB_66,
  eB_67, eB_72, eB_73, eB_74, eB_75, eB_80, eB_84, eB_85, eB_86, eB_87, eB_90, eB_92, eB_93, eB_94, eB_95, eB_96,
  eB_97, eB_98, eB_99, eB_109, eB_110, eB_111, eB_112, eB_113, eB_114, eB_118, eB_119, eB_120, eB_133, eB_134, eB_135, eB_139,
  eB_140, eB_141, eB_142, eB_143, eB_144, eB_145, eB_146, eB_147, eB_151, eB_152, eB_153, eB_157, eB_158, eB_159, eB_160, eB_161,
  eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187, eB_193, eB_196,
  eB_197, eB_198, eB_199, eB_203, eB_204, eB_205, eB_206, eB_207, eB_208, eB_209, eB_210, eB_214, eB_227, eB_228, eB_229, eB_236,
  eB_237, eB_238, eB_239, eB_240, eB_241, eB_245, eB_246, eB_247, eB_252, eB_253, eB_255, eB_260, eB_261, eB_262, eB_263, eB_272,
  eB_273, eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_300,
  eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330, eB_331, eB_336,
  eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360, eB_365,
  eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_381, eB_382, eB_383, eB_384, eB_387, eB_389, eB_397, eB_408, eB_409,
  eB_410, eB_414, eB_415, eB_416, eB_420, eB_421, eB_422, eB_423, eB_425, eB_427, eB_428, eB_429, eB_430, eB_431, eB_453, eB_454,
  eB_455, eB_456, eB_457, eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_486,
  eB_487, eB_492, eB_493, eB_494, eB_495, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514,
  eB_515, eB_518, eB_520, eB_521, eB_522, eB_523, eB_526, eB_528, eB_529, eB_530, eB_531, eB_534, eB_536, eB_541, eB_542, eB_543,
  eB_544, eB_549, eB_550, eB_551, eB_552, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571,
  eB_572, eB_577, eB_578, eB_579, eB_580, eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607,
  eB_608, eB_609, eB_610, eB_611, eB_612, eB_613, eB_614, eB_615, eB_616, eB_617, eB_618, eB_619, eB_620, eB_621, eB_623, eB_626,
  eB_628, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_644, eB_645, eB_646, eB_647, eB_648, eB_653, eB_654,
  eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684, eB_689, eB_690,
  eB_691, eB_692, eB_693, eB_694, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_713, eB_714, eB_715, eB_716,
  eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_737, eB_741, eB_742, eB_743,
  eB_744, eB_748, eB_749, eB_750, eB_751, eB_752, eB_754, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_770, eB_771,
  eB_774, eB_775, eB_780, eB_781, eB_786, eB_787, eB_794, eB_795, eB_796, eB_797, eB_808, eB_809, eB_814, eB_815, eB_818, eB_819,
  eB_820, eB_821, eB_824, eB_825, eB_828, eB_829, eB_830, eB_831, eB_834, eB_835, eB_838, eB_839, eB_843, eB_846, eB_847, eB_854,
  eB_855, eB_860, eB_861, eB_862, eB_863, eB_864, eB_865, eB_870, eB_871, eB_876, eB_877, eB_882, eB_883, eB_884, eB_885, eB_887,
  eB_890, eB_891, eB_894, eB_895, eB_896, eB_897, eB_899, eB_901, eB_907, eB_908, eB_910, eB_911, eB_914, eB_915, eB_916, eB_918,
  eB_920, eB_921, eB_922, eB_923, eB_924, eB_925, eB_926, eB_928, eB_929, eB_931, eB_934, eB_936, eB_937, eB_941, eB_942, eB_944,
  eB_945, eB_951, eB_952, eB_953, eB_954, eB_956, eB_958, eB_960, eB_961, eB_963, eB_964, eB_966, eB_967, eB_969, eB_971, eB_972,
  eB_975, eB_976, eB_977, eB_978, eB_982, eB_985, eB_986, eB_992, eB_994, eB_995, eB_997, eB_998, eB_1002, eB_1007, eB_1008, eB_1009,
  eB_1010, eB_1012, eB_1013, eB_1015, eB_1017, eB_1018, eB_1023]
theorem nbOKB_355 : nbB_355 = nbhd entsB eB_355 := by decide +kernel
theorem mkOKB_355 : mkEnt 32 1024 W rB_355 355 = eB_355 := by decide +kernel
theorem tB_355 : kTermA 4294967295 eB_355 nbB_355 = 121933894709452662747517230 := by decide +kernel


end RamseyCert
