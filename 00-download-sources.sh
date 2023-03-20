#!/usr/bin/env bash

set -e # exit on any error
set -o pipefail

curl https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.0.tar.bz2          | tar jxvf -
curl https://gnupg.org/ftp/gcrypt/gpgrt/libgpg-error-1.46.tar.bz2    | tar jxvf -
curl https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.1.tar.bz2 | tar jxvf -
curl https://gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.5.tar.bz2  | tar jxvf -
curl https://gnupg.org/ftp/gcrypt/libksba/libksba-1.6.3.tar.bz2      | tar jxvf -
curl https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2              | tar jxvf -
curl https://gnupg.org/ftp/gcrypt/pinentry/pinentry-1.2.1.tar.bz2    | tar jxvf -


mv gnupg-2.4.0/        gnupg/
mv libgpg-error-1.46/  libgpg-error/
mv libgcrypt-1.10.1/   libgcrypt/
mv libassuan-2.5.5/    libassuan/
mv libksba-1.6.3/      libksba/
mv npth-1.6/           npth/
mv pinentry-1.2.1/     pinentry/
