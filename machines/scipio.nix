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
    GlacierBackup = ../programs/utils/glacierbackup.nix;
in {
  imports = [
    home-manager.nixosModules.default
    ../programs/utils/s5cmd-sync.nix
    ../shared/core.nix
  ];

  environment.systemPackages = [
#    repackinator
  ];
  networking.hostName = "scipio";
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  services.s5cmdSync = {
    enable = true;
    source = "/home/sean/immich/library";
    destination = "s3://photobackup-devramsean0/";
    schedule = "daily";
    extraArgs = [ "--delete" "--storage-class" "DEEP_ARCHIVE"];
    environmentFile = "/etc/s5cmd.env";
  };
}
