#!/usr/bin/env bash
set -ex

autoreconf -fvi

mkdir build
pushd build
../configure \
   "--prefix=${PREFIX}" \
   "--with-flex" \
   "--with-bison"

make
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make check
fi
make install
popd
