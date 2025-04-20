{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations =
    let
      # shorten paths
      inherit (inputs.nixpkgs.lib) nixosSystem;

      homeImports = import "${self}/home";

      mod = "${self}/system";
      # get the basic config to build on top of
      inherit (import mod) laptop;

      # get these into the module system
      specialArgs = {
        inherit inputs self;
        pkgs-unstable = import inputs.nixpkgs-unstable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
    in
    {
      froggo = nixosSystem {
        inherit specialArgs;
        modules = laptop ++ [
          # {
          #   nix.settings = {
          #     substituters = [ "https://cosmic.cachix.org/" ];
          #     trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
          #   };
          # }
          # inputs.nixos-cosmic.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.froggo = homeImports;
              extraSpecialArgs = specialArgs;
              backupFileExtension = ".hm-backup";
            };
          }
          ./froggo
        ];
      };
    };
}
