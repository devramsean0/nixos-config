{ config, pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set timezone
  time.timeZone = "Europe/London";

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
  environment.sytemPackages = with pkgs; [
    starship
    gh
    git
    hyfetch
    unzip
  ]
  services.tailscale.enable = true;

  services.openssh = {
    enable = true;
    # require public key authentication for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    #settings.PermitRootLogin = "yes";
  };
  # Terminal
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  # Docker
  virtualisation.docker.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ]; 

  # Users
  users.users = {
    sean = {
      isNormalUser = true;
      description = "Sean";
      extraGroups = [ "networkManager" "wheel" "docker"]
      packages = with pkgs; [];
      openssh = {
        authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB9sx5+UaHAudLKJkXq0il8VsauOZqmjAUC41/BS9G8q sean"
        ];
      };
    };
  };
}