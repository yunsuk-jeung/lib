#!/bin/bash

# Function to download a file if it doesn't exist
download_file_if_not_exist() {
    local url=$1
    local file_path=$2
    local base_download_path="source_codes"
    
    if [ ! -d "$base_download_path" ]; then
        mkdir -p "$base_download_path"
    fi

    file_path="$base_download_path/$file_path"

    if [ -f "$file_path" ]; then
        echo "The file $file_path already exists."
    else
        echo "Downloading $file_path..."
        curl -L -o "$file_path" "$url"
        echo "Download completed."
    fi
}

# Function to expand a ZIP archive
expand_archive_file() {
    local file_path=$1
    local base_download_path="source_codes"
    file_path="$base_download_path/$file_path"
    first_entry=$(unzip -l "$file_path" | sed -n '4p' | awk '{print $4}')

    first_entry="$base_download_path/$first_entry"
    echo "path     : $file_path"
    echo "endtry   : $first_entry"
    echo "download : $base_download_path"

    if [ -e "$first_entry" ]; then
        echo "The file $first_entry already exists. stop expanding"
        return
    else
        echo "Expanding ZIP archive $file_path..."
        unzip -n "$file_path" -d "$base_download_path"
        echo "ZIP archive expanded."
    fi
}

echo "####################################################################"
echo "###################### TBB #########################################"
name="tbb"
url="https://github.com/oneapi-src/oneTBB/archive/refs/tags/v2021.11.0-rc1.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

# echo "####################################################################"
# echo "###################### boost #########################################"
# file_path="source_codes/boost-1.78.0"
# if [ -d "$file_path" ]; then
#     echo "The file $file_path already exists."
# else
#     echo "Downloading $file_path... by git clone"
#     git clone https://github.com/boostorg/boost.git "$file_path"
#     cd "$file_path"
#     git checkout "boost-1.78.0"
#     git submodule update --init --recursive
#     cd -
#     echo "Download completed."
# fi

echo "####################################################################"
echo "###################### eigen #########################################"
name="eigen34"
url="https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

echo "####################################################################"
echo "###################### fmt #########################################"
name="fmt"
url="https://github.com/fmtlib/fmt/archive/refs/tags/10.1.1.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

echo "####################################################################"
echo "###################### sophus #########################################"
name="sophus"
url="https://github.com/strasdat/Sophus/archive/refs/tags/1.22.10.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

# echo "####################################################################"
# echo "###################### gflags #########################################"
# name="gflags"
# url="https://github.com/gflags/gflags/archive/refs/tags/v2.2.2.zip"
# type=".zip"
# zipfile="$name$type"
# download_file_if_not_exist "$url" "$zipfile"
# expand_archive_file "$zipfile"

# echo "####################################################################"
# echo "###################### glog #########################################"
# name="glog"
# url="https://github.com/google/glog/archive/refs/tags/v0.6.0.zip"
# type=".zip"
# zipfile="$name$type"
# download_file_if_not_exist "$url" "$zipfile"
# expand_archive_file "$zipfile"

# echo "####################################################################"
# echo "###################### ceres #########################################"
# name="ceres"
# url="https://github.com/ceres-solver/ceres-solver/archive/refs/tags/2.2.0.zip"
# type=".zip"
# zipfile="$name$type"
# download_file_if_not_exist "$url" "$zipfile"
# expand_archive_file "$zipfile"

# echo "####################################################################"
# echo "###################### gtsam #########################################"
# file_path="source_codes/gtsam-ba23e45"
# if [ -d "$file_path" ]; then
#     echo "The file $file_path already exists."
# else
#     echo "Downloading $file_path... by git clone"
#     git clone https://github.com/borglab/gtsam.git "$file_path"
#     cd "$file_path"
#     git checkout "ba23e45"
#     git submodule update --init --recursive
#     cd -
#     echo "Download completed."
# fi

echo "####################################################################"
echo "########################### json ###################################"
name="json"
url="https://github.com/nlohmann/json/archive/refs/tags/v3.11.2.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

echo "####################################################################"
echo "########################### opencvcontriv3420  #####################"
name="opencvcontriv420"
url="https://github.com/opencv/opencv_contrib/archive/refs/tags/3.4.20.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

echo "####################################################################"
echo "########################### opencv3420 #############################"
name="opencv3420"
url="https://github.com/opencv/opencv/archive/refs/tags/3.4.20.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

echo "####################################################################"
echo "########################### spdlog ###################################"
name="spdlog"
url="https://github.com/gabime/spdlog/archive/refs/tags/v1.12.0.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

echo "####################################################################"
echo "########################### vma ###################################"
name="vma"
url="https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator/archive/refs/tags/v3.0.1.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

echo "####################################################################"
echo "########################### volk ###################################"
name="volk"
url="https://github.com/zeux/volk/archive/refs/tags/1.3.250.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

file_path="source_codes/Vulkan-Headers_1.3.250.1"
if [ -d "$file_path" ]; then
    echo "The file $file_path already exists."
else
    echo "Downloading $file_path... by git clone"
    git clone https://github.com/KhronosGroup/Vulkan-Headers.git "$file_path"
    cd "$file_path"
    git checkout "sdk-1.3.250.1"
    git submodule update --init --recursive
    cd -
    echo "Download completed."
fi

echo "####################################################################"
echo "########################### imgui ###################################"
name="imgui"
url="https://github.com/ocornut/imgui/archive/refs/tags/v1.90.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

echo "####################################################################"
echo "########################### glfw ###################################"
name="glfw"
url="https://github.com/glfw/glfw/archive/refs/tags/3.3.8.zip"
type=".zip"
zipfile="$name$type"
download_file_if_not_exist "$url" "$zipfile"
expand_archive_file "$zipfile"

# echo "####################################################################"
# echo "###########################  ###################################"
# name=""
# url=""
# type=".zip"
# zipfile="$name$type"
# download_file_if_not_exist "$url" "$zipfile"
# expand_archive_file "$zipfile"
