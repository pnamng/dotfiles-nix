{ config, ... }:
{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: "Overpass Nerd Font", FontAwesome6Free;
        font-size: 12px;
      }

      window#waybar {
        border-radius: 12px;
        background-color: #${config.colorScheme.palette.base00};
      }

      window#waybar > box {
        padding: 4px;
        border-radius: 24px;
      }

      #workspaces button {
        padding: 0 4px;
        margin: 0 2px;
        color: #${config.colorScheme.palette.base0D};
      }

      #workspaces button.active {
        background-color: #${config.colorScheme.palette.base05};
        color: #${config.colorScheme.palette.base02};
      }

      #workspaces button.active:hover {
        color: #${config.colorScheme.palette.base0D};
      }

      #workspaces button:hover {
        color: #${config.colorScheme.palette.base05};
      }

      #cpu,
      #memory,
      #battery,
      #clock,
      #tray,
      #backlight,
      #pulseaudio,
      #custom-media,
      #submap,
      #network {
        font-family: "JetBrainsMono Nerd Font", FontAwesome6Free;
        padding: 0 8px;
      }

      #battery {
        color: #${config.colorScheme.palette.base0B};
      }

      #battery.good {
        color: #${config.colorScheme.palette.base0B};
      }

      #battery.warning {
        color: #${config.colorScheme.palette.base0E};
      }

      #battery.critical {
        color: #${config.colorScheme.palette.base08};
      }

      #submap.resize {
        background-color: #${config.colorScheme.palette.base0E};
      }

      #custom-nix {
        font-size: 16px;
        padding: 0 8px;
      }

      #clock {
        font-weight: bold;
        border: 1px solid #${config.colorScheme.palette.base05};
        border-radius: 8px;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 24;
        spacing = 0;
        margin-bottom = 8;
        margin-top = 0;
        margin-right = 12;
        margin-left = 12;
        modules-left = [
          "custom/nix"
          "clock"
          "custom/media"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "hyprland/submap"
          "cpu"
          "memory"
          "temperature"
          "battery"
          "battery#bat2"
          "network"
          "pulseaudio"
          "backlight"
          "tray"
        ];
        "hyprland/workspaces" = {
          align = "center";
          justify = "center";
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "10" = "";
            default = "";
          };
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
            "7" = [ ];
            "8" = [ ];
            "9" = [ ];
            "10" = [ ];
          };
        };
        "custom/nix" = {
          format = "󱄅";
        };
        "custom/media" = {
          format = { };
          max-length = 60;
          format-icons = {
            spotify = " ";
            default = "";
          };
          escape = true;
          exec = "playerctl --follow metadata --format \"{{title}}  |  {{artist}}\"";
        };
        "custom/weather" = {
          format = "{}";
          tooltip = true;
          interval = 120;
          exec = "$HOME/.config/waybar/waybar-wttr.py 2> /dev/null";
          return-type = "json";
        };
        mpd = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 5;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };
        tray = {
          icon-size = 16;
          spacing = 10;
        };
        clock = {
          timezone = "Asia/Ho_Chi_Minh";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'>{}</span>";
              days = "<span color='#ecc6d9'>{}</span>";
              weeks = "<span color='#99ffdd'>W{}</span>";
              weekdays = "<span color='#ffcc66'>{}</span>";
              today = "<span color='#ff6699'><u>{}</u></span>";
            };
          };
        };
        cpu = {
          format = "  {usage}%";
          tooltip = false;
        };
        memory = {
          format = " {}%";
        };
        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };
        backlight = {
          format = "{icon}  {percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        battery = {
          states = {
            good = 80;
            warning = 20;
            critical = 10;
          };
          format = "{icon} {capacity}%";
          format-full = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
        };
        "battery#bat2" = {
          bat = "BAT2";
        };
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            "power-saver" = "";
          };
        };
        network = {
          format-wifi = " ";
          format-ethernet = " {ipaddr}/{cidr}";
          tooltip-format = " {essid} ({signalStrength}%)";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          format = "{icon}  {volume}% {format_source}";
          format-bluetooth = "{icon} {volume}% {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
          on-click-right = "wpctl set-mute @DEFAULT_SOURCE@ toggle";
        };
      };
    };
  };
}
