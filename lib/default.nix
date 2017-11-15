{ callPackage, ... }:

rec {

  makeOptSymlinkPrefix = callPackage ./make-opt-symlink.nix { };

  makeOptSymlink = makeOptSymlinkPrefix null;

}
