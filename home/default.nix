{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
  # imports = [
  #   inputs.walker.homeManagerModules.default
  # ];
  home.username = "froggo";
  home.homeDirectory = "/home/froggo";

  # themes --------------------
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
    theme = {
      package = pkgs.everforest-gtk-theme;
      name = "Everforest-Dark-B-LB";
    };
    iconTheme = {
      name = "ePapirus";
    };
  };

  qt = {
    enable = true;
  };

  home.packages =
    with pkgs;
    with pkgs-unstable;
    [
      # utils
      fastfetch

      # interfaces
      hyprlock
      hypridle
      swww
      waybar
      fuzzel
      nwg-look

      # productivity
      tmux
    ]
    ++ [
      alacritty
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
      package = pkgs-unstable.neovim-unwrapped;
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
      ".config/hypr/" = {
        source = ./hypr;
        recursive = false;
      };

      ".config/waybar/" = {
        source = ./waybar;
        recursive = false;
      };

      ".tmux.conf".source = ./.tmux.conf;
      ".config/fuzzel/".source = ./fuzzel;
      ".config/alacritty/".source = ./alacritty;
      ".config/nvim/" = {
        source = ./nvim;
        recursive = true;
      };

      ".config/mako/".source = ./mako;
      ".config/fastfetch/".source = ./fastfetch;
      ".config/mpv/".source = ./mpv;
    };

    # should not be modified i think
    stateVersion = "24.05";
  };

  services.mako.enable = true;
}
