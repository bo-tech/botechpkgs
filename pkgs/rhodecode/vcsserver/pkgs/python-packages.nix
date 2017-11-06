# Generated by pip2nix 0.7.0.dev1
# See https://github.com/johbo/pip2nix

{ pkgs, fetchurl, fetchgit, fetchhg }:

self: super: {
  Beaker = super.buildPythonPackage {
    name = "Beaker-1.9.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [funcsigs];
    src = fetchurl {
      url = "https://pypi.python.org/packages/93/b2/12de6937b06e9615dbb3cb3a1c9af17f133f435bdef59f4ad42032b6eb49/Beaker-1.9.0.tar.gz";
      sha256 = "1gwmssmh1lhkh372c4rhaynxqz5xk2v2glj7wi64ldhq6sd0yz9i";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  Jinja2 = super.buildPythonPackage {
    name = "Jinja2-2.9.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [MarkupSafe];
    src = fetchurl {
      url = "https://pypi.python.org/packages/90/61/f820ff0076a2599dd39406dcb858ecb239438c02ce706c8e91131ab9c7f1/Jinja2-2.9.6.tar.gz";
      sha256 = "1zzrkywhziqffrzks14kzixz7nd4yh2vc0fb04a68vfd2ai03anx";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  Mako = super.buildPythonPackage {
    name = "Mako-1.0.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [MarkupSafe];
    src = fetchurl {
      url = "https://pypi.python.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz";
      sha256 = "1bi5gnr8r8dva06qpyx4kgjc6spm2k1y908183nbbaylggjzs0jf";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  MarkupSafe = super.buildPythonPackage {
    name = "MarkupSafe-1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz";
      sha256 = "0rdn1s8x9ni7ss8rfiacj7x1085lx8mh2zdwqslnw8xc3l4nkgm6";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  PasteDeploy = super.buildPythonPackage {
    name = "PasteDeploy-1.5.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/0f/90/8e20cdae206c543ea10793cbf4136eb9a8b3f417e04e40a29d72d9922cbd/PasteDeploy-1.5.2.tar.gz";
      sha256 = "1jz3m4hq8v6hyhfjz9425nd3nvn52cvbfipdcd72krjmla4qz1fm";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  WebOb = super.buildPythonPackage {
    name = "WebOb-1.7.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/46/87/2f96d8d43b2078fae6e1d33fa86b95c228cebed060f4e3c7576cc44ea83b/WebOb-1.7.3.tar.gz";
      sha256 = "10vjp2rvqiyvw157fk3sy7yds1gknzw97z4gk0qv1raskx5s2p76";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  WebTest = super.buildPythonPackage {
    name = "WebTest-2.0.27";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six WebOb waitress beautifulsoup4];
    src = fetchurl {
      url = "https://pypi.python.org/packages/80/fa/ca3a759985c72e3a124cbca3e1f8a2e931a07ffd31fd45d8f7bf21cb95cf/WebTest-2.0.27.tar.gz";
      sha256 = "05dns4ppr61s5lkxka0kvmq4cd7jaxks7ddwflshp2pji4kbssib";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  appnope = super.buildPythonPackage {
    name = "appnope-0.1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/26/34/0f3a5efac31f27fabce64645f8c609de9d925fe2915304d1a40f544cff0e/appnope-0.1.0.tar.gz";
      sha256 = "0wgdwp5v7r4g2bss8vbdxah12hsy2mvzxh3sil9s4iskjbz5z6cb";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  backports.shutil-get-terminal-size = super.buildPythonPackage {
    name = "backports.shutil-get-terminal-size-1.0.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/ec/9c/368086faa9c016efce5da3e0e13ba392c9db79e3ab740b763fe28620b18b/backports.shutil_get_terminal_size-1.0.0.tar.gz";
      sha256 = "107cmn7g3jnbkp826zlj8rrj19fam301qvaqf0f3905f5217lgki";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  beautifulsoup4 = super.buildPythonPackage {
    name = "beautifulsoup4-4.6.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/fa/8d/1d14391fdaed5abada4e0f63543fef49b8331a34ca60c88bd521bcf7f782/beautifulsoup4-4.6.0.tar.gz";
      sha256 = "12cf0ygpz9srpfh9gx2f9ba0swa1rzypv3sm4r0hmjyw6b4nm2w0";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  configobj = super.buildPythonPackage {
    name = "configobj-5.0.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz";
      sha256 = "00h9rcmws03xvdlfni11yb60bz3kxfvsj6dg6nrpzj71f03nbxd2";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  cov-core = super.buildPythonPackage {
    name = "cov-core-1.15.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [coverage];
    src = fetchurl {
      url = "https://pypi.python.org/packages/4b/87/13e75a47b4ba1be06f29f6d807ca99638bedc6b57fa491cd3de891ca2923/cov-core-1.15.0.tar.gz";
      sha256 = "0k3np9ymh06yv1ib96sb6wfsxjkqhmik8qfsn119vnhga9ywc52a";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  coverage = super.buildPythonPackage {
    name = "coverage-3.7.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/09/4f/89b06c7fdc09687bca507dc411c342556ef9c5a3b26756137a4878ff19bf/coverage-3.7.1.tar.gz";
      sha256 = "0knlbq79g2ww6xzsyknj9rirrgrgc983dpa2d9nkdf31mb2a3bni";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  decorator = super.buildPythonPackage {
    name = "decorator-4.0.11";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/cc/ac/5a16f1fc0506ff72fcc8fd4e858e3a1c231f224ab79bb7c4c9b2094cc570/decorator-4.0.11.tar.gz";
      sha256 = "0xpyzmxghpym05vfwifnb87rfzprjx7pym6g54rg805ihbq6ngcm";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal { fullName = "new BSD License"; } ];
    };
  };
  dulwich = super.buildPythonPackage {
    name = "dulwich-0.13.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/84/95/732d280eee829dacc954e8109f97b47abcadcca472c2ab013e1635eb4792/dulwich-0.13.0.tar.gz";
      sha256 = "0f1jwvrh549c4rgavkn3wizrch904s73s4fmrxykxy9cw8s57lwf";
    };
    meta = {
      license = [ pkgs.lib.licenses.gpl2Plus ];
    };
  };
  enum34 = super.buildPythonPackage {
    name = "enum34-1.1.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz";
      sha256 = "1cgm5ng2gcfrkrm3hc22brl6chdmv67b9zvva9sfs7gn7dwc9n4a";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  funcsigs = super.buildPythonPackage {
    name = "funcsigs-1.0.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/94/4a/db842e7a0545de1cdb0439bb80e6e42dfe82aaeaadd4072f2263a4fbed23/funcsigs-1.0.2.tar.gz";
      sha256 = "0l4g5818ffyfmfs1a924811azhjj8ax9xd1cffr1mzd3ycn0zfx7";
    };
    meta = {
      license = [ { fullName = "ASL"; } pkgs.lib.licenses.asl20 ];
    };
  };
  gevent = super.buildPythonPackage {
    name = "gevent-1.2.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [greenlet];
    src = fetchurl {
      url = "https://pypi.python.org/packages/1b/92/b111f76e54d2be11375b47b213b56687214f258fd9dae703546d30b837be/gevent-1.2.2.tar.gz";
      sha256 = "0bbbjvi423y9k9xagrcsimnayaqymg6f2dj76m9z3mjpkjpci4a7";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  gprof2dot = super.buildPythonPackage {
    name = "gprof2dot-2016.10.13";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a0/e0/73c71baed306f0402a00a94ffc7b2be94ad1296dfcb8b46912655b93154c/gprof2dot-2016.10.13.tar.gz";
      sha256 = "1x3wwj1p1hi7xi0m6l21k8k1iwifzrwdl3zk7fr8x2lbq9lf3ha8";
    };
    meta = {
      license = [ { fullName = "LGPL"; } ];
    };
  };
  greenlet = super.buildPythonPackage {
    name = "greenlet-0.4.12";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/be/76/82af375d98724054b7e273b5d9369346937324f9bcc20980b45b068ef0b0/greenlet-0.4.12.tar.gz";
      sha256 = "0zilms19nfrs820dh1hmfb02aa3ql2w67bzxh7a57ld521h9rjg4";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  gunicorn = super.buildPythonPackage {
    name = "gunicorn-19.7.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/30/3a/10bb213cede0cc4d13ac2263316c872a64bf4c819000c8ccd801f1d5f822/gunicorn-19.7.1.tar.gz";
      sha256 = "08mnl5l1p47q5wk38d7mafnhsqk50yba0l9kvc2vwrx61jgidqgf";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  hg-evolve = super.buildPythonPackage {
    name = "hg-evolve-6.6.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c5/04/3557c97eaa320b5a6769edade64a299cd2710f5f3b818f64991ab6c8c08f/hg-evolve-6.6.0.tar.gz";
      sha256 = "1jvmq5sxmg1cgklg8xk4w070xpvm8b61v6i08rpga2da2kdismqf";
    };
    meta = {
      license = [ { fullName = "GPLv2+"; } ];
    };
  };
  hgsubversion = super.buildPythonPackage {
    name = "hgsubversion-1.8.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [mercurial subvertpy];
    src = fetchurl {
      url = "https://pypi.python.org/packages/1c/b8/ff4d2e0ec486f9765b410f09728c02a010e7485d68d6154968074498a403/hgsubversion-1.8.7.tar.gz";
      sha256 = "0llk2h5zimdr54qbdzk0rqm6n04qsh0xj4iwq4yw75dsm2pjii2i";
    };
    meta = {
      license = [ pkgs.lib.licenses.gpl1 ];
    };
  };
  hupper = super.buildPythonPackage {
    name = "hupper-1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/2e/07/df892c564dc09bb3cf6f6deb976c26adf9117db75ba218cb4353dbc9d826/hupper-1.0.tar.gz";
      sha256 = "02lj6kgaf9xpr0binxwac3gpdhljglyj9fr78s165jc7qd7mifdg";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  infrae.cache = super.buildPythonPackage {
    name = "infrae.cache-1.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [Beaker repoze.lru];
    src = fetchurl {
      url = "https://pypi.python.org/packages/bb/f0/e7d5e984cf6592fd2807dc7bc44a93f9d18e04e6a61f87fdfb2622422d74/infrae.cache-1.0.1.tar.gz";
      sha256 = "1dvqsjn8vw253wz9d1pz17j79mf4bs53dvp2qxck2qdp1am1njw4";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpl21 ];
    };
  };
  ipdb = super.buildPythonPackage {
    name = "ipdb-0.10.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools ipython];
    src = fetchurl {
      url = "https://pypi.python.org/packages/ad/cc/0e7298e1fbf2efd52667c9354a12aa69fb6f796ce230cca03525051718ef/ipdb-0.10.3.tar.gz";
      sha256 = "0a1bxpxhs2s0wj9s5v2j6gh6sv4c977c7pxr1y215ghg52s5d8ly";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  ipython = super.buildPythonPackage {
    name = "ipython-5.1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools decorator pickleshare simplegeneric traitlets prompt-toolkit pygments appnope pexpect backports.shutil-get-terminal-size pathlib2 pexpect appnope];
    src = fetchurl {
      url = "https://pypi.python.org/packages/89/63/a9292f7cd9d0090a0f995e1167f3f17d5889dcbc9a175261719c513b9848/ipython-5.1.0.tar.gz";
      sha256 = "0qdrf6aj9kvjczd5chj1my8y2iq09am9l8bb2a1334a52d76kx3y";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  ipython-genutils = super.buildPythonPackage {
    name = "ipython-genutils-0.2.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399/ipython_genutils-0.2.0.tar.gz";
      sha256 = "1a4bc9y8hnvq6cp08qs4mckgm6i6ajpndp4g496rvvzcfmp12bpb";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  mercurial = super.buildPythonPackage {
    name = "mercurial-4.2.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/9e/12/b6586b07b725b7c54683808033cb26fab9a46f6e7b17fd7e38655a5e5d48/mercurial-4.2.2.tar.gz";
      sha256 = "1zhabwc0m59rkvx4nibykzhfynw9d5018cx18gp2fvdfqpg340dj";
    };
    meta = {
      license = [ pkgs.lib.licenses.gpl1 pkgs.lib.licenses.gpl2Plus ];
    };
  };
  mock = super.buildPythonPackage {
    name = "mock-1.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/15/45/30273ee91feb60dabb8fbb2da7868520525f02cf910279b3047182feed80/mock-1.0.1.zip";
      sha256 = "1g5dkfqygaxgf49m4dyrss47n07zqrfaxf6gpin07794m86hi0wg";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  msgpack-python = super.buildPythonPackage {
    name = "msgpack-python-0.4.8";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/21/27/8a1d82041c7a2a51fcc73675875a5f9ea06c2663e02fcfeb708be1d081a0/msgpack-python-0.4.8.tar.gz";
      sha256 = "11pqk5braa6wndpnr1dhg64js82vjgxnm0lzy73rwl831zgijaqs";
    };
    meta = {
      license = [ pkgs.lib.licenses.asl20 ];
    };
  };
  pathlib2 = super.buildPythonPackage {
    name = "pathlib2-2.3.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six scandir];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a1/14/df0deb867c2733f7d857523c10942b3d6612a1b222502fdffa9439943dfb/pathlib2-2.3.0.tar.gz";
      sha256 = "1cx5gs2v9j2vnzmcrbq5l8fq2mwrr1h6pyf1sjdji2w1bavm09fk";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pexpect = super.buildPythonPackage {
    name = "pexpect-4.2.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [ptyprocess];
    src = fetchurl {
      url = "https://pypi.python.org/packages/e8/13/d0b0599099d6cd23663043a2a0bb7c61e58c6ba359b2656e6fb000ef5b98/pexpect-4.2.1.tar.gz";
      sha256 = "14ls7k99pwvl21zqv65kzrhccv50j89m5ij1hf0slmsvlxjj84rx";
    };
    meta = {
      license = [ pkgs.lib.licenses.isc { fullName = "ISC License (ISCL)"; } ];
    };
  };
  pickleshare = super.buildPythonPackage {
    name = "pickleshare-0.7.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pathlib2];
    src = fetchurl {
      url = "https://pypi.python.org/packages/69/fe/dd137d84daa0fd13a709e448138e310d9ea93070620c9db5454e234af525/pickleshare-0.7.4.tar.gz";
      sha256 = "0yvk14dzxk7g6qpr7iw23vzqbsr0dh4ij4xynkhnzpfz4xr2bac4";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  plaster = super.buildPythonPackage {
    name = "plaster-1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools];
    src = fetchurl {
      url = "https://pypi.python.org/packages/37/e1/56d04382d718d32751017d32f351214384e529b794084eee20bb52405563/plaster-1.0.tar.gz";
      sha256 = "1hy8k0nv2mxq94y5aysk6hjk9ryb4bsd13g83m60hcyzxz3wflc3";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  plaster-pastedeploy = super.buildPythonPackage {
    name = "plaster-pastedeploy-0.4.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [PasteDeploy plaster];
    src = fetchurl {
      url = "https://pypi.python.org/packages/9d/6e/f8be01ed41c94e6c54ac97cf2eb142a702aae0c8cce31c846f785e525b40/plaster_pastedeploy-0.4.1.tar.gz";
      sha256 = "1lrbkya5birfmg9gnfcnsa9id28klmjcqbm33rcg69pv9sfld4jv";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  prompt-toolkit = super.buildPythonPackage {
    name = "prompt-toolkit-1.0.15";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six wcwidth];
    src = fetchurl {
      url = "https://pypi.python.org/packages/8a/ad/cf6b128866e78ad6d7f1dc5b7f99885fb813393d9860778b2984582e81b5/prompt_toolkit-1.0.15.tar.gz";
      sha256 = "05v9h5nydljwpj5nm8n804ms0glajwfy1zagrzqrg91wk3qqi1c5";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  ptyprocess = super.buildPythonPackage {
    name = "ptyprocess-0.5.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/51/83/5d07dc35534640b06f9d9f1a1d2bc2513fb9cc7595a1b0e28ae5477056ce/ptyprocess-0.5.2.tar.gz";
      sha256 = "0ra31k10v3629xq0kdn8lwmfbi97anmk48r03yvh7mks0kq96hg6";
    };
    meta = {
      license = [  ];
    };
  };
  py = super.buildPythonPackage {
    name = "py-1.4.34";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/68/35/58572278f1c097b403879c1e9369069633d1cbad5239b9057944bb764782/py-1.4.34.tar.gz";
      sha256 = "1qyd5z0hv8ymxy84v5vig3vps2fvhcf4bdlksb3r03h549fmhb8g";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pygments = super.buildPythonPackage {
    name = "pygments-2.2.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz";
      sha256 = "1k78qdvir1yb1c634nkv6rbga8wv4289xarghmsbbvzhvr311bnv";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  pyramid = super.buildPythonPackage {
    name = "pyramid-1.9.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools WebOb repoze.lru zope.interface zope.deprecation venusian translationstring PasteDeploy plaster plaster-pastedeploy hupper];
    src = fetchurl {
      url = "https://pypi.python.org/packages/9a/57/73447be9e7d0512d601e3f0a1fb9d7d1efb941911f49efdfe036d2826507/pyramid-1.9.1.tar.gz";
      sha256 = "0dhbzc4q0vsnv3aihy728aczg56xs6h9s1rmvr096q4lb6yln3w4";
    };
    meta = {
      license = [ { fullName = "Repoze Public License"; } { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  pyramid-jinja2 = super.buildPythonPackage {
    name = "pyramid-jinja2-2.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pyramid zope.deprecation Jinja2 MarkupSafe];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a1/80/595e26ffab7deba7208676b6936b7e5a721875710f982e59899013cae1ed/pyramid_jinja2-2.5.tar.gz";
      sha256 = "1gcnhd2bfrw6l5x68xdshnmz4ix0mf8h2r369lgk0m5l0cqnxj4k";
    };
    meta = {
      license = [ { fullName = "Repoze Public License"; } { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  pyramid-mako = super.buildPythonPackage {
    name = "pyramid-mako-1.0.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pyramid Mako];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f1/92/7e69bcf09676d286a71cb3bbb887b16595b96f9ba7adbdc239ffdd4b1eb9/pyramid_mako-1.0.2.tar.gz";
      sha256 = "18gk2vliq8z4acblsl6yzgbvnr9rlxjlcqir47km7kvlk1xri83d";
    };
    meta = {
      license = [ { fullName = "Repoze Public License"; } { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  pytest = super.buildPythonPackage {
    name = "pytest-3.1.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [py setuptools];
    src = fetchurl {
      url = "https://pypi.python.org/packages/72/2b/2d3155e01f45a5a04427857352ee88220ee39550b2bc078f9db3190aea46/pytest-3.1.2.tar.gz";
      sha256 = "1gvrx0ybpn67fcgp76c0dv4jvpmxsjyfh739jfjj42x7pfgw4pkr";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pytest-catchlog = super.buildPythonPackage {
    name = "pytest-catchlog-1.2.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [py pytest];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f2/2b/2faccdb1a978fab9dd0bf31cca9f6847fbe9184a0bdcc3011ac41dd44191/pytest-catchlog-1.2.2.zip";
      sha256 = "1w7wxh27sbqwm4jgwrjr9c2gy384aca5jzw9c0wzhl0pmk2mvqab";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pytest-cov = super.buildPythonPackage {
    name = "pytest-cov-2.5.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytest coverage];
    src = fetchurl {
      url = "https://pypi.python.org/packages/24/b4/7290d65b2f3633db51393bdf8ae66309b37620bc3ec116c5e357e3e37238/pytest-cov-2.5.1.tar.gz";
      sha256 = "0bbfpwdh9k3636bxc88vz9fa7vf4akchgn513ql1vd0xy4n7bah3";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal pkgs.lib.licenses.mit ];
    };
  };
  pytest-profiling = super.buildPythonPackage {
    name = "pytest-profiling-1.2.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six pytest gprof2dot];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f9/0d/df67fb9ce16c2cef201693da956321b1bccfbf9a4ead39748b9f9d1d74cb/pytest-profiling-1.2.6.tar.gz";
      sha256 = "08sqmsm0rnmgbzpzv075jgwia39cz1vgwx44nna815s9nf334w6i";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pytest-runner = super.buildPythonPackage {
    name = "pytest-runner-2.11.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/9e/4d/08889e5e27a9f5d6096b9ad257f4dea1faabb03c5ded8f665ead448f5d8a/pytest-runner-2.11.1.tar.gz";
      sha256 = "1cw978kqqcq916b9gfns1qjqvg33c5ail5jhw9054dsynkm32flq";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  pytest-sugar = super.buildPythonPackage {
    name = "pytest-sugar-0.8.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytest termcolor];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a5/b0/b2773dee078f17773a5bf2dfad49b0be57b6354bbd84bbefe4313e509d87/pytest-sugar-0.8.0.tar.gz";
      sha256 = "13njxd4sm0b8lcx02vznswfa0q9pwknym0mnzl4sy03hjr4bz5ih";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  pytest-timeout = super.buildPythonPackage {
    name = "pytest-timeout-1.2.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytest];
    src = fetchurl {
      url = "https://pypi.python.org/packages/cc/b7/b2a61365ea6b6d2e8881360ae7ed8dad0327ad2df89f2f0be4a02304deb2/pytest-timeout-1.2.0.tar.gz";
      sha256 = "1f3wy93637yqp6dw1xmqwrzkswr81fi8qsxxb60755q8y5l337n2";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit { fullName = "DFSG approved"; } ];
    };
  };
  repoze.lru = super.buildPythonPackage {
    name = "repoze.lru-0.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/6e/1e/aa15cc90217e086dc8769872c8778b409812ff036bf021b15795638939e4/repoze.lru-0.6.tar.gz";
      sha256 = "0cdx3fq67qfcdrb3h9rjjcvks2zfrgyd834indncplqnywxk4yhg";
    };
    meta = {
      license = [ { fullName = "Repoze Public License"; } { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  rhodecode-vcsserver = super.buildPythonPackage {
    name = "rhodecode-vcsserver-4.10.0";
    buildInputs = with self; [pytest py pytest-cov pytest-sugar pytest-runner pytest-catchlog pytest-profiling gprof2dot pytest-timeout mock WebTest cov-core coverage configobj];
    doCheck = true;
    propagatedBuildInputs = with self; [Beaker configobj decorator dulwich hgsubversion hg-evolve infrae.cache mercurial msgpack-python pyramid-jinja2 pyramid pyramid-mako repoze.lru simplejson subprocess32 subvertpy six translationstring WebOb zope.deprecation zope.interface gevent greenlet gunicorn waitress ipdb ipython pytest py pytest-cov pytest-sugar pytest-runner pytest-catchlog pytest-profiling gprof2dot pytest-timeout mock WebTest cov-core coverage];
    src = ./src;
    meta = {
      license = [ { fullName = "GPL V3"; } { fullName = "GNU General Public License v3 or later (GPLv3+)"; } ];
    };
  };
  scandir = super.buildPythonPackage {
    name = "scandir-1.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/77/3f/916f524f50ee65e3f465a280d2851bd63685250fddb3020c212b3977664d/scandir-1.6.tar.gz";
      sha256 = "0f23can26zr597g8jclb6w42nnxbr0kbyrmyxnd5dh669cnql9z0";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal { fullName = "New BSD License"; } ];
    };
  };
  setuptools = super.buildPythonPackage {
    name = "setuptools-30.1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/1e/43/002c8616db9a3e7be23c2556e39b90a32bb40ba0dc652de1999d5334d372/setuptools-30.1.0.tar.gz";
      sha256 = "0pw8brhlfdgc431xsk4ckdj7iad7dc87g30jf3w2xv0c4s1z3ivk";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  simplegeneric = super.buildPythonPackage {
    name = "simplegeneric-0.8.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b/simplegeneric-0.8.1.zip";
      sha256 = "0wwi1c6md4vkbcsfsf8dklf3vr4mcdj4mpxkanwgb6jb1432x5yw";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpl21 ];
    };
  };
  simplejson = super.buildPythonPackage {
    name = "simplejson-3.11.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/08/48/c97b668d6da7d7bebe7ea1817a6f76394b0ec959cb04214ca833c34359df/simplejson-3.11.1.tar.gz";
      sha256 = "1rr58dppsq73p0qcd9bsw066cdd3v63sqv7j6sqni8frvm4jv8h1";
    };
    meta = {
      license = [ { fullName = "Academic Free License (AFL)"; } pkgs.lib.licenses.mit ];
    };
  };
  six = super.buildPythonPackage {
    name = "six-1.9.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/16/64/1dc5e5976b17466fd7d712e59cbe9fb1e18bec153109e5ba3ed6c9102f1a/six-1.9.0.tar.gz";
      sha256 = "1mci5i8mjqmljmv33h0q3d4djc13zk1kfmb3fbvd3yy43x0m4h72";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  subprocess32 = super.buildPythonPackage {
    name = "subprocess32-3.2.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b8/2f/49e53b0d0e94611a2dc624a1ad24d41b6d94d0f1b0a078443407ea2214c2/subprocess32-3.2.7.tar.gz";
      sha256 = "14350dhhlhyz5gqzi3lihn9m6lvskx5mcb20srx1kgsk9i50li8y";
    };
    meta = {
      license = [ pkgs.lib.licenses.psfl ];
    };
  };
  subvertpy = super.buildPythonPackage {
    name = "subvertpy-0.9.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://code.rhodecode.com/upstream/subvertpy/archive/subvertpy-0.9.3.tar.gz?md5=4e49da2fe07608239cc9a80a7bb8f33c";
      sha256 = "02fqy8ij7iavsh8brjffsjv15f8j7vs010rays3cra93qm8wmjnn";
    };
    meta = {
      license = [ pkgs.lib.licenses.lgpl21Plus ];
    };
  };
  termcolor = super.buildPythonPackage {
    name = "termcolor-1.1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz";
      sha256 = "0fv1vq14rpqwgazxg4981904lfyp84mnammw7y046491cv76jv8x";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  traitlets = super.buildPythonPackage {
    name = "traitlets-4.3.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [ipython-genutils six decorator enum34];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a5/98/7f5ef2fe9e9e071813aaf9cb91d1a732e0a68b6c44a32b38cb8e14c3f069/traitlets-4.3.2.tar.gz";
      sha256 = "0dbq7sx26xqz5ixs711k5nc88p8a0nqyz6162pwks5dpcz9d4jww";
    };
    meta = {
      license = [ pkgs.lib.licenses.bsdOriginal ];
    };
  };
  translationstring = super.buildPythonPackage {
    name = "translationstring-1.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/5e/eb/bee578cc150b44c653b63f5ebe258b5d0d812ddac12497e5f80fcad5d0b4/translationstring-1.3.tar.gz";
      sha256 = "0bdpcnd9pv0131dl08h4zbcwmgc45lyvq3pa224xwan5b3x4rr2f";
    };
    meta = {
      license = [ { fullName = "BSD-like (http://repoze.org/license.html)"; } ];
    };
  };
  venusian = super.buildPythonPackage {
    name = "venusian-1.1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/38/24/b4b470ab9e0a2e2e9b9030c7735828c8934b4c6b45befd1bb713ec2aeb2d/venusian-1.1.0.tar.gz";
      sha256 = "0zapz131686qm0gazwy8bh11vr57pr89jbwbl50s528sqy9f80lr";
    };
    meta = {
      license = [ { fullName = "BSD-derived (http://www.repoze.org/LICENSE.txt)"; } ];
    };
  };
  waitress = super.buildPythonPackage {
    name = "waitress-1.0.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/cd/f4/400d00863afa1e03618e31fd7e2092479a71b8c9718b00eb1eeb603746c6/waitress-1.0.2.tar.gz";
      sha256 = "0pw6yyxi348r2xpq3ykqnf7gwi881azv2422d2ixb0xi5jws2ky7";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpl21 ];
    };
  };
  wcwidth = super.buildPythonPackage {
    name = "wcwidth-0.1.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz";
      sha256 = "0pn6dflzm609m4r3i8ik5ni9ijjbb5fa3vg1n7hn6vkd49r77wrx";
    };
    meta = {
      license = [ pkgs.lib.licenses.mit ];
    };
  };
  zope.deprecation = super.buildPythonPackage {
    name = "zope.deprecation-4.1.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c1/d3/3919492d5e57d8dd01b36f30b34fc8404a30577392b1eb817c303499ad20/zope.deprecation-4.1.2.tar.gz";
      sha256 = "0y0bxdhw0c4z80q2gspp6igi2k2ip0b6jnssrh9hqq7w3ysj5mpy";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpl21 ];
    };
  };
  zope.interface = super.buildPythonPackage {
    name = "zope.interface-4.1.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [setuptools];
    src = fetchurl {
      url = "https://pypi.python.org/packages/9d/81/2509ca3c6f59080123c1a8a97125eb48414022618cec0e64eb1313727bfe/zope.interface-4.1.3.tar.gz";
      sha256 = "0ks8h73b2g4bkad821qbv0wzjppdrwys33i7ka45ik3wxjg1l8if";
    };
    meta = {
      license = [ pkgs.lib.licenses.zpl21 ];
    };
  };

### Test requirements

  
}