cmake_minimum_required(VERSION 3.18.1)

project("libs")

option(LINK_WITH_EIGEN "link with eigen" ON)
option(LINK_WITH_TBB "link with TBB" ON)
option(LINK_WITH_SPDLOG "link with SPDLOG" ON)
option(LINK_WITH_JSON "link with JSON" ON)
option(LINK_WITH_OPENCV34 "link with cv34" ON)

if(WIN32)
  set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs_win)
elseif(ANDROID)
  set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs/lib)
endif()

add_library(${PROJECT_NAME} INTERFACE)

if(LINK_WITH_EIGEN)
  add_library(eigen INTERFACE)
  target_include_directories(eigen INTERFACE ${LIB_DIR}/eigen3_3_7/include/eigen3)
  target_link_libraries(${PROJECT_NAME} INTERFACE eigen)
endif()

if(LINK_WITH_TBB)
  list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/tbb_2021_11_0_rc1/lib/cmake/TBB)
  find_package(TBB REQUIRED)
  target_link_libraries(${PROJECT_NAME} INTERFACE TBB::tbb)
endif()

if(LINK_WITH_SPDLOG)
  list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/spdlog1_12_0/lib/cmake/spdlog)
  find_package(spdlog REQUIRED)
  target_link_libraries(${PROJECT_NAME} INTERFACE spdlog::spdlog)
endif()

if(LINK_WITH_JSON)
  list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/json3_11_2/share/cmake/nlohmann_json)
  find_package(nlohmann_json REQUIRED)
  target_link_libraries(${PROJECT_NAME} INTERFACE nlohmann_json::nlohmann_json)
endif()

if(LINK_WITH_OPENCV34)
  list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/opencv3_4_20/x64/vc17/lib)
  find_package(OpenCV REQUIRED)
  target_include_directories(${PROJECT_NAME} INTERFACE ${OpenCV_INCLUDE_DIRS})
  target_link_libraries(${PROJECT_NAME} INTERFACE ${OpenCV_LIBS})
endif()