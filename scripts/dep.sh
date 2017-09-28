#!/usr/bin/env bash

VENDOR_DIR="vendor"
VENDOR_LIB=$VENDOR_DIR/lib

LIBGIT2_VERSION="v25"

# OpenSSL library info.
OPENSSL_BRANCH="OpenSSL_1_1_0f"
OPENSSL_SOURCE="openssl-source"
OPENSSL_STATIC="openssl"

# libssh2 library info.
LIBSSH2_BRANCH=""

echo "installing openssl"
git clone git://git.openssl.org/openssl.git $VENDOR_DIR/$OPENSSL_SOURCE -b $OPENSSL_BRANCH

pushd $VENDOR_DIR/$OPENSSL_SOURCE
./config -Wl,-rpath=$VENDOR_LIB -O3
make
make test
make install
