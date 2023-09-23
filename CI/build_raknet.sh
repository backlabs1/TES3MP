#!/usr/bin/env bash

git clone https://github.com/DreamWeave-MP/CrabNet raknet

cd raknet

cmake . -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache

make -j3

cd -
