{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    shellInit = ''eval "$(starship init zsh)"'';
  };
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
}
