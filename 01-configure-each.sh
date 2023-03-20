#!/usr/bin/env bash

set -e # exit on any error
set -o pipefail

function libgpg-error() {
  cd libgpg-error
  ./configure \
    --build=x86_64-pc-linux-gnu \
    --host=aarch64-w64-mingw32 \
    --prefix="$PREFIX" \
    --enable-static --disable-shared \
    --enable-install-gpg-error-config
  # ^ for libgpg-error newer than 1.46: https://github.com/msys2/MINGW-packages/pull/13540/files
  cd ..
}

function libgcrypt() {
  cd libgcrypt
  ./configure \
    --build=x86_64-pc-linux-gnu \
    --host=aarch64-w64-mingw32 \
    --prefix="$PREFIX" \
    --enable-static --disable-shared \
    --with-libgpg-error-prefix="$PREFIX"
  cd ..
}

function libassuan() {
  cd libassuan
  patch -p1 < ../libassuan-setenv.c.patch
  ./configure \
    --build=x86_64-pc-linux-gnu \
    --host=aarch64-w64-mingw32 \
    --prefix="$PREFIX" \
    --enable-static --disable-shared \
    --with-libgpg-error-prefix="$PREFIX"
  cd ..
}

function libksba() {
  cd libksba
  ./configure \
    --build=x86_64-pc-linux-gnu \
    --host=aarch64-w64-mingw32 \
    --prefix="$PREFIX" \
    --enable-static --disable-shared \
    --with-libgpg-error-prefix="$PREFIX"
  cd ..
}

function npth() {
  cd npth
  ./configure \
    --build=x86_64-pc-linux-gnu \
    --host=aarch64-w64-mingw32 \
    --prefix="$PREFIX" \
    --enable-static --disable-shared
  cd ..
}

function pinentry() {
  cd pinentry
  ./configure \
    --build=x86_64-pc-linux-gnu \
    --host=aarch64-w64-mingw32 \
    --prefix="$PREFIX" \
    --enable-static --disable-shared \
    --with-libgpg-error-prefix="$PREFIX" \
    --with-libassuan-prefix="$PREFIX" \
    --disable-pinentry-qt \
    --disable-pinentry-tty \
    --disable-pinentry-curses \
    --disable-fallback-curses \
    --disable-pinentry-emacs \
    --disable-pinentry-gtk2 \
    --disable-pinentry-gnome3 \
    LIBS=-lws2_32
  cd ..
}

function gnupg() {
  cd gnupg
  ./configure \
    --build=x86_64-pc-linux-gnu \
    --host=aarch64-w64-mingw32 \
    --prefix="$PREFIX" \
    --enable-static --disable-shared \
    --with-libgpg-error-prefix="$PREFIX" \
    --with-libassuan-prefix="$PREFIX" \
    --with-libgcrypt-prefix="$PREFIX"  \
    --with-libksba-prefix="$PREFIX" \
    --with-npth-prefix="$PREFIX"
  cd ..
}

libgpg-error
libgcrypt
libassuan
libksba
npth
pinentry
