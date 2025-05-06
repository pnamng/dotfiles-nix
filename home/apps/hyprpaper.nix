{
  services.hyprpaper = {
    enable = true;
    settings = {
      # ipc = "on";
      splash = false;
      # splash_offset = 2.0;

      preload = [
        "~/.dotfiles/walls/everforest-stairs.jpeg"
      ];

      wallpaper = [
        ",~/.dotfiles/walls/everforest-stairs.jpeg"
      ];
    };
  };
}
