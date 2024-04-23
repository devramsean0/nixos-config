{
  description = "Sean's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    # Define your machines here
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
            ./hardware/dell-inspiron-3520.nix
            ./machines/laptop.nix
#           ./configuration.nix
          ];
      };
    };
  };
}
