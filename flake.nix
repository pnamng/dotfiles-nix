{
  description = "first flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations.froggo = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
	pkgs = import nixpkgs {
	  # Refer to the `system` parameter from
	  # the outer scope recursively
	  inherit system;
	  # To use Chrome, we need to allow the
	  # installation of non-free software.
	  config.allowUnfree = true;
	};
	pkgs-unstable = import nixpkgs-unstable {
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

	    home-manager.users.froggo = import ./home.nix;
	    home-manager.extraSpecialArgs = {
		    pkgs-unstable = import nixpkgs-unstable {
			    inherit system;
			    config.allowUnfree = true;
		    };
	    };
	  }
      ];
    };
  };
}
