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
          ./froggo
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.froggo = homeImports;
              extraSpecialArgs = specialArgs;
              backupFileExtension = ".hm-backup";
            };
          }
        ];
      };
    };
}
