import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_109 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_12, eB_13, eB_14, eB_16, eB_18, eB_19, eB_21, eB_23, eB_25, eB_27, eB_28, eB_30,
  eB_32, eB_33, eB_34, eB_36, eB_37, eB_39, eB_40, eB_41, eB_42, eB_43, eB_47, eB_56, eB_57, eB_58, eB_59, eB_60,
  eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75, eB_76,
  eB_77, eB_78, eB_79, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_98, eB_100, eB_102, eB_104, eB_107,
  eB_108, eB_109, eB_112, eB_116, eB_117, eB_118, eB_122, eB_123, eB_124, eB_127, eB_130, eB_136, eB_137, eB_138, eB_139, eB_140,
  eB_142, eB_143, eB_145, eB_146, eB_147, eB_148, eB_149, eB_152, eB_153, eB_154, eB_155, eB_156, eB_159, eB_160, eB_161, eB_162,
  eB_163, eB_164, eB_165, eB_166, eB_167, eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_208, eB_210, eB_212,
  eB_214, eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_225, eB_226, eB_227, eB_228, eB_229, eB_230, eB_233, eB_237, eB_238,
  eB_239, eB_240, eB_241, eB_242, eB_245, eB_246, eB_247, eB_248, eB_250, eB_251, eB_253, eB_255, eB_257, eB_259, eB_284, eB_285,
  eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_308, eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317,
  eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_340, eB_349,
  eB_350, eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378, eB_379, eB_380, eB_385,
  eB_386, eB_388, eB_390, eB_391, eB_392, eB_394, eB_395, eB_398, eB_399, eB_400, eB_402, eB_404, eB_405, eB_409, eB_410, eB_411,
  eB_415, eB_416, eB_417, eB_418, eB_420, eB_421, eB_422, eB_423, eB_425, eB_436, eB_437, eB_438, eB_439, eB_440, eB_443, eB_446,
  eB_447, eB_449, eB_450, eB_454, eB_455, eB_456, eB_457, eB_461, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485,
  eB_486, eB_487, eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501,
  eB_502, eB_503, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_536, eB_545, eB_546, eB_547, eB_548, eB_549,
  eB_550, eB_551, eB_552, eB_553, eB_554, eB_555, eB_556, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_565,
  eB_566, eB_567, eB_568, eB_585, eB_586, eB_587, eB_588, eB_589, eB_590, eB_591, eB_592, eB_610, eB_611, eB_612, eB_613, eB_614,
  eB_616, eB_617, eB_619, eB_620, eB_621, eB_622, eB_623, eB_626, eB_628, eB_637, eB_638, eB_639, eB_640, eB_641, eB_642, eB_643,
  eB_644, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674, eB_675,
  eB_676, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684, eB_693, eB_694, eB_695, eB_696, eB_697, eB_698, eB_699,
  eB_700, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739,
  eB_740, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_765, eB_766, eB_767, eB_768, eB_769, eB_776, eB_777,
  eB_778, eB_779, eB_788, eB_789, eB_792, eB_793, eB_796, eB_797, eB_800, eB_801, eB_802, eB_803, eB_804, eB_805, eB_808, eB_809,
  eB_816, eB_817, eB_820, eB_821, eB_826, eB_827, eB_828, eB_829, eB_830, eB_831, eB_832, eB_833, eB_834, eB_835, eB_838, eB_839,
  eB_848, eB_849, eB_850, eB_851, eB_854, eB_855, eB_856, eB_857, eB_861, eB_862, eB_863, eB_868, eB_869, eB_876, eB_877, eB_878,
  eB_879, eB_880, eB_881, eB_882, eB_883, eB_884, eB_885, eB_886, eB_887, eB_888, eB_889, eB_892, eB_893, eB_896, eB_899, eB_902,
  eB_904, eB_906, eB_907, eB_909, eB_910, eB_911, eB_912, eB_913, eB_915, eB_919, eB_921, eB_922, eB_925, eB_927, eB_929, eB_932,
  eB_936, eB_937, eB_938, eB_940, eB_943, eB_945, eB_946, eB_949, eB_950, eB_951, eB_953, eB_956, eB_958, eB_960, eB_963, eB_964,
  eB_965, eB_967, eB_968, eB_969, eB_974, eB_976, eB_977, eB_982, eB_983, eB_986, eB_989, eB_990, eB_992, eB_993, eB_994, eB_998,
  eB_999, eB_1001, eB_1002, eB_1003, eB_1007, eB_1010, eB_1014, eB_1015, eB_1018, eB_1021, eB_1022, eB_1023]
theorem nbOKB_109 : nbB_109 = nbhd entsB eB_109 := by decide +kernel
theorem mkOKB_109 : mkEnt 32 1024 W rB_109 109 = eB_109 := by decide +kernel
theorem tB_109 : kTermA 4294967295 eB_109 nbB_109 = 96555806801656775917426162 := by decide +kernel


end RamseyCert
