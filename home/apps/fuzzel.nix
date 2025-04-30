{ config, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        prompt = "> ";
        lines = 10;
        width = 40;
        terminal = "alacritty";
        vertical-pad = 24;
      };
      colors = {
        background = "${config.colorScheme.palette.base00}ff"; # #0f111b with alpha
        text = "${config.colorScheme.palette.base05}ff"; # #ecf0c1 with alpha
        match = "${config.colorScheme.palette.base0E}ff"; # Green for matched text
        selection = "${config.colorScheme.palette.base0D}ff"; # Purple for selected item background
        selection-text = "${config.colorScheme.palette.base02}ff"; # Text on selected item
        selection-match = "${config.colorScheme.palette.base0E}ff"; # Green for matched text in selection
        border = "${config.colorScheme.palette.base02}ff"; # Purple border
      };
      border = {
        width = 2;
        radius = 5;
      };
      dmenu = {
        exit-immediately-if-empty = true;
      };
    };
  };
}
