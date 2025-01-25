{ config, pkgs, ... }:

let
  unlockscript = pkgs.callPackage ../patches/xmm7360/fcc-unlock.d.nix {};
in {
  networking.networkmanager.fccUnlockScripts = [
    {
      id = "8086:7560";
      path = "${unlockscript}/lib/8086:7560";
    }
  ];
}
