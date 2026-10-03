import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_661 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_14, eB_15, eB_16, eB_17, eB_19, eB_20, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26,
  eB_27, eB_30, eB_34, eB_35, eB_37, eB_38, eB_40, eB_41, eB_42, eB_45, eB_48, eB_49, eB_50, eB_51, eB_56, eB_57,
  eB_58, eB_59, eB_64, eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75, eB_80, eB_81, eB_82, eB_83, eB_90,
  eB_92, eB_93, eB_94, eB_95, eB_99, eB_102, eB_103, eB_104, eB_108, eB_111, eB_114, eB_117, eB_120, eB_123, eB_124, eB_125,
  eB_127, eB_128, eB_130, eB_131, eB_140, eB_141, eB_143, eB_144, eB_146, eB_147, eB_148, eB_151, eB_154, eB_157, eB_160, eB_161,
  eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_177, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_192,
  eB_193, eB_194, eB_195, eB_200, eB_204, eB_205, eB_206, eB_207, eB_210, eB_213, eB_215, eB_216, eB_218, eB_219, eB_221, eB_222,
  eB_224, eB_225, eB_229, eB_232, eB_235, eB_238, eB_241, eB_244, eB_250, eB_255, eB_258, eB_259, eB_260, eB_261, eB_262, eB_263,
  eB_268, eB_269, eB_270, eB_271, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299,
  eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327,
  eB_332, eB_333, eB_334, eB_335, eB_340, eB_345, eB_346, eB_347, eB_348, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359,
  eB_360, eB_362, eB_364, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_385,
  eB_386, eB_391, eB_394, eB_399, eB_404, eB_405, eB_406, eB_408, eB_409, eB_411, eB_412, eB_414, eB_415, eB_417, eB_418, eB_420,
  eB_421, eB_431, eB_432, eB_433, eB_434, eB_437, eB_440, eB_441, eB_444, eB_449, eB_450, eB_451, eB_453, eB_454, eB_456, eB_459,
  eB_466, eB_467, eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_476, eB_478, eB_479, eB_480, eB_481, eB_484, eB_486, eB_487,
  eB_488, eB_489, eB_490, eB_491, eB_493, eB_494, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513,
  eB_514, eB_515, eB_518, eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537, eB_538, eB_539, eB_540,
  eB_545, eB_546, eB_547, eB_548, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572,
  eB_581, eB_582, eB_583, eB_584, eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604,
  eB_611, eB_614, eB_617, eB_620, eB_629, eB_630, eB_631, eB_632, eB_641, eB_642, eB_643, eB_644, eB_649, eB_650, eB_651, eB_652,
  eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_677, eB_678, eB_679, eB_680,
  eB_681, eB_684, eB_685, eB_686, eB_687, eB_688, eB_690, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707, eB_708, eB_709,
  eB_710, eB_711, eB_712, eB_713, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736,
  eB_738, eB_745, eB_746, eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_765, eB_766, eB_767,
  eB_770, eB_771, eB_772, eB_773, eB_780, eB_781, eB_784, eB_785, eB_786, eB_787, eB_790, eB_791, eB_794, eB_795, eB_804, eB_805,
  eB_812, eB_813, eB_814, eB_815, eB_820, eB_821, eB_822, eB_823, eB_826, eB_827, eB_828, eB_829, eB_832, eB_833, eB_834, eB_835,
  eB_838, eB_839, eB_840, eB_842, eB_843, eB_844, eB_845, eB_848, eB_849, eB_852, eB_853, eB_854, eB_855, eB_858, eB_859, eB_864,
  eB_865, eB_866, eB_867, eB_868, eB_869, eB_870, eB_871, eB_872, eB_873, eB_876, eB_877, eB_878, eB_879, eB_880, eB_881, eB_884,
  eB_885, eB_886, eB_887, eB_892, eB_893, eB_896, eB_900, eB_901, eB_902, eB_903, eB_905, eB_906, eB_911, eB_912, eB_914, eB_917,
  eB_918, eB_920, eB_924, eB_926, eB_928, eB_929, eB_932, eB_934, eB_936, eB_940, eB_941, eB_943, eB_945, eB_946, eB_948, eB_951,
  eB_955, eB_956, eB_959, eB_960, eB_962, eB_963, eB_966, eB_969, eB_970, eB_978, eB_979, eB_980, eB_983, eB_989, eB_992, eB_993,
  eB_994, eB_995, eB_999, eB_1001, eB_1002, eB_1005, eB_1006, eB_1007, eB_1008, eB_1009, eB_1011, eB_1013, eB_1014, eB_1016, eB_1018, eB_1019,
  eB_1023]
theorem nbOKB_661 : nbB_661 = nbhd entsB eB_661 := by decide +kernel
theorem mkOKB_661 : mkEnt 32 1024 W rB_661 661 = eB_661 := by decide +kernel
theorem tB_661 : kTermA 4294967295 eB_661 nbB_661 = 79847167079408562261411035 := by decide +kernel


end RamseyCert
