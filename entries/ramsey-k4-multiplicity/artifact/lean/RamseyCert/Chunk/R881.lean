import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_881 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_13, eR_18, eR_21, eR_23, eR_25, eR_28, eR_29, eR_36,
  eR_39, eR_44, eR_45, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_76,
  eR_77, eR_78, eR_79, eR_96, eR_99, eR_100, eR_101, eR_103, eR_104, eR_106, eR_107, eR_111, eR_114, eR_115, eR_116, eR_120,
  eR_121, eR_122, eR_124, eR_125, eR_127, eR_128, eR_130, eR_131, eR_133, eR_134, eR_135, eR_142, eR_145, eR_149, eR_151, eR_155,
  eR_156, eR_157, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173,
  eR_174, eR_175, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205,
  eR_206, eR_207, eR_208, eR_209, eR_217, eR_220, eR_223, eR_226, eR_227, eR_228, eR_235, eR_236, eR_237, eR_239, eR_240, eR_244,
  eR_250, eR_251, eR_253, eR_256, eR_257, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_276, eR_277, eR_278,
  eR_279, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294,
  eR_295, eR_296, eR_297, eR_298, eR_299, eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334,
  eR_335, eR_336, eR_337, eR_338, eR_339, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_365, eR_366, eR_367,
  eR_368, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383,
  eR_384, eR_388, eR_390, eR_391, eR_394, eR_398, eR_399, eR_404, eR_408, eR_409, eR_413, eR_414, eR_415, eR_419, eR_420, eR_423,
  eR_425, eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_437, eR_440, eR_442, eR_443, eR_445, eR_446, eR_452,
  eR_453, eR_454, eR_457, eR_460, eR_461, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480,
  eR_481, eR_482, eR_483, eR_484, eR_485, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506,
  eR_507, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_537, eR_538, eR_539,
  eR_540, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_577, eR_578, eR_579,
  eR_580, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595,
  eR_596, eR_597, eR_598, eR_599, eR_600, eR_611, eR_614, eR_620, eR_621, eR_623, eR_628, eR_629, eR_630, eR_631, eR_632, eR_633,
  eR_634, eR_635, eR_636, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_657,
  eR_658, eR_659, eR_660, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_693, eR_694, eR_695, eR_696, eR_697,
  eR_698, eR_699, eR_700, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_741, eR_742, eR_743, eR_744, eR_745,
  eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761,
  eR_762, eR_763, eR_764, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_778, eR_779, eR_782, eR_783, eR_788, eR_789, eR_794,
  eR_795, eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_814,
  eR_815, eR_818, eR_819, eR_822, eR_823, eR_824, eR_825, eR_826, eR_827, eR_828, eR_829, eR_838, eR_839, eR_842, eR_843, eR_848,
  eR_849, eR_852, eR_853, eR_854, eR_855, eR_858, eR_859, eR_860, eR_861, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_870,
  eR_871, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895, eR_896, eR_897, eR_899, eR_901, eR_903,
  eR_904, eR_905, eR_909, eR_910, eR_912, eR_915, eR_916, eR_917, eR_919, eR_921, eR_922, eR_923, eR_924, eR_926, eR_927, eR_928,
  eR_929, eR_932, eR_933, eR_935, eR_943, eR_947, eR_952, eR_959, eR_962, eR_963, eR_964, eR_965, eR_967, eR_968, eR_973, eR_978,
  eR_979, eR_981, eR_985, eR_993, eR_994, eR_995, eR_996, eR_997, eR_998, eR_1001, eR_1005, eR_1007, eR_1008, eR_1010, eR_1011, eR_1012,
  eR_1014, eR_1015, eR_1017, eR_1018, eR_1019, eR_1020, eR_1021, eR_1022, eR_1023]
theorem nbOKR_881 : nbR_881 = nbhd entsR eR_881 := by decide +kernel
theorem mkOKR_881 : mkEnt 32 1024 W rR_881 881 = eR_881 := by decide +kernel
theorem tR_881 : kTermA 4294967295 eR_881 nbR_881 = 108688411953826895335276104 := by decide +kernel


end RamseyCert
