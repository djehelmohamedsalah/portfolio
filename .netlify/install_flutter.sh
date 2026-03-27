#!/usr/bin/env bash

set -e

# use env variable or fallback
: "${FLUTTER_VERSION:=3.41.6}"

git clone --depth 1 --branch $FLUTTER_VERSION https://github.com/flutter/flutter.git /opt/flutter

export PATH="/opt/flutter/bin:$PATH"

flutter --version
flutter config --enable-web
flutter pub get
flutter build web --release