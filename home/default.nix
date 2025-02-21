{ pkgs, pkgs-unstable, lib, ... }:

{
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
      name ="ePapirus";
    };
  };

  qt = {
    enable = true;
  };

  home.packages = with pkgs; with pkgs-unstable; [
    # utils
    fastfetch
    zip
    xz
    unzip
    ripgrep
    jq
    eza
    dconf
    brightnessctl
    glxinfo
    openssl
    bluetuith

    lua

    # interfaces
    hyprlock
    hypridle
    swww
    waybar
    fuzzel
    nwg-look

    # productivity
    tmux
    lazygit
    francis

    mpv
    darktable
    lmstudio
  ] ++ [
    # ---------------------------
    # (microsoft-edge.override {
    #   commandLineArgs = [
    #     "--ozone-platform=wayland"
    #     "--password-store=kwallet6"
    #   ];
    # })
    spotify
    alacritty
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
  };

  home.file.".config/hypr/" = {
    source = ./hypr;
    recursive = false;
  };

  home.file.".config/waybar/" = {
    source = ./waybar;
    recursive = false;
  };

  home.file.".tmux.conf".source = ./.tmux.conf;
  home.file.".config/fuzzel/".source = ./fuzzel;
  home.file.".config/alacritty/".source = ./alacritty;
  home.file.".config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };

  # should not be modified i think
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
