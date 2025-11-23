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
    schedule = "daily";
    environmentFile = "/etc/s5cmd.env";
    syncTargets = [
      {
	source = "/home/sean/immich/library/library";
	destination = "s3://photobackup-devramsean0/library/";
	extraArgs = [ "--storage-class" "DEEP_ARCHIVE"];
      }
      {
	source = "/home/sean/immich/library/upload";
	destination = "s3://photobackup-devramsean0/upload/";
	extraArgs = [ "--delete" "--storage-class" "STANDARD"];
      }
      {
	source = "/home/sean/immich/library/profile";
	destination = "s3://photobackup-devramsean0/profile/";
	extraArgs = [ "--delete" "--storage-class" "DEEP_ARCHIVE"];
      }
      {
	source = "/home/sean/immich/library/backups";
        destination = "s3://photobackup-devramsean0/backups/";
        extraArgs = [ "--delete" "--storage-class" "STANDARD"];
      }
    ];
  };
}
