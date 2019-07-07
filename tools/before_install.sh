#!/bin/bash

export PATH="$PATH":"$HOME/.pub-cache/bin"

git fetch --all

if [ $TRAVIS_OS_NAME = 'osx' ]; then

    pip install six
    brew update
    brew uninstall --ignore-dependencies libimobiledevice
    brew uninstall --ignore-dependencies usbmuxd
    brew install --HEAD usbmuxd
    brew install --HEAD libimobiledevice
    brew install ideviceinstaller
    brew install ios-deploy
    gem install cocoapods -v '1.6.0'

fi

git clone https://github.com/flutter/flutter.git -b $FLUTTER_VERSION

./flutter/bin/flutter pub global activate webdev
./flutter/bin/flutter upgrade
./flutter/bin/flutter pub get