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
    ./apps/gtk.nix
    ./apps/qt.nix
  ];

  # define color scheme
  colorScheme = inputs.nix-colors.colorSchemes.dracula;

  home.username = "froggo";
  home.homeDirectory = "/home/froggo";

  home.packages =
    with pkgs;
    with pkgs-unstable;
    [
      swww
      nwg-look
      tmux
    ]
    ++ [
      # alacritty
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

    alacritty = {
      enable = true;
      package = pkgs-unstable.alacritty;
      settings = import ./apps/alacritty.nix;
    };

    fastfetch = {
      enable = true;
      settings = import ./apps/fastfetch.nix;
    };

    fuzzel = {
      enable = true;
      settings = import ./apps/fuzzel.nix;
    };

    mpv = {
      enable = true;
      config = import ./apps/mpv.nix;
    };

    hyprlock = {
      enable = true;
      settings = import ./apps/hyprlock.nix;
    };

    waybar = {
      enable = true;
      settings = import ./apps/waybar.nix;
      style = builtins.readFile ./waybar/style.css;
    };

    home-manager.enable = true;
  };

  services = {
    mako = import ./apps/mako.nix;
    hyprpaper = {
      enable = true;
      settings = import ./apps/hyprpaper.nix;
    };
    hypridle = {
      enable = true;
      settings = import ./apps/hypridle.nix;
    };
  };

  home = {
    file = {
      ".config/hypr/themes" = {
        source = ./hypr/themes;
        recursive = false;
      };
      ".config/hypr/modules" = {
        source = ./hypr/modules;
        recursive = false;
      };

      ".config/nvim/lua" = {
        source = ./nvim/lua;
      };

      ".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
      ".tmux.conf".source = ./.tmux.conf;
    };

    # should not be modified i think
    stateVersion = "24.05";
  };
}
