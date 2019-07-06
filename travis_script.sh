#!/bin/bash

./flutter/bin/flutter -v test

if [ $TRAVIS_OS_NAME = 'osx' ]; then

    ./flutter/bin/flutter -v build ios --no-codesign

else

    ./flutter/bin/flutter -v build apk

fi