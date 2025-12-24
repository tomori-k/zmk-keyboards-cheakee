#!/bin/sh

set -eu

mkdir -p /keyboard/build

cd /workspace

BOARD="seeeduino_xiao_ble"
ARTIFACT_NAME="${SHIELD}.uf2"
EXTRA_FLAGS=""

# ログを有効化
if [ ${DEBUG:-0} -eq 1 ]; then
    EXTRA_FLAGS="$EXTRA_FLAGS -S zmk-usb-logging"
fi

west build -s "zmk/app" -d "build" -b "$BOARD" $EXTRA_FLAGS -- \
    -DSHIELD="$SHIELD" \
    -DZMK_CONFIG="/keyboard/zmk-config-cheakee/config" \
    -DZMK_EXTRA_MODULES="/keyboard"

# 外に出す
cp "build/zephyr/zmk.uf2" "/keyboard/build/$ARTIFACT_NAME"
