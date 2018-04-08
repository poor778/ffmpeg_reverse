#!/bin/bash

build_linux()
{
    ARCH=x86_64
    PREFIX=$(pwd)/linux/$ARCH
    ./configure \
        --prefix=$PREFIX \
        --enable-shared \
        --disable-static \
        --target-os=linux \
        --arch=$ARCH \
        --disable-stripping \
}
build_linux
