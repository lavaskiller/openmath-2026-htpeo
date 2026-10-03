import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_784 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_12, eR_17, eR_18, eR_19, eR_20, eR_22, eR_24, eR_26, eR_30, eR_31, eR_32, eR_33,
  eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_45, eR_46, eR_47, eR_52, eR_53, eR_54, eR_55, eR_60,
  eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_84, eR_85, eR_86, eR_87, eR_89,
  eR_90, eR_91, eR_97, eR_98, eR_99, eR_103, eR_104, eR_105, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_118, eR_119,
  eR_120, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_136, eR_137, eR_138, eR_151, eR_152, eR_153,
  eR_157, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_184,
  eR_185, eR_187, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_203, eR_208, eR_209, eR_210, eR_215, eR_216, eR_217, eR_218,
  eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229, eR_236, eR_237, eR_238, eR_239, eR_240,
  eR_241, eR_248, eR_249, eR_250, eR_252, eR_253, eR_256, eR_257, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269,
  eR_270, eR_271, eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301,
  eR_302, eR_303, eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337,
  eR_338, eR_339, eR_340, eR_341, eR_342, eR_343, eR_344, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369,
  eR_370, eR_371, eR_372, eR_377, eR_378, eR_379, eR_380, eR_385, eR_386, eR_387, eR_389, eR_391, eR_392, eR_393, eR_394, eR_395,
  eR_396, eR_397, eR_399, eR_400, eR_401, eR_402, eR_403, eR_404, eR_408, eR_409, eR_410, eR_414, eR_415, eR_416, eR_420, eR_421,
  eR_422, eR_423, eR_425, eR_432, eR_433, eR_434, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_441, eR_442, eR_443, eR_444,
  eR_445, eR_446, eR_447, eR_448, eR_449, eR_453, eR_454, eR_455, eR_457, eR_459, eR_460, eR_461, eR_462, eR_463, eR_464, eR_465,
  eR_470, eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_492, eR_495, eR_501, eR_502, eR_503, eR_508, eR_510, eR_511,
  eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_541, eR_542, eR_543, eR_544,
  eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570, eR_571, eR_572,
  eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_601, eR_602, eR_603, eR_604,
  eR_621, eR_623, eR_626, eR_628, eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_649, eR_650, eR_651, eR_652, eR_657,
  eR_658, eR_659, eR_660, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685,
  eR_686, eR_687, eR_688, eR_697, eR_698, eR_699, eR_700, eR_702, eR_703, eR_704, eR_713, eR_715, eR_716, eR_721, eR_723, eR_724,
  eR_729, eR_730, eR_732, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_757,
  eR_758, eR_759, eR_760, eR_768, eR_769, eR_772, eR_773, eR_774, eR_775, eR_778, eR_779, eR_780, eR_782, eR_783, eR_790, eR_791,
  eR_792, eR_793, eR_796, eR_797, eR_804, eR_805, eR_810, eR_811, eR_812, eR_813, eR_814, eR_815, eR_816, eR_818, eR_819, eR_822,
  eR_823, eR_826, eR_827, eR_828, eR_829, eR_830, eR_831, eR_834, eR_835, eR_836, eR_837, eR_840, eR_841, eR_844, eR_845, eR_850,
  eR_851, eR_852, eR_853, eR_854, eR_855, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_868, eR_869, eR_872, eR_873, eR_876,
  eR_877, eR_878, eR_879, eR_890, eR_892, eR_893, eR_896, eR_897, eR_903, eR_904, eR_905, eR_906, eR_908, eR_912, eR_913, eR_914,
  eR_915, eR_917, eR_918, eR_920, eR_925, eR_927, eR_928, eR_931, eR_933, eR_935, eR_936, eR_944, eR_945, eR_946, eR_952, eR_953,
  eR_956, eR_957, eR_958, eR_959, eR_960, eR_963, eR_964, eR_965, eR_970, eR_971, eR_973, eR_975, eR_976, eR_978, eR_980, eR_981,
  eR_983, eR_984, eR_987, eR_991, eR_992, eR_993, eR_996, eR_998, eR_999, eR_1002, eR_1003, eR_1010, eR_1011, eR_1012, eR_1014, eR_1015,
  eR_1016, eR_1017, eR_1021, eR_1022]
theorem nbOKR_784 : nbR_784 = nbhd entsR eR_784 := by decide +kernel
theorem mkOKR_784 : mkEnt 32 1024 W rR_784 784 = eR_784 := by decide +kernel
theorem tR_784 : kTermA 4294967295 eR_784 nbR_784 = 92763464361287138845549776 := by decide +kernel


end RamseyCert
