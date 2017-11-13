{ config, cfg, lib, ... }:
''
    # Import default config from taiga-back.
    from settings import *

    # Read database password from deployment key if available. Otherwise just
    # set it to None.
    DB_PASSWORD = None
    ${lib.optionalString (builtins.hasAttr "taigaDbPassword" config.deployment.keys) ''
    with open('${config.deployment.keys.taigaDbPassword.path}', 'r') as f:
      DB_PASSWORD = f.read().strip('\n')
    ''}

    # Set configuration values
    DEBUG = ${if cfg.debug then "True" else "False"}
    MEDIA_ROOT = "${cfg.stateDir}/media"
    STATIC_ROOT = "${cfg.stateDir}/static"
    STATIC_URL = "${cfg.staticUrl}"
    MEDIA_URL = "${cfg.mediaUrl}"
    DATABASES = {
      "default": {
        "ENGINE": "${cfg.dbEngine}",
        "NAME": "${cfg.dbName}",
        "USER": "${cfg.dbUser}",
        "PASSWORD": DB_PASSWORD,
        "HOST": "${cfg.dbHost}",
      }
    }

    with open('${config.deployment.keys.taigaDjangoSecretKey.path}', 'r') as f:
      SECRET_KEY = f.read().strip('\n')

    # Extra configuration values supplied by "extraConfig" attribute.
    ${cfg.extraConfig}
''
