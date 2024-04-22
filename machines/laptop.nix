{ config, pkgs, ... }:
{
    includes = [
        ./shared/core.nix
        ./shared/userland/i3.nix
    ];
    networking.hostName = "laptop";
}