@echo off

@echo off
powershell -File "download_libs.ps1"

set CURR_DIR=%~dp0
set BUILD_TYPE=Release

@REM cd %CURR_DIR%
@REM call win_scripts\install_eigen3_4_0.bat %BUILD_TYPE%
@REM echo Eigen Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_fmt_10_1_1.bat %BUILD_TYPE%
@REM echo install_fmt_10_1_1 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_sophus_1_22_10.bat %BUILD_TYPE%
@REM echo install_sophus_1_22_10 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_oneapi-tbb-2021_11_0_rc1.bat %BUILD_TYPE%
@REM echo install_oneapi-tbb-2021_10_0 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_spdlog1_12_0.bat %BUILD_TYPE%
@REM echo install_spdlog1_12_0 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_json3_11_2.bat %BUILD_TYPE%
@REM echo install_json3_11_2 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_opencv3_4_20.bat %BUILD_TYPE%
@REM echo install_opencv3_4_20 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_boost_1_78_0.bat %BUILD_TYPE%
@REM echo install_boost_1_78_0 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_gtsam_ba23e4.bat %BUILD_TYPE%
@REM echo install_gtsam_ba23e4 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_gflags_2_2_2.bat %BUILD_TYPE%
@REM echo install_gflags_2_2_2 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_glog_0_6_0.bat %BUILD_TYPE%
@REM echo install_glog_0_6_0 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_ceres-solver_2.2.0.bat %BUILD_TYPE%
@REM echo install_ceres-solver_2.2.0 Done!

cd %CURR_DIR%
call win_scripts\install_glfw_3_3_8.bat %BUILD_TYPE%
echo install_glfw_3_3_8 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\install_vulkan_thirdparties.bat %BUILD_TYPE%
@REM echo install_vulkan_thirdparties Done!


pause
