{
  lib,
  config,
  pkgs,
  ...
}:
{
  xdg.configFile."starship.toml" = {
    enable = true;
    source = ./starship.toml;
  };
}
