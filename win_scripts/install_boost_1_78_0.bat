@echo off
REM Set the paths
set SCRIPT_DIR=%~dp0
set TARGET_NAME=boost_1_78_0
set PROJECT_DIR=%SCRIPT_DIR%..\%TARGET_NAME%
set INSTALL_DIR=%PROJECT_DIR%\..\libs_win\%TARGET_NAME%
set VS_VERSION="Visual Studio 17 2022"

set BUILD_TYPE=%1
echo Received BUILD_TYPE: %BUILD_TYPE%

if /I "%BUILD_TYPE%"=="Debug" (
    set CURR_BUILD_TYPE=debug
) else if /I "%BUILD_TYPE%"=="Release" (
    set CURR_BUILD_TYPE=release
) else (
    echo Invalid BUILD_TYPE specified. Must be Debug or Release.
    exit /b 1
)

REM Navigate to the project directory
cd %PROJECT_DIR%

call bootstrap.bat
call .\b2 --prefix=%INSTALL_DIR% toolset=msvc-14.3 variant=%CURR_BUILD_TYPE% link=static threading=multi address-model=64 runtime-link=shared install