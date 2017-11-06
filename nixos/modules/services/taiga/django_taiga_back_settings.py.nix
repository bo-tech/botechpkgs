{cfg}:
''
    # Import default config from taiga-back
    from settings import *

    # Set some defaults from nix.
    DEBUG = False
    MEDIA_ROOT = "${cfg.stateDir}/media"
    STATIC_ROOT = "${cfg.stateDir}/static"
    STATIC_URL = "/static/"
    MEDIA_URL = "/media/"

    # Append extraConfig
    ${cfg.extraConfig}
''
