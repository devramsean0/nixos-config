{
  description = "Sean's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    wolfangaukang.url = "git+https://codeberg.org/wolfangaukang/nix-agordoj";
    wolfangaukang.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, wolfangaukang, ... }@attrs: {
    # Define your machines here
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = attrs;
        modules = [
	    home-manager.nixosModules.home-manager {
		home-manager.useGlobalPkgs = true;
           	home-manager.useUserPackages = true;
		home-manager.users.sean = import ./users/sean.nix;
	    }
            ./hardware/dell-inspiron-3520.nix
            ./machines/laptop.nix
#           ./configuration.nix
          ];
      };
    };
  };
}
