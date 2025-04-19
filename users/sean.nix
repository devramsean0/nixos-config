{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../programs/desktop/firefox.nix
    ../programs/i3/i3-config.nix
    ../programs/desktop/vscode.nix
  ];
  home.homeDirectory = "/home/sean";
  home.username = "sean";
  home.stateVersion = "23.11";
  home.file.".background-image" = {
    enable = true;
    source = ../programms/i3/.background-image;
  };
}
