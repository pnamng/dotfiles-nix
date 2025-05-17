{
  services.hyprpaper = {
    enable = true;
    settings = {
      # ipc = "on";
      splash = false;
      # splash_offset = 2.0;

      preload = [
        "~/.dotfiles/walls/chaffins-dolomites.jpg"
      ];

      wallpaper = [
        ",~/.dotfiles/walls/chaffins-dolomites.jpg"
      ];
    };
  };
}
