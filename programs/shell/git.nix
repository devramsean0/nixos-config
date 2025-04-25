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
      commit.gpgsign = true;
      gpg.program = "${pkgs.gnupg}/bin/gpg";
      pull.rebase = false;
      tag.gpgsign = true;
      user = {
        email = "me@sean.cyou";
        name = "Sean Outram";
        signingkey = "2FC229E89E4750745BA7319BFA84185975973307";
      };
      safe.directory = "/etc/nixos";
      "crendential \"https://github.com\"" = {
        helper = "${pkgs.gh}/bin/gh auth git-credential";
      };
    };
  };
}
