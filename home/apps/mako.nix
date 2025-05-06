{ config, ... }:
{
  services.mako = {
    enable = true;
    font = "JetBrainsMono Nerd Font 12";
    backgroundColor = "#${config.colorScheme.palette.base00}";
    textColor = "#${config.colorScheme.palette.base05}";
    borderColor = "#${config.colorScheme.palette.base0D}";
    borderSize = 2;
    borderRadius = 20;
    padding = "10";
    defaultTimeout = 3000;
    maxVisible = 3;
    width = 400;
    height = 100;
    extraConfig = ''
      [urgency=low]
      border-color=#${config.colorScheme.palette.base03}
      background-color=#${config.colorScheme.palette.base00}
      text-color=#${config.colorScheme.palette.base05}

      [urgency=normal]
      border-color=#${config.colorScheme.palette.base0D}
      background-color=#${config.colorScheme.palette.base00}
      text-color=#${config.colorScheme.palette.base05}

      [urgency=critical]
      border-color=#${config.colorScheme.palette.base09}
      background-color=#${config.colorScheme.palette.base00}
      text-color=#${config.colorScheme.palette.base09}
    '';
  };
}
