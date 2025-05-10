{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.github.vscode-github-actions
      vscode-extensions.github.copilot-chat
      vscode-extensions.github.copilot
      vscode-extensions.github.codespaces
      vscode-extensions. ms-vscode-remote.remote-containers
    ];
  };
}
