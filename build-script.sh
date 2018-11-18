#!/bin/bash

NDK=/home/yuanping/Software/NDK/android-ndk-r15c
SYSROOT=$NDK/platforms/android-19/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
function build_one
{
./configure \
--prefix=$PREFIX \
--enable-shared \
--disable-static \
--disable-doc \
--disable-ffplay \
--disable-ffprobe \
--disable-doc \
--disable-symver \
--disable-parsers \
--disable-protocols \
--disable-indevs \
--disable-muxers \
--disable-demuxers \
--disable-hwaccels \
--disable-decoders \
--disable-encoders \
--enable-protocol=concat \
--enable-protocol=file \
--enable-protocol=http \
--enable-muxer=mp4 \
--enable-muxer=h264 \
--enable-muxer=gif \
--enable-demuxer=mpegts \
--enable-demuxer=gif \
--enable-decoder=h264 \
--enable-decoder=gif \
--enable-decoder=vp8 \
--enable-encoder=png \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--extra-ldflags="$ADDI_LDFLAGS" \
$ADDITIONAL_CONFIGURE_FLAG
make clean all
make -j3
make install
}
CPU=arm
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="-marm"
build_one
