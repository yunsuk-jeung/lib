function(find_vulkan_thirdparties VULKAN_DIR)
  add_library(vulkanThirdparties INTERFACE)

  if(WIN32)
    set(VULKAN_LIB_DIR ${VULKAN_DIR}/Lib)

    target_include_directories(
      vulkanThirdparties
      INTERFACE
      ${VULKAN_DIR}/include
      ${VULKAN_DIR}/include/glslang)

    set(VULKAN_DEBUG_LIBS
      ${VULKAN_LIB_DIR}/glslangd.lib
      ${VULKAN_LIB_DIR}/glslang-default-resource-limitsd.lib
      ${VULKAN_LIB_DIR}/SPIRVd.lib
      ${VULKAN_LIB_DIR}/HLSLd.lib
      ${VULKAN_LIB_DIR}/MachineIndependentd.lib
      ${VULKAN_LIB_DIR}/GenericCodeGend.lib
      ${VULKAN_LIB_DIR}/SPVRemapperd.lib
      ${VULKAN_LIB_DIR}/OSDependentd.lib
      ${VULKAN_LIB_DIR}/OGLCompilerd.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools-diffd.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools-optd.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools-linkd.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools-reduced.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools-lintd.lib
      ${VULKAN_LIB_DIR}/SPIRV-Toolsd.lib
      ${VULKAN_LIB_DIR}/spirv-cross-cored.lib
      ${VULKAN_LIB_DIR}/spirv-cross-utild.lib
      ${VULKAN_LIB_DIR}/spirv-cross-reflectd.lib
      ${VULKAN_LIB_DIR}/spirv-cross-glsld.lib
      ${VULKAN_LIB_DIR}/spirv-cross-hlsld.lib
      ${VULKAN_LIB_DIR}/spirv-cross-msld.lib
      ${VULKAN_LIB_DIR}/spirv-cross-cd.lib
      ${VULKAN_LIB_DIR}/spirv-cross-cppd.lib)

    set(VULKAN_RELEASE_LIBS
      ${VULKAN_LIB_DIR}/glslang.lib
      ${VULKAN_LIB_DIR}/glslang-default-resource-limits.lib
      ${VULKAN_LIB_DIR}/SPIRV.lib
      ${VULKAN_LIB_DIR}/HLSL.lib
      ${VULKAN_LIB_DIR}/MachineIndependent.lib
      ${VULKAN_LIB_DIR}/GenericCodeGen.lib
      ${VULKAN_LIB_DIR}/SPVRemapper.lib
      ${VULKAN_LIB_DIR}/OSDependent.lib
      ${VULKAN_LIB_DIR}/OGLCompiler.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools-diff.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools-opt.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools-link.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools-reduce.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools-lint.lib
      ${VULKAN_LIB_DIR}/SPIRV-Tools.lib
      ${VULKAN_LIB_DIR}/spirv-cross-core.lib
      ${VULKAN_LIB_DIR}/spirv-cross-util.lib
      ${VULKAN_LIB_DIR}/spirv-cross-reflect.lib
      ${VULKAN_LIB_DIR}/spirv-cross-glsl.lib
      ${VULKAN_LIB_DIR}/spirv-cross-hlsl.lib
      ${VULKAN_LIB_DIR}/spirv-cross-msl.lib
      ${VULKAN_LIB_DIR}/spirv-cross-c.lib
      ${VULKAN_LIB_DIR}/spirv-cross-cpp.lib)

    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
      foreach(LIB_FILE ${VULKAN_DEBUG_LIBS})
        get_filename_component(LIB_NAME_WE ${LIB_FILE} NAME_WE)
        string(REPLACE "-" "_" LIB_NAME ${LIB_NAME_WE})
        add_library(${LIB_NAME} STATIC IMPORTED)
        set_target_properties(${LIB_NAME} PROPERTIES IMPORTED_LOCATION ${LIB_FILE})
        target_link_libraries(vulkanThirdparties INTERFACE ${LIB_NAME})
      endforeach()
    else()
      # foreach(LIB_FILE IN LISTS VULKAN_RELEASE_LIBS)
      # string(REGEX MATCH ".*d\\.lib$" IS_DEBUG_LIB ${LIB_FILE})

      # if(NOT IS_DEBUG_LIB)
      # list(APPEND LIB_FILES_RELEASE ${LIB_FILE})
      # endif()
      # endforeach()
      foreach(LIB_FILE ${LIB_FILES_RELEASE})
        get_filename_component(LIB_NAME_WE ${LIB_FILE} NAME_WE)
        string(REPLACE "-" "_" LIB_NAME ${LIB_NAME_WE})
        add_library(${LIB_NAME} STATIC IMPORTED)
        set_target_properties(${LIB_NAME} PROPERTIES IMPORTED_LOCATION ${LIB_FILE})
        target_link_libraries(vulkanThirdparties INTERFACE ${LIB_NAME})
      endforeach()
    endif()
  else()
    set(VULKAN_LIB_DIR ${VULKAN_DIR}/lib)

    target_include_directories(
      vulkanThirdparties
      INTERFACE
      ${VULKAN_DIR}/include
      ${VULKAN_DIR}/include/glslang)

    set(VULKAN_RELEASE_LIBS
      ${VULKAN_LIB_DIR}/libglslang.a
      ${VULKAN_LIB_DIR}/libglslang-default-resource-limits.a
      ${VULKAN_LIB_DIR}/libSPIRV.a
      ${VULKAN_LIB_DIR}/libHLSL.a
      ${VULKAN_LIB_DIR}/libMachineIndependent.a
      ${VULKAN_LIB_DIR}/libGenericCodeGen.a
      ${VULKAN_LIB_DIR}/libSPVRemapper.a
      ${VULKAN_LIB_DIR}/libOSDependent.a
      ${VULKAN_LIB_DIR}/libOGLCompiler.a
      ${VULKAN_LIB_DIR}/libSPIRV-Tools-diff.a
      ${VULKAN_LIB_DIR}/libSPIRV-Tools-opt.a
      ${VULKAN_LIB_DIR}/libSPIRV-Tools-link.a
      ${VULKAN_LIB_DIR}/libSPIRV-Tools-reduce.a
      ${VULKAN_LIB_DIR}/libSPIRV-Tools-lint.a
      ${VULKAN_LIB_DIR}/libSPIRV-Tools.a
      ${VULKAN_LIB_DIR}/libspirv-cross-core.a
      ${VULKAN_LIB_DIR}/libspirv-cross-util.a
      ${VULKAN_LIB_DIR}/libspirv-cross-reflect.a
      ${VULKAN_LIB_DIR}/libspirv-cross-glsl.a
      ${VULKAN_LIB_DIR}/libspirv-cross-hlsl.a
      ${VULKAN_LIB_DIR}/libspirv-cross-msl.a
      ${VULKAN_LIB_DIR}/libspirv-cross-c.a
      ${VULKAN_LIB_DIR}/libspirv-cross-cpp.a)

    foreach(LIB_FILE ${VULKAN_RELEASE_LIBS})
      get_filename_component(LIB_NAME_WE ${LIB_FILE} NAME_WE)
      string(REPLACE "-" "_" LIB_NAME ${LIB_NAME_WE})
      add_library(${LIB_NAME} STATIC IMPORTED)
      set_target_properties(${LIB_NAME} PROPERTIES IMPORTED_LOCATION ${LIB_FILE})
      target_link_libraries(vulkanThirdparties INTERFACE ${LIB_NAME})
    endforeach()
  endif()
endfunction()
