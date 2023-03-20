#!/usr/bin/env bash

HOME="$(dirname $(readlink -f $0))"
BUILD="$HOME/build"

mkdir -p "$BUILD"

cd "$BUILD"
$HOME/00-download-sources.sh

SUDO=sudo

if [[ ! -x dockcross-windows-arm64 ]]; then
    $SUDO docker run --rm dockcross/windows-arm64 > ./dockcross-windows-arm64
    chmod +x ./dockcross-windows-arm64
fi

# copy scripts to the container
cp "$HOME"/*.sh "$BUILD"
cp "$HOME"/*.patch "$BUILD"

# THE BIG GAME
$SUDO ./dockcross-windows-arm64 bash /work/01-build-in-cross-env.sh
