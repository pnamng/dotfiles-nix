{ config, pkgs, pkgs-unstable, lib, ... }:

{
  # imports = [
  #   inputs.nixvim.homeManagerModules.nixvim
  # ];
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
    pkgs.waybar
    pkgs.hyprpaper
    pkgs.hyprlock
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


  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   package = pkgs-unstable.hyprland;
  #   # portalPackage = pkgs.xdg-desktop-portal-hyprland;
  # };

  # programs.nixvim = {
  #   enable = true;

  #   colorschemes.catppuccin.enable = true;
  #   plugins.lualine.enable = true;
  # };

  home.file.".config/waybar/" = {
    source = ./waybar;
    recursive = false;
  };

  home.file.".config/hypr/".source = ./hypr;
  home.file.".config/fuzzel".source = ./fuzzel;
  # home.file.".config/waybar/".source = ./waybar;

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
