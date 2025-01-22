{ config, pkgs, lib, ... }:
{
  imports = [
    ../shared/core.nix
#    ../shared/userland/i3.nix
  ];
  environment.etc."setup.sh".source = ../setup.sh;
  environment.etc."setup.sh".mode = "0755";
  services.getty.autologinUser = lib.mkForce "root";  
  networking.networkmanager.enable = lib.mkForce false;
}

