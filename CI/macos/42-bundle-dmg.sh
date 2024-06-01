#!/bin/zsh
set -ex
. ./_common.sh

app_dirname=$(basename testbox/*.app)
volname=$(basename $app_dirname .app)-$TES3MP_VERSION
mkdir -p ../../out
dmg_out=../../out/${volname}.dmg
rm -f $dmg_out

# --skip-jenkins option disables Finder scripts
create-dmg --volname "$volname" \
    --skip-jenkins \
    --window-size 800 400 \
    --icon $app_dirname 200 190 \
    --app-drop-link 600 185 \
    --hdiutil-verbose \
    $dmg_out ./testbox
