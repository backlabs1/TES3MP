#!/bin/zsh
set -ex
. ./_common.sh

volname=TES3MP-$TES3MP_VERSION
mkdir -p ../../out
dmg_out=../../out/${volname}.dmg
rm -f $dmg_out

# --skip-jenkins option disables Finder scripts
create-dmg --volname "$volname" \
    --skip-jenkins \
    --window-size 800 400 \
    --icon "TES3MP.app" 200 190 \
    --app-drop-link 600 185 \
    --hdiutil-verbose \
    $dmg_out ./testbox
