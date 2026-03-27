#!/usr/bin/env bash
set -e

echo "Installing Flutter..."

FLUTTER_DIR="flutter_sdk"
FLUTTER_REPO="https://github.com/flutter/flutter.git"
FLUTTER_BRANCH="${FLUTTER_VERSION:-stable}"

# ===== FIX CACHE PROBLEM =====
if [ -d "$FLUTTER_DIR" ]; then
  echo "flutter_sdk already exists — removing old cache..."
  rm -rf "$FLUTTER_DIR"
fi

git clone --depth 1 --branch "$FLUTTER_BRANCH" "$FLUTTER_REPO" "$FLUTTER_DIR"

export PATH="$PATH:`pwd`/$FLUTTER_DIR/bin"

flutter doctor

flutter config --enable-web
flutter pub get
flutter build web --release