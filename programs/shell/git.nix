{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    prompt.enable = true;
    config = {
      init.defaultBranch = "main";
#      commit.gpgsign = true;
      gpg.program = "${pkgs.gnupg}/bin/gpg";
      pull.rebase = false;
#      tag.gpgsign = true;
      user = {
        email = "me@sean.cyou";
        name = "Sean Outram";
        signingkey = "E0503C5A984B8FAA3D6FC03748377A6A78729C71";
      };
      safe.directory = "/etc/nixos";
      "crendential \"https://github.com\"" = {
        helper = "${pkgs.gh}/bin/gh auth git-credential";
      };
    };
  };
}
