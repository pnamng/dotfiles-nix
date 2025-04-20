{
  mainBar = {
    layer = "top";
    position = "bottom";
    height = 24;
    spacing = 0;
    margin-bottom = 0;
    margin-top = 0;
    margin-right = 0;
    margin-left = 0;
    modules-left = [
      "hyprland/workspaces"
      "custom/media"
    ];
    modules-center = [];
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
      "clock"
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
        "1" = [];
        "2" = [];
        "3" = [];
        "4" = [];
        "5" = [];
        "6" = [];
        "7" = [];
        "8" = [];
        "9" = [];
        "10" = [];
      };
    };
    "custom/media" = {
      format = {};
      max-length = 120;
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
      format-icons = ["" "" ""];
    };
    backlight = {
      format = "{icon}  {percent}%";
      format-icons = ["" "" "" "" "" "" "" "" ""];
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
      format-icons = [" " " " " " " " " "];
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
        default = ["" "" ""];
      };
      on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      on-click-right = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
    };
  };
}
