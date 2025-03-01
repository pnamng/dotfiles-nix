{ pkgs, ... }:
{
  # fonts --------------------------------
  fonts = {
    packages = with pkgs; [
      inter
      font-awesome
      cascadia-code
      noto-fonts-cjk-sans
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "Overpass"
        ];
      })
    ];
    fontconfig = {
      cache32Bit = true;
      allowBitmaps = true;
      useEmbeddedBitmaps = true;
      subpixel.rgba = "rgb";
      hinting.style = "medium";
      defaultFonts = {
        serif = [ "NotoSerif" ];
        sansSerif = [ "Inter" ];
        monospace = [ "JetBrainsMono" ];
      };
    };
  };
}
