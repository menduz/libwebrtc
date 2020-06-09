#!/bin/bash

set -e
set -v

mkdir -p "$ARTIFACTS_DIR" || true
mkdir -p "$ARTIFACTS_DIR/lib" || true
mkdir -p "$ARTIFACTS_DIR/include" || true

cp "$BASE_DIR/build/$RELEASE_TYPE/obj/libwebrtc.a" "$ARTIFACTS_DIR/lib" || true
cp "$BASE_DIR/build/$RELEASE_TYPE/obj/pc/libpeerconnection.a" "$ARTIFACTS_DIR/lib" || true
cp "$BASE_DIR/build/$RELEASE_TYPE/obj/api/libjingle_peerconnection_api.a" "$ARTIFACTS_DIR/lib" || true

cp "$BASE_DIR/build/$RELEASE_TYPE/obj/libwebrtc.lib" "$ARTIFACTS_DIR/lib" || true
cp "$BASE_DIR/build/$RELEASE_TYPE/obj/pc/libpeerconnection.lib" "$ARTIFACTS_DIR/lib" || true
cp "$BASE_DIR/build/$RELEASE_TYPE/obj/api/libjingle_peerconnection_api.lib" "$ARTIFACTS_DIR/lib" || true

find "$BASE_DIR/build/external/libwebrtc/download/src" -name "*.h" -print | cpio -pd "$ARTIFACTS_DIR/include"

# create tar
tar -cvf artifact.tar "$ARTIFACTS_DIR"