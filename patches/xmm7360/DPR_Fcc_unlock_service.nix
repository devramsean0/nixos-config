{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) stdenv callPackage;
  autoPatchelfHook = pkgs.autoPatchelfHook;
  libmodemauth = callPackage ./libmodemauth.so.nix {};
in stdenv.mkDerivation rec {
  pname = "DPR_Fcc_unlock_service";
  version = "1.0.0";

  src = ../../thirdParty/xmm7360/DPR_Fcc_unlock_service;
  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ pkgs.pciutils libmodemauth pkgs.libz pkgs.libmbim ];

  unpackPhase = ''
    mkdir -p $out
    cp $src $out
  '';

  installPhase = ''
    runHook preInstall
    runHook postInstall
  '';
}

