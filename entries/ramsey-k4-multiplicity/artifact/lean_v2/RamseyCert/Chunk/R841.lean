import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_841 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_14, eR_15, eR_16, eR_17, eR_19, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26,
  eR_27, eR_30, eR_34, eR_35, eR_37, eR_38, eR_40, eR_41, eR_42, eR_45, eR_52, eR_53, eR_54, eR_55, eR_60, eR_61,
  eR_62, eR_63, eR_65, eR_66, eR_67, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_88, eR_90, eR_91,
  eR_96, eR_97, eR_98, eR_100, eR_101, eR_105, eR_106, eR_107, eR_109, eR_110, eR_112, eR_113, eR_115, eR_116, eR_118, eR_119,
  eR_121, eR_122, eR_126, eR_129, eR_132, eR_133, eR_134, eR_135, eR_140, eR_141, eR_143, eR_144, eR_146, eR_147, eR_148, eR_151,
  eR_154, eR_157, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_177, eR_178, eR_179, eR_188, eR_189, eR_190,
  eR_191, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_203, eR_208, eR_209, eR_211, eR_212, eR_214, eR_217, eR_220, eR_223,
  eR_226, eR_227, eR_228, eR_230, eR_231, eR_233, eR_234, eR_236, eR_237, eR_239, eR_240, eR_242, eR_243, eR_245, eR_246, eR_247,
  eR_248, eR_249, eR_251, eR_252, eR_253, eR_254, eR_256, eR_257, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270,
  eR_271, eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302,
  eR_303, eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334,
  eR_335, eR_340, eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_369, eR_370,
  eR_371, eR_372, eR_377, eR_378, eR_379, eR_380, eR_385, eR_386, eR_387, eR_388, eR_389, eR_390, eR_392, eR_393, eR_395, eR_396,
  eR_397, eR_398, eR_400, eR_401, eR_404, eR_405, eR_406, eR_408, eR_409, eR_411, eR_412, eR_414, eR_415, eR_417, eR_418, eR_420,
  eR_421, eR_423, eR_424, eR_425, eR_426, eR_427, eR_428, eR_429, eR_430, eR_437, eR_440, eR_442, eR_443, eR_445, eR_446, eR_449,
  eR_450, eR_451, eR_453, eR_454, eR_456, eR_457, eR_458, eR_460, eR_461, eR_462, eR_463, eR_464, eR_465, eR_474, eR_476, eR_477,
  eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497, eR_498, eR_499, eR_504, eR_505, eR_506,
  eR_507, eR_516, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_536, eR_537, eR_538, eR_539,
  eR_540, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570, eR_571,
  eR_572, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602, eR_603,
  eR_604, eR_611, eR_614, eR_617, eR_620, eR_629, eR_630, eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651,
  eR_652, eR_657, eR_658, eR_659, eR_660, eR_661, eR_662, eR_663, eR_669, eR_670, eR_671, eR_672, eR_681, eR_682, eR_684, eR_690,
  eR_691, eR_692, eR_697, eR_698, eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_713, eR_715, eR_716, eR_717, eR_718, eR_719,
  eR_720, eR_725, eR_726, eR_727, eR_728, eR_737, eR_738, eR_739, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752,
  eR_757, eR_758, eR_759, eR_760, eR_770, eR_771, eR_772, eR_773, eR_776, eR_777, eR_778, eR_779, eR_782, eR_783, eR_784, eR_785,
  eR_786, eR_787, eR_790, eR_791, eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807,
  eR_810, eR_811, eR_816, eR_820, eR_821, eR_824, eR_825, eR_826, eR_827, eR_828, eR_829, eR_831, eR_832, eR_833, eR_836, eR_837,
  eR_838, eR_839, eR_844, eR_845, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_854, eR_855, eR_860, eR_861, eR_862, eR_863,
  eR_866, eR_867, eR_876, eR_877, eR_882, eR_883, eR_891, eR_896, eR_897, eR_898, eR_900, eR_903, eR_904, eR_905, eR_906, eR_908,
  eR_910, eR_912, eR_914, eR_915, eR_918, eR_919, eR_920, eR_921, eR_924, eR_926, eR_928, eR_929, eR_930, eR_931, eR_932, eR_936,
  eR_938, eR_943, eR_944, eR_945, eR_946, eR_947, eR_951, eR_954, eR_955, eR_958, eR_960, eR_961, eR_962, eR_964, eR_965, eR_968,
  eR_974, eR_975, eR_979, eR_981, eR_982, eR_984, eR_985, eR_986, eR_988, eR_989, eR_991, eR_995, eR_1002, eR_1003, eR_1004, eR_1005,
  eR_1008, eR_1011, eR_1013, eR_1015, eR_1016, eR_1021, eR_1023]
theorem nbOKR_841 : nbR_841 = nbhd entsR eR_841 := by decide +kernel
theorem mkOKR_841 : mkEnt 32 1024 W rR_841 841 = eR_841 := by decide +kernel
theorem tR_841 : kTermA 4294967295 eR_841 nbR_841 = 90256532410627950274756920 := by decide +kernel


end RamseyCert
