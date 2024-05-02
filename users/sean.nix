{ config, pkgs, ... }:

{
  imports = [
    ../shared/configs.nix
  ];
  home.homeDirectory = "/home/sean";
  home.username = "sean";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  # Program Configs
  programs.git = {
    enable = true;
    userName  = "Sean Outram";
    userEmail = "outramsean0@gmail.com";
    extraConfig = {
      pull.ff = "only";
      safe.directory = "/etc/nixos";
    };
  };
}

