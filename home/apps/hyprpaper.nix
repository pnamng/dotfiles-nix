{
  services.hyprpaper = {
    enable = true;
    settings = {
      # ipc = "on";
      splash = false;
      # splash_offset = 2.0;

      preload = [
        "~/.dotfiles/walls/sequoia-dark.png"
      ];

      wallpaper = [
        ",~/.dotfiles/walls/sequoia-dark.png"
      ];
    };
  };
}
