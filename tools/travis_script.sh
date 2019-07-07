#!/bin/bash

case $TRAVIS_BRANCH in
    flutter_web)
        ./flutter/bin/flutter packages pub global run webdev build -r
        ;;
    flutter_desktop)
        git submodule update
        cp -R flutter-desktop-embedding/example/linux .
        cp -R flutter-desktop-embedding/example/fonts .
        if [ $TRAVIS_OS_NAME = 'osx' ]; then
            ./flutter/bin/flutter -v build macosx
        else
            ./flutter/bin/flutter -v build linux
        fi
        ;;
    *)
        if [ $TRAVIS_OS_NAME = 'osx' ]; then
            ./flutter/bin/flutter -v build ios --no-codesign
        else
            ./flutter/bin/flutter -v build apk
        fi
        ./flutter/bin/flutter -v test
        ;;
esac