{ config, pkgs, wolfangaukang, ... }:
{
    environment.systemPackages = with pkgs; [
        vscode
    ];
    services.xserver = {
        xkb = {
            layout = "gb";
            variant = "";
        };   
    };
}
