{
  description = "Sean's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@attrs: {
    # Define your machines here
    nixosConfigurations = {
      maximus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = attrs;
        modules = [
	    home-manager.nixosModules.home-manager {
		home-manager.useGlobalPkgs = true;
          	home-manager.useUserPackages = true;
		home-manager.users.sean = import ./users/sean.nix;
#		home-manager.users.root = import ./users/sean.nix;
	    }
            ./hardware/dell-inspiron-3520.nix
            ./machines/maximus.nix
#           ./configuration.nix
          ];
      };
      gaius = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = attrs;
	modules = [
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.sean = import ./users/sean.nix;
	}
	./hardware/thinkpad-l480.nix
	./machines/gaius.nix
	];
      };
      netcup = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = attrs;
        modules = [
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sean = import ./users/sean.nix;
#	    home-manager.users.root = import ./users/root.nix;
          }
	  ./hardware/netcup-vps-200-g10s.nix
	  ./machines/netcup.nix
       ];
      };
      laptopISO = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = attrs;
	modules = [
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.sean = import ./users/sean.nix;
#	    home-manager.users.root = import ./users/root.nix;
	  }
	  "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-base.nix"
	  ./machines/iso.nix
	];	
      };
      aegidius = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = attrs;
	modules = [
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.sean = import ./users/sean.nix;
	  }
	  ../hardware/acer-c720.nix
	  ../machines/aegidius.nix
	];
      };
      titus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = attrs;
        modules = [
	    home-manager.nixosModules.home-manager {
		home-manager.useGlobalPkgs = true;
          	home-manager.useUserPackages = true;
		home-manager.users.sean = import ./users/sean.nix;
#		home-manager.users.root = import ./users/sean.nix;
	    }
            ./machines/titus.nix
          ];
      };
    };
  };
}
