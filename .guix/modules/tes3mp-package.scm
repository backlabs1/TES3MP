(define-module (tes3mp-package)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:use-module (guix)
  #:use-module (guix build-system cmake)
  #:use-module (guix channels)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (srfi srfi-1))

(define crabnet
  (let ((commit "3ec9a338a7cefd5cc751c9d29095cafa4c73be20"))
    (package
     (name "crabnet")
     (version commit)
     (source
      ;; (local-file "../../../CrabNet.git" "source"
      ;;             #:recursive? #t)
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/backlabs1/CrabNet.git")
             (commit commit)))
       (file-name (git-file-name name commit))
       (sha256
        (base32 "1icgh7kfldl8yfj56i69cv4bga4cgc64gh1n5bm0clw2ybd0fndn"))))
     (build-system cmake-build-system)
     (arguments
      `(#:tests? #f
        ;; #:build-type "Release"
        #:configure-flags (list "-DRAKNET_ENABLE_DLL=OFF"
                                "-DRAKNET_ENABLE_SAMPLES=OFF"
                                "-DRAKNET_ENABLE_STATIC=ON"
                                "-DRAKNET_GENERATE_INCLUDE_ONLY_DIR=ON")))
     (synopsis "C++ networking engine")
     (description
      "CrabNet is a cross platform, open source, C++ networking engine for
game programmers, forked from RakNet.")
     (home-page "https://codeberg.org/backlabs1/CrabNet")
     (license license:bsd-2))))

(define-public tes3mp
  (package
    (name "tes3mp")
    (version "dev")
    (source
     (local-file "../.." "source"
                 #:recursive? #t))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f
       ;; #:build-type "Release"
       ;; #:strip-binaries? #f ;for debugging
       #:configure-flags (list "-DBUILD_BSATOOL=OFF"
                               "-DBUILD_ESMTOOL=OFF"
                               "-DBUILD_ESSIMPORTER=OFF"
                               "-DBUILD_NIFTEST=OFF"
                               "-DBUILD_OPENCS=OFF"
                               ;; only required for client
                               "-DDESIRED_QT_VERSION=5"
                               "-DOPENMW_USE_SYSTEM_RECASTNAVIGATION=ON"
                               ;; for building client only
                               ;; "-DBUILD_OPENMW_MP=OFF"
                               ;; for building server only
                               ;; "-DBUILD_BROWSER=OFF"
                               ;; "-DBUILD_LAUNCHER=OFF"
                               ;; "-DBUILD_MWINIIMPORTER=OFF"
                               ;; "-DBUILD_OPENMW=OFF"
                               ;; "-DBUILD_WIZARD=OFF"
                               )))
    (native-inputs (list boost crabnet doxygen git pkg-config))
    (inputs (list luajit-lua52-openresty
                  lz4
                  openmw-openscenegraph
                  recastnavigation
                  sdl2
                  ;; required for client only
                  bullet
                  ffmpeg
                  icu4c
                  libxt
                  mygui-gl
                  openal
                  qtbase-5
                  sqlite
                  unshield
                  yaml-cpp))
    (synopsis "Multiplayer implementation for OpenMW")
    (description
     "OpenMW is an open-source reimplementation of the 2002 open-world
role-playing game Morrowind. TES3MP adds multiplayer support to
OpenMW, allowing multiple users to play Morrowind together in the same
game world.")
    (home-page "https://codeberg.org/backlabs1/TES3MP")
    (license license:gpl3)))

tes3mp
