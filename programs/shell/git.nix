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
                email = "me@sean.cyou";
                name = "Sean Outram";
                signingkey = "8F290E78234000C4F6B8E0BE06AFA5789F82F1D8";
            };
            "crendential \"https://github.com\"" = {
                helper = "${pkgs.gh}/bin/gh auth git-credential";
            };
        };
    };
}
