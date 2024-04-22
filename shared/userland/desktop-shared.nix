{ config, pkgs, ... }:
{
    environment.systemPackages with pkgs; [
        firefox
        slack
        discord
        vscode
        libreoffice
        cloudflare-warp
        zoom-us
        spotify
        _1password
        _1password-gui
    ]
    programs.steam = {
        enable = true;
    }
}