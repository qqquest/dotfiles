{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @inputs:{
    nixosConfigurations = {
      europa = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./hosts/europa
        ];
	specialArgs = { inherit inputs; };
      };
    };
  };
}
