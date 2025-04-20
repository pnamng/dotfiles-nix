{
  env = {
    TERM = "xterm-256color";
  };

  font = {
    normal = {
      family = "JetBrainsMono Nerd Font";
      style = "Regular";
    };
    bold = {
      family = "JetBrainsMono Nerd Font";
      style = "Bold";
    };
    italic = {
      family = "JetBrainsMono Nerd Font";
      style = "Italic";
    };
    size = 11.0;
    offset = {
      x = 0;
      y = -2;
    };
    glyph_offset = {
      x = 0;
      y = 0;
    };
  };

  window = {
    opacity = 1.0;
    dynamic_padding = false;
    padding = {
      x = 4;
      y = 4;
    };
    dimensions = {
      columns = 120;
      lines = 40;
    };
  };

  colors = {
    primary = {
      background = "#0f111b";
      foreground = "#ecf0c1";
    };
    normal = {
      black = "#000000";
      red = "#e33400";
      green = "#5ccc96";
      yellow = "#b3a1e6";
      blue = "#00a3cc";
      magenta = "#f2ce00";
      cyan = "#7a5ccc";
      white = "#686f9a";
    };
    bright = {
      black = "#686f9a";
      red = "#e33400";
      green = "#5ccc96";
      yellow = "#b3a1e6";
      blue = "#00a3cc";
      magenta = "#f2ce00";
      cyan = "#7a5ccc";
      white = "#f0f1ce";
    };
  };
}
