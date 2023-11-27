cmake_minimum_required(VERSION 3.18.1)

project("libs")

if(WIN32)
  set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs_win)
elseif(ANDROID)
  set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs/lib)
endif()

add_library(${PROJECT_NAME} INTERFACE)

target_include_directories(${PROJECT_NAME} INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/utils)

list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/json-3.11.2/share/cmake/nlohmann_json)
find_package(nlohmann_json REQUIRED)
target_link_libraries(${PROJECT_NAME} INTERFACE nlohmann_json::nlohmann_json)

list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/fmt-10.1.1/lib/cmake/fmt)
find_package(fmt REQUIRED)
target_link_libraries(${PROJECT_NAME} INTERFACE fmt::fmt)

list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/spdlog-1.12.0/lib/cmake/spdlog)
find_package(spdlog REQUIRED)
target_link_libraries(${PROJECT_NAME} INTERFACE spdlog::spdlog)

list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/eigen-3.4.0/share/eigen3/cmake)
find_package(Eigen3 REQUIRED)
target_link_libraries(${PROJECT_NAME} INTERFACE Eigen3::Eigen)

list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/Sophus-1.22.10/share/sophus/cmake)
find_package(Sophus REQUIRED)
target_link_libraries(${PROJECT_NAME} INTERFACE Sophus::Sophus)

list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/oneTBB-2021.11.0-rc1/lib/cmake/TBB)
find_package(TBB REQUIRED)
target_link_libraries(${PROJECT_NAME} INTERFACE TBB::tbb)

list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/opencv-3.4.20/x64/vc17/lib)
find_package(OpenCV REQUIRED)
target_include_directories(${PROJECT_NAME} INTERFACE ${OpenCV_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} INTERFACE ${OpenCV_LIBS})

list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/gflags-2.2.2/lib/cmake/gflags)
list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/glog-0.6.0/lib/cmake/glog)
list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/ceres-solver-2.2.0/lib/cmake/Ceres)
find_package(Ceres REQUIRED)
target_link_libraries(${PROJECT_NAME} INTERFACE ceres)

set(FOUND_LIBS TRUE)