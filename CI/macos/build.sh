#!/usr/bin/env bash
# Run this script on macOS to build TES3MP for macOS.
set -e

# Do not accept arguments
[[ -n $1 ]] && exit 1

# Switch to this script's own directory
cd "${BASH_SOURCE%/*}/" || exit

# Check for dependencies that are *not* handled here
error=false
if ! sudo --non-interactive whoami > /dev/null; then
    error=true
    echo "Passwordless sudo is required."
fi
xcode_clt_version=$(pkgutil --pkg-info=com.apple.pkg.CLTools_Executables | \
                        grep ^version: | cut -d' ' -f2)
if [[ $xcode_clt_version != 15* ]]; then
    error=true
    echo "XCode Command Line Tools v15 is required."
fi
if ! brew --version; then
    error=true
    echo "Homebrew is required."
fi
$error && exit 1

# Install dependencies that *are* handled here
brew install \
     cmake \
     coreutils \
     create-dmg \
     gnu-sed \
     meson \
     nasm \
     ninja \
     patchutils \
     pkg-config \
     python-setuptools

# Build TES3MP and dependencies--Run numbered scripts in alphanumeric order.
mkdir -p out
rm -fr ../../build out/src out/lib
for script in $(ls -1v *.sh | grep '^[0-9]' | sort -n); do
    [[ -n $GITHUB_ACTIONS ]] && echo "::group::$script"
    echo "Running $script"
    ./$script
    [[ -n $GITHUB_ACTIONS ]] && echo "::endgroup::"
done

# Building TES3MP only
# mkdir -p out
# rm -fr ../../build
# ./30*.sh
# ./40*.sh
# ./41*.sh
# ./42*.sh
