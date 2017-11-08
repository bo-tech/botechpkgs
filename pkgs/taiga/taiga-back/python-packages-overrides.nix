# Generated by pip2nix 0.7.0.dev1
# Adjust to your needs, e.g. to provide C libraries.

{ pkgs, basePythonPackages }:

self: super: {

  # Example adjustment for lxml: It needs a few C libraries
  #
  # lxml = super.lxml.override (attrs: {
  #   buildInputs = with self; [
  #     pkgs.libxml2
  #     pkgs.libxslt
  #   ];
  # });

  asana = super.asana.override (attrs: {
    patchPhase = ''
      echo > requirements.txt
      sed -i "s/requests~=2.9.1/requests >=2.9.1/" setup.py
      sed -i "s/requests_oauthlib~=0.6.1/requests_oauthlib >=0.6.1/" setup.py
    '';
  });

  sampledata = super.sampledata.override (attrs: {
    buildInputs = attrs.buildInputs ++ [
      basePythonPackages.versiontools
    ];
  });

  django-sampledatahelper = super.django-sampledatahelper.override (attrs: {
    buildInputs = attrs.buildInputs ++ [
      basePythonPackages.versiontools
    ];
  });

  # TODO: mbld: The setuptools from python-packages.nix gives us a infinite
  # recursion error. Currently not clear why this happens but using the standard
  # one works for now.
  setuptools = basePythonPackages.setuptools;

  # TODO: mbld: These derivations need some tweeks to build. Currently we use
  # the stock versions from nixpkgs. This may work without any problems but
  # later we should use the versions specified by taiga.
  Pillow = basePythonPackages.pillow;
  cffi = basePythonPackages.cffi;
  cryptography = basePythonPackages.cryptography;
  lxml = basePythonPackages.lxml;
  psycopg2 = basePythonPackages.psycopg2;

  # TODO: mbld: Failed to generate this with pip2nix so far.
  # CairoSVG = basePythonPackages.cairosvg;
  # django-pglocks = basePythonPackages.django-pglocks;

  # TODO: mbld: Use stock derivations to avoid duplicate packages in the
  # closure. These are needed because we are using some modules from stock
  # nixpkgs and these are dependencies which are also defined in
  # python-packages.nix
  six = basePythonPackages.six;
  requests = basePythonPackages.requests;
  requests-oauthlib = basePythonPackages.requests_oauthlib;
  oauthlib = basePythonPackages.oauthlib;
  PyJWT = basePythonPackages.pyjwt;

  # Taken from nixpkgs to inject custom django.
  django-pglocks = super.buildPythonPackage rec {
    pname = "django-pglocks";
    name = "${pname}-${version}";
    version = "1.0.2";

    meta = {
      description = "PostgreSQL locking context managers and functions for Django.";
      homepage = https://github.com/Xof/django-pglocks;
      license = pkgs.lib.licenses.mit;
    };

    src = basePythonPackages.fetchPypi {
      inherit pname version;
      sha256 = "1ks4k0bk4457wfl3xgzr4v7xb0lxmnkhxwhlp0bbnmzipdafw1cl";
    };

    buildInputs = [ self.Django ];
    propagatedBuildInputs = [ self.Django ];

    # tests need a postgres database
    doCheck = false;
  };

  taiga = super.buildPythonPackage rec {
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
      # TODO: mbld: doesn't build on OSX
      # CairoSVG
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
      ln -s ${self.gunicorn}/bin/gunicorn $out/bin/
      ln -s ${self.Django}/bin/django-admin $out/bin/
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
