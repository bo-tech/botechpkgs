{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.services.taigaFront;

  # TODO: Set production grade values.
  defaultConfig = pkgs.writeText "conf.json" ''
    {
    "api": "${cfg.apiUrl}",
    "eventsUrl": null,
    "eventsMaxMissedHeartbeats": 5,
    "eventsHeartbeatIntervalTime": 60000,
    "eventsReconnectTryInterval": 10000,
    "debug": true,
    "debugInfo": true,
    "defaultLanguage": "en",
    "themes": ["taiga"],
    "defaultTheme": "taiga",
    "publicRegisterEnabled": true,
    "feedbackEnabled": true,
    "privacyPolicyUrl": null,
    "termsOfServiceUrl": null,
    "maxUploadFileSize": null,
    "contribPlugins": [],
    "tribeHost": null,
    "importers": [],
    "gravatar": true
    }
  '';

in {

  options.services.taigaFront = {
    enable = mkEnableOption "Taiga frontent service";

    package = mkOption {
      type = types.package;
      description = ''
        The taiga frontend package to use.
      '';
    };

    port = mkOption {
      type = types.int;
      default = 80;
      description = ''
        Port number the taiga frontend will listen on.
      '';
    };

    apiUrl = mkOption {
      type = types.str;
      default = "https://taiga/api/v1/";
      description = ''
        URL under which the frontend code can reach the taiga backend API. This
        is normally the URL under which the taiga backend is exposed publically.
      '';
    };

    config = mkOption {
      type = types.path;
      default = defaultConfig;
      description = ''
        Path to the configuration file for the taiga frontend.
      '';
    };

  };

  config = mkIf cfg.enable {

    services.nginx = {
      enable = true;
      virtualHosts = {
        taigaFront = {
          default = true;
          serverName = "taiga-front";
          listen = [
            { addr = "0.0.0.0"; port = cfg.port; ssl=false; }
            { addr = "[::]"; port = cfg.port; ssl=false; }
          ];
          locations."/" = {
            root = "${cfg.package}/dist";
            tryFiles = "$uri $uri/ /index.html";
          };
          locations."/conf.json" = {
            alias = "${cfg.config}";
          };
        };
      };
    };

  };

}
