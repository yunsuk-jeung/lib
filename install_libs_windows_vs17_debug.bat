@echo off

@echo off
powershell -File "download_libs.ps1"

set CURR_DIR=%~dp0
set BUILD_TYPE=Debug

@REM cd %CURR_DIR%
@REM call win_scripts\install_eigen3_4_0.bat %BUILD_TYPE%
@REM echo Eigen Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_fmt_10_1_1.bat %BUILD_TYPE%
@REM echo install_fmt_10_1_1 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_sophus_1_22_10.bat %BUILD_TYPE%
@REM echo install_sophus_1_22_10 Done!

cd %CURR_DIR%
call win_scripts\intsall_oneapi-tbb-2021_11_0_rc1.bat %BUILD_TYPE%
echo intsall_oneapi-tbb-2021_10_0 Done!

cd %CURR_DIR%
call win_scripts\intsall_spdlog1_12_0.bat %BUILD_TYPE%
echo intsall_spdlog1_12_0 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_json3_11_2.bat %BUILD_TYPE%
@REM echo intsall_json3_11_2 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_opencv3_4_20.bat %BUILD_TYPE%
@REM echo intsall_opencv3_4_20 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_boost_1_78_0.bat %BUILD_TYPE%
@REM echo install_boost_1_78_0 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_gtsam_ba23e4.bat %BUILD_TYPE%
@REM echo intsall_gtsam_ba23e4 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_gflags_2_2_2.bat %BUILD_TYPE%
@REM echo intsall_gflags_2_2_2 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_glog_0_6_0.bat %BUILD_TYPE%
@REM echo intsall_glog_0_6_0 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_ceres-solver_2.2.0.bat %BUILD_TYPE%
@REM echo intsall_ceres-solver_2.2.0 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_glfw_3_3_8.bat %BUILD_TYPE%
@REM echo intsall_glfw_3_3_8 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_vulkan_thirdparties.bat %BUILD_TYPE%
@REM echo install_vulkan_thirdparties Done!


pause
