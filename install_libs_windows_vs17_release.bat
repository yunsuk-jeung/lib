@echo off

set CURR_DIR=%~dp0
set BUILD_TYPE=Release

cd %CURR_DIR%
call win_scripts\install_eigen3_3_7.bat %BUILD_TYPE%
echo Eigen Done!

cd %CURR_DIR%
call win_scripts\intsall_tbb_2021_11_0_rc1.bat %BUILD_TYPE%
echo spdlog Done!

cd %CURR_DIR%
call win_scripts\intsall_spdlog1_12_0.bat %BUILD_TYPE%
echo tbb Done!

cd %CURR_DIR%
call win_scripts\intsall_json3_11_2.bat %BUILD_TYPE%
echo tbb Done!

pause
