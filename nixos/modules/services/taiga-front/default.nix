{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.services.taigaFront;

  defaultConfig = {
    api = "https://taiga.example.org/api/v1/";
    eventsUrl = null;
    eventsMaxMissedHeartbeats = 5;
    eventsHeartbeatIntervalTime = 60000;
    eventsReconnectTryInterval = 10000;
    debug = false;
    debugInfo = false;
    defaultLanguage = "en";
    themes = ["taiga"];
    defaultTheme = "taiga";
    publicRegisterEnabled = false;
    feedbackEnabled = false;
    privacyPolicyUrl = null;
    termsOfServiceUrl = null;
    maxUploadFileSize = null;
    contribPlugins = [];
    tribeHost = null;
    importers = [];
    gravatar = false;
  };

in {

  options.services.taigaFront = {
    enable = mkEnableOption "Taiga frontent service";

    package = mkOption {
      type = types.package;
      default = pkgs.taiga-front-dist;
      description = ''
        The taiga frontend package to use.
      '';
    };

    config = mkOption {
      type = types.attrs;
      default = {};
      description = ''
        Attribute set containing the taiga frontend configuration.
      '';
    };

    configFile = mkOption {
      type = types.path;
      default = pkgs.writeText "taiga_front_config.json" (
        builtins.toJSON (defaultConfig // cfg.config));
      description = ''
        Path to the configuration file for the taiga frontend. Normally there is
        no need to edit this directly, use the "config" attribute instead.
      '';
    };

    nginxVirtualHost = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "taiga";
      description = "Name of the nginx virtual host attribute to use.";
    };

  };

  config = mkIf cfg.enable {

    services.nginx.virtualHosts = mkIf (cfg.nginxVirtualHost != null) {
      "${cfg.nginxVirtualHost}" = {
        locations."/" = {
          root = "${cfg.package}/dist";
          tryFiles = "$uri $uri/ /index.html";
        };
        locations."/conf.json" = {
          alias = "${cfg.configFile}";
        };
      };
    };

  };

}
