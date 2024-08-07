@echo off
REM Set the paths
set CMAKE_PATH="C:\Program Files\CMake\bin\cmake.exe"
set SCRIPT_DIR=%~dp0
set TARGET_NAME=opencv-3.4.20
set PROJECT_DIR=%SCRIPT_DIR%..\source_codes\%TARGET_NAME%
set INSTALL_DIR=%PROJECT_DIR%\..\..\libs\%TARGET_NAME%
set VS_VERSION="Visual Studio 17 2022"

set BUILD_TYPE=%1
echo Received BUILD_TYPE: %BUILD_TYPE%

set "source_path=%SCRIPT_DIR%\..\Opencv3420CMakeLists.txt"
set "destination_path=%PROJECT_DIR%\CMakeLists.txt"

copy "%source_path%" "%destination_path%"
if errorlevel 1 (
     echo failed to change cmake file. error code: %errorlevel%
) else (
    echo chaned cmake file.
)

REM Navigate to the project directory
cd %PROJECT_DIR%

set BUILD_DIR="build_"

REM Create a build directory if it doesn't exist
if not exist %PROJECT_DIR%\%BUILD_DIR% mkdir %PROJECT_DIR%\%BUILD_DIR%
cd %PROJECT_DIR%\%BUILD_DIR%

IF EXIST CMakeCache.txt DEL /F CMakeCache.txt

REM Run CMake for the project with a custom install prefix
%CMAKE_PATH% -G %VS_VERSION% -DCMAKE_CXX_FLAGS="-MP" -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
-D CMAKE_PREFIX_PATH=%SCRIPT_DIR%\..\libs\eigen-3.4.0\share\eigen3\cmake ^
-D WITH_PROTOBUF=OFF ^
-D WITH_EIGEN=ON ^
-D WITH_TBB=ON ^
-D TBB_DIR=%SCRIPT_DIR%\..\libs\oneTBB-2021.11.0-rc1\lib\cmake\TBB ^
-D TBB_ENV_INCLUDE=%SCRIPT_DIR%\..\libs\oneTBB-2021.11.0-rc1\include ^
-D WITH_VTK=ON ^
-D BUILD_opencv_python=OFF ^
-D BUILD_opencv_python2=OFF ^
-D BUILD_opencv_python3=OFF ^
-D BUILD_JAVA=OFF ^
-D OPENCV_EXTRA_MODULES_PATH=%PROJECT_DIR%\..\opencv_contrib-3.4.20\modules ^
-D BUILD_ANDROID_PROJECTS=OFF ^
-D BUILD_EXAMPLES=OFF ^
-D BUILD_PERF_TESTS=OFF ^
-D BUILD_TESTS=OFF ^
-D BUILD_PERF_TESTS=OFF ^
-D BUILD_SHARED_LIBS=ON ^
-D BUILD_WITH_STATIC_CRT=OFF ^
-D BUILD_FAT_JAVA_LIB=OFF ^
-D OPENCV_ENABLE_NONFREE=ON ^
-D BUILD_opencv_apps=OFF ^
-D BUILD_opencv_world=ON ^
..

REM Optionally, build the project using CMake
%CMAKE_PATH% --build . --config %BUILD_TYPE%

REM Optionally, install the project to the specified install directory
%CMAKE_PATH% --install . --config %BUILD_TYPE%