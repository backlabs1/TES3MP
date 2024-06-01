#!/usr/bin/env zsh
set -e
. ./_common.sh

pushd "$TES3MP_SRC"

mkdir -p build
pushd build
cmake \
    -DBUILD_BSATOOL=OFF \
    -DBUILD_ESMTOOL=OFF \
    -DBUILD_ESSIMPORTER=OFF \
    -DBUILD_NIFTEST=OFF \
    -DBUILD_OPENCS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER="$CXX_NO_SCCACHE" \
    -DCMAKE_CXX_FLAGS="-std=c++14" \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_C_COMPILER="$CC_NO_SCCACHE" \
    -DCMAKE_INSTALL_PREFIX="$OUT/tes3mp" \
    -DCMAKE_OSX_ARCHITECTURES=arm64\;x86_64 \
    -DDESIRED_QT_VERSION=5 \
    -DLZ4_INCLUDE_DIR="$LZ4_DIR/include" \
    -DLZ4_LIBRARY_RELEASE="$LZ4_DIR/lib/liblz4.dylib" \
    -DMyGUI_INCLUDE_DIR="$MYGUI_HOME/Headers" \
    -DMyGUI_LIBRARY="$MYGUI_HOME/MyGUIEngine" \
    -DOPENMW_OSX_DEPLOYMENT=TRUE \
    -DOPENMW_USE_SYSTEM_BULLET=OFF \
    -DOPENMW_USE_SYSTEM_MYGUI=ON \
    -DOPENMW_USE_SYSTEM_OSG=ON \
    -DOSGPlugins_DONT_FIND_DEPENDENCIES=ON \
    -DRakNet_INCLUDES="$RAKNET_ROOT/include" \
    -GNinja \
    -Wno-dev -DOPENMW_LTO_BUILD=ON \
    ..
cmake --build .

popd
popd
