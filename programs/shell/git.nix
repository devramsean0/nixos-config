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
                signingkey = "844A33EF76FBE49B50CF37B11E80D936A450AC38";
            };
            "crendential \"https://github.com\"" = {
                helper = "${pkgs.gh}/bin/gh auth git-credential";
            };
        };
    };
}
