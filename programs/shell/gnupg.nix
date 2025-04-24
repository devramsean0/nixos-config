{ config, lib, pkgs, ... }:
{
    services.pcscd.enable = true;
    programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-tty; # replace this with your own desktop's one, see nixpkgs
        enableSSHSupport = true;
    };
}