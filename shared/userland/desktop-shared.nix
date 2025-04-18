{ config, pkgs, ... }:
{
    imports = [
	    ../../programs/firefox.nix
#        ../../programs/vscode.nix
    ];
    environment.systemPackages = with pkgs; [
        slack
        discord
        libreoffice
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
       variety
       wine
       wine64
    ];
    programs.steam.enable = true;
}
