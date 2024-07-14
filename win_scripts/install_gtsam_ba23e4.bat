@echo off
REM Set the paths
set CMAKE_PATH="C:\Program Files\CMake\bin\cmake.exe"
set SCRIPT_DIR=%~dp0
set TARGET_NAME=gtsam-ba23e45
set PROJECT_DIR=%SCRIPT_DIR%..\source_codes\%TARGET_NAME%
set INSTALL_DIR=%PROJECT_DIR%\..\..\libs\%TARGET_NAME%
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

if /I "%BUILD_TYPE%"=="Debug" (
    set BUILD_DIR="build_d"
) else if /I "%BUILD_TYPE%"=="Release" (
    set BUILD_DIR="build_r"
) else (
    echo Invalid BUILD_TYPE specified. Must be Debug or Release.
    exit /b 1
)



REM Create a build directory if it doesn't exist
if not exist %PROJECT_DIR%\%BUILD_DIR% mkdir %PROJECT_DIR%\%BUILD_DIR%
cd %PROJECT_DIR%\%BUILD_DIR%

IF EXIST CMakeCache.txt DEL /F CMakeCache.txt

@REM -D GTSAM_BUILD_TESTS=OFF ^
@REM -D GTSAM_BUILD_EXAMPLES_ALWAYS=OFF ^
REM Run CMake for the project with a custom install prefix
%CMAKE_PATH% -G %VS_VERSION% -DCMAKE_CXX_FLAGS="-MP" -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
-D CMAKE_PREFIX_PATH=%SCRIPT_DIR%\..\libs\boost-1.78.0\lib\cmake;%SCRIPT_DIR%\..\libs\eigen-3.4.0\share\eigen3\cmake;%SCRIPT_DIR%\..\libs\oneTBB-2021.11.0-rc1/lib/cmake/TBB; ^
-D BUILD_SHARED_LIBS=OFF ^
-D GTSAM_BUILD_WITH_MARCH_NATIVE=OFF ^
-D GTSAM_USE_SYSTEM_EIGEN=ON ^
-D GTSAM_UNSTABLE_BUILD_PYTHON=OFF ^
-D GTSAM_TANGENT_PREINTEGRATION=ON ^
..

REM Optionally, build the project using CMake
%CMAKE_PATH% --build . --config %BUILD_TYPE%

REM Optionally, install the project to the specified install directory
%CMAKE_PATH% --install . --config %BUILD_TYPE%