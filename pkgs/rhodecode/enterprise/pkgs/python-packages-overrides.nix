# Overrides for the generated python-packages.nix
#
# This function is intended to be used as an extension to the generated file
# python-packages.nix. The main objective is to add needed dependencies of C
# libraries and tweak the build instructions where needed.

{ pkgs, basePythonPackages }:

let
  sed = "sed -i";
  localLicenses = {
    repoze = {
      fullName = "Repoze License";
      url =  http://www.repoze.org/LICENSE.txt;
    };
  };

in

self: super: {

  appenlight-client = super.appenlight-client.override (attrs: {
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  });

  future = super.future.override (attrs: {
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  });

  gnureadline = super.gnureadline.override (attrs: {
    buildInputs = attrs.buildInputs ++ [
      pkgs.ncurses
    ];
    patchPhase = ''
      substituteInPlace setup.py --replace "/bin/bash" "${pkgs.bash}/bin/bash"
    '';
  });

  gunicorn = super.gunicorn.override (attrs: {
    propagatedBuildInputs = attrs.propagatedBuildInputs ++ [
      # johbo: futures is needed as long as we are on Python 2, otherwise
      # gunicorn explodes if used with multiple threads per worker.
      self.futures
    ];
  });

  nbconvert = super.nbconvert.override (attrs: {
    propagatedBuildInputs = attrs.propagatedBuildInputs ++ [
      # marcink: plug in jupyter-client for notebook rendering
      self.jupyter-client
    ];
  });

  ipython = super.ipython.override (attrs: {
    propagatedBuildInputs =
    let
      basePropagatedBuildInputs =
        if (! pkgs.stdenv.isDarwin)
        then pkgs.lib.remove self.appnope attrs.propagatedBuildInputs
        else attrs.propagatedBuildInputs;
    in
      basePropagatedBuildInputs ++ [
        self.gnureadline
      ];
  });

  celery = super.celery.override (attrs: {
    # The current version of kombu needs some patching to work with the
    # other libs. Should be removed once we update celery and kombu.
    patches = [
      ./patch-celery-dateutil.diff
    ];
  });

  kombu = super.kombu.override (attrs: {
    # The current version of kombu needs some patching to work with the
    # other libs. Should be removed once we update celery and kombu.
    patches = [
      ./patch-kombu-py-2-7-11.diff
      ./patch-kombu-msgpack.diff
    ];
  });

  lxml = super.lxml.override (attrs: {
    # johbo: On 16.09 we need this to compile on darwin, otherwise compilation
    # fails on Darwin.
    hardeningDisable = if pkgs.stdenv.isDarwin then [ "format" ] else [];
    buildInputs = with self; [
      pkgs.libxml2
      pkgs.libxslt
    ];
    propagatedBuildInputs = attrs.propagatedBuildInputs ++ [
      # Needed, so that "setup.py bdist_wheel" does work
      self.wheel
    ];
  });

  MySQL-python = super.MySQL-python.override (attrs: {
    buildInputs = attrs.buildInputs ++ [
      pkgs.openssl
    ];
    propagatedBuildInputs = attrs.propagatedBuildInputs ++ [
      pkgs.mysql.lib
      pkgs.zlib
    ];
  });

  psutil = super.psutil.override (attrs: {
    buildInputs = attrs.buildInputs ++
      pkgs.lib.optional pkgs.stdenv.isDarwin pkgs.darwin.IOKit;
  });

  psycopg2 = super.psycopg2.override (attrs: {
    buildInputs = attrs.buildInputs ++
      pkgs.lib.optional pkgs.stdenv.isDarwin pkgs.openssl;
    propagatedBuildInputs = attrs.propagatedBuildInputs ++ [
      pkgs.postgresql
    ];
    meta = {
      license = pkgs.lib.licenses.lgpl3Plus;
    };
  });

  py-gfm = super.py-gfm.override  {
    name = "py-gfm-0.1.3.rhodecode-upstream1";
  };

  pycurl = super.pycurl.override (attrs: {
    propagatedBuildInputs = attrs.propagatedBuildInputs ++ [
      pkgs.curl
      pkgs.openssl
    ];
    preConfigure = ''
      substituteInPlace setup.py --replace '--static-libs' '--libs'
      export PYCURL_SSL_LIBRARY=openssl
    '';
    meta = {
      # TODO: It is LGPL and MIT
      license = pkgs.lib.licenses.mit;
    };
  });

  Pylons = super.Pylons.override (attrs: {
    name = "Pylons-1.0.2.rhodecode-patch1";
  });

  pyramid = super.pyramid.override (attrs: {
    postFixup = ''
      wrapPythonPrograms
      # TODO: johbo: "wrapPython" adds this magic line which
      # confuses pserve.
      ${sed} '/import sys; sys.argv/d' $out/bin/.pserve-wrapped
    '';
    meta = {
      license = localLicenses.repoze;
    };
  });

  pyramid-debugtoolbar = super.pyramid-debugtoolbar.override (attrs: {
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal localLicenses.repoze ];
    };
  });

  pysqlite = super.pysqlite.override (attrs: {
    propagatedBuildInputs = [
      pkgs.sqlite
    ];
    meta = {
      license = [ pkgs.lib.licenses.zlib pkgs.lib.licenses.libpng ];
    };
  });

  pytest-runner = super.pytest-runner.override (attrs: {
    propagatedBuildInputs = [
      self.setuptools-scm
    ];
  });

  python-ldap = super.python-ldap.override (attrs: {
    propagatedBuildInputs = attrs.propagatedBuildInputs ++ [
      pkgs.cyrus_sasl
      pkgs.openldap
      pkgs.openssl
    ];
    # TODO: johbo: Remove the "or" once we drop 16.03 support.
    NIX_CFLAGS_COMPILE = "-I${pkgs.cyrus_sasl.dev or pkgs.cyrus_sasl}/include/sasl";
  });

  python-pam = super.python-pam.override (attrs:
    let
      includeLibPam = pkgs.stdenv.isLinux;
    in {
      # TODO: johbo: Move the option up into the default.nix, we should
      # include python-pam only on supported platforms.
      propagatedBuildInputs = attrs.propagatedBuildInputs ++
        pkgs.lib.optional includeLibPam [
          pkgs.pam
        ];
      # TODO: johbo: Check if this can be avoided, or transform into
      # a real patch
      patchPhase = pkgs.lib.optionals includeLibPam ''
        substituteInPlace pam.py \
          --replace 'find_library("pam")' '"${pkgs.pam}/lib/libpam.so.0"'
      '';
    });

  pyzmq = super.pyzmq.override (attrs: {
    buildInputs = attrs.buildInputs ++ [
      pkgs.czmq
    ];
  });

  URLObject = super.URLObject.override (attrs: {
    meta = {
      license = {
        spdxId = "Unlicense";
        fullName = "The Unlicense";
        url = http://unlicense.org/;
      };
    };
  });

  amqplib = super.amqplib.override (attrs: {
    meta = {
      license = pkgs.lib.licenses.lgpl3;
    };
  });

  docutils = super.docutils.override (attrs: {
    meta = {
      license = pkgs.lib.licenses.bsd2;
    };
  });

  colander = super.colander.override (attrs: {
    meta = {
      license = localLicenses.repoze;
    };
  });

  pyramid-beaker  = super.pyramid-beaker.override (attrs: {
    meta = {
      license = localLicenses.repoze;
    };
  });

  pyramid-mako = super.pyramid-mako.override (attrs: {
    meta = {
      license = localLicenses.repoze;
    };
  });

  repoze.lru = super.repoze.lru.override (attrs: {
    meta = {
      license = localLicenses.repoze;
    };
  });

  recaptcha-client = super.recaptcha-client.override (attrs: {
    meta = {
      # TODO: It is MIT/X11
      license = pkgs.lib.licenses.mit;
    };
  });

  python-editor = super.python-editor.override (attrs: {
    meta = {
      license = pkgs.lib.licenses.asl20;
    };
  });

  translationstring = super.translationstring.override (attrs: {
    meta = {
      license = localLicenses.repoze;
    };
  });

  venusian = super.venusian.override (attrs: {
    meta = {
      license = localLicenses.repoze;
    };
  });

  # Avoid that setuptools is replaced, this leads to trouble
  # with buildPythonPackage.
  setuptools = basePythonPackages.setuptools;

}
