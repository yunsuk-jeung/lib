#!/bin/bash

# Specify the desired Vulkan SDK version
VULKAN_VERSION="1.3.250.1"

# Download and install the Vulkan SDK
wget "https://sdk.lunarg.com/sdk/download/$VULKAN_VERSION/linux/vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.gz" -O vulkansdk-linux.tar.gz
mkdir -p $HOME/VulkanSDK/$VULKAN_VERSION
tar -xzf vulkansdk-linux.tar.gz -C $HOME/VulkanSDK/$VULKAN_VERSION --strip-components=1

# Set up the Vulkan SDK environment variables
echo "export VULKAN_SDK=$HOME/VulkanSDK/$VULKAN_VERSION/x86_64" >> $HOME/.bashrc
echo "export PATH=\$VULKAN_SDK/bin:\$PATH" >> $HOME/.bashrc
echo "export LD_LIBRARY_PATH=\$VULKAN_SDK/lib:\$LD_LIBRARY_PATH" >> $HOME/.bashrc
echo "export VK_ICD_FILENAMES=\$VULKAN_SDK/etc/vulkan/icd.d/nvidia_icd.json" >> $HOME/.bashrc
echo "export VK_LAYER_PATH=\$VULKAN_SDK/etc/vulkan/explicit_layer.d" >> $HOME/.bashrc

# Apply the environment variables
source $HOME/.bashrc

# Clean up
rm vulkansdk-linux.tar.gz

echo "Vulkan SDK $VULKAN_VERSION installed and environment variables set up."