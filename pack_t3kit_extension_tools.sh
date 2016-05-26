#!/usr/bin/env bash

# Simple bash script to zip some extensions for TYPO3 extension repository
# https://typo3.org/extensions/repository/

# t3kit_extension_tools
git clone git@github.com:t3kit/t3kit_extension_tools.git
cd t3kit_extension_tools
LAST_TAG2=`git describe --abbrev=0 --tags`
echo "t3kit_extension_tools" $LAST_TAG2
git archive -o ../"${PWD##*/}_$LAST_TAG2.zip" HEAD
cd ..
rm -rf t3kit_extension_tools
