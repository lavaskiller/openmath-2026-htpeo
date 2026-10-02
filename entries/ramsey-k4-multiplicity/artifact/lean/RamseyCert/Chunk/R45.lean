import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_45 : List Ent := [
  eR_12, eR_14, eR_15, eR_16, eR_18, eR_21, eR_23, eR_25, eR_27, eR_31, eR_32, eR_33, eR_36, eR_39, eR_42, eR_46,
  eR_47, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62,
  eR_63, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94,
  eR_95, eR_97, eR_102, eR_105, eR_109, eR_112, eR_113, eR_117, eR_118, eR_119, eR_123, eR_126, eR_129, eR_136, eR_137, eR_138,
  eR_140, eR_141, eR_143, eR_144, eR_146, eR_147, eR_148, eR_152, eR_153, eR_154, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163,
  eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175, eR_192, eR_193, eR_194, eR_195,
  eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205, eR_206, eR_207, eR_208, eR_213, eR_217, eR_220,
  eR_226, eR_228, eR_235, eR_236, eR_239, eR_240, eR_244, eR_250, eR_254, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_264,
  eR_265, eR_266, eR_267, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_288,
  eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_324, eR_325, eR_326, eR_327, eR_328,
  eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_340, eR_341, eR_342, eR_343, eR_344,
  eR_345, eR_346, eR_347, eR_348, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_385, eR_386, eR_388, eR_390,
  eR_391, eR_394, eR_398, eR_399, eR_404, eR_407, eR_408, eR_409, eR_413, eR_414, eR_415, eR_420, eR_421, eR_424, eR_427, eR_428,
  eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_437, eR_440, eR_441, eR_449, eR_453, eR_454, eR_458, eR_459, eR_470, eR_471,
  eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_496, eR_497,
  eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513,
  eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562,
  eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_601, eR_602,
  eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_622, eR_624,
  eR_625, eR_627, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650,
  eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682,
  eR_683, eR_684, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698,
  eR_699, eR_700, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730,
  eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762,
  eR_763, eR_764, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785,
  eR_786, eR_787, eR_794, eR_795, eR_798, eR_799, eR_802, eR_803, eR_808, eR_809, eR_810, eR_814, eR_815, eR_816, eR_817, eR_818,
  eR_819, eR_820, eR_821, eR_824, eR_825, eR_826, eR_827, eR_828, eR_829, eR_832, eR_833, eR_840, eR_841, eR_844, eR_845, eR_850,
  eR_851, eR_852, eR_853, eR_854, eR_855, eR_856, eR_857, eR_860, eR_861, eR_862, eR_863, eR_866, eR_867, eR_869, eR_872, eR_873,
  eR_874, eR_875, eR_880, eR_881, eR_882, eR_883, eR_886, eR_887, eR_892, eR_893, eR_894, eR_895, eR_899, eR_901, eR_904, eR_906,
  eR_907, eR_908, eR_910, eR_911, eR_912, eR_913, eR_914, eR_917, eR_918, eR_923, eR_924, eR_926, eR_927, eR_929, eR_930, eR_931,
  eR_932, eR_933, eR_935, eR_936, eR_938, eR_939, eR_942, eR_943, eR_945, eR_947, eR_950, eR_956, eR_959, eR_961, eR_963, eR_964,
  eR_968, eR_969, eR_970, eR_971, eR_976, eR_977, eR_978, eR_982, eR_983, eR_984, eR_988, eR_992, eR_994, eR_998, eR_999, eR_1005,
  eR_1006, eR_1009, eR_1011, eR_1012, eR_1013, eR_1015, eR_1019, eR_1021, eR_1022]
theorem nbOKR_45 : nbR_45 = nbhd entsR eR_45 := by decide +kernel
theorem mkOKR_45 : mkEnt 32 1024 W rR_45 45 = eR_45 := by decide +kernel
theorem tR_45 : kTermA 4294967295 eR_45 nbR_45 = 114291347338101417416092368 := by decide +kernel


end RamseyCert
