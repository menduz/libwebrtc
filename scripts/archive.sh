#!/bin/bash

set -e
set -v

mkdir -p "$ARTIFACTS_DIR" || true
mkdir -p "$ARTIFACTS_DIR/lib" || true
mkdir -p "$ARTIFACTS_DIR/include" || true

cd "$(pwd)/build/external/libwebrtc/download/src"
find . -name "*.h" -print | cpio -pd "$ARTIFACTS_DIR/include"

cp "$BASE_DIR/build/$RELEASE_TYPE/obj/libwebrtc.a" "$ARTIFACTS_DIR/lib"

# create tar
cd "$ARTIFACTS_DIR"
tar -cvf artifact.tar lib include