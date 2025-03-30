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

  programs.git = {
    enable = true;
    userName = "ech";
    userEmail = "pnam2311@gmail.com";
  };

  programs.neovim = {
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

  home = {
    file.".config/hypr/" = {
      source = ./hypr;
      recursive = false;
    };

    file.".config/waybar/" = {
      source = ./waybar;
      recursive = false;
    };

    file.".tmux.conf".source = ./.tmux.conf;
    file.".config/fuzzel/".source = ./fuzzel;
    file.".config/alacritty/".source = ./alacritty;
    file.".config/nvim/" = {
      source = ./nvim;
      recursive = true;
    };

    file.".config/mako/".source = ./mako;
    file.".config/fastfetch/".source = ./fastfetch;
    file.".config/mpv/".source = ./mpv;

    # should not be modified i think
    stateVersion = "24.05";
  };

  services.mako.enable = true;

  programs.home-manager.enable = true;
}
