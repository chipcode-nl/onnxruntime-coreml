#!/bin/sh
#
# Publish ONNX runtime with CoreML support enabled to PyPI
#
# Author   : Carl van Heezik
# Revision : 1.0
# Date     : 2023-03-14
#

# Upload to the test repository 
# python3 -m twine upload --repository testpypi dist/*

# Upload to the production repository 
python3 -m twine upload --repository pypi dist/*