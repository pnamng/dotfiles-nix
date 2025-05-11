{ config, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      font = "JetBrainsMono Nerd Font 12";
      background-color = "#${config.colorScheme.palette.base00}";
      text-color = "#${config.colorScheme.palette.base05}";
      border-color = "#${config.colorScheme.palette.base0D}";
      border-size = 2;
      border-radius = 20;
      padding = "10";
      default-timeout = 3000;
      max-visible = 3;
      width = 400;
      height = 100;
    };
    criteria = {
      "urgency=low" = {
        border-color = "#${config.colorScheme.palette.base03}";
        background-color = "#${config.colorScheme.palette.base00}";
        text-color = "#${config.colorScheme.palette.base05}";
      };

      "urgency=normal" = {
        border-color = "#${config.colorScheme.palette.base0D}";
        background-color = "#${config.colorScheme.palette.base00}";
        text-color = "#${config.colorScheme.palette.base05}";
      };

      "urgency=critical" = {
        border-color = "#${config.colorScheme.palette.base09}";
        background-color = "#${config.colorScheme.palette.base00}";
        text-color = "#${config.colorScheme.palette.base09}";
      };
    };
  };
}
