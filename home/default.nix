{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./apps
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-hard;

  home.username = "froggo";
  home.homeDirectory = "/home/froggo";

  home.packages = with pkgs; [
    nwg-look
  ];

  programs = {
    git = {
      enable = true;
      userName = "ech";
      userEmail = "pnam2311@gmail.com";
      extraConfig = {
        core = {
          editor = "nvim";
        };
      };
    };

    neovim = {
      enable = true;
      package = pkgs.neovim-unwrapped;
      extraLuaConfig = lib.fileContents ./nvim/init.lua;
      extraPackages = with pkgs; [
        vue-language-server
        lua-language-server
        typescript-language-server
        pyright
        nixd
        nixfmt-rfc-style
        rustfmt
      ];
    };

    home-manager.enable = true;
  };

  home = {
    file = {
      ".config/hypr/modules" = {
        source = ./hypr/modules;
        recursive = false;
      };

      ".config/nvim/lua" = {
        source = ./nvim/lua;
      };
    };

    # should not be modified i think
    stateVersion = "24.05";
  };
}
