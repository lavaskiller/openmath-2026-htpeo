import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_1 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_13, eB_14, eB_15,
  eB_16, eB_17, eB_18, eB_19, eB_20, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_27, eB_28, eB_29, eB_30, eB_31,
  eB_32, eB_33, eB_34, eB_35, eB_36, eB_37, eB_38, eB_39, eB_40, eB_41, eB_42, eB_43, eB_44, eB_45, eB_46, eB_47,
  eB_48, eB_49, eB_50, eB_51, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_60, eB_61, eB_62, eB_63,
  eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75, eB_76, eB_77, eB_78, eB_79,
  eB_80, eB_81, eB_82, eB_83, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95,
  eB_96, eB_97, eB_98, eB_99, eB_100, eB_101, eB_102, eB_103, eB_104, eB_105, eB_106, eB_107, eB_108, eB_109, eB_110, eB_111,
  eB_112, eB_113, eB_114, eB_115, eB_116, eB_117, eB_118, eB_119, eB_120, eB_121, eB_122, eB_123, eB_124, eB_125, eB_126, eB_127,
  eB_128, eB_129, eB_130, eB_131, eB_132, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_139, eB_140, eB_141, eB_142, eB_143,
  eB_144, eB_145, eB_146, eB_147, eB_148, eB_149, eB_150, eB_151, eB_152, eB_153, eB_154, eB_155, eB_156, eB_157, eB_158, eB_159,
  eB_160, eB_161, eB_162, eB_163, eB_164, eB_165, eB_166, eB_167, eB_168, eB_169, eB_170, eB_171, eB_172, eB_173, eB_174, eB_175,
  eB_176, eB_177, eB_178, eB_179, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191,
  eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_200, eB_201, eB_202, eB_203, eB_204, eB_205, eB_206, eB_207,
  eB_208, eB_209, eB_210, eB_211, eB_212, eB_213, eB_214, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221, eB_222, eB_223,
  eB_224, eB_225, eB_226, eB_227, eB_228, eB_229, eB_230, eB_231, eB_232, eB_233, eB_234, eB_235, eB_236, eB_237, eB_238, eB_239,
  eB_240, eB_241, eB_242, eB_243, eB_244, eB_245, eB_246, eB_247, eB_257, eB_259, eB_260, eB_261, eB_262, eB_263, eB_264, eB_265,
  eB_266, eB_267, eB_268, eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_280, eB_281,
  eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297,
  eB_298, eB_299, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_312, eB_313,
  eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329,
  eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346,
  eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362,
  eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378,
  eB_379, eB_380, eB_382, eB_386, eB_388, eB_389, eB_395, eB_396, eB_399, eB_423, eB_424, eB_441, eB_445, eB_767, eB_770, eB_771,
  eB_774, eB_775, eB_782, eB_783, eB_784, eB_785, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_794, eB_795, eB_800, eB_801,
  eB_804, eB_805, eB_806, eB_807, eB_810, eB_811, eB_812, eB_813, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_822, eB_823,
  eB_832, eB_833, eB_834, eB_835, eB_840, eB_841, eB_846, eB_847, eB_850, eB_851, eB_860, eB_861, eB_862, eB_863, eB_864, eB_865,
  eB_866, eB_867, eB_868, eB_876, eB_877, eB_878, eB_879, eB_880, eB_881, eB_886, eB_887, eB_888, eB_889, eB_896, eB_898, eB_901,
  eB_903, eB_904, eB_905, eB_906, eB_908, eB_911, eB_913, eB_916, eB_919, eB_920, eB_921, eB_922, eB_926, eB_927, eB_928, eB_929,
  eB_931, eB_932, eB_933, eB_935, eB_937, eB_941, eB_943, eB_946, eB_949, eB_954, eB_960, eB_964, eB_967, eB_969, eB_971, eB_974,
  eB_976, eB_980, eB_984, eB_985, eB_986, eB_990, eB_993, eB_994, eB_997, eB_998, eB_1000, eB_1002, eB_1003, eB_1004, eB_1005, eB_1006,
  eB_1009, eB_1011, eB_1012, eB_1013, eB_1014, eB_1015, eB_1016, eB_1018, eB_1019, eB_1020, eB_1021, eB_1022]
theorem nbOKB_1 : nbB_1 = nbhd entsB eB_1 := by decide +kernel
theorem mkOKB_1 : mkEnt 32 1024 W rB_1 1 = eB_1 := by decide +kernel
theorem tB_1 : kTermA 4294967295 eB_1 nbB_1 = 124485155154616449596339458 := by decide +kernel


end RamseyCert
