import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_190 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_16, eB_21, eB_23, eB_25, eB_30, eB_31,
  eB_32, eB_45, eB_46, eB_47, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71,
  eB_72, eB_73, eB_74, eB_75, eB_77, eB_79, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_96, eB_100,
  eB_101, eB_102, eB_106, eB_107, eB_108, eB_115, eB_116, eB_117, eB_121, eB_122, eB_123, eB_133, eB_134, eB_135, eB_136, eB_137,
  eB_138, eB_151, eB_152, eB_153, eB_157, eB_158, eB_159, eB_160, eB_161, eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_176,
  eB_177, eB_178, eB_179, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193, eB_194, eB_195, eB_204, eB_205, eB_206, eB_207, eB_208,
  eB_209, eB_210, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221, eB_222, eB_223, eB_224, eB_225, eB_226, eB_227, eB_228,
  eB_229, eB_236, eB_237, eB_238, eB_239, eB_240, eB_241, eB_248, eB_249, eB_250, eB_252, eB_254, eB_259, eB_260, eB_264, eB_265,
  eB_266, eB_267, eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293,
  eB_294, eB_295, eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_320, eB_321, eB_322, eB_323, eB_326,
  eB_328, eB_329, eB_330, eB_331, eB_332, eB_336, eB_337, eB_338, eB_339, eB_340, eB_343, eB_345, eB_346, eB_347, eB_348, eB_349,
  eB_350, eB_351, eB_352, eB_357, eB_358, eB_359, eB_360, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_381,
  eB_382, eB_383, eB_384, eB_385, eB_386, eB_387, eB_389, eB_391, eB_392, eB_393, eB_394, eB_395, eB_396, eB_397, eB_399, eB_400,
  eB_401, eB_405, eB_406, eB_407, eB_411, eB_412, eB_413, eB_417, eB_418, eB_419, eB_424, eB_426, eB_427, eB_428, eB_429, eB_430,
  eB_450, eB_451, eB_452, eB_456, eB_458, eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484,
  eB_485, eB_486, eB_487, eB_488, eB_489, eB_490, eB_491, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_516,
  eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537, eB_538, eB_539, eB_540,
  eB_543, eB_545, eB_546, eB_547, eB_548, eB_550, eB_553, eB_554, eB_555, eB_556, eB_559, eB_565, eB_566, eB_567, eB_568, eB_573,
  eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584, eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_605,
  eB_606, eB_607, eB_608, eB_621, eB_623, eB_626, eB_628, eB_629, eB_630, eB_631, eB_632, eB_634, eB_641, eB_642, eB_643, eB_644,
  eB_649, eB_650, eB_651, eB_652, eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672,
  eB_677, eB_678, eB_679, eB_680, eB_685, eB_686, eB_687, eB_688, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704,
  eB_708, eB_713, eB_714, eB_715, eB_716, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735,
  eB_736, eB_741, eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_762, eB_772, eB_773,
  eB_780, eB_781, eB_784, eB_785, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_794, eB_795, eB_796, eB_797, eB_798, eB_799,
  eB_800, eB_801, eB_802, eB_803, eB_806, eB_807, eB_816, eB_817, eB_818, eB_819, eB_824, eB_825, eB_834, eB_835, eB_836, eB_837,
  eB_848, eB_849, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_856, eB_857, eB_860, eB_861, eB_868, eB_869, eB_870, eB_871,
  eB_874, eB_875, eB_876, eB_877, eB_878, eB_879, eB_880, eB_881, eB_886, eB_887, eB_890, eB_891, eB_897, eB_901, eB_902, eB_906,
  eB_908, eB_909, eB_910, eB_912, eB_913, eB_916, eB_920, eB_924, eB_925, eB_927, eB_928, eB_930, eB_932, eB_933, eB_934, eB_935,
  eB_937, eB_940, eB_942, eB_947, eB_948, eB_950, eB_951, eB_954, eB_955, eB_956, eB_957, eB_962, eB_965, eB_967, eB_970, eB_971,
  eB_972, eB_975, eB_976, eB_979, eB_980, eB_983, eB_984, eB_985, eB_989, eB_992, eB_993, eB_994, eB_995, eB_997, eB_998, eB_999,
  eB_1002, eB_1003, eB_1004, eB_1005, eB_1008, eB_1012, eB_1015, eB_1018, eB_1021, eB_1023]
theorem nbOKB_190 : nbB_190 = nbhd entsB eB_190 := by decide +kernel
theorem mkOKB_190 : mkEnt 32 1024 W rB_190 190 = eB_190 := by decide +kernel
theorem tB_190 : kTermA 4294967295 eB_190 nbB_190 = 76761045496524835418195424 := by decide +kernel


end RamseyCert
