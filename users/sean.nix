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
    ../programs/shell/starship.nix
  ];
  home.homeDirectory = "/home/sean";
  home.username = "sean";
  home.stateVersion = "23.11";
  home.file.".background-image" = {
    enable = true;
    source = ../programs/i3/.background-image;
  };
}
