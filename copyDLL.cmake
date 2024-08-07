function(copy_tbb_dlls target EXTERNAL_LIB_DIR)
  set(TBB_BIN_DIR ${EXTERNAL_LIB_DIR}/libs/oneTBB-2021.11.0-rc1/bin)

  if(WIN32)
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
      file(GLOB TBB_DLLS "${TBB_BIN_DIR}/tbb*_debug.dll")
    else()
      file(GLOB TBB_DLLS "${TBB_BIN_DIR}/tbb*.dll")
      list(FILTER TBB_DLLS EXCLUDE REGEX ".*_debug\\.dll$")
    endif()

    add_custom_command(TARGET ${target} POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy
      ${TBB_DLLS}
      $<TARGET_FILE_DIR:${target}>)
  endif()
endfunction()

function(copy_cv34_dlls target)
  set(CV_BIN_DIR ${EXTERNAL_LIB_DIR}/libs/opencv-3.4.20/x64/vc17/bin)

  if(WIN32)
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
      file(GLOB CV_DLLS "${CV_BIN_DIR}/opencv*d.dll")
      list(APPEND CV_DLLS "${CV_BIN_DIR}/opencv_ffmpeg3420_64.dll")
    else()
      file(GLOB CV_DLLS "${CV_BIN_DIR}/opencv*.dll")
      list(FILTER CV_DLLS EXCLUDE REGEX ".*d\\.dll$")
    endif()

    add_custom_command(TARGET ${target} POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy
      ${CV_DLLS}
      $<TARGET_FILE_DIR:${target}>)
  endif()
endfunction()

function(copy_tbb_dlls_to_dir target EXTERNAL_LIB_DIR DST_DIR)
  set(TBB_BIN_DIR ${EXTERNAL_LIB_DIR}/libs/oneTBB-2021.11.0-rc1/bin)

  if(WIN32)
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
      file(GLOB TBB_DLLS "${TBB_BIN_DIR}/tbb*_debug.dll")
    else()
      file(GLOB TBB_DLLS "${TBB_BIN_DIR}/tbb*.dll")
      list(FILTER TBB_DLLS EXCLUDE REGEX ".*_debug\\.dll$")
    endif()

    add_custom_command(TARGET ${target} POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy
      ${TBB_DLLS}
      ${DST_DIR})
  endif()
endfunction()

function(copy_cv34_dlls_to_dir target EXTERNAL_LIB_DIR DST_DIR)
  set(CV_BIN_DIR ${EXTERNAL_LIB_DIR}/libs/opencv-3.4.20/x64/vc17/bin)

  if(WIN32)
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
      file(GLOB CV_DLLS "${CV_BIN_DIR}/opencv*d.dll")
      list(APPEND CV_DLLS "${CV_BIN_DIR}/opencv_ffmpeg3420_64.dll")
    else()
      file(GLOB CV_DLLS "${CV_BIN_DIR}/opencv*.dll")
      list(FILTER CV_DLLS EXCLUDE REGEX ".*d\\.dll$")
    endif()

    add_custom_command(TARGET ${target} POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy
      ${CV_DLLS}
      ${DST_DIR})
  endif()
endfunction()