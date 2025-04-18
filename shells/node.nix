# let
#   nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11";
#   pkgs = import nixpkgs { config = {}; overlays = []; };
# in
{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    cowsay
    lolcat
    nodejs_20
    python310
    stdenv.cc.cc.lib
  ];

  GREETING = "Node 20 + Python 3.10";

  shellHook = ''
    echo $GREETING | cowsay | lolcat
  '';
}
