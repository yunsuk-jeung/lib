echo ##################### TBB ########################### 

PowerShell -Command wget -Uri https://github.com/oneapi-src/oneTBB/releases/download/v2021.10.0/oneapi-tbb-2021.10.0-win.zip -OutFile tbb.zip
PowerShell -Command Expand-Archive -Path tbb.zip
PowerShell -Command Move-Item -Path tbb\oneapi-tbb-2021.10.0 -Destination oneapi-tbb-2021.10.0
PowerShell -Command Remove-Item -LiteralPath tbb -Force -Recurse

@REM PowerShell -Command Remove-Item -LiteralPath tbb.zip

@REM boost_1_78_0
@REM eigen_3_3_7

@REM gflags_2_2_2

@REM glog_0_6_0
@REM PowerShell -Command wget -Uri 'https://github.com/google/glog/archive/refs/tags/v0.6.0.tar.gz' -OutFile 'glog_0_6_0.tar.gz'
@REM PowerShell -Command tar -xzf glog_0_6_0.tar.gz

@REM ceres_2_2_0
@REM PowerShell -Command wget -Uri 'http://ceres-solver.org/ceres-solver-2.2.0.tar.gz' -OutFile 'ceres-solver-2.2.0.tar.gz'
@REM PowerShell -Command tar -xzf ceres-solver-2.2.0.tar.gz

@REM gtsam 420 -> 얘는 release path 없음

@REM gtsam devel_ba23e45... -> 얘는 release path 없음

@REM json

@REM opencv contriv

@REM opencv3420

@REM spdlog






pause