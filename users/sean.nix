{ config, lib, pkgs, ... }:
{
    imports = [
        ../programs/i3/i3.nix
        ../programs/desktop/firefox.nix
    ];
    home.homeDirectory = "/home/sean";
    home.username = "sean";
    home.stateVersion = "23.11";
}