
{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) stdenv callPackage;
  unlockservice = callPackage ./DPR_Fcc_unlock_service.nix {};
in stdenv.mkDerivation rec {
  pname = "fcc-unlock.d";
  version = "1.0.0";

  src = ../../thirdParty/xmm7360/libmodemauth.so;
  buildInpputs = [ unlockservice ];

  unpackPhase = ''
    echo "fixing fcc-unlock.d";
    mkdir -p $out
    mkdir -p $TMPDIR
    echo "#!/bin/sh" >> $TMPDIR/"8086:7560";
    unlockservice_executable=$(find ${unlockservice} -type f -executable | head -n 1)
    echo $unlockservice_executable >> $TMPDIR/"8086:7560";
    echo ${unlockservice}
  '';

  installPhase = ''
    echo "Building libmodemauth.so";
    mkdir -p $out/lib
    ls $TMPDIR
    cp $TMPDIR/"8086:7560" $out/lib
  '';
}
