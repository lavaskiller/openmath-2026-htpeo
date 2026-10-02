import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_716 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_13, eB_16, eB_18, eB_21, eB_23, eB_25, eB_28, eB_29, eB_30, eB_33, eB_36, eB_39,
  eB_43, eB_44, eB_45, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_72,
  eB_73, eB_74, eB_75, eB_84, eB_85, eB_86, eB_87, eB_92, eB_93, eB_94, eB_95, eB_96, eB_99, eB_100, eB_101, eB_103,
  eB_104, eB_106, eB_107, eB_111, eB_114, eB_115, eB_116, eB_120, eB_121, eB_122, eB_124, eB_125, eB_127, eB_128, eB_130, eB_131,
  eB_133, eB_134, eB_135, eB_139, eB_142, eB_145, eB_149, eB_150, eB_151, eB_155, eB_156, eB_157, eB_160, eB_161, eB_162, eB_163,
  eB_168, eB_169, eB_170, eB_171, eB_180, eB_181, eB_182, eB_183, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193, eB_194, eB_195,
  eB_200, eB_201, eB_202, eB_203, eB_208, eB_209, eB_213, eB_217, eB_220, eB_223, eB_226, eB_227, eB_228, eB_232, eB_235, eB_236,
  eB_237, eB_239, eB_240, eB_244, eB_250, eB_251, eB_253, eB_256, eB_257, eB_264, eB_265, eB_266, eB_267, eB_268, eB_269, eB_270,
  eB_271, eB_272, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299, eB_300, eB_301,
  eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_314, eB_316, eB_317, eB_318, eB_319, eB_320, eB_328, eB_329, eB_330, eB_331,
  eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_347, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359,
  eB_360, eB_363, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_388, eB_390,
  eB_391, eB_394, eB_398, eB_399, eB_404, eB_407, eB_408, eB_409, eB_413, eB_414, eB_415, eB_419, eB_420, eB_421, eB_423, eB_425,
  eB_431, eB_432, eB_433, eB_434, eB_437, eB_440, eB_442, eB_443, eB_445, eB_446, eB_449, eB_452, eB_453, eB_454, eB_457, eB_460,
  eB_461, eB_462, eB_463, eB_464, eB_465, eB_474, eB_475, eB_476, eB_477, eB_482, eB_483, eB_484, eB_485, eB_488, eB_489, eB_490,
  eB_491, eB_492, eB_495, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_520,
  eB_521, eB_522, eB_523, eB_528, eB_529, eB_530, eB_531, eB_537, eB_538, eB_539, eB_540, eB_545, eB_546, eB_547, eB_548, eB_553,
  eB_557, eB_558, eB_559, eB_560, eB_564, eB_565, eB_566, eB_567, eB_568, eB_569, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578,
  eB_579, eB_580, eB_585, eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_603, eB_605, eB_606, eB_607, eB_608, eB_611,
  eB_614, eB_617, eB_620, eB_621, eB_623, eB_626, eB_628, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_645,
  eB_646, eB_647, eB_648, eB_653, eB_654, eB_655, eB_656, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675, eB_676, eB_677,
  eB_678, eB_679, eB_680, eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_705, eB_706, eB_707, eB_708, eB_713,
  eB_714, eB_715, eB_716, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736, eB_745,
  eB_746, eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_768, eB_769, eB_774, eB_775, eB_776,
  eB_777, eB_778, eB_779, eB_786, eB_787, eB_790, eB_791, eB_794, eB_795, eB_800, eB_801, eB_804, eB_805, eB_806, eB_807, eB_808,
  eB_809, eB_812, eB_813, eB_818, eB_819, eB_822, eB_823, eB_826, eB_827, eB_828, eB_829, eB_838, eB_839, eB_840, eB_842, eB_843,
  eB_848, eB_849, eB_850, eB_851, eB_852, eB_853, eB_856, eB_857, eB_860, eB_861, eB_864, eB_865, eB_866, eB_867, eB_868, eB_869,
  eB_870, eB_871, eB_874, eB_875, eB_876, eB_886, eB_887, eB_888, eB_889, eB_890, eB_891, eB_896, eB_899, eB_900, eB_902, eB_905,
  eB_908, eB_909, eB_910, eB_911, eB_915, eB_916, eB_918, eB_920, eB_921, eB_922, eB_923, eB_924, eB_925, eB_926, eB_928, eB_929,
  eB_932, eB_935, eB_942, eB_944, eB_945, eB_947, eB_957, eB_958, eB_959, eB_963, eB_966, eB_968, eB_970, eB_972, eB_978, eB_979,
  eB_981, eB_982, eB_983, eB_984, eB_985, eB_988, eB_990, eB_991, eB_992, eB_994, eB_996, eB_998, eB_1000, eB_1001, eB_1002, eB_1004,
  eB_1007, eB_1008, eB_1011, eB_1014, eB_1015, eB_1017, eB_1018, eB_1019, eB_1020, eB_1021, eB_1022]
theorem nbOKB_716 : nbB_716 = nbhd entsB eB_716 := by decide +kernel
theorem mkOKB_716 : mkEnt 32 1024 W rB_716 716 = eB_716 := by decide +kernel
theorem tB_716 : kTermA 4294967295 eB_716 nbB_716 = 117553690034908431291818426 := by decide +kernel


end RamseyCert
