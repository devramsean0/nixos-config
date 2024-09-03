{ config, pkgs, ... }:
{
    imports = [
        ../shared/core.nix
        ../shared/userland/i3.nix
    ];
    networking.hostName = "titus";

    services.tailscale.useRoutingFeatures ="client";
}
