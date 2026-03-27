#!/usr/bin/env bash

set -e

echo "Installing Flutter..."

# use version from netlify.toml
: "${FLUTTER_VERSION:=3.41.6}"

# install inside repo (allowed path)
git clone --depth 1 --branch $FLUTTER_VERSION https://github.com/flutter/flutter.git flutter_sdk

export PATH="$PWD/flutter_sdk/bin:$PATH"

flutter --version

flutter config --enable-web

echo "Getting dependencies..."
flutter pub get

echo "Building web..."
flutter build web --release