#!/usr/bin/env bash

HOME="$(dirname $(readlink -f $0))"
BUILD="$HOME/build"

mkdir -p "$BUILD"

cd "$BUILD"
$HOME/00-download-sources.sh

if [[ ! -x dockcross-windows-arm64 ]]; then
    sudo docker run --rm dockcross/windows-arm64 > ./dockcross-windows-arm64
    chmod +x ./dockcross-windows-arm64
fi

./dockcross-windows-arm64 bash /work/01-build-in-cross-env.sh
