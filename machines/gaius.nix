{
  config,
  lib,
  pkgs,
  home-manager,
  ...
}:
{
  imports = [
    home-manager.nixosModules.default
    ../shared/core.nix
    ../shared/desktop.nix
  ];
  networking.hostName = "gaius";
  # xBattery Stuff
  services.power-profiles-daemon.enable = false;
  services.thermald.enable = true;
  services.tlp = {
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };
  services.tailscale.useRoutingFeatures = "client";
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
