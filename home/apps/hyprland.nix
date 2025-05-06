{ config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      source = [
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
        gaps_in = 6;
        gaps_out = "12,12,12,12";
        border_size = 2;
        "col.active_border" = "0xee${config.colorScheme.palette.base0B} 0xee${config.colorScheme.palette.base0B} 45deg";
        "col.inactive_border" = "0xee${config.colorScheme.palette.base03}";
        layout = "dwindle";
        allow_tearing = false;
      };

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
        sensitivity = 0;
      };

      decoration = {
        rounding = 4;
        blur = {
          enabled = true;
          size = 10;
          passes = 3;
        };
      };

      animations = {
        enabled = "yes";

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
        workspace_swipe = "off";
      };

      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = 1;
        focus_on_activate = true;
      };

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
