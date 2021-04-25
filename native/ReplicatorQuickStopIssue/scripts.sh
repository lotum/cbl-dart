#!/usr/bin/env bash

set -e

projectDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
buildDir="$projectDir/build"

function config() {
    export CC=clang-10
    export CXX=clang++-10

    cmake \
        -B "$buildDir" \
        -G Ninja \
        -DCMAKE_C_COMPILER_LAUNCHER=ccache \
        -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
        -DCMAKE_INCLUDE_PATH=/usr/lib/llvm-10 \
        -DCMAKE_BUILD_TYPE=Debug \
        "$projectDir"
}

function build() {
    cmake --build "$buildDir"
}

function buildAndRun() {
    build
    gdb -batch -ex run -ex bt build/main
}

"$@"
