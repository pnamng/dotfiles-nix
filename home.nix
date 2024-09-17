{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "froggo";
  home.homeDirectory = "/home/froggo";

  home.packages = [
    pkgs.fastfetch

    pkgs.zip
    pkgs.xz
    pkgs.unzip

    pkgs.ripgrep
    pkgs.jq
    pkgs.eza

    pkgs.brightnessctl
    pkgs.glxinfo

    # wm/de related
    pkgs.fuzzel
    pkgs.waybar
    pkgs.hyprland
    pkgs.hyprcursor
    
    pkgs.tmux
    pkgs.lua
    pkgs.nwg-look

    # ---------------------------
    pkgs-unstable.microsoft-edge
    pkgs-unstable.spotify

    pkgs-unstable.alacritty
    pkgs-unstable.neovim
  ];

  programs.git = {
    enable = true;
    userName = "ech";
    userEmail = "pnam2311@gmail.com";
  };


  # home.file.".config/nvim/" = {
  #   source = ./nvim;
  #   recursive = false;
  # };

  home.file.".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.

  programs.home-manager.enable = true;
}
