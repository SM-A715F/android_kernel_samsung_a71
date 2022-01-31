#!/bin/bash

export ARCH=arm64
export CLANG=$HOME/clang
mkdir out


make O=out ARCH=arm64 a71_defconfig

make -j8 O=out \
			ARCH=arm64 SUBARCH=arm64 \
			DTC_EXT=$HOME/kernel/tools/dtc \
			CC=${CLANG}/bin/clang \
			CROSS_COMPILE=${CLANG}/bin/aarch64-linux-gnu- \
			LD=${CLANG}/bin/ld.lld
			AR=${CLANG}/bin/llvm-ar  \
			NM=${CLANG}/bin/llvm-nm \
			OBJCOPY=${CLANG}/bin/llvm-objcopy \
			OBJDUMP=${CLANG}/bin/llvm-objdump \
			STRIP=${CLANG}/bin/llvm-strip