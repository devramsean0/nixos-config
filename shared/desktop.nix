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
    arandr
    spotify
    obsidian
    filezilla
  ];
  environment.pathsToLink = [ "/libexec" ];
  
  # Virt Manager
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "sean" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

 services.teamviewer.enable = true;
}
