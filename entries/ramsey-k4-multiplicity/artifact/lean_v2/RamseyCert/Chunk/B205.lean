import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_205 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_5, eB_8, eB_9, eB_10, eB_11, eB_16, eB_17, eB_18, eB_19, eB_20, eB_21, eB_22,
  eB_23, eB_24, eB_25, eB_26, eB_33, eB_34, eB_35, eB_36, eB_37, eB_38, eB_39, eB_40, eB_41, eB_48, eB_49, eB_50,
  eB_51, eB_56, eB_57, eB_58, eB_59, eB_64, eB_65, eB_66, eB_67, eB_72, eB_73, eB_74, eB_75, eB_80, eB_81, eB_82,
  eB_83, eB_88, eB_89, eB_90, eB_91, eB_93, eB_164, eB_165, eB_166, eB_167, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181,
  eB_182, eB_183, eB_188, eB_189, eB_190, eB_191, eB_196, eB_197, eB_198, eB_199, eB_204, eB_205, eB_206, eB_207, eB_208, eB_209,
  eB_210, eB_211, eB_212, eB_213, eB_214, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221, eB_222, eB_223, eB_224, eB_225,
  eB_226, eB_227, eB_228, eB_229, eB_230, eB_231, eB_232, eB_233, eB_234, eB_235, eB_236, eB_237, eB_238, eB_239, eB_240, eB_241,
  eB_242, eB_243, eB_244, eB_245, eB_246, eB_247, eB_253, eB_254, eB_256, eB_257, eB_258, eB_259, eB_260, eB_261, eB_262, eB_263,
  eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294, eB_295,
  eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326, eB_327,
  eB_332, eB_333, eB_334, eB_335, eB_340, eB_342, eB_344, eB_345, eB_346, eB_347, eB_348, eB_350, eB_353, eB_354, eB_355, eB_356,
  eB_358, eB_361, eB_362, eB_363, eB_364, eB_368, eB_369, eB_370, eB_371, eB_372, eB_376, eB_377, eB_378, eB_379, eB_380, eB_381,
  eB_382, eB_383, eB_384, eB_385, eB_386, eB_423, eB_424, eB_425, eB_426, eB_431, eB_432, eB_433, eB_434, eB_441, eB_442, eB_443,
  eB_444, eB_445, eB_446, eB_457, eB_458, eB_459, eB_460, eB_461, eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477,
  eB_482, eB_483, eB_484, eB_485, eB_492, eB_493, eB_494, eB_495, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511,
  eB_516, eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_541, eB_542, eB_543, eB_544,
  eB_549, eB_550, eB_551, eB_552, eB_557, eB_558, eB_559, eB_560, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576,
  eB_581, eB_582, eB_583, eB_584, eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608,
  eB_609, eB_610, eB_611, eB_612, eB_613, eB_614, eB_615, eB_616, eB_617, eB_618, eB_619, eB_620, eB_621, eB_622, eB_623, eB_624,
  eB_625, eB_626, eB_627, eB_628, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_645, eB_646, eB_647, eB_648,
  eB_652, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_667, eB_669, eB_670, eB_671, eB_672, eB_677, eB_678,
  eB_679, eB_680, eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_700, eB_701, eB_702, eB_703, eB_704, eB_705,
  eB_709, eB_710, eB_711, eB_712, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736,
  eB_741, eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_764, eB_770, eB_771, eB_772,
  eB_773, eB_776, eB_777, eB_778, eB_779, eB_782, eB_783, eB_784, eB_785, eB_790, eB_791, eB_796, eB_797, eB_804, eB_805, eB_808,
  eB_809, eB_812, eB_813, eB_816, eB_817, eB_830, eB_831, eB_834, eB_835, eB_838, eB_839, eB_840, eB_841, eB_852, eB_853, eB_856,
  eB_857, eB_858, eB_859, eB_860, eB_861, eB_870, eB_871, eB_872, eB_873, eB_874, eB_875, eB_878, eB_879, eB_896, eB_897, eB_898,
  eB_899, eB_901, eB_904, eB_905, eB_906, eB_907, eB_910, eB_911, eB_915, eB_916, eB_920, eB_921, eB_923, eB_924, eB_925, eB_927,
  eB_930, eB_932, eB_933, eB_934, eB_937, eB_939, eB_940, eB_942, eB_943, eB_945, eB_946, eB_947, eB_948, eB_952, eB_959, eB_960,
  eB_962, eB_963, eB_964, eB_965, eB_966, eB_969, eB_970, eB_972, eB_973, eB_974, eB_977, eB_978, eB_980, eB_981, eB_982, eB_983,
  eB_986, eB_988, eB_990, eB_992, eB_995, eB_1002, eB_1004, eB_1005, eB_1006, eB_1009, eB_1010, eB_1012, eB_1015, eB_1016, eB_1018, eB_1019,
  eB_1021, eB_1022, eB_1023]
theorem nbOKB_205 : nbB_205 = nbhd entsB eB_205 := by decide +kernel
theorem mkOKB_205 : mkEnt 32 1024 W rB_205 205 = eB_205 := by decide +kernel
theorem tB_205 : kTermA 4294967295 eB_205 nbB_205 = 125725241324951984005978028 := by decide +kernel


end RamseyCert
