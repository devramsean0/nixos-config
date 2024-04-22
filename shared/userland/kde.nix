{ config, pkgs, ... }:
{
    imports = [
        ./desktop-shared.nix
    ]
    services.xserver = {
        enable = true;
        displayManager.sddm.enable = true;
        deskopManager.plasma5.enable = true;
    };
}