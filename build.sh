#!/usr/bin/env bash

set -e # exit on any error
set -o pipefail

HOME="$(dirname $(readlink -f $0))"
BUILD="$HOME/build"
PREFIX="$BUILD/install/gnupg"
mkdir -p "$BUILD"
mkdir -p "$PREFIX"

cd "$BUILD"
$HOME/00-download-sources.sh
$HOME/01-configure-each.sh
$HOME/02-build-each.sh
