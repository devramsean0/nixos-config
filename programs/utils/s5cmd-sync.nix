{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.s5cmdSync;
in {
  options.services.s5cmdSync = {
    enable = mkEnableOption "Sync a folder to S3 using s5cmd";

    source = mkOption {
      type = types.path;
      example = "/srv/data";
      description = "Local source folder to sync.";
    };

    destination = mkOption {
      type = types.str;
      example = "s3://my-bucket/backups/";
      description = "S3 destination URL (s3://bucket/path/).";
    };

    schedule = mkOption {
      type = types.str;
      default = "daily";
      example = "*-*-* 03:00:00";
      description = "Systemd OnCalendar schedule for the sync job.";
    };

    user = mkOption {
      type = types.str;
      default = "root";
      description = "User under which to run the sync.";
    };

    extraArgs = mkOption {
      type = types.listOf types.str;
      default = [ "--delete" "--numworkers" "4" ];
      example = [ "--delete" "--numworkers" "8" ];
      description = "Extra arguments passed to s5cmd sync.";
    };

    environmentFile = mkOption {
      type = types.nullOr types.path;
      default = null;
      example = "/etc/s5cmd.env";
      description = ''
        Optional environment file containing AWS credentials or configuration.
        Each line should be of the form KEY=VALUE (e.g. AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION).
      '';
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.s5cmd ];

    systemd.services.s5cmdSync = {
      description = "S3 folder sync using s5cmd";
      wants = [ "network-online.target" ];
      after = [ "network-online.target" ];

      serviceConfig = {
        Type = "oneshot";
        User = cfg.user;
        ExecStart = ''
          ${pkgs.s5cmd}/bin/s5cmd sync ${concatStringsSep " " cfg.extraArgs} \
            ${cfg.source}/ ${cfg.destination}
        '';
      } // optionalAttrs (cfg.environmentFile != null) {
        EnvironmentFile = cfg.environmentFile;
      };
    };

    systemd.timers.s5cmdSync = {
      description = "Periodic S5cmd sync";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = cfg.schedule;
        Persistent = true;
        Unit = "s5cmdSync.service";
      };
    };
  };
}
