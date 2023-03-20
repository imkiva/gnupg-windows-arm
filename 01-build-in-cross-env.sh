#!/usr/bin/env bash

set -e # exit on any error
set -o pipefail

export HOME="$(dirname $(readlink -f $0))"
export PREFIX="$HOME/install/gnupg"

mkdir -p "$PREFIX"

$HOME/02-build-each.sh
$HOME/03-fix-path.sh
