{ pkgs, lib, ... }:

with lib;

commonPrefix: name: package: pkgs.stdenv.mkDerivation {
  name = "${optionalString (commonPrefix != null) "${commonPrefix}-"}${name}-symlink";
  phases = "installPhase";
  installPhase = ''
    location=$out/opt${optionalString (commonPrefix != null) ("/" + commonPrefix)}
    mkdir -p $location
    ln -s ${package} $location/${name}
  '';
}
