{ config, pkgs, wolfangaukang, ... }:
{
    imports = [
	../../programs/firefox.nix
	wolfangaukang.nixosModules.cloudflare-warp
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
    services.cloudflare-warp = {
	enable = false;
	certificate = ../../certificates/cloudflare.pem;
    };
}
