#!/bin/bash

if [ $TRAVIS_BRANCH = 'flutter_web' ]; then

    ./flutter/bin/flutter packages pub global run webdev build -r

else

    if [ $TRAVIS_OS_NAME = 'osx' ]; then

        ./flutter/bin/flutter -v build ios --no-codesign

    else

        ./flutter/bin/flutter -v build apk

    fi

    ./flutter/bin/flutter -v test

fi
