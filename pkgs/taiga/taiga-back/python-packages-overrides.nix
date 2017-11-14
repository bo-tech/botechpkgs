# Generated by pip2nix 0.7.0.dev1
# Adjust to your needs, e.g. to provide C libraries.

{ pkgs, basePythonPackages }:

with pkgs.lib;

let
  stdenv = pkgs.stdenv;
in

self: super: {

  asana = super.asana.override (attrs: {
    patchPhase = ''
      echo > requirements.txt
      sed -i "s/requests~=2.9.1/requests >=2.9.1/" setup.py
      sed -i "s/requests_oauthlib~=0.6.1/requests_oauthlib >=0.6.1/" setup.py
    '';
  });

  Pillow = super.Pillow.override (oldAttrs: rec {
    buildInputs = with self; oldAttrs.buildInputs ++ [
      pkgs.freetype pkgs.libjpeg pkgs.zlib pkgs.libtiff pkgs.libwebp pkgs.tcl nose pkgs.lcms2 ]
      ++ optionals (isPyPy) [ pkgs.tk pkgs.xorg.libX11 ];

    # NOTE: we use LCMS_ROOT as WEBP root since there is not other setting for webp.
    preConfigure = let
      libinclude' = pkg: ''"${pkg.out}/lib", "${pkg.out}/include"'';
      libinclude = pkg: ''"${pkg.out}/lib", "${pkg.dev}/include"'';
    in ''
      sed -i "setup.py" \
          -e 's|^FREETYPE_ROOT =.*$|FREETYPE_ROOT = ${libinclude pkgs.freetype}|g ;
              s|^JPEG_ROOT =.*$|JPEG_ROOT = ${libinclude pkgs.libjpeg}|g ;
              s|^ZLIB_ROOT =.*$|ZLIB_ROOT = ${libinclude pkgs.zlib}|g ;
              s|^LCMS_ROOT =.*$|LCMS_ROOT = ${libinclude pkgs.lcms2}|g ;
              s|^TIFF_ROOT =.*$|TIFF_ROOT = ${libinclude pkgs.libtiff}|g ;
              s|^TCL_ROOT=.*$|TCL_ROOT = ${libinclude' pkgs.tcl}|g ;'
      export LDFLAGS="-L${pkgs.libwebp}/lib"
      export CFLAGS="-I${pkgs.libwebp}/include"
    ''
    # Remove impurities
    + stdenv.lib.optionalString stdenv.isDarwin ''
      substituteInPlace setup.py \
        --replace '"/Library/Frameworks",' "" \
        --replace '"/System/Library/Frameworks"' ""
    '';
  });

  lxml = super.lxml.override (oldAttrs: rec {
    buildInputs = with self;
      oldAttrs.buildInputs
      ++ [ pkgs.libxml2 pkgs.libxslt ];
    hardeningDisable = stdenv.lib.optional stdenv.isDarwin "format";
  });

  psycopg2 = super.psycopg2.override (oldAttrs: rec {
    buildInputs =
      with self;
      oldAttrs.buildInputs
      ++ optional stdenv.isDarwin pkgs.openssl;
    propagatedBuildInputs =
      with self;
      oldAttrs.propagatedBuildInputs
      ++ [ pkgs.postgresql ];
    doCheck = false;
  });

  cffi = super.cffi.override (oldAttrs: rec {
    propagatedBuildInputs =
      oldAttrs.propagatedBuildInputs
      ++ [ pkgs.libffi self.pycparser ];
    buildInputs =
      oldAttrs.buildInputs
      ++ [ basePythonPackages.pytest ];
    checkPhase = ''
      py.test
    '';
  });

  cryptography = super.cryptography.override (oldAttrs: rec {
    buildInputs =
      oldAttrs.buildInputs
      ++ [ pkgs.openssl ]
      ++ optional stdenv.isDarwin pkgs.darwin.apple_sdk.frameworks.Security;
    propagatedBuildInputs = with self;
      oldAttrs.propagatedBuildInputs
      ++ [ idna asn1crypto packaging six ]
      ++ optional (pythonOlder "3.4") enum34
      ++ optional (pythonOlder "3.3") ipaddress
      ++ optional (!isPyPy) cffi;

    checkInputs = with self;
      oldAttrs.checkInputs
      ++ [ pytest pretend iso8601 pytz hypothesis ];

    # The test assumes that if we're on Sierra or higher, that we use `getentropy`, but for binary
    # compatibility with pre-Sierra for binary caches, we hide that symbol so the library doesn't
    # use it. This boils down to them checking compatibility with `getentropy` in two different places,
    # so let's neuter the second test.
    postPatch = ''
      substituteInPlace ./tests/hazmat/backends/test_openssl.py --replace '"16.0"' '"99.0"'
    '';
  });

  # TODO: mbld: The setuptools from python-packages.nix gives us a infinite
  # recursion error. Currently not clear why this happens but using the standard
  # one works for now.
  setuptools = basePythonPackages.setuptools;

  taiga-back = super.buildPythonPackage rec {
    version = "3.1.0";
    name = "taiga-back-${version}";
    src = pkgs.fetchurl {
      url = "https://github.com/taigaio/taiga-back/archive/${version}.tar.gz";
      sha256 = "36a4d8b2f6eea295f4b2277d07932f31ad424430f96a6a7e85a4da349a236416";
    };
    doCheck = false;
    buildInputs = with self; [
      # Missing dependencies
      pkgs.gettext  # Needed to run "python manage.py compilemessages"
      # Deps from requirements.txt
      Django
      django-picklefield
      django-sampledatahelper
      gunicorn
      psycopg2
      Pillow
      pytz
      six
      amqp
      djmail
      django-jinja
      jinja2
      pygments
      django-sites
      Markdown
      fn
      diff-match-patch
      requests
      requests-oauthlib
      webcolors
      django-sr
      easy-thumbnails
      celery
      redis
      Unidecode
      raven
      bleach
      django-ipware
      premailer
      cssutils
      lxml
      django-pglocks
      pyjwkest
      python-dateutil
      netaddr
      serpy
      psd-tools
      CairoSVG
      cryptography
      PyJWT
      asana
    ];
    propagatedBuildInputs = with self; [];

    setup_py_file = pkgs.writeText "setup.py" ''
      from setuptools import setup, find_packages
      from os import path
      here = path.abspath(path.dirname(__file__))
      setup(
          name='taiga-back',
          version='${version}',
          description='Taiga Project',
          packages=find_packages(exclude=['locale', 'tests']),
          install_requires=[],
          package_data={
              'taiga': [
                  # Helper to find these paths:
                  # "find . ! -name '*.py' -and ! -name '*.pyc' -and -type f"
                  'base/static/emails/*',
                  'base/static/img/emojis/*',
                  'base/templates/emails/*',
                  'export_import/templates/emails/*',
                  'feedback/templates/emails/*',
                  'hooks/bitbucket/migrations/*',
                  'hooks/github/migrations/*',
                  'hooks/gitlab/migrations/*',
                  'hooks/gogs/migrations/*',
                  'importers/templates/emails/*',
                  'locale/**/LC_MESSAGES/*',
                  'projects/contact/templates/emails/*',
                  'projects/fixtures/*',
                  'projects/history/templates/emails/includes/*',
                  'projects/management/commands/sample_data/*',
                  'projects/notifications/templates/emails/**/*',
                  'projects/templates/emails/*',
                  'users/fixtures/*',
                  'users/static/img/*',
                  'users/templates/emails/*',
              ],
          },
      )
    '';

    preBuild = ''
      cp ${setup_py_file} setup.py
    '';

    postInstall = ''
      # Link some executables and wrap in proper PATH
      if [ ! -e $out/bin ]; then
        mkdir $out/bin
      fi
      ln -s ${self.gunicorn}/bin/gunicorn $out/bin/taiga-gunicorn
      ln -s ${self.Django}/bin/django-admin $out/bin/taiga-django-admin
      for file in $out/bin/*; do
        wrapProgram $file \
          --prefix PYTHONPATH : $PYTHONPATH \
          --prefix PATH : $PATH
      done

      # Remove development.py and create a local.py that loads the common
      # settings to prevent loading of dev settings.
      if [ -f $out/${self.python.sitePackages}/settings/development.py ]; then
        rm $out/${self.python.sitePackages}/settings/development.py
      fi
      if [ ! -e $out/${self.python.sitePackages}/settings/local.py ]; then
        echo "from .common import *" > $out/${self.python.sitePackages}/settings/local.py
      fi
    '';
  };

}
