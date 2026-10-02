import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_130 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_12, eB_13, eB_14, eB_16, eB_17, eB_19, eB_20, eB_21, eB_22, eB_23, eB_24, eB_25,
  eB_26, eB_27, eB_28, eB_30, eB_31, eB_32, eB_35, eB_36, eB_38, eB_41, eB_42, eB_43, eB_44, eB_45, eB_46, eB_48,
  eB_49, eB_50, eB_51, eB_52, eB_53, eB_54, eB_55, eB_72, eB_73, eB_74, eB_75, eB_76, eB_77, eB_78, eB_79, eB_80,
  eB_81, eB_82, eB_83, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_96,
  eB_98, eB_101, eB_104, eB_106, eB_109, eB_112, eB_115, eB_118, eB_121, eB_124, eB_127, eB_130, eB_133, eB_134, eB_135, eB_139,
  eB_140, eB_142, eB_143, eB_145, eB_146, eB_147, eB_148, eB_149, eB_151, eB_152, eB_154, eB_155, eB_157, eB_158, eB_168, eB_169,
  eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179, eB_180, eB_181, eB_182, eB_183, eB_208, eB_210,
  eB_211, eB_213, eB_216, eB_217, eB_218, eB_219, eB_220, eB_222, eB_223, eB_224, eB_225, eB_226, eB_228, eB_229, eB_231, eB_232,
  eB_234, eB_235, eB_237, eB_238, eB_240, eB_241, eB_243, eB_244, eB_249, eB_251, eB_252, eB_255, eB_256, eB_258, eB_259, eB_260,
  eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_308,
  eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_340,
  eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372,
  eB_385, eB_386, eB_387, eB_388, eB_389, eB_390, eB_393, eB_396, eB_397, eB_398, eB_401, eB_402, eB_404, eB_406, eB_407, eB_408,
  eB_409, eB_410, eB_412, eB_413, eB_415, eB_416, eB_418, eB_419, eB_421, eB_422, eB_427, eB_428, eB_429, eB_430, eB_431, eB_432,
  eB_433, eB_434, eB_435, eB_436, eB_437, eB_439, eB_440, eB_441, eB_442, eB_444, eB_445, eB_447, eB_449, eB_451, eB_452, eB_454,
  eB_455, eB_459, eB_460, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485, eB_504, eB_505, eB_506, eB_507, eB_508,
  eB_509, eB_510, eB_511, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537, eB_538, eB_539, eB_540,
  eB_541, eB_542, eB_543, eB_544, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_585, eB_586, eB_587, eB_588,
  eB_589, eB_590, eB_591, eB_592, eB_609, eB_612, eB_615, eB_618, eB_619, eB_620, eB_621, eB_622, eB_623, eB_624, eB_625, eB_626,
  eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_653, eB_654, eB_655, eB_656, eB_657, eB_658,
  eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674,
  eB_675, eB_676, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714,
  eB_715, eB_716, eB_717, eB_718, eB_719, eB_720, eB_721, eB_722, eB_723, eB_724, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738,
  eB_739, eB_740, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_765, eB_766, eB_767, eB_768, eB_769, eB_770,
  eB_771, eB_772, eB_773, eB_780, eB_781, eB_782, eB_783, eB_786, eB_787, eB_792, eB_793, eB_794, eB_795, eB_796, eB_797, eB_798,
  eB_799, eB_806, eB_807, eB_812, eB_813, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_824, eB_825, eB_826, eB_827, eB_828,
  eB_829, eB_832, eB_833, eB_834, eB_835, eB_836, eB_837, eB_838, eB_840, eB_841, eB_856, eB_857, eB_858, eB_859, eB_862, eB_863,
  eB_872, eB_873, eB_878, eB_879, eB_882, eB_883, eB_884, eB_885, eB_888, eB_889, eB_890, eB_891, eB_892, eB_893, eB_898, eB_905,
  eB_906, eB_907, eB_908, eB_909, eB_910, eB_911, eB_919, eB_922, eB_923, eB_925, eB_927, eB_928, eB_929, eB_932, eB_935, eB_936,
  eB_937, eB_938, eB_939, eB_940, eB_949, eB_952, eB_953, eB_954, eB_955, eB_957, eB_958, eB_959, eB_960, eB_965, eB_966, eB_968,
  eB_971, eB_973, eB_975, eB_976, eB_978, eB_979, eB_981, eB_983, eB_984, eB_985, eB_988, eB_989, eB_992, eB_997, eB_1001, eB_1002,
  eB_1005, eB_1006, eB_1007, eB_1008, eB_1009, eB_1014, eB_1015, eB_1016, eB_1018, eB_1019, eB_1021, eB_1023]
theorem nbOKB_130 : nbB_130 = nbhd entsB eB_130 := by decide +kernel
theorem mkOKB_130 : mkEnt 32 1024 W rB_130 130 = eB_130 := by decide +kernel
theorem tB_130 : kTermA 4294967295 eB_130 nbB_130 = 120610599116903222949003105 := by decide +kernel


end RamseyCert
