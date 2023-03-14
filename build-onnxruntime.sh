#!/bin/sh
#
# Build ONNX runtime with CoreML support enabled
#
# The Microsoft build script can't handle spaces in the paths.
# So we must run this script from a local drive
#
# Author   : Carl van Heezik
# Revision : 1.0
# Date     : 2023-03-14
#

echo "Building ONNX runtime + CoreML with $(python3 --version)"

# Build the latest version 
version_tag="v1.13.1"

root_dir=$(pwd)
onnx_dir="$root_dir/onnx.tmp"
dist_dir="$root_dir/dist"

# Cleanup
rm -rf $onnx_dir

# Download the correct version from the Microsoft branch 
git clone --recurse-submodules --depth 1 --branch $version_tag https://github.com/microsoft/onnxruntime.git $onnx_dir

cd "$onnx_dir"
# Install Python dependencies
pip3 install -r requirements-dev.txt

# Run the Microsoft build scripts 
# See https://onnxruntime.ai/docs/build/ios.html
./build.sh --clean
./build.sh --skip-keras-test --skip_tests --config "Release" --parallel 8 --enable_pybind --build_wheel --wheel_name_suffix=-coreml --osx_arch "arm64" --apple_deploy_target 11 --use_coreml

# Copy to dist
mkdir -p "$dist_dir"
cp -a ./build/MacOS/Release/dist/*.whl "$dist_dir"
cp ./LICENSE "$root_dir"
# cp ./README.md "$root_dir"

# Cleanup
rm -rf $onnx_dir
