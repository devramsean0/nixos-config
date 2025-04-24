{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs; [
      vscode-extensions.github.vscode-github-actions
      vscode-extensions.github.copilot-chat
      vscode-extensions.github.copilot
      vscode-extensions.github.codespaces
    ];
  };
}
