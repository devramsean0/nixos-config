# Scipio - My Local Backup server

{
  config,
  lib,
  pkgs,
  home-manager,
  ...
}:
let
#  repackinator = pkgs.callPackage ../programs/xbox/repackinator.nix {};
in {
  imports = [
    home-manager.nixosModules.default
    ../shared/core.nix
  ];

  environment.systemPackages = [
#    repackinator
  ];
  networking.hostName = "scipio";
}
