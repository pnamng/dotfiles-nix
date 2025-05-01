{
  services.hyprpaper = {
    enable = true;
    settings = {
      # ipc = "on";
      splash = false;
      # splash_offset = 2.0;

      preload = [
        "~/.dotfiles/walls/red-white.jpg"
      ];

      wallpaper = [
        ",~/.dotfiles/walls/red-white.jpg"
      ];
    };
  };
}
