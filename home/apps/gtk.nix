{
  pkgs,
  config,
  inputs,
  ...
}:
let
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; })
    gtkThemeFromScheme
    ;
in
{
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
    theme = {
      name = "${config.colorScheme.slug}";
      package = gtkThemeFromScheme { scheme = config.colorScheme; };
      # package = pkgs.everforest-gtk-theme;
      # name = "Everforest-Dark-B-LB";
    };
    iconTheme = {
      name = "ePapirus";
    };
  };
}
