{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          monitor = "";
          path = "$lock-background"; # only png supported for now
          color = "rgba(25, 20, 20, 1.0)";
          blur_passes = 0; # 0 disables blurring
          blur_size = 7;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "720, 120";
          outline_thickness = 0;
          dots_text_format = "*";
          dots_size = 1; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = "center";
          dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
          outer_color = "rgba(15151500)";
          inner_color = "rgba(200, 200, 200, 0)";
          font_color = "$secondary-text";
          fade_on_empty = true;
          fade_timeout = 1000; # Milliseconds before fade_on_empty is triggered.
          placeholder_text = ""; # Text rendered in the input box when it's empty.
          hide_input = false;
          rounding = -1; # -1 means complete rounding (circle/oval)
          check_color = "rgb(204, 136, 34)";
          fail_color = "rgba(204, 34, 34, 0)"; # if authentication failed
          fail_text = ""; # can be set to empty
          fail_transition = 300; # transition time in ms
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1; # when both locks are active
          invert_numlock = false;
          swap_font_color = false;
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "🎵 $(playerctl metadata --format \"{{ title }}\")"'';
          text_align = "center";
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 24;
          font_family = "Overpass Nerd Font";
          rotate = 0; # degrees, counter-clockwise
          position = "-80, 60";
          halign = "right";
          valign = "bottom";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +%H:%M)</span>"'';
          text_align = "right";
          color = "$primary-text";
          font_size = 84;
          font_family = "JetBrainsMono Nerd Font";
          rotate = 0; # degrees, counter-clockwise
          position = "-80, 180";
          halign = "right";
          valign = "bottom";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +%d-%m-%y)</span>"'';
          text_align = "center";
          color = "$secondary-text";
          font_size = 24;
          font_family = "JetBrainsMono Nerd Font";
          rotate = 0; # degrees, counter-clockwise
          position = "-80, 160";
          halign = "right";
          valign = "bottom";
        }
      ];
    };
  };
}
