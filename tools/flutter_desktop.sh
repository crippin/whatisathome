#!/bin/bash

flutter channel master
flutter upgrade
flutter pub get
git submodule update
cp -R flutter-desktop-embedding/example/linux .
cp -R flutter-desktop-embedding/example/fonts .