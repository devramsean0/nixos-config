# flake.nix

{
  description = "Sean's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    # Define your machines here
    nixosConfigurations = {
      laptop = {
        system = "x86_64-linux";
        config = {
          imports = [
            ./hardware-configuration.nix
            ./machines
          ];
        };
      };
    };
  };
}
