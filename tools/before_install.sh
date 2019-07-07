#!/bin/bash

export PATH="$PATH":"$HOME/.pub-cache/bin"

if [ $TRAVIS_OS_NAME = 'osx' ]; then

    pip install six
    brew update
    brew uninstall --ignore-dependencies libimobiledevice
    brew uninstall --ignore-dependencies usbmuxd
    brew install --HEAD usbmuxd
    brew install --HEAD libimobiledevice
    brew install ideviceinstaller
    brew install ios-deploy

fi

git clone https://github.com/flutter/flutter.git -b $FLUTTER_VERSION

case $TRAVIS_BRANCH in
    flutter_web)
        ./flutter/bin/flutter channel dev
        ./flutter/bin/flutter pub global activate webdev
        ;;
    flutter_desktop)
        ./flutter/bin/flutter channel master
        ./flutter/bin/flutter upgrade
        ;;
    *)
        ;;
esac

./flutter/bin/flutter pub get