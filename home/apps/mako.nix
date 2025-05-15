{ config, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      font = "JetBrainsMono Nerd Font 11";
      background-color = "#${config.colorScheme.palette.base00}";
      text-color = "#${config.colorScheme.palette.base05}";
      border-color = "#${config.colorScheme.palette.base0D}";
      border-size = 2;
      border-radius = 20;
      icon-border-radius = 12;
      padding = 8;
      default-timeout = 3000;
      max-visible = 3;
      width = 420;
      height = 100;
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
