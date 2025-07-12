#!/bin/sh

mkdir -p /keyboard/build

cd /workspace

BOARD="seeeduino_xiao_ble"
ARTIFACT_NAME="${SHIELD}.uf2"

west build -s "zmk/app" -d "build" -b "$BOARD" -- \
    -DSHIELD="$SHIELD" \
    -DZMK_CONFIG="/keyboard/config" \
    -DZMK_EXTRA_MODULES="/keyboard"

# 外に出す
cp "build/zephyr/zmk.uf2" "/keyboard/build/$ARTIFACT_NAME"
