self: super: let

  # lib = super.lib;

  # callPackage = super.callPackage;

in {
  nixos-container = super.nixos-container.overrideAttrs (oldAttrs: {
    src = ./pkgs/nixos-container/nixos-container.pl;
  });

  # rhodecode = callPackage ./pkgs/rhodecode/enterprise { };

  # taiga-back = callPackage ./pkgs/taiga/taiga-back { };

  # taiga-front-dist = callPackage ./pkgs/taiga/taiga-front { };

  # vcsserver = callPackage ./pkgs/rhodecode/vcsserver {};

}
