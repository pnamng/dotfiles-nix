{
  pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
  },
}:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    nodejs_20
    docker
    n8n
  ];

  # GREETING = "Node 20";

  # shellHook = ''
  #   echo $GREETING | cowsay | lolcat
  # '';
}
