import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_967 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_13, eR_14, eR_16, eR_17, eR_18, eR_19, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26,
  eR_29, eR_32, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_44, eR_47, eR_52, eR_53, eR_54, eR_56, eR_57, eR_58,
  eR_59, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83, eR_92, eR_93, eR_95,
  eR_96, eR_97, eR_99, eR_100, eR_102, eR_104, eR_107, eR_108, eR_110, eR_111, eR_113, eR_114, eR_116, eR_117, eR_119, eR_120,
  eR_122, eR_123, eR_124, eR_127, eR_130, eR_133, eR_134, eR_135, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_150, eR_153,
  eR_156, eR_159, eR_164, eR_165, eR_166, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186,
  eR_187, eR_192, eR_193, eR_194, eR_195, eR_205, eR_206, eR_207, eR_208, eR_210, eR_211, eR_213, eR_214, eR_215, eR_218, eR_221,
  eR_224, eR_228, eR_229, eR_231, eR_232, eR_234, eR_235, eR_237, eR_238, eR_240, eR_241, eR_243, eR_244, eR_245, eR_246, eR_247,
  eR_248, eR_250, eR_251, eR_252, eR_253, eR_254, eR_256, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270,
  eR_271, eR_276, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306,
  eR_307, eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334,
  eR_335, eR_340, eR_341, eR_342, eR_343, eR_344, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366,
  eR_367, eR_368, eR_377, eR_378, eR_379, eR_380, eR_385, eR_386, eR_387, eR_388, eR_389, eR_390, eR_391, eR_392, eR_394, eR_395,
  eR_397, eR_398, eR_399, eR_400, eR_403, eR_406, eR_407, eR_409, eR_410, eR_412, eR_413, eR_415, eR_416, eR_418, eR_419, eR_421,
  eR_422, eR_423, eR_424, eR_425, eR_426, eR_431, eR_432, eR_433, eR_434, eR_435, eR_438, eR_441, eR_442, eR_444, eR_445, eR_448,
  eR_451, eR_452, eR_454, eR_455, eR_456, eR_457, eR_458, eR_459, eR_460, eR_463, eR_464, eR_465, eR_470, eR_471, eR_473, eR_482,
  eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506,
  eR_507, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_536, eR_537, eR_538,
  eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_573, eR_574,
  eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_601, eR_602,
  eR_603, eR_604, eR_609, eR_612, eR_615, eR_618, eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650,
  eR_651, eR_653, eR_654, eR_655, eR_656, eR_661, eR_662, eR_663, eR_664, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_689,
  eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721,
  eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750,
  eR_752, eR_761, eR_762, eR_763, eR_764, eR_774, eR_775, eR_776, eR_777, eR_780, eR_781, eR_786, eR_787, eR_788, eR_789, eR_790,
  eR_791, eR_794, eR_795, eR_800, eR_801, eR_804, eR_805, eR_820, eR_821, eR_828, eR_829, eR_830, eR_831, eR_834, eR_835, eR_844,
  eR_845, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_880, eR_881, eR_886,
  eR_887, eR_890, eR_891, eR_894, eR_895, eR_897, eR_898, eR_899, eR_901, eR_904, eR_906, eR_907, eR_909, eR_910, eR_915, eR_916,
  eR_917, eR_921, eR_922, eR_923, eR_929, eR_930, eR_931, eR_932, eR_933, eR_935, eR_936, eR_938, eR_941, eR_945, eR_946, eR_947,
  eR_948, eR_951, eR_953, eR_954, eR_955, eR_959, eR_960, eR_961, eR_962, eR_963, eR_965, eR_966, eR_968, eR_969, eR_972, eR_973,
  eR_975, eR_976, eR_979, eR_980, eR_981, eR_983, eR_984, eR_985, eR_986, eR_987, eR_991, eR_996, eR_997, eR_998, eR_999, eR_1000,
  eR_1001, eR_1002, eR_1003, eR_1005, eR_1006, eR_1010, eR_1014, eR_1015, eR_1018, eR_1019, eR_1020, eR_1022, eR_1023]
theorem nbOKR_967 : nbR_967 = nbhd entsR eR_967 := by decide +kernel
theorem mkOKR_967 : mkEnt 32 1024 W rR_967 967 = eR_967 := by decide +kernel
theorem tR_967 : kTermA 4294967295 eR_967 nbR_967 = 88979436005456171662040772 := by decide +kernel


end RamseyCert
