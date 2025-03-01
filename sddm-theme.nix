{ pkgs }:

# let
#   imgLink = "https://raw.githubusercontent.com/pnamng/dotfiles-nix/refs/heads/main/walls/wallhaven-gpo753.jpg";
#
#   image = pkgs.fetchurl {
#     url = imgLink;
#     sha256 = "sha256-HrcYriKliK2QN02/2vFK/osFjTT1NamhGKik3tozGU0=";
#   };
# in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-chili";
    rev = "6516d50176c3b34df29003726ef9708813d06271";
    sha256 = "sha256-wxWsdRGC59YzDcSopDRzxg8TfjjmA3LHrdWjepTuzgw=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
  '';
}
