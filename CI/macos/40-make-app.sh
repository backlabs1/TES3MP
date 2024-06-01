#!/bin/zsh
set -ex
. ./_common.sh

readonly OSG_VERSION="3.6.5"

rm -rf testbox
mkdir -p testbox
app_dirname=$(basename $TES3MP_SRC/build/*.app)
cp -R $TES3MP_SRC/build/$app_dirname testbox/
app_target=testbox/$app_dirname
mkdir -p $app_target/Contents/Frameworks
mkdir -p $app_target/Contents/PlugIns
mkdir -p $app_target/Contents/PlugIns/osgPlugins-$OSG_VERSION
find out/lib -name "*.dylib" \( -type f -o -type l \) -exec cp -P {} $app_target/Contents/Frameworks/ \;
find out/lib -name "*.so" \( -type f -o -type l \) -exec cp -P {} $app_target/Contents/Frameworks/ \;
find out/lib -name "*.framework" -type d -exec cp -R {} $app_target/Contents/Frameworks/ \;
mv $app_target/Contents/Frameworks/osgdb_*.so $app_target/Contents/PlugIns/osgPlugins-$OSG_VERSION
rm $app_target/Contents/Frameworks/**/libqcocoa.dylib
./fixup_deps.py $app_target $app_target/Contents/MacOS

# Following isn't fixing up deps, but it is important.
# TODO: Move to other scripts.
mkdir $app_target/Contents/Resources/server
cp -R "$SRC/CoreScripts" $app_target/Contents/Resources/server/CoreScripts
cp $TES3MP_SRC/build/*default.cfg $app_target/Contents/Resources

# Make an icns out of the TES3MP logo which will be referenced by Info.plist.
bake_icns() {
    # Credit to https://github.com/BenSouchet/png-to-icns/tree/main (MIT license).
    sips -z 16 16     "$1" --out "$2/icon_16x16.png" > /dev/null
    sips -z 32 32     "$1" --out "$2/icon_16x16@2x.png" > /dev/null
    sips -z 32 32     "$1" --out "$2/icon_32x32.png" > /dev/null
    sips -z 64 64     "$1" --out "$2/icon_32x32@2x.png" > /dev/null
    sips -z 128 128   "$1" --out "$2/icon_128x128.png" > /dev/null
    sips -z 256 256   "$1" --out "$2/icon_128x128@2x.png" > /dev/null
    sips -z 256 256   "$1" --out "$2/icon_256x256.png" > /dev/null
    sips -z 512 512   "$1" --out "$2/icon_256x256@2x.png" > /dev/null
    sips -z 512 512   "$1" --out "$2/icon_512x512.png" > /dev/null
    sips -z 1024 1024 "$1" --out "$2/icon_512x512@2x.png" > /dev/null
    iconutil -c icns -o "$3" "$2"
}
iconset_temp_dir="$(mktemp -d)/icon.iconset"
mkdir -p "$iconset_temp_dir"
rm -rf "$iconset_temp_dir/*"
bake_icns $TES3MP_SRC/files/tes3mp/tes3mp_logo.png $iconset_temp_dir $app_target/Contents/Resources/TES3MP.icns
rm $app_target/Contents/Resources/OpenMW.icns

cp Info.plist $app_target/Contents/

# TODO: Update the version number in Info.plist.
"$SED" -i "s/VERSIONHERE/$TES3MP_VERSION/g" $app_target/Contents/Info.plist

# Update tes3mp-server-default.cfg to look in the app bundle for server scripts.
"$SED" -i '/home = .\/server/c\home = ..\/Resources\/server\/CoreScripts' \
    $app_target/Contents/Resources/tes3mp-server-default.cfg

# Update the version file TES3MP uses at runtime for compatibility checks.
echo -e $TES3MP_VERSION_FILE > $app_target/Contents/Resources/resources/version

# Copy credits files into the app bundle.
cp $TES3MP_SRC/AUTHORS.md $app_target/Contents/Resources/
cp $TES3MP_SRC/tes3mp-credits.md $app_target/Contents/Resources/
