{
  env = {
    TERM = "xterm-256color";
  };

  font = {
    normal = {
      family = "CascadiaCode";
      style = "Regular";
    };
    bold = {
      family = "CascadiaCode";
      style = "Bold";
    };
    italic = {
      family = "CascadiaCode";
      style = "Italic";
    };
    size = 11.0;
    offset = {
      x = 0;
      y = 0;
    };
    glyph_offset = {
      x = 0;
      y = 0;
    };
  };

  window = {
    opacity = 0.8;
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
      background = "#272e33";
      foreground = "#d3c6aa";
    };
    normal = {
      black = "#414b50";
      red = "#e67e80";
      green = "#a7c080";
      yellow = "#dbbc7f";
      blue = "#7fbbb3";
      magenta = "#d699b6";
      cyan = "#83c092";
      white = "#d3c6aa";

    };
    bright = {
      black = "#475258";
      red = "#e67e80";
      green = "#a7c080";
      yellow = "#dbbc7f";
      blue = "#7fbbb3";
      magenta = "#d699b6";
      cyan = "#83c092";
      white = "#d3c6aa";
    };
  };
}
