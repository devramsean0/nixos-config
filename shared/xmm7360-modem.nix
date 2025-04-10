{ config, pkgs, ... }:

let
  unlockscript = pkgs.callPackage ../patches/xmm7360/fcc-unlock.d.nix {};
  configservice = pkgs.callPackage ../patches/xmm7360/configservice_lenovo.nix {};
in {
  networking.networkmanager.fccUnlockScripts = [
    {
      id = "8086:7560";
      path = "${unlockscript}/lib/8086:7560";
    }
  ];
  systemd.services.sarConfig = {
    description = "sar config";
    after = [ "network.target" ];  # Adjust based on service dependencies
    serviceConfig = {
      User = "root";
      ExecStart = "${configservice}/configservice_lenovo";
      ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";  # Use NixOS package path for kill
      Restart = "on-failure";
      RestartSec = 20;
    };
    wantedBy = [ "multi-user.target" ];
  };
}
