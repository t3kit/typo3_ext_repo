#!/usr/bin/env bash

# Simple bash script to zip some extensions for TYPO3 extension repository
# https://typo3.org/extensions/repository/


# theme_t3kit_bluemountain
git clone git@github.com:t3kit/theme_t3kit_bluemountain.git
cd theme_t3kit_bluemountain
git submodule update --init --recursive
git checkout -b release
LAST_TAG1=`git describe --abbrev=0 --tags`
echo "theme_t3kit_bluemountain" $LAST_TAG1
cd Resources/Public/felayout_bluemountain
git archive -o ../../../felayout_bluemountain.zip HEAD
cd -
git rm Resources/Public/felayout_bluemountain
unzip felayout_bluemountain.zip -d Resources/Public/felayout_bluemountain
rm felayout_bluemountain.zip
git add .
git commit -am 'release'
git archive -o ../"${PWD##*/}_$LAST_TAG1.zip" HEAD
cd ..
rm -rf theme_t3kit_bluemountain
