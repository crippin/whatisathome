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
./flutter/bin/flutter doctor

if [ $TRAVIS_BRANCH = 'flutter_web' ]; then

    ./flutter/bin/flutter channel dev
    ./flutter/bin/flutter pub global activate webdev

fi

./flutter/bin/flutter pub get