import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_267 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_16, eR_17, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27, eR_28, eR_29, eR_30,
  eR_31, eR_32, eR_42, eR_43, eR_44, eR_45, eR_46, eR_47, eR_52, eR_53, eR_54, eR_55, eR_60, eR_61, eR_62, eR_63,
  eR_68, eR_69, eR_70, eR_71, eR_72, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83, eR_92, eR_93, eR_94, eR_95, eR_97,
  eR_98, eR_99, eR_100, eR_101, eR_102, eR_106, eR_107, eR_108, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_115, eR_116,
  eR_117, eR_118, eR_119, eR_120, eR_121, eR_122, eR_123, eR_148, eR_149, eR_150, eR_151, eR_152, eR_153, eR_154, eR_155, eR_156,
  eR_157, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_184,
  eR_186, eR_187, eR_192, eR_193, eR_195, eR_204, eR_205, eR_206, eR_207, eR_208, eR_209, eR_210, eR_211, eR_212, eR_213, eR_227,
  eR_228, eR_229, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238, eR_239, eR_240, eR_241, eR_242, eR_243,
  eR_244, eR_248, eR_249, eR_250, eR_255, eR_256, eR_257, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270,
  eR_271, eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306,
  eR_307, eR_312, eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338,
  eR_339, eR_340, eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366,
  eR_367, eR_368, eR_373, eR_374, eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_391, eR_392, eR_393, eR_394,
  eR_395, eR_396, eR_399, eR_400, eR_401, eR_402, eR_403, eR_404, eR_432, eR_433, eR_434, eR_435, eR_436, eR_437, eR_438, eR_439,
  eR_440, eR_441, eR_442, eR_443, eR_444, eR_445, eR_446, eR_447, eR_448, eR_449, eR_456, eR_459, eR_460, eR_461, eR_467, eR_468,
  eR_469, eR_474, eR_475, eR_476, eR_482, eR_483, eR_485, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498,
  eR_499, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530,
  eR_531, eR_536, eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566,
  eR_567, eR_568, eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594,
  eR_595, eR_596, eR_601, eR_602, eR_603, eR_604, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618,
  eR_619, eR_620, eR_629, eR_631, eR_641, eR_642, eR_644, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655, eR_656, eR_661,
  eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_681, eR_682, eR_684, eR_689, eR_690, eR_692, eR_697, eR_698, eR_699, eR_700,
  eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_725, eR_726, eR_727, eR_728,
  eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_757, eR_758, eR_759, eR_760,
  eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_776, eR_777, eR_778, eR_779, eR_782, eR_783, eR_784, eR_785, eR_786,
  eR_787, eR_790, eR_791, eR_792, eR_793, eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_806, eR_807, eR_808,
  eR_809, eR_812, eR_813, eR_814, eR_815, eR_818, eR_819, eR_826, eR_827, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_838,
  eR_839, eR_844, eR_845, eR_850, eR_851, eR_852, eR_853, eR_854, eR_855, eR_856, eR_857, eR_858, eR_859, eR_860, eR_861, eR_862,
  eR_863, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_880,
  eR_881, eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_888, eR_889, eR_896, eR_897, eR_898, eR_900, eR_901, eR_902, eR_903,
  eR_904, eR_906, eR_907, eR_910, eR_911, eR_923, eR_924, eR_927, eR_928, eR_931, eR_932, eR_933, eR_934, eR_941, eR_944, eR_945,
  eR_949, eR_951, eR_952, eR_958, eR_959, eR_960, eR_961, eR_962, eR_966, eR_967, eR_971, eR_974, eR_976, eR_977, eR_981, eR_984,
  eR_987, eR_988, eR_992, eR_993, eR_996, eR_997, eR_998, eR_999, eR_1000, eR_1003, eR_1007, eR_1008, eR_1010, eR_1015, eR_1018, eR_1019,
  eR_1020]
theorem nbOKR_267 : nbR_267 = nbhd entsR eR_267 := by decide +kernel
theorem mkOKR_267 : mkEnt 32 1024 W rR_267 267 = eR_267 := by decide +kernel
theorem tR_267 : kTermA 4294967295 eR_267 nbR_267 = 88026627279829180881940434 := by decide +kernel


end RamseyCert
