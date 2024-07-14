#!/bin/bash

copy_directory() {
    local src=$1
    local dest=$2
    mkdir -p "$dest"
    cp -r "$src"/* "$dest"
    echo "Copied $src to $dest"
}

copy_file() {
    local src=$1
    local dest=$2
    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    echo "Copied $src to $dest"
}

copy_directory "source_codes/VulkanMemoryAllocator-3.0.1/include" "libs/VulkanMemoryAllocator-3.0.1/include"
copy_file "source_codes/volk-1.3.250/volk.h" "libs/volk-1.3.250/volk.h"
copy_file "source_codes/volk-1.3.250/volk.c" "libs/volk-1.3.250/volk.c"
copy_directory "source_codes/Vulkan-Headers_1.3.250.1/include" "libs/Vulkan-Headers_1.3.250.1/include"
copy_directory "source_codes/imgui-1.90" "libs/imgui-1.90"