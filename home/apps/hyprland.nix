{ config, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    settings = {
      source = [
        "~/.config/hypr/modules/variables.conf"
        "~/.config/hypr/modules/env.conf"
        "~/.config/hypr/modules/bindings.conf"
        "~/.config/hypr/modules/submaps.conf"
        "~/.config/hypr/modules/windows.conf"
        "~/.config/hypr/modules/workspaces.conf"
      ];

      # imports = [
      #   ./workspaces
      # ];

      monitor = [
        "eDP-1,highrr,auto,1.25"
        "DP-1,highrr,auto,1.25"
        "DP-2,highrr,auto,1.25"
      ];

      exec-once = [
        "waybar"
        "hyprpaper"
        "hypridle"
        "fcitx5"
        "nm-applet"
        "[workspace 4 silent] alacritty"
        "[workspace 6 silent] qbittorrent"
        "[workspace 9 silent] alacritty --hold -e spotify_player"
      ];

      general = {
        gaps_in = 6;
        gaps_out = "12,12,12,12";
        border_size = 1;
        "col.active_border" =
          "0xee${config.colorScheme.palette.base0B} 0xee${config.colorScheme.palette.base0B} 45deg";
        "col.inactive_border" = "0xee${config.colorScheme.palette.base03}";
        layout = "hy3";
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
          passes = 2;
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
    extraConfig = ''
      plugin = ${inputs.hy3.packages.x86_64-linux.hy3}/lib/libhy3.so
      plugin {
        hy3 {
          tabs {
            radius = 4
            padding = 4
            border_width = 3
            text_font = JetBrainsMono Nerd Font

            # active tab bar segment colors
            col.active = rgba(${config.colorScheme.palette.base00}ee)
            col.active.border = rgba(${config.colorScheme.palette.base0D}ee)
            col.active.text = rgba(${config.colorScheme.palette.base05}ee)

            # focused tab bar segment colors (focused node in unfocused container)
            col.focused = rgba(${config.colorScheme.palette.base02}ee)
            col.focused.border = rgba(${config.colorScheme.palette.base0D}ee)
            col.focused.text = rgba(${config.colorScheme.palette.base05}ee)

            # inactive tab bar segment colors
            col.inactive = rgba(${config.colorScheme.palette.base03}ee)
            col.inactive.border = rgba(${config.colorScheme.palette.base03}ee)
            col.inactive.text = rgba(${config.colorScheme.palette.base05}ee)

            # urgent tab bar segment colors
            # col.urgent = <color> # default: rgba(ff223340)
            # col.urgent.border = <color> # default: rgba(ff2233ee)
            # col.urgent.text = <color> # default: rgba(ffffffff)

            # urgent tab bar segment colors
            # col.locked = <color> # default: rgba(90903340)
            # col.locked.border = <color> # default: rgba(909033ee)
            # col.locked.text = <color> # default: rgba(ffffffff)

            # if tab backgrounds should be blurred
            # Blur is only visible when the above colors are not opaque.
            # blur = <bool> # default: true

            # opacity multiplier for tabs
            # Applies to blur as well as the given colors.
            # opacity = <float> # default: 1.0
          }
        }
      }
    '';
  };
}
