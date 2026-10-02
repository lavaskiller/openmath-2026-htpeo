import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_956 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_15, eB_16, eB_20, eB_21, eB_23, eB_25, eB_27, eB_28, eB_32, eB_35, eB_38, eB_41,
  eB_42, eB_43, eB_47, eB_48, eB_49, eB_50, eB_51, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_72,
  eB_73, eB_74, eB_75, eB_84, eB_85, eB_86, eB_87, eB_92, eB_93, eB_94, eB_95, eB_96, eB_98, eB_100, eB_102, eB_103,
  eB_105, eB_107, eB_108, eB_109, eB_112, eB_116, eB_117, eB_118, eB_122, eB_123, eB_125, eB_126, eB_128, eB_129, eB_131, eB_132,
  eB_133, eB_134, eB_135, eB_141, eB_144, eB_147, eB_148, eB_149, eB_153, eB_154, eB_155, eB_159, eB_164, eB_165, eB_166, eB_167,
  eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193, eB_194, eB_195,
  eB_200, eB_201, eB_202, eB_203, eB_208, eB_210, eB_212, eB_215, eB_218, eB_221, eB_224, eB_228, eB_229, eB_230, eB_233, eB_237,
  eB_238, eB_240, eB_241, eB_242, eB_249, eB_251, eB_253, eB_256, eB_258, eB_264, eB_265, eB_266, eB_267, eB_272, eB_273, eB_274,
  eB_275, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_288, eB_292, eB_293, eB_294, eB_295, eB_297, eB_300,
  eB_301, eB_302, eB_303, eB_306, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330, eB_331,
  eB_332, eB_333, eB_334, eB_335, eB_338, eB_341, eB_342, eB_343, eB_344, eB_348, eB_353, eB_354, eB_355, eB_356, eB_361, eB_362,
  eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_381, eB_382, eB_383, eB_384, eB_388, eB_390,
  eB_393, eB_396, eB_398, eB_401, eB_403, eB_405, eB_409, eB_410, eB_411, eB_415, eB_416, eB_417, eB_421, eB_422, eB_423, eB_425,
  eB_431, eB_432, eB_433, eB_434, eB_435, eB_438, eB_441, eB_442, eB_444, eB_445, eB_448, eB_450, eB_454, eB_455, eB_457, eB_459,
  eB_460, eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_492, eB_493, eB_494,
  eB_495, eB_500, eB_501, eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515, eB_520,
  eB_521, eB_522, eB_523, eB_532, eB_533, eB_534, eB_535, eB_538, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548,
  eB_553, eB_554, eB_555, eB_556, eB_561, eB_562, eB_563, eB_564, eB_572, eB_573, eB_574, eB_575, eB_576, eB_580, eB_581, eB_582,
  eB_583, eB_584, eB_588, eB_589, eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_609,
  eB_612, eB_615, eB_618, eB_621, eB_623, eB_626, eB_628, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_647,
  eB_649, eB_650, eB_651, eB_652, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_669, eB_670, eB_671, eB_672,
  eB_677, eB_678, eB_679, eB_680, eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_705, eB_706, eB_707, eB_708,
  eB_709, eB_710, eB_711, eB_712, eB_717, eB_718, eB_719, eB_720, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739, eB_740,
  eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_774, eB_775, eB_784, eB_794,
  eB_795, eB_798, eB_799, eB_800, eB_801, eB_804, eB_805, eB_809, eB_810, eB_811, eB_814, eB_815, eB_819, eB_822, eB_823, eB_828,
  eB_829, eB_830, eB_831, eB_832, eB_833, eB_834, eB_835, eB_836, eB_837, eB_840, eB_841, eB_844, eB_845, eB_846, eB_847, eB_848,
  eB_849, eB_850, eB_851, eB_852, eB_853, eB_858, eB_859, eB_862, eB_863, eB_870, eB_871, eB_872, eB_873, eB_874, eB_875, eB_876,
  eB_877, eB_880, eB_881, eB_886, eB_887, eB_888, eB_889, eB_892, eB_893, eB_896, eB_897, eB_899, eB_900, eB_904, eB_905, eB_907,
  eB_908, eB_911, eB_912, eB_915, eB_916, eB_920, eB_923, eB_924, eB_925, eB_926, eB_927, eB_932, eB_934, eB_935, eB_936, eB_938,
  eB_940, eB_944, eB_949, eB_950, eB_952, eB_953, eB_954, eB_956, eB_959, eB_961, eB_962, eB_963, eB_965, eB_966, eB_967, eB_968,
  eB_972, eB_974, eB_976, eB_980, eB_981, eB_982, eB_983, eB_985, eB_987, eB_988, eB_989, eB_993, eB_996, eB_998, eB_1001, eB_1004,
  eB_1005, eB_1008, eB_1009, eB_1011, eB_1012, eB_1013, eB_1015, eB_1016, eB_1018, eB_1023]
theorem nbOKB_956 : nbB_956 = nbhd entsB eB_956 := by decide +kernel
theorem mkOKB_956 : mkEnt 32 1024 W rB_956 956 = eB_956 := by decide +kernel
theorem tB_956 : kTermA 4294967295 eB_956 nbB_956 = 94507986401805284008078950 := by decide +kernel


end RamseyCert
