{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) stdenv callPackage;
  autoPatchelfHook = pkgs.autoPatchelfHook;
  libmodemauth = callPackage ./libmodemauth.so.nix {};
in stdenv.mkDerivation rec {
  pname = "configservice_lenovo";
  version = "1.0.0";

  src = ../../thirdParty/xmm7360/configservice_lenovo;
  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ pkgs.libgcc pkgs.stdenv.cc.cc.lib ];

  unpackPhase = ''
    mkdir -p $out
    cp $src $out/configservice_lenovo
  '';

  installPhase = ''
    runHook preInstall
    runHook postInstall
  '';
}

