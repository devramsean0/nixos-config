{ config, lib, pkgs, ... }:
{
    programs.git = {
        enable = true;
        prompt.enable = true;
        config = {
            init.defaultBranch = "main";
            commit.gpgsign = true;
            gpg.program = "${pkgs.gnupg}/bin/gpg";
            pull.rebase = false;
            tag.gpgsign = true;
            user = {
                email = "git@sean.cyou";
                name = "Sean Outram";
                signingkey = "76C6E96B6A561DBE8F92B2E1AE25B4F5B6346CCF";
            };
            "crendential \"https://github.com\"" = {
                helper = "${pkgs.gh}/bin/gh auth git-credential";
            };
        };
    };
}