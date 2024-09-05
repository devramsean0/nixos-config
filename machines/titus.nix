{ config, pkgs, ... }:
{
    imports = [
        ../shared/core.nix
        ../shared/userland/i3.nix
        ../shared/userland/desktop-shared.nix
    ];
    networking.hostName = "titus";

    services.tailscale.useRoutingFeatures ="client";
}
