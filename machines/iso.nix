{ config, pkgs, lib, ... }:
{
  imports = [
    ../shared/core.nix
    ../shared/userland/i3.nix
  ];
  networking.networkmanager.enable = lib.mkForce false;
}

