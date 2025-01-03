# let
#   nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11";
#   pkgs = import nixpkgs { config = {}; overlays = []; };
# in
{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShellNoCC {
    packages = with pkgs; [
      cowsay
        lolcat
        nodejs_18
    ];

    GREETING = "Node 18!";

    shellHook = ''
      echo $GREETING | cowsay | lolcat
      '';
  }
