@echo off
REM Set the paths
set CMAKE_PATH="C:\Program Files\CMake\bin\cmake.exe"
set SCRIPT_DIR=%~dp0
set PROJECT_DIR=%SCRIPT_DIR%..\gtsam_4_2_0
set INSTALL_DIR=%PROJECT_DIR%\..\libs_win\gtsam_4_2_0
set VS_VERSION="Visual Studio 17 2022"

set BUILD_TYPE=%1
echo Received BUILD_TYPE: %BUILD_TYPE%

REM Navigate to the project directory
cd %PROJECT_DIR%

REM delete findTBB for using mine
del %PROJECT_DIR%\cmake\FindTBB.cmake

set "source_path=%SCRIPT_DIR%\gtsam420HandleTBB.cmake"
set "destination_path=%PROJECT_DIR%\cmake\HandleTBB.cmake"

copy "%source_path%" "%destination_path%"
if errorlevel 1 (
     echo failed to change cmake file. error code: %errorlevel%
) else (
    echo chaned cmake file.
)

set BUILD_DIR="build"

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
-D CMAKE_PREFIX_PATH=%SCRIPT_DIR%\..\libs_win\boost_1_78_0\lib\cmake;%SCRIPT_DIR%\..\libs_win\tbb_2021_11_0_rc1/lib/cmake/TBB;%SCRIPT_DIR%\..\libs_win\eigen3_3_7\share\eigen3\cmake; ^
-D BUILD_SHARED_LIBS=OFF ^
-D GTSAM_BUILD_TESTS=OFF ^
-D GTSAM_UNSTABLE_BUILD_PYTHON=OFF ^
-D GTSAM_TANGENT_PREINTEGRATION=OFF ^
-D GTSAM_BUILD_EXAMPLES_ALWAYS=OFF ^
..

REM Optionally, build the project using CMake
%CMAKE_PATH% --build . --config %BUILD_TYPE%

REM Optionally, install the project to the specified install directory
%CMAKE_PATH% --install . --config %BUILD_TYPE%