#!/usr/bin/env bash

set -e # exit on any error
set -o pipefail

PREFIX="$PWD/build/gnupg"
mkdir -p "$PREFIX"

for name in libgpg-error libgcrypt libassuan libksba npth pinentry; do
  cd "$name"
  make -j$(nproc) install
  cd ..
done

# fixing pinentry.exe -> pinentry-w32.exe symbol link
cd "$PREFIX/bin"
rm pinentry.exe
mv pinentry-w32.exe pinentry.exe
