{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../programs/shell/zsh.nix
    ../programs/remote/openssh.nix
    ../programs/shell/git.nix
    ../programs/shell/gnupg.nix
    ../programs/utils/syncthing.nix
  ];
  networking.networkmanager.enable = true;
  environment.localBinInPath = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  # Configure keymaps
  console.keyMap = "uk";

  # Standard packages that I want on all machines + minor package allowance
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    gh
    git
    hyfetch
    unzip
    acpi
    pavucontrol
    pkg-config
    gnupg
    pinentry
    starship
    picocom
    qemu
  ];
  services.tailscale.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Fonts
  fonts.packages = with pkgs; [ nerd-fonts.fira-code ];

  # Users
  users.users = {
    sean = {
      isNormalUser = true;
      description = "Sean";
      extraGroups = [
        "networkManager"
        "wheel"
        "docker"
        "dialout"
      ];
      packages = with pkgs; [ ];
      openssh = {
        authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB9sx5+UaHAudLKJkXq0il8VsauOZqmjAUC41/BS9G8q sean"
        ];
      };
      hashedPassword = "$6$XxzpK4DwPBUdEP48$p/4MlWxtRAi8/l3jw3WftC2AhVHpznJt6O/xAEFnEq9Z71hAUl3.X3g4LcJH3XVhZwnoSLCFfwSHCEZ4QOv5u0";
    };
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "23.05";

  # Audio
  hardware.pulseaudio.enable = false;
  hardware.pulseaudio.support32Bit = true;
}
