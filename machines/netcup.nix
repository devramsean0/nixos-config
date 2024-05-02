{ config, pkgs, ... }:
{
  imports = [
    ../shared/core.nix
  ];
  networking.hostName = "netcup";
}
