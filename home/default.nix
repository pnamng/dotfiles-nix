{
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./apps
  ];

  colorScheme = inputs.nix-colors.colorSchemes.everforest-dark-hard;

  # define color scheme
  # colorScheme = {
  #   slug = "spaceduck";
  #   name = "spaceduck";
  #   author = "ech";
  #   palette = {
  #     base00 = "0f111b"; # Background (dark navy)
  #     base01 = "1b1c36"; # Lighter background (status bar, secondary background)
  #     base02 = "30365f"; # Selection background (mid-tone purple)
  #     base03 = "686f9a"; # Comments, inactive elements (grayish purple)
  #     base04 = "7678a5"; # Light gray (slightly brighter for UI elements)
  #     base05 = "ecf0c1"; # Foreground (off-white with yellow tint)
  #     base06 = "f0f1ce"; # Light foreground (brighter white for bold text)
  #     base07 = "ffffff"; # Bright white (for highlights)
  #     base08 = "e33400"; # Red (errors, deletions)
  #     base09 = "f2ce00"; # Yellow (warnings, modified files)
  #     base0A = "b3a1e6"; # Light purple (keywords, search highlights)
  #     base0B = "5ccc96"; # Green (strings, additions)
  #     base0C = "00a3cc"; # Cyan (types, constants)
  #     base0D = "7a5ccc"; # Purple (functions, primary syntax)
  #     base0E = "e39400"; # Orange (attributes, regex)
  #     base0F = "f2ce00"; # Bright yellow (alternate for warnings or special)
  #   };
  # };

  home.username = "froggo";
  home.homeDirectory = "/home/froggo";

  home.packages = with pkgs-unstable; [
    # swww
    nwg-look
    tmux
    ghostty
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

      # ".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
      ".tmux.conf".source = ./.tmux.conf;
    };

    # should not be modified i think
    stateVersion = "24.05";
  };
}
