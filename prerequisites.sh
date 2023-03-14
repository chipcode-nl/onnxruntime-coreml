#!/bin/sh
#
# Install prerequisites for building ONNX runtime with CoreML support
#
# Author   : Carl van Heezik
# Revision : 1.0
# Date     : 2023-03-14
#

# To build the libraries
brew install wget cmake protobuf git git-lfs

# For packaging Python package 
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade build
python3 -m pip install --upgrade twine
