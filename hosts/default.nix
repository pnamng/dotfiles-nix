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
      };
    in
    {
      froggo = nixosSystem {
        inherit specialArgs;
        modules = laptop ++ [
          inputs.home-manager.nixosModules.home-manager
          inputs.nix-index-database.nixosModules.nix-index
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
