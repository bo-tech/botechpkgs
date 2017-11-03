{ pkgs ? import <nixpkgs> {},
  stdenv ? pkgs.stdenv,
  fetchurl ? pkgs.fetchurl}:

stdenv.mkDerivation rec {
  name = "taiga-front-dist";
  version = "3.1.0";
  src = fetchurl {
    url = "https://github.com/taigaio/taiga-front-dist/archive/${version}-stable.tar.gz";
    sha256 = "103in77vlvkzgf4i95483rn7gf5scnwbqckaqrvkfwh5rq0yas2a";
  };
  buildPhase = "";
  installPhase = ''
    mkdir $out
    cp -r dist $out/dist
  '';
}
