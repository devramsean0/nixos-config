{ config, pkgs, ... }:
{
    imports = [
	../../programs/firefox.nix
    ];
    environment.systemPackages = with pkgs; [
        slack
        discord
        vscode
        libreoffice
	cloudflare-warp
#        zoom-us
#        spotify
       _1password
       _1password-gui
       beeper
       wine
       kicad
       flameshot
       darktable
       rclone
    ];
}
