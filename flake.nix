{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = github:nix-community/home-manager;
  };
  outputs = { self, nixpkgs, ... }@attrs: {
    # replace 'joes-desktop' with your hostname here.
    nixosConfigurations.gaius = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
	./hardware/thinkpad-l480.nix
	./machines/gaius.nix
      ];
    };
  };
}
