#!/usr/bin/env bash

cd "$PREFIX"/bin

# pinentry.exe is a symbolic link to pinentry-w32.exe, which Windows does not support.
rm pinentry.exe
mv pinentry-w32.exe pinentry.exe
