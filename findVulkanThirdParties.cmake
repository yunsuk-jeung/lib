function(find_vulkan_thirdparties VULKAN_DIR)
  add_library(vulkanThirdparties INTERFACE)

  set(VULKAN_LIB_DIR ${VULKAN_DIR}/Lib)

  target_include_directories(
    vulkanThirdparties
    INTERFACE
    ${VULKAN_DIR}/include
    ${VULKAN_DIR}/include/glslang)

  file(GLOB VULKAN_DEBUG_LIBS "${VULKAN_LIB_DIR}/*d.lib")
  file(GLOB VULKAN_RELEASE_LIBS "${VULKAN_LIB_DIR}/*.lib")

  if(WIN32)
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
      foreach(LIB_FILE ${VULKAN_DEBUG_LIBS})
        get_filename_component(LIB_NAME_WE ${LIB_FILE} NAME_WE)
        string(REPLACE "-" "_" LIB_NAME ${LIB_NAME_WE})
        add_library(${LIB_NAME} STATIC IMPORTED)
        set_target_properties(${LIB_NAME} PROPERTIES IMPORTED_LOCATION ${LIB_FILE})
        target_link_libraries(vulkanThirdparties INTERFACE ${LIB_NAME})
      endforeach()
    else()
      foreach(LIB_FILE IN LISTS VULKAN_RELEASE_LIBS)
        string(REGEX MATCH ".*d\\.lib$" IS_DEBUG_LIB ${LIB_FILE})

        if(NOT IS_DEBUG_LIB)
          list(APPEND LIB_FILES_RELEASE ${LIB_FILE})
        endif()
      endforeach()

      foreach(LIB_FILE ${LIB_FILES_RELEASE})
        get_filename_component(LIB_NAME_WE ${LIB_FILE} NAME_WE)
        string(REPLACE "-" "_" LIB_NAME ${LIB_NAME_WE})
        add_library(${LIB_NAME} STATIC IMPORTED)
        set_target_properties(${LIB_NAME} PROPERTIES IMPORTED_LOCATION ${LIB_FILE})
        target_link_libraries(vulkanThirdparties INTERFACE ${LIB_NAME})
      endforeach()
    endif()
  endif()
endfunction()
