#!/bin/bash

case $FLUTTER_VERSION in
    stable) #Android/ios
        if [ $TRAVIS_OS_NAME = 'osx' ]; then
            ./flutter/bin/flutter -v build ios --no-codesign
        else
            ./flutter/bin/flutter -v build apk
        fi
        ;;
    dev) # Web (html,js)
        git apply flutter_web.patch
        ./flutter/bin/flutter pub get
        ./flutter/bin/flutter packages pub global run webdev build -r
        ;;
    master) # Desktop
        git submodule update
        cp -R flutter-desktop-embedding/example/linux .
        cp -R flutter-desktop-embedding/example/macos .
        cp -R flutter-desktop-embedding/example/fonts .
        if [ $TRAVIS_OS_NAME = 'osx' ]; then
            ./flutter/bin/flutter -v build macos
        else
            ./flutter/bin/flutter -v build linux
        fi
        ;;
esac