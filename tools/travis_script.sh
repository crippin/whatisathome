#!/bin/bash

case $FLUTTER_VERSION in
    stable) #Android/ios
        git checkout master
        if [ $TRAVIS_OS_NAME = 'osx' ]; then
            ./flutter/bin/flutter -v build ios --no-codesign
        else
            ./flutter/bin/flutter -v build apk
        fi
        ;;
    dev) # Web (html,js)
        git checkout flutter_web
        ./flutter/bin/flutter packages pub global run webdev build -r
        ;;
    master) # Desktop
        git checkout flutter_desktop
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