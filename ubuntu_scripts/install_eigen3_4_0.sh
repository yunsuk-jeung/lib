#!/bin/bash

# Set the paths
SCRIPT_DIR=$(dirname "$(realpath "$0")")
TARGET_NAME="eigen-3.4.0"
PROJECT_DIR="$SCRIPT_DIR/../source_codes/$TARGET_NAME"
INSTALL_DIR="$PROJECT_DIR/../../libs/$TARGET_NAME"
VS_VERSION="Ninja"

BUILD_TYPE=$1
echo "Received BUILD_TYPE: $BUILD_TYPE"

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

cmake -G "$VS_VERSION" -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR" -DCMAKE_BUILD_TYPE="$BUILD_TYPE" \
 -DBUILD_TESTING=OFF \
 ..

NUM_CORES=$(nproc)  # 시스템의 모든 코어 사용
echo "Using $NUM_CORES cores for parallel build"

# Optionally, build the project using CMake
cmake --build . --config "$BUILD_TYPE" --parallel $NUM_CORES

# Optionally, install the project to the specified install directory
cmake --install . --config "$BUILD_TYPE"