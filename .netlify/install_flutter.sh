#!/usr/bin/env bash
set -e

echo "Installing Flutter..."

FLUTTER_VERSION="3.24.0"
FLUTTER_DIR="$HOME/flutter"

if [ ! -d "$FLUTTER_DIR" ]; then
  curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz -o flutter.tar.xz
  tar xf flutter.tar.xz -C $HOME
fi

export PATH="$HOME/flutter/bin:$PATH"

flutter --version

echo "Getting packages..."
flutter pub get

echo "Building web..."
flutter build web --release