{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@attrs:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      # replace 'joes-desktop' with your hostname here.
      nixosConfigurations = { 
	gaius = nixpkgs.lib.nixosSystem {
	        system = "x86_64-linux";
	        specialArgs = attrs;
	        modules = [
	          ./hardware/thinkpad-l480.nix
	          ./machines/gaius.nix
	          home-manager.nixosModules.home-manager
	          {
	            home-manager.useGlobalPkgs = true;
	            home-manager.useUserPackages = true;
	            home-manager.users.sean = import ./users/sean.nix;
	          }
	        ];
	};
	ISO = nixpkgs.lib.nixosSystem {
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
		        ./hardware/iso.nix
		      ];	
	};
    };
}
