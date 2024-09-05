{ config, pkgs, ... }:
{
    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
        extensions = [
            vscode-extensions.github.vscode-github-actions
            vscode-extensions.github.copilot-chat
            vscode-extensions.github.copilot
            vscode-extensions.github.codespaces
        ];
    };
}