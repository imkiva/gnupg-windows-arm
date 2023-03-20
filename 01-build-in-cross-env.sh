#!/usr/bin/env bash

set -e # exit on any error
set -o pipefail

export HOME="$(dirname $(readlink -f $0))"
export BUILD="$HOME/build"
export PREFIX="$BUILD/install/gnupg"

mkdir -p "$BUILD"
mkdir -p "$PREFIX"

$HOME/02-configure-each.sh
$HOME/03-build-each.sh
