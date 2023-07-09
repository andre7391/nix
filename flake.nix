{
  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
    in
    {
      # hosts configurations
      nixosConfigurations = {
        zeus = lib.nixosSystem {
          modules = [ ./hosts/zeus/config.nix ];
          specialArgs = { inherit inputs outputs; };
        };
      };

      # users configurations
      homeConfigurations = {
        andre-zeus = lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./home/users/andre/config.nix ];
          extraSpecialArgs = { inherit inputs outputs home-manager; };
        };
      };
    };
}
