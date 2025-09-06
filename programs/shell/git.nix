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
        signingkey = "B79BCEA9DAF691AA22F652D24E0CDF139FF4BE7A";
      };
      safe.directory = "/etc/nixos";
      "crendential \"https://github.com\"" = {
        helper = "${pkgs.gh}/bin/gh auth git-credential";
      };
    };
  };
}
