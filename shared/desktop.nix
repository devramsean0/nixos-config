{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [ ../programs/i3/i3.nix ];
  environment.systemPackages = with pkgs; [
    slack
    discord
    wine64
    kicad
    flameshot
    libreoffice
  ];
  environment.pathsToLink = [ "/libexec" ];
}
