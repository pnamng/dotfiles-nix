# let
#   nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11";
#   pkgs = import nixpkgs { config = {}; overlays = []; };
# in
{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShellNoCC {
    packages = with pkgs; [
      cowsay
      lolcat
      nodejs_20
    ];

    GREETING = "Node 20";

      shellHook = ''
      echo $GREETING | cowsay | lolcat
      '';
}
