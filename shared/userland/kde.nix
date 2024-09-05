{ config, pkgs, ... }:
{
    imports = [
        ./desktop-core.nix
    ]
    services.xserver = {
        enable = true;
        displayManager.sddm.enable = true;
        deskopManager.plasma5.enable = true;
    };
}