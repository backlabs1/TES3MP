# TES3MP by backlabs1

"The Elder Scrolls III: Morrowind", is a single-player open-world role-playing
video game by Bethesda Softworks, released
in 2002. [OpenMW](https://openmw.org/) is an open-source game engine that
supports playing Morrowind, using Morrowind's data
files. [TES3MP](https://tes3mp.com) is a project adding multiplayer
functionality to OpenMW.

This project, currently called "TES3MP by backlabs1", is a fork of TES3MP with
a focus on supporting the Morrowind, OpenMW, and TES3MP community, engaging
new interest, and bringing together more of the wide array of
Morrowind-related content and software for players to enjoy.

Like upstream TES3MP, this project is currently a work in progress and does
not claim to offer a bug-free gaming experience. Furthermore, this project is
**experimental** and status, names, versioning, URLs, etc. are subject to
change in breaking ways.

The current goal of this project is to polish the non-VR releases for Linux,
macOS, and Windows. There are a variety of other potential goals for the
future.

## Contributing

If you want to help this project succeed, consider:

- donating to OpenMW developers (see [the OpenMW
  FAQ](https://openmw.org/faq/#donations)), the TES3MP developers (see
  [TES3MP.com](http://tes3mp.com/#donations)), or backlabs1 (please send a
  note to <backlabs1@mailbox.org>);
- contributing code changes to OpenMW (see [the OpenMW
  FAQ](https://openmw.org/faq/#help)) or TES3MP (see
  [TES3MP.com](http://tes3mp.com/#contributing));
- reporting bugs and triaging bug reports for OpenMW or TES3MP; and
- telling others about OpenMW, TES3MP, or this project.

## Building on Linux (with Guix)

- Install Guix (for example, on Debian GNU/Linux, run `apt install guix`)
  unless you are running GuixSD.
- To build with your current version of Guix, run `guix build
  --file=guix.scm`.
- To build with the exact version of Guix specified in `channels.scm`, run
  `guix time-machine --channels=channels.scm -- build --file=guix.scm`.

## Building on macOS

Follow these steps to build TES3MP on macOS, using the Terminal app to execute
commands. This will produce universal binaries compatible with both Intel- and
Apple Silicon-based hardware. Note however the `tes3mp-server` runs well only
on Intel-based hardware.

- Download "Command Line Tools for Xcode 15.1" from
  <https://developer.apple.com/downloads> and install it. You will need a free
  Apple developer account. (Xcode 15.3 requires macOS 14.)
  - `hdiutil attach Command_Line_Tools_for_Xcode_15.1.dmg`
  - `cd "/Volumes/Command Line Developer Tools/"`
  - `sudo installer -pkg "Command Line Tools.pkg" -target /`
  - `hdiutil detach "/Volumes/Command Line Developer Tools"`
- Install [Homebrew](https://brew.sh/) by running `/bin/bash -c "$(curl -fsSL
  https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`. Read
  the output about "analytics" and "next steps" and follow instructions to
  finish the Homebrew setup.
- Run `./CI/macos/build.sh`. **WARNING: This script will install dependencies
  using Homebrew.**

The first time you run the application, you may need to right-click the `.app`
and select "Open" due to the app being unsigned. This process will prompt you
to confirm that you really want to open the application. After doing this
once, you should be able run the application normally.

Run the server (on Intel-based hardware) with
`/Applications/TES3MP.app/Contents/MacOS/tes3mp-server`.

## Building on Windows

Follow these steps to build TES3MP on Windows.

- Open **Windows PowerShell** as Administrator and run `Set-ExecutionPolicy
  -ExecutionPolicy Bypass -Force`. **WARNING: This will allow PowerShell
  scripts to be executed on the system.**
- Right-click on `CI\windows-build.ps1` and click **Run with PowerShell**. The
  script will ask for Administrator privileges. **WARNING: This script will
  install Chocolatey and use it to install dependencies.**

## Credits and licenses

This project exists thanks to many people who have contributed to both OpenMW
and TES3MP. See also `AUTHORS.md` and `tes3mp-credits.md`. This "TES3MP by
backlabs1" project is maintained by "backlabs1" <backlabs1@mailbox.org>.

The code published here is made available according to the terms of the GNU
General Public License, version 3. See `LICENSE` or
<https://www.gnu.org/licenses/gpl-3.0.txt> for a copy.

The `files/mygui/DejaVuLGCSansMono.ttf` font is being used according to the
terms of `files/mygui/DejaVuFontLicense.txt`.

This project is not affiliated with or endorsed by Bethesda Softworks, OpenMW,
or TES3MP.

Copyright © 2008-2021 OpenMW Team
Copyright © 2016-2022 David Cernat & Stanislav Zhukov
Copyright © 2024 backlabs1 <backlabs1@mailbox.org>
