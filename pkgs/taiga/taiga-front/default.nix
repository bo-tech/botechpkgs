{ pkgs ? import <nixpkgs> {},
  stdenv ? pkgs.stdenv,
  fetchgit ? pkgs.fetchgit
}:

stdenv.mkDerivation rec {
  name = "taiga-front-dist";
  version = "3.1.0";
  src = fetchgit {
    url = "https://github.com/taigaio/taiga-front-dist.git";
    rev = "ac88fa2f9127c26173c2dd04e59dd076a3899ab9";
    sha256 = "17m2yzpxj0nmbljfb47hp90bchhnkk32wdw2dznpa74fb6gdp619";
  };
  buildPhase = "";
  installPhase = ''
    mkdir $out
    cp -r dist $out/dist
  '';
}
