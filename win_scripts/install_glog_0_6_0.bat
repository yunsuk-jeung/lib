@echo off
REM Set the paths
set CMAKE_PATH="C:\Program Files\CMake\bin\cmake.exe"
set SCRIPT_DIR=%~dp0
set TARGET_NAME=glog-0.6.0
set PROJECT_DIR=%SCRIPT_DIR%..\source_codes\%TARGET_NAME%
set INSTALL_DIR=%PROJECT_DIR%\..\..\libs\%TARGET_NAME%
set VS_VERSION="Visual Studio 17 2022"

set BUILD_TYPE=%1
echo Received BUILD_TYPE: %BUILD_TYPE%

REM Navigate to the project directory
cd %PROJECT_DIR%

set BUILD_DIR="build_"

REM Create a build directory if it doesn't exist
if not exist %PROJECT_DIR%\%BUILD_DIR% mkdir %PROJECT_DIR%\%BUILD_DIR%
cd %PROJECT_DIR%\%BUILD_DIR%

IF EXIST CMakeCache.txt DEL /F CMakeCache.txt

REM Run CMake for the project with a custom install prefix
%CMAKE_PATH% -G %VS_VERSION% -DCMAKE_CXX_FLAGS="-MP" -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
-D BUILD_SHARED_LIBS=OFF ^
-D WITH_GFLAGS=ON ^
-D WITH_GTEST=OFF ^
-D BUILD_TESTING=OFF ^
..

REM Optionally, build the project using CMake
%CMAKE_PATH% --build . --config %BUILD_TYPE%

REM Optionally, install the project to the specified install directory
%CMAKE_PATH% --install . --config %BUILD_TYPE%