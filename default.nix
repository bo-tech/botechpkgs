self: super:

let
  callPackage = super.callPackage;
in

{

  btLib = callPackage ./lib { };

  nixos-container = super.nixos-container.overrideAttrs (oldAttrs: {
    src = ./pkgs/nixos-container/nixos-container.pl;
  });

  rhodecode = callPackage ./pkgs/rhodecode/enterprise { };

  taiga-back = callPackage ./pkgs/taiga/taiga-back {
    pythonPackages = self.python3Packages;
  };

  taiga-front-dist = callPackage ./pkgs/taiga/taiga-front { };

  vcsserver = callPackage ./pkgs/rhodecode/vcsserver {};

}
