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
    ../shared/desktop.nix
  ];

  environment.systemPackages = [
#    repackinator
  ];
  networking.hostName = "maximus";
  services.tailscale.useRoutingFeatures = "client";
  console.keyMap = lib.mkForce "us";
  services.xserver.xkb.layout = lib.mkForce "us";

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
