#!/bin/bash

# Set the current directory
CURR_DIR=$(dirname "$(realpath "$0")")
BUILD_TYPE=Release

# # Execute the PowerShell script
bash "$CURR_DIR/download_libs.sh"

# # Uncomment and modify the lines below to execute other installation scripts as needed
cd "$CURR_DIR"
bash ubuntu_scripts/install_eigen3_4_0.sh $BUILD_TYPE
echo "Eigen Done!"

cd "$CURR_DIR"
bash ubuntu_scripts/install_fmt_10_1_1.sh $BUILD_TYPE
echo "install_fmt_10_1_1 Done!"

cd "$CURR_DIR"
bash ubuntu_scripts/install_sophus_1_22_10.sh $BUILD_TYPE
echo "install_sophus_1_22_10 Done!"

cd "$CURR_DIR"
bash ubuntu_scripts/install_oneapi-tbb-2021_11_0_rc1.sh $BUILD_TYPE
echo "install_oneapi-tbb-2021_11_0_rc1 Done!"

cd "$CURR_DIR"
bash ubuntu_scripts/install_spdlog1_12_0.sh $BUILD_TYPE
echo "install_spdlog1_12_0 Done!"

cd "$CURR_DIR"
bash ubuntu_scripts/install_json3_11_2.sh $BUILD_TYPE
echo "install_json3_11_2 Done!"

cd "$CURR_DIR"
bash ubuntu_scripts/install_opencv3_4_20.sh $BUILD_TYPE
echo "install_opencv3_4_20 Done!"

# cd "$CURR_DIR"
# bash ubuntu_scripts/install_boost_1_78_0.sh $BUILD_TYPE
# echo "install_boost_1_78_0 Done!"

# cd "$CURR_DIR"
# bash ubuntu_scripts/install_gtsam_ba23e4.sh $BUILD_TYPE
# echo "install_gtsam_ba23e4 Done!"

# cd "$CURR_DIR"
# bash ubuntu_scripts/install_gflags_2_2_2.sh $BUILD_TYPE
# echo "install_gflags_2_2_2 Done!"

# cd "$CURR_DIR"
# bash ubuntu_scripts/install_glog_0_6_0.sh $BUILD_TYPE
# echo "install_glog_0_6_0 Done!"

# cd "$CURR_DIR"
# bash ubuntu_scripts/install_ceres-solver_2_2_0.sh $BUILD_TYPE
# echo "install_ceres-solver_2_2_0 Done!"

cd "$CURR_DIR"
bash ubuntu_scripts/install_glfw_3_3_8.sh $BUILD_TYPE
echo "install_glfw_3_3_8 Done!"

cd "$CURR_DIR"
bash ubuntu_scripts/install_vulkan_1.3.250.sh $BUILD_TYPE
echo "install_vulkan_1.3.250 Done!"

cd "$CURR_DIR"
bash ubuntu_scripts/install_vulkan_thirdparties.sh $BUILD_TYPE
echo "install_vulkan_thirdparties Done!"

echo -e "\nPress any key to continue..."
read -n1 -s