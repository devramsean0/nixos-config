{ pkgs, lib, ... }:
{
  services.syncthing = {
    enable = true;
    group = "users";
    user = "sean";
    dataDir = "/home/sean/";
    configDir = "/home/sean/.config/syncthing";
  };
}
