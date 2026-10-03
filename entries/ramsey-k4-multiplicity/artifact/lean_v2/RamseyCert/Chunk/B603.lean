import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_603 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_14, eB_15, eB_19, eB_20, eB_28, eB_29, eB_31, eB_32, eB_34, eB_35, eB_37, eB_38,
  eB_40, eB_41, eB_43, eB_44, eB_46, eB_47, eB_50, eB_52, eB_53, eB_54, eB_55, eB_59, eB_60, eB_61, eB_62, eB_63,
  eB_64, eB_65, eB_66, eB_67, eB_72, eB_73, eB_74, eB_75, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91,
  eB_96, eB_99, eB_102, eB_105, eB_108, eB_111, eB_114, eB_117, eB_120, eB_123, eB_126, eB_129, eB_132, eB_133, eB_134, eB_135,
  eB_140, eB_141, eB_143, eB_144, eB_146, eB_147, eB_149, eB_150, eB_152, eB_153, eB_155, eB_156, eB_158, eB_159, eB_161, eB_164,
  eB_165, eB_166, eB_167, eB_171, eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187,
  eB_192, eB_193, eB_194, eB_195, eB_200, eB_201, eB_202, eB_203, eB_210, eB_213, eB_214, eB_217, eB_220, eB_223, eB_226, eB_229,
  eB_232, eB_235, eB_238, eB_241, eB_244, eB_245, eB_246, eB_247, eB_248, eB_249, eB_256, eB_257, eB_259, eB_260, eB_261, eB_262,
  eB_263, eB_268, eB_269, eB_270, eB_271, eB_272, eB_274, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_292,
  eB_293, eB_294, eB_295, eB_304, eB_305, eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_328,
  eB_329, eB_330, eB_331, eB_336, eB_337, eB_338, eB_339, eB_340, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352,
  eB_357, eB_358, eB_359, eB_360, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_385, eB_386, eB_392, eB_393,
  eB_395, eB_396, eB_400, eB_401, eB_404, eB_407, eB_410, eB_413, eB_416, eB_419, eB_422, eB_427, eB_428, eB_429, eB_430, eB_431,
  eB_437, eB_440, eB_442, eB_443, eB_445, eB_446, eB_449, eB_452, eB_455, eB_456, eB_460, eB_461, eB_462, eB_463, eB_464, eB_465,
  eB_467, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_488, eB_489, eB_490, eB_491, eB_495,
  eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515, eB_524, eB_525, eB_526, eB_527,
  eB_532, eB_533, eB_534, eB_535, eB_536, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552, eB_553, eB_554, eB_555,
  eB_556, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579, eB_580, eB_589, eB_590, eB_591,
  eB_592, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_611, eB_614, eB_617, eB_620, eB_621, eB_622, eB_623,
  eB_624, eB_625, eB_626, eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_644, eB_649, eB_650,
  eB_651, eB_652, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_669, eB_670, eB_671, eB_672, eB_681, eB_682,
  eB_683, eB_684, eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704, eB_709, eB_710,
  eB_711, eB_712, eB_716, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_740,
  eB_745, eB_746, eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_770, eB_771, eB_772, eB_773,
  eB_774, eB_775, eB_778, eB_779, eB_780, eB_781, eB_782, eB_783, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_804, eB_805,
  eB_810, eB_811, eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_824, eB_825, eB_826, eB_827, eB_834, eB_835,
  eB_836, eB_837, eB_838, eB_839, eB_842, eB_843, eB_844, eB_845, eB_846, eB_850, eB_851, eB_852, eB_853, eB_856, eB_857, eB_858,
  eB_859, eB_864, eB_865, eB_874, eB_875, eB_880, eB_881, eB_882, eB_883, eB_886, eB_887, eB_888, eB_889, eB_899, eB_902, eB_903,
  eB_904, eB_905, eB_906, eB_909, eB_910, eB_912, eB_921, eB_924, eB_925, eB_926, eB_929, eB_939, eB_940, eB_941, eB_946, eB_947,
  eB_948, eB_949, eB_950, eB_951, eB_952, eB_953, eB_954, eB_956, eB_961, eB_963, eB_965, eB_966, eB_971, eB_972, eB_976, eB_978,
  eB_981, eB_982, eB_984, eB_985, eB_986, eB_990, eB_991, eB_992, eB_995, eB_998, eB_1000, eB_1001, eB_1003, eB_1006, eB_1007, eB_1008,
  eB_1010, eB_1011, eB_1012, eB_1013, eB_1016, eB_1017, eB_1018, eB_1019, eB_1020, eB_1021, eB_1023]
theorem nbOKB_603 : nbB_603 = nbhd entsB eB_603 := by decide +kernel
theorem mkOKB_603 : mkEnt 32 1024 W rB_603 603 = eB_603 := by decide +kernel
theorem tB_603 : kTermA 4294967295 eB_603 nbB_603 = 119040069618469433758348884 := by decide +kernel


end RamseyCert
