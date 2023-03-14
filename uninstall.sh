#!/bin/sh
#
# Uninstall all Python packages
#
# Author   : Carl van Heezik
# Revision : 1.0
# Date     : 2023-03-14
#

pip3 freeze > requirements.txt
pip3 uninstall -r requirements.txt -y