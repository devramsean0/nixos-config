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
    ];
    programs.steam = {
        enable = true;
    };
    services.xserver = {
	xkb = {
		layout = "gb";
		variant = "";
	};   
    };
}
