{ config, pkgs, ... }:
{
  xdg.configFile."i3blocks" = {
    recursive = false;
    enable = true;
    source = ../config/i3blocks;
  };
  xdg.configFile."i3" = {
    recursive = false;
    enable = true;
    source = ../config/i3;
  };
  xdg.configFile."rofi/config.rasi" = {
    enable = true;
    source = ../config/rofi/config.rasi;
  };
}

