@echo off
REM Set the paths
set CMAKE_PATH="C:\Program Files\CMake\bin\cmake.exe"
set SCRIPT_DIR=%~dp0
set PROJECT_DIR=%SCRIPT_DIR%\..\ceres-solver_2.2.0
set INSTALL_DIR=%PROJECT_DIR%\..\libs_win\ceres-solver_2.2.0
set VS_VERSION="Visual Studio 17 2022"

set BUILD_TYPE=%1
echo Received BUILD_TYPE: %BUILD_TYPE%

REM Navigate to the project directory
cd %PROJECT_DIR%

set BUILD_DIR="build_"

REM Create a build directory if it doesn't exist
if not exist %PROJECT_DIR%\%BUILD_DIR% mkdir %PROJECT_DIR%\%BUILD_DIR%
cd %PROJECT_DIR%\%BUILD_DIR%

SET "gitignore_path=%PROJECT_DIR%\%BUILD_DIR%\.gitignore"
echo # Ignore everything in this directory> "%gitignore_path%"
echo *>> "%gitignore_path%"
echo .gitignore file created/overwritten successfully.

IF EXIST CMakeCache.txt DEL /F CMakeCache.txt

REM Run CMake for the project with a custom install prefix
%CMAKE_PATH% -G %VS_VERSION% -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
-D CMAKE_PREFIX_PATH=^
%SCRIPT_DIR%\..\libs_win\eigen3_3_7\share\eigen3\cmake;^
%SCRIPT_DIR%\..\libs_win\glog_0_6_0\lib\cmake\glog ^
-D MINIGLOG=OFF ^
-D GFLAGS=ON ^
-D SUITESPARSE=OFF ^
-D USE_CUDA=OFF ^
-D BUILD_TESTING=OFF ^
-D BUILD_EXAMPLES=OFF ^
-D BUILD_BENCHMARKS=OFF ^
-D BUILD_SHARED_LIBS=OFF ^
..

REM Optionally, build the project using CMake
%CMAKE_PATH% --build . --config %BUILD_TYPE%

REM Optionally, install the project to the specified install directory
%CMAKE_PATH% --install . --config %BUILD_TYPE%