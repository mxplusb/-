#!/usr/bin/env bash

VENDOR_DIR="vendor"
VENDOR_LIB=$VENDOR_DIR/lib

# golang options.
GO=$VENDOR_DIR/go/bin/go
GOROOT=$VENDOR_DIR/go
GOPATH=$PWD/$VENDOR_DIR/golang
PATH=$PATH:$GOROOT/bin:$GOPATH/bin
CGO_CFLAGS="-g -O3"
CGO_CXXFLAGS="-g -O3"
CGO_FFLAGS="-g -O3"
CGO_LDFLAGS="-g -O3"

#echo "installing golang."

#mkdir -p $GOPATH
#wget https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
#tar -C $VENDOR_DIR/ -xzvf go1.9.linux-amd64.tar.gz
#rm go1.9.linux-amd64.tar.gz
#$GO env
#
#echo "installing go dependencies."
#$GO get -v github.com/Masterminds/glide
#$GO install -v github.com/Masterminds/glide
#glide update