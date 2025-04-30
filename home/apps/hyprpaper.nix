{
  services.hyprpaper = {
    enable = true;
    settings = {
      # ipc = "on";
      splash = false;
      # splash_offset = 2.0;

      preload = [
        "~/.dotfiles/walls/gruvbox-dark-rainbow.png"
      ];

      wallpaper = [
        ",~/.dotfiles/walls/gruvbox-dark-rainbow.png "
      ];
    };
  };
}
