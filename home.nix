{ config, pkgs, pkgs-unstable, lib, ... }:

{
  home.username = "froggo";
  home.homeDirectory = "/home/froggo";

  home.file.".icons/Bibata-Modern-Ice".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
  # themes --------------------
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    theme.package = pkgs.gruvbox-gtk-theme;
    theme.name = "Gruvbox-Dark";

    iconTheme.package = pkgs.numix-icon-theme;
    iconTheme.name = "Numix";

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  qt = {
    enable = true;
  };

  home.packages = [
    pkgs.fastfetch

    pkgs.zip
    pkgs.xz
    pkgs.unzip
    pkgs.ripgrep
    pkgs.jq
    pkgs.eza
    pkgs.xfce.thunar
    # sth gtk related
    pkgs.dconf

    pkgs.brightnessctl
    pkgs.glxinfo
    pkgs.openssl

    # wm/de related
    pkgs.fuzzel
    pkgs-unstable.waybar
    pkgs.hyprpaper
    pkgs-unstable.hyprlock
    pkgs-unstable.hyprcursor
    pkgs.hypridle
    
    pkgs.tmux
    pkgs.lua

    # ---------------------------
    (pkgs-unstable.microsoft-edge.override {
      commandLineArgs = [
        "--ozone-platform=wayland"
        "--enable-wayland-ime"
      ];
    })
    pkgs-unstable.spotify
    pkgs-unstable.alacritty
  ];

  programs.git = {
    enable = true;
    userName = "ech";
    userEmail = "pnam2311@gmail.com";
  };

  programs.neovim = {
    enable = true;
    package = pkgs-unstable.neovim-unwrapped;
    extraLuaConfig = lib.fileContents ./nvim/lua/init.lua;
  };


  home.file.".config/waybar/" = {
    source = ./waybar;
    recursive = false;
  };

  home.file.".config/hypr/".source = ./hypr;
  home.file.".config/fuzzel/".source = ./fuzzel;
#   home.file.".tmux.conf".source = ./.tmux.conf;
  home.file.".config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
