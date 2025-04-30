{ config, pkgs-unstable, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs-unstable.hyprland;
    portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;
    settings = {
      source = [
        "~/.config/hypr/themes/spaceduck.conf"
        "~/.config/hypr/modules/variables.conf"
        "~/.config/hypr/modules/env.conf"
        "~/.config/hypr/modules/bindings.conf"
        "~/.config/hypr/modules/submaps.conf"
        "~/.config/hypr/modules/windows.conf"
        "~/.config/hypr/modules/workspaces.conf"
      ];

      monitor = [
        "eDP-1,highrr,auto,1.25"
        "DP-1,highrr,auto,1.25"
        "DP-2,highrr,auto,1.25"
      ];

      exec-once = [
        "swww-daemon"
        "waybar"
        "hyprpaper"
        "hypridle"
        "fcitx5"
        "nm-applet"
        "[workspace 1 silent] obsidian"
        "[workspace 4 silent] alacritty"
        "[workspace 6 silent] qbittorrent"
        "[workspace 9 silent] alacritty -e spotify_player"
      ];
      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 6;
        gaps_out = "12,12,12,12";
        border_size = 2;
        col.active_border = "#${config.colorScheme.palette.base0B}ee #${config.colorScheme.palette.base0C}ee 45deg";
        # col.inactive_border = rgba(595959aa)

        layout = "dwindle";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };
      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input = {
        kb_layout = "us";
        # kb_variant =
        # kb_model =
        # kb_options =
        # kb_rules =

        follow_mouse = 2;
        numlock_by_default = false;

        touchpad = {
          natural_scroll = "yes";
        };

        sensitivity = 0; # -1.0 to 1.0, 0 means no modification.
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 4;

        blur = {
          enabled = true;
          size = 10;
          passes = 2;
        };
      };

      animations = {
        enabled = "yes";

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = "off";
      };

      misc = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        force_default_wallpaper = 1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = 1;
        focus_on_activate = true;
      };

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      cursor = {
        no_hardware_cursors = true;
        no_break_fs_vrr = true;
      };

      debug = {
        disable_logs = false;
        disable_scale_checks = true;
      };
    };
  };
}
