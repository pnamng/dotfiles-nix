{
  description = "first flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-b76567c281.url = "github:nixos/nixpkgs/b76567c281da43c3e46381eefabd28e022e07e90";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, nixpkgs-b76567c281, home-manager, ... }: {
    nixosConfigurations.froggo = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs-b76567c281 = import nixpkgs-b76567c281 {
          inherit system;
          config.allowUnfree = true;
        };
      };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.froggo = import ./home.nix;
          home-manager.extraSpecialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
        }
      ];
      # --------------------------------------------------
    };
  };
}
