{
  config,
  pkgs,
  ...
}:
{
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = { env = {
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
          x = 10;
          y = 10;
        };
        dimensions = {
          columns = 120;
          lines = 40;
        };
      };
      colors = {
        primary = {
          background = "#${config.colorScheme.palette.base00}";
          foreground = "#${config.colorScheme.palette.base05}";
        };
        normal = {
          black = "#${config.colorScheme.palette.base05}";
          red = "#${config.colorScheme.palette.base0E}";
          green = "#${config.colorScheme.palette.base0D}";
          yellow = "#${config.colorScheme.palette.base0A}";
          blue = "#${config.colorScheme.palette.base08}";
          magenta = "#${config.colorScheme.palette.base09}";
          cyan = "#${config.colorScheme.palette.base0B}";
          white = "#${config.colorScheme.palette.base03}";
        };
        bright = {
          black = "#${config.colorScheme.palette.base05}";
          red = "#${config.colorScheme.palette.base0E}";
          green = "#${config.colorScheme.palette.base0D}";
          yellow = "#${config.colorScheme.palette.base0A}";
          blue = "#${config.colorScheme.palette.base08}";
          magenta = "#${config.colorScheme.palette.base09}";
          cyan = "#${config.colorScheme.palette.base0B}";
          white = "#${config.colorScheme.palette.base03}";
        };
      };
    };
  };
}
