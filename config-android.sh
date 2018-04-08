#!/bin/bash

NDK=/local2/software/sdk/ndk-bundle
SYSINCLUDE=$NDK/sysroot

build_arm()
{
    SYSROOT=$NDK/platforms/android-23/arch-arm
    TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
    ARCH=arm
    PREFIX=$(pwd)/android/$ARCH
    ADDI_CFLAGS="-marm -I$NDK/sysroot/usr/include -I$NDK/sysroot/usr/include/arm-linux-androideabi"
    ./configure \
        --prefix=$PREFIX \
        --enable-shared \
        --disable-static \
        --disable-doc \
        --disable-ffmpeg \
        --disable-ffplay \
        --disable-ffprobe \
        --disable-avdevice \
        --disable-doc \
        --disable-symver \
        --target-os=linux \
        --arch=$ARCH \
        --enable-cross-compile \
        --enable-runtime-cpudetect \
        --disable-asm \
        --cc=$TOOLCHAIN/bin/arm-linux-androideabi-gcc \
        --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
        --nm=$TOOLCHAIN/bin/arm-linux-androideabi-nm \
        --disable-stripping \
        --sysroot=$SYSROOT \
        --sysinclude=$SYSINCLUDE \
        --enable-gpl \
        --enable-small \
        --disable-debug \
        --extra-cflags="-Os -fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp $ADDI_CFLAGS" \
        --extra-ldflags="$ADDI_LDFLAGS" \
        $ADDITIONAL_CONFIGURE_FLAG
}

build_x86()
{
    SYSROOT=$NDK/platforms/android-23/arch-x86
    TOOLCHAIN=$NDK/toolchains/x86-4.9/prebuilt/linux-x86_64
    ARCH=x86
    PREFIX=$(pwd)/android/$ARCH
    ADDI_CFLAGS="-I$NDK/sysroot/usr/include -I$NDK/sysroot/usr/include/i686-linux-android"
    ./configure \
        --prefix=$PREFIX \
        --enable-shared \
        --disable-static \
        --disable-doc \
        --disable-ffmpeg \
        --disable-ffplay \
        --disable-ffprobe \
        --disable-avdevice \
        --disable-doc \
        --disable-symver \
        --target-os=linux \
        --arch=$ARCH \
        --enable-cross-compile \
        --enable-runtime-cpudetect \
        --disable-asm \
        --cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
        --disable-stripping \
        --sysroot=$SYSROOT \
        --sysinclude=$SYSINCLUDE \
        --enable-gpl \
        --enable-small \
        --disable-debug \
        --extra-cflags="-Os -fPIC -DANDROID -D__thumb__ -Wfatal-errors -Wno-deprecated  $ADDI_CFLAGS" \
        --extra-ldflags="$ADDI_LDFLAGS" \
        $ADDITIONAL_CONFIGURE_FLAG
}
build_x86
