#!/bin/bash

# Set the paths
SCRIPT_DIR=$(dirname "$(realpath "$0")")
TARGET_NAME="opencv-3.4.20"
PROJECT_DIR="$SCRIPT_DIR/../source_codes/$TARGET_NAME"
INSTALL_DIR="$PROJECT_DIR/../../libs/$TARGET_NAME"
EIGEN_DIR="$SCRIPT_DIR/../libs/eigen-3.4.0/share/eigen3/cmake"
TBB_DIR="$SCRIPT_DIR/../libs/oneTBB-2021.11.0-rc1/lib/cmake/TBB"
TBB_INCLUDE_DIR="$SCRIPT_DIR/../libs/oneTBB-2021.11.0-rc1/include"
OPENCV_CONTRIB_MODULES_PATH="$PROJECT_DIR/../opencv_contrib-3.4.20/modules"

BUILD_TYPE=$1
echo "Received BUILD_TYPE: $BUILD_TYPE"

SOURCE_PATH="$SCRIPT_DIR/../Opencv3420CMakeLists.txt"
DESTINATION_PATH="$PROJECT_DIR/CMakeLists.txt"

if cp "$SOURCE_PATH" "$DESTINATION_PATH"; then
    echo "Changed CMake file."
else
    echo "Failed to change CMake file. Error code: $?"
    exit 1
fi

# Navigate to the project directory
cd "$PROJECT_DIR" || exit 1

BUILD_DIR="build_"

# Create a build directory if it doesn't exist
if [ ! -d "$PROJECT_DIR/$BUILD_DIR" ]; then
    mkdir "$PROJECT_DIR/$BUILD_DIR"
fi

cd "$PROJECT_DIR/$BUILD_DIR" || exit 1

if [ -f CMakeCache.txt ]; then
    rm -f CMakeCache.txt
fi


# Run CMake for the project with a custom install prefix
cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR" -DCMAKE_BUILD_TYPE="$BUILD_TYPE" \
-DCMAKE_PREFIX_PATH="$EIGEN_DIR" \
-DWITH_PROTOBUF=OFF \
-DWITH_EIGEN=ON \
-DWITH_TBB=ON \
-DTBB_DIR="$TBB_DIR" \
-DTBB_ENV_INCLUDE="$TBB_INCLUDE_DIR" \
-DWITH_VTK=ON \
-DBUILD_opencv_python=OFF \
-DBUILD_opencv_python2=OFF \
-DBUILD_opencv_python3=OFF \
-DBUILD_JAVA=OFF \
-DOPENCV_EXTRA_MODULES_PATH="$OPENCV_CONTRIB_MODULES_PATH" \
-DBUILD_ANDROID_PROJECTS=OFF \
-DBUILD_EXAMPLES=OFF \
-DBUILD_PERF_TESTS=OFF \
-DBUILD_TESTS=OFF \
-DBUILD_SHARED_LIBS=ON \
-DBUILD_WITH_STATIC_CRT=OFF \
-DBUILD_FAT_JAVA_LIB=OFF \
-DOPENCV_ENABLE_NONFREE=ON \
-DBUILD_opencv_apps=OFF \
-DBUILD_opencv_world=ON \
..

NUM_CORES=$(nproc)  # 시스템의 모든 코어 사용
echo "Using $NUM_CORES cores for parallel build"

# Optionally, build the project using CMake
cmake --build . --config "$BUILD_TYPE" --parallel $NUM_CORES

# Optionally, install the project to the specified install directory
cmake --install . --config "$BUILD_TYPE"