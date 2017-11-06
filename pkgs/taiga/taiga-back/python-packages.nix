# Generated by pip2nix 0.7.0.dev1
# See https://github.com/johbo/pip2nix

{ pkgs, fetchurl, fetchgit, fetchhg }:

self: super: {
  Django = super.buildPythonPackage {
    name = "Django-1.10.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/1d/07/fb81c7ed26abbfadd84185be80b5b949219948c4bfd7c30c5c1436d5fd7d/Django-1.10.6.tar.gz";
      sha256 = "0q9c7hx720vc0jzq4xlxwhnxmmm8kh0qsqj3l46m29mi98jvwvks";
    };
  };
  Markdown = super.buildPythonPackage {
    name = "Markdown-2.6.8";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/1d/25/3f6d2cb31ec42ca5bd3bfbea99b63892b735d76e26f20dd2dcc34ffe4f0d/Markdown-2.6.8.tar.gz";
      sha256 = "0cqfhr1km2s5d8jm6hbwgkrrj9hvkjf2gab3s2axlrw1clgaij0a";
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
  };
  Pillow = super.buildPythonPackage {
    name = "Pillow-3.4.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/46/4f/94f6165052774839b4a4af0c72071aa528d5dc8cb8bc6bb43e24a55c10cc/Pillow-3.4.2.tar.gz";
      sha256 = "1l9nxhf1pqcfclm94qb2gx80v8sv6gh340h0ymgpabk00mf9gs8f";
    };
  };
  PyJWT = super.buildPythonPackage {
    name = "PyJWT-1.4.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/8f/10/9ce7e91d8ec9d852db6f9f2b076811d9f51ed7b0360602432d95e6ea4feb/PyJWT-1.4.2.tar.gz";
      sha256 = "0w7m2wg6vjdq3i88m92d9mr6k9v20knnj54n24akba5zlfvk3a47";
    };
  };
  Unidecode = super.buildPythonPackage {
    name = "Unidecode-0.4.20";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/ba/64/410af95d27f2a8824112d17ed41ea7ce6d2cbc8a4832c2e548d3408fad0a/Unidecode-0.04.20.tar.gz";
      sha256 = "1q00i8gpsq3d9r0q8wk4b290fxl0kqlsdk7iadvli45in6s1hi7d";
    };
  };
  amqp = super.buildPythonPackage {
    name = "amqp-2.1.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [vine];
    src = fetchurl {
      url = "https://pypi.python.org/packages/23/39/06bb8bd31e78962675f696498f7821f5dbd11aa0919c5a811d83a0e02609/amqp-2.1.4.tar.gz";
      sha256 = "1ybywzkd840v1qvb1p2bs08js260vq1jscjg8182hv7bmwacqy0k";
    };
  };
  asana = super.buildPythonPackage {
    name = "asana-0.6.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [requests requests-oauthlib six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f8/f7/500b4d42b96658f9bd65a9cca6c99ab0134516727eeef4eb1a4fff2626e4/asana-0.6.2.tar.gz";
      sha256 = "0skai72392n3i1c4bl3hn2kh5lj990qsbasdwkbjdcy6vq57jggf";
    };
  };
  billiard = super.buildPythonPackage {
    name = "billiard-3.5.0.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/39/ac/f5571210cca2e4f4532e38aaff242f26c8654c5e2436bee966c230647ccc/billiard-3.5.0.3.tar.gz";
      sha256 = "1riwiiwgb141151md4ykx49qrz749akj5k8g290ji9bsqjyj4yqx";
    };
  };
  bleach = super.buildPythonPackage {
    name = "bleach-1.5.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six html5lib];
    src = fetchurl {
      url = "https://pypi.python.org/packages/99/00/25a8fce4de102bf6e3cc76bc4ea60685b2fee33bde1b34830c70cacc26a7/bleach-1.5.0.tar.gz";
      sha256 = "0rdwb3piwwl30wfqg4ywm07276w7090xfq71lb5d6k5mk62pb3lp";
    };
  };
  celery = super.buildPythonPackage {
    name = "celery-4.0.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pytz billiard kombu];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b2/b7/888565f3e955473247aef86174db5121d16de6661b69bd8f3d10aff574f6/celery-4.0.2.tar.gz";
      sha256 = "0kgmbs3fl9879n48p4m79nxy9by2yhvxq1jdvlnqzzvkdb2sdmg3";
    };
  };
  cffi = super.buildPythonPackage {
    name = "cffi-1.11.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pycparser];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c9/70/89b68b6600d479034276fed316e14b9107d50a62f5627da37fafe083fde3/cffi-1.11.2.tar.gz";
      sha256 = "19h0wwz9cww74gw8cyq0izj8zkhjyzjw2d3ks1c3f1y4q28xv1xb";
    };
  };
  cryptography = super.buildPythonPackage {
    name = "cryptography-1.7.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [idna pyasn1 six setuptools cffi];
    src = fetchurl {
      url = "https://pypi.python.org/packages/82/f7/d6dfd7595910a20a563a83a762bf79a253c4df71759c3b228accb3d7e5e4/cryptography-1.7.1.tar.gz";
      sha256 = "0k6v7wq4h0yk9r0x0bl2x9fyrg4a6gj5qp4m9mgpk6m481yyygwm";
    };
  };
  cssselect = super.buildPythonPackage {
    name = "cssselect-1.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/77/ff/9c865275cd19290feba56344eba570e719efb7ca5b34d67ed12b22ebbb0d/cssselect-1.0.1.tar.gz";
      sha256 = "0xs0fi2ymyq5krd5qk569nz4ykjwvq6nrz3252g40j4k9c2irnvk";
    };
  };
  cssutils = super.buildPythonPackage {
    name = "cssutils-1.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/22/de/6b03e0088baf0299ab7d2e95a9e26c2092e9cb3855876b958b6a62175ca2/cssutils-1.0.1.tar.gz";
      sha256 = "0qwha9x1wml2qmipbcz03gndnlwhzrjdvw9i09si247a90l8p8fq";
    };
  };
  diff-match-patch = super.buildPythonPackage {
    name = "diff-match-patch-20121119";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/22/82/46eaeab04805b4fac17630b59f30c4f2c8860988bcefd730ff4f1992908b/diff-match-patch-20121119.tar.gz";
      sha256 = "0k1f3v8nbidcmmrk65m7h8v41jqi37653za9fcs96y7jzc8mdflx";
    };
  };
  django-ipware = super.buildPythonPackage {
    name = "django-ipware-1.1.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/94/c6/b08db9d173eb87fef85301b48b8202d969f36aad332f25e85abf7e6ce733/django-ipware-1.1.6.tar.gz";
      sha256 = "00zah4g2h93nbsijz556j97v9qkn9sxcia1a2wrwdwnav2fhzack";
    };
  };
  django-jinja = super.buildPythonPackage {
    name = "django-jinja-2.2.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [jinja2 Django];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a0/ed/651dff14c9a9a93417ec548fabaa628b5f92bb50a74d87f461c2a1d43bef/django-jinja-2.2.2.tar.gz";
      sha256 = "099b99iprkvlsndrjmw4v3i3i60i9gm1aq5r88z15r7vgmv6sigj";
    };
  };
  django-picklefield = super.buildPythonPackage {
    name = "django-picklefield-0.3.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/9c/22/602e6d010248786d72b70c7ca16b0d19ec513897a39861a957a092a77b08/django-picklefield-0.3.2.tar.gz";
      sha256 = "1qlsbp3798ii68ny9zlz2ppkna00jf7i4hmjal3p8433gi18md7s";
    };
  };
  django-sampledatahelper = super.buildPythonPackage {
    name = "django-sampledatahelper-0.4.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six Django sampledata];
    src = fetchurl {
      url = "https://pypi.python.org/packages/2b/fe/e8ef20ee17dcd5d4df96c36dcbcaca7a79d6a2f8dc319f4e25107e000859/django-sampledatahelper-0.4.1.tar.gz";
      sha256 = "1795zg73lajcsfyd8i8cprb2v93d4csifjnld6bfnya90ncsbl4n";
    };
  };
  django-sites = super.buildPythonPackage {
    name = "django-sites-0.9";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [Django];
    src = fetchurl {
      url = "https://pypi.python.org/packages/67/6b/1b814292d71d32f0380fb6256f639cf154227b753184f83f900c4ccfe3ea/django-sites-0.9.tar.gz";
      sha256 = "05nrydk4a5a99qrxjrcnacs8nbbq5pfjikdpj4w9yn5yfayp057s";
    };
  };
  django-sr = super.buildPythonPackage {
    name = "django-sr-0.0.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [Django];
    src = fetchurl {
      url = "https://pypi.python.org/packages/3b/da/7d19c3d34a0f7180530733abdd0bbd0742de4a0fce51883a0e7f65ae6a4f/django-sr-0.0.4.tar.gz";
      sha256 = "0d3yqppi1q3crcn9nxx58wzm4yw61d5m7435g6rb9wcamr9bi1im";
    };
  };
  djmail = super.buildPythonPackage {
    name = "djmail-1.0.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/22/de/b2064db0285751f0ce6646c4512497c39c60aab0bf8ba0732e3002736f97/djmail-1.0.0.tar.gz";
      sha256 = "0i6h5s8m9clxjy4nw9lfdgl379aig4s9pzkr97xbki8g0frnc6aq";
    };
  };
  docopt = super.buildPythonPackage {
    name = "docopt-0.6.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz";
      sha256 = "14f4hn6d1j4b99svwbaji8n2zj58qicyz19mm0x6pmhb50jsics9";
    };
  };
  easy-thumbnails = super.buildPythonPackage {
    name = "easy-thumbnails-2.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [Django Pillow];
    src = fetchurl {
      url = "https://pypi.python.org/packages/bb/af/b7909bb2f5b842c459c772cf50a7ceda635e8055d0be411705171732bb28/easy-thumbnails-2.3.tar.gz";
      sha256 = "1qhdiw4sphqhsni05v1xlsn6vbp1r85wi6wylm5gxnr6c047zras";
    };
  };
  fn = super.buildPythonPackage {
    name = "fn-0.4.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/a2/32/9d184dc2e8225af558e155a3865d610df8533d5d48a2ed5943bf8a30a137/fn-0.4.3.tar.gz";
      sha256 = "1nmsjmn8jb4gp22ksx0j0hhdf4y0zm8rjykyy2i6flzimg6q1kgq";
    };
  };
  future = super.buildPythonPackage {
    name = "future-0.16.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz";
      sha256 = "1nzy1k4m9966sikp0qka7lirh8sqrsyainyf8rk97db7nwdfv773";
    };
  };
  gunicorn = super.buildPythonPackage {
    name = "gunicorn-19.6.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/84/ce/7ea5396efad1cef682bbc4068e72a0276341d9d9d0f501da609fab9fcb80/gunicorn-19.6.0.tar.gz";
      sha256 = "065n5z91607q4l8wncqkz297cdcb60cz8wnyxy88wk4as4b6jgw1";
    };
  };
  html5lib = super.buildPythonPackage {
    name = "html5lib-0.9999999";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/ae/ae/bcb60402c60932b32dfaf19bb53870b29eda2cd17551ba5639219fb5ebf9/html5lib-0.9999999.tar.gz";
      sha256 = "0s28fp85hizzik3hh94x84ibgp5rpd8blhby0px2p16mm28s24i6";
    };
  };
  idna = super.buildPythonPackage {
    name = "idna-2.6";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz";
      sha256 = "13qaab6d0s15gknz8v3zbcfmbj6v86hn9pjxgkdf62ch13imssic";
    };
  };
  jinja2 = super.buildPythonPackage {
    name = "jinja2-2.9.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [MarkupSafe];
    src = fetchurl {
      url = "https://pypi.python.org/packages/71/59/d7423bd5e7ddaf3a1ce299ab4490e9044e8dfd195420fc83a24de9e60726/Jinja2-2.9.5.tar.gz";
      sha256 = "09a87292xi1nla648d6sw4hhr38r51hxndksba6zlmpqjbcj8akh";
    };
  };
  kombu = super.buildPythonPackage {
    name = "kombu-4.1.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [amqp];
    src = fetchurl {
      url = "https://pypi.python.org/packages/03/5e/1a47d1e543d4943d65330af4e4406049f443878818fb65bfdc651bb93a96/kombu-4.1.0.tar.gz";
      sha256 = "1jvkaaflz174fwnjf5x2s46k3jak0vrdxhnif72cw7xzkpfxjja2";
    };
  };
  lxml = super.buildPythonPackage {
    name = "lxml-3.7.3";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/39/e8/a8e0b1fa65dd021d48fe21464f71783655f39a41f218293c1c590d54eb82/lxml-3.7.3.tar.gz";
      sha256 = "1iv1jgkqn1hdh1xyxri6g0y1s67h01jzjkw2nhkx3rqylmw2sl5a";
    };
  };
  netaddr = super.buildPythonPackage {
    name = "netaddr-0.7.19";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/0c/13/7cbb180b52201c07c796243eeff4c256b053656da5cfe3916c3f5b57b3a0/netaddr-0.7.19.tar.gz";
      sha256 = "1zdfadvpq4lmcqzr383gywxn4xyn355kj1n3lk9q2l03vmyfrbiq";
    };
  };
  oauthlib = super.buildPythonPackage {
    name = "oauthlib-2.0.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/78/46/c19c2d374a37d218c551717d873670216af7242bc92958df1701dcc5e76d/oauthlib-2.0.4.tar.gz";
      sha256 = "04sdsy1qb1psxrkl36jwk6bvjccjipa0f8k9jvam7panncy2jkji";
    };
  };
  premailer = super.buildPythonPackage {
    name = "premailer-3.0.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [lxml cssselect cssutils requests];
    src = fetchurl {
      url = "https://pypi.python.org/packages/73/2e/bc055726855f2416e5b9ede631bd16d69b0366d425befb83048c600b492b/premailer-3.0.1.tar.gz";
      sha256 = "0cmlvqx1dvy16k5q5ylmr43nlfpb9k2zl3q7s4kzhf0lml4wqwaf";
    };
  };
  psd-tools = super.buildPythonPackage {
    name = "psd-tools-1.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [docopt];
    src = fetchurl {
      url = "https://pypi.python.org/packages/21/b2/cba69da51d30d2228ae1efbc9ed1d9f22e1bfaa7125dca20c0b66855f776/psd-tools-1.4.tar.gz";
      sha256 = "0g2vss5hwlk96w0yj42n7ia56mly51n92f2rlbrifhn8hfbxd38s";
    };
  };
  psycopg2 = super.buildPythonPackage {
    name = "psycopg2-2.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/62/ca/0a479c9664526e86c2913a7ad593586eeb86b428b7e629e7c7b6b69e3cb7/psycopg2-2.7.tar.gz";
      sha256 = "16izkxa9x6mvzamdmlwzdxidibaifc5g7bjvx8qplkxdc3vfrbff";
    };
  };
  pyasn1 = super.buildPythonPackage {
    name = "pyasn1-0.3.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/3c/a6/4d6c88aa1694a06f6671362cb3d0350f0d856edea4685c300785200d1cd9/pyasn1-0.3.7.tar.gz";
      sha256 = "0ra9mlf35v7bg9brv2m83mz2i868nwrh1h6mha73ys0psrk2lzqq";
    };
  };
  pycparser = super.buildPythonPackage {
    name = "pycparser-2.18";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz";
      sha256 = "09mjyw82ibqzl449g7swy8bfxnfpmas0815d2rkdjlcqw81wma4r";
    };
  };
  pycryptodomex = super.buildPythonPackage {
    name = "pycryptodomex-3.4.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/d6/99/56ac930e35394c93440f1a6e254cf4573098503ff4c1851e820600a46a85/pycryptodomex-3.4.7.tar.gz";
      sha256 = "0nhb1sqf9049s7abm1l3m0l1wq90qmbnjddmwhv3dmh61ma2xajj";
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
  };
  pyjwkest = super.buildPythonPackage {
    name = "pyjwkest-1.3.2";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [pycryptodomex requests six future];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b7/57/b02a875f75128e1f124b214c2140cc0b006145fdd19caf8125a68d99ab0d/pyjwkest-1.3.2.tar.gz";
      sha256 = "11rrswsmma3wzi2qnmq929323yc6i9fkjsv8zr7b3vajd72yr49d";
    };
  };
  python-dateutil = super.buildPythonPackage {
    name = "python-dateutil-2.6.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz";
      sha256 = "1lhq0hxjc3cfha101q02ld5ijlpfyjn2w1yh7wvpiy367pgzi8k2";
    };
  };
  pytz = super.buildPythonPackage {
    name = "pytz-2016.10";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/42/00/5c89fc6c9b305df84def61863528e899e9dccb196f8438f6cbe960758fc5/pytz-2016.10.tar.gz";
      sha256 = "0ayjvkr80k0f0wnpz520bn9sdd0wr5jm2wd1wy7svkrpll5f4hws";
    };
  };
  raven = super.buildPythonPackage {
    name = "raven-6.0.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/0c/e6/a6e2a56e9f80cc7fd7a466c7c8d353780204c5aeeb07037e588d9dc21947/raven-6.0.0.zip";
      sha256 = "00r8pd6zx1dxpgkcd4pf0l9cg4rcamq5fdl9zj1h68v2qx2xgqnf";
    };
  };
  redis = super.buildPythonPackage {
    name = "redis-2.10.5";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/68/44/5efe9e98ad83ef5b742ce62a15bea609ed5a0d1caf35b79257ddb324031a/redis-2.10.5.tar.gz";
      sha256 = "0csmrkxb29x7xs9b51zplwkkq2hwnbh9jns1g85dykn5rxmaxysx";
    };
  };
  requests = super.buildPythonPackage {
    name = "requests-2.13.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/16/09/37b69de7c924d318e51ece1c4ceb679bf93be9d05973bb30c35babd596e2/requests-2.13.0.tar.gz";
      sha256 = "1s0wg4any4dsv5l3hqjxqk2zgb7pdbqhy9rhc8kh3aigfq4ws8jp";
    };
  };
  requests-oauthlib = super.buildPythonPackage {
    name = "requests-oauthlib-0.8.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [oauthlib requests];
    src = fetchurl {
      url = "https://pypi.python.org/packages/80/14/ad120c720f86c547ba8988010d5186102030591f71f7099f23921ca47fe5/requests-oauthlib-0.8.0.tar.gz";
      sha256 = "0s7lh5q661gjza1czlmibkrwf8dcj9qfqm3hs39sdbbyflbc8fl8";
    };
  };
  sampledata = super.buildPythonPackage {
    name = "sampledata-0.3.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six pytz];
    src = fetchurl {
      url = "https://pypi.python.org/packages/c8/2a/47577aa3b9038cdd1ab263ede01d497f9ceed5b50ac99642550a17bbcaff/sampledata-0.3.7.tar.gz";
      sha256 = "1kx2j49lag30d32zhzsr50gl5b949wa4lcdap2filg0d07picsdh";
    };
  };
  serpy = super.buildPythonPackage {
    name = "serpy-0.1.1";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [six];
    src = fetchurl {
      url = "https://pypi.python.org/packages/6e/40/957005bc5f7996dcbf0ceedb302c4dc58fb9d2cceb5e2c3eb8a7f3c163e4/serpy-0.1.1.tar.gz";
      sha256 = "0r9wn99x9nbqxfancnq9jh3cn83i1b6gc79xj0ipnxixp661yj5i";
    };
  };
  setuptools = super.buildPythonPackage {
    name = "setuptools-36.6.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/45/29/8814bf414e7cd1031e1a3c8a4169218376e284ea2553cc0822a6ea1c2d78/setuptools-36.6.0.zip";
      sha256 = "1dqjk0lrcflxq3rf4ljnjin5pm90h3rlhwzl8fi8sy9aaa4la1v2";
    };
  };
  six = super.buildPythonPackage {
    name = "six-1.10.0";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz";
      sha256 = "0snmb8xffb3vsma0z67i0h0w2g2dy0p3gsgh9gi4i0kgc5l8spqh";
    };
  };
  vine = super.buildPythonPackage {
    name = "vine-1.1.4";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/32/23/36284986e011f3c130d802c3c66abd8f1aef371eae110ddf80c5ae22e1ff/vine-1.1.4.tar.gz";
      sha256 = "0wkskb2hb494v9gixqnf4bl972p4ibcmxdykzpwjlfa5picns4aj";
    };
  };
  webcolors = super.buildPythonPackage {
    name = "webcolors-1.7";
    buildInputs = with self; [];
    doCheck = false;
    propagatedBuildInputs = with self; [];
    src = fetchurl {
      url = "https://pypi.python.org/packages/1c/11/d9fb5a7c872a941ad8b30a4be191253d5a9028834c4d69eab55bb6bc60be/webcolors-1.7.tar.gz";
      sha256 = "01kj91k4g7gmlk3n7prl2arimpwv0gjcyffrwkqv3h219mj6hzp4";
    };
  };

### Test requirements

  
}