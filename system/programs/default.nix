{
  imports = [
    ./fonts.nix
  ];

  programs.hyprland.enable = true;
  programs.firefox.enable = true;

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "mortalscumbag";
      plugins = [
        "z"
        "git"
      ];
    };
  };
}
