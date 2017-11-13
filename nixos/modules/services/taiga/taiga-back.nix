{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.services.taigaBack;

  deploymentKeyUnits = [
    "taigaAdminPassword-key.service"
    "taigaDbPassword-key.service"
    "taigaDjangoSecretKey-key.service"
  ];

  djangoSetUserPassword = ./django_set_user_password.py;

  djangoInitialUserJson = pkgs.writeText "taiga_back_initial_user.json"
    (import ./initial_user_json.nix { inherit cfg; });

  djangoSettings = pkgs.writeTextDir "taiga_back_settings.py"
    (import ./django_taiga_back_settings.py.nix { inherit config cfg lib; });

  initTaigaBackScript = let
    django-admin="${cfg.package}/bin/django-admin";
  in pkgs.writeScript "initTaigaBackScript.sh" ''
    #! ${pkgs.bash}/bin/bash -e

    # Set umask
    umask 027

    # Create media and static directories.
    mkdir -p ${cfg.stateDir}/media
    mkdir -p ${cfg.stateDir}/static

    # TODO: This needs some time to finish and block the initial deployment
    #       after "taiga...> setting up tmpfiles"
    # Setup DB on first execution.
    if [ ! -e ${cfg.stateDir}/db_setup_done ]; then
      # Some commands need to be executed from site-packages dir
      cd ${cfg.package}/${cfg.package.python.sitePackages}
      ${django-admin} migrate --noinput
      ${django-admin} loaddata ${djangoInitialUserJson}
      ${django-admin} loaddata initial_project_templates
      ${django-admin} compilemessages
      ${django-admin} collectstatic --noinput
      ${lib.optionalString cfg.sampleData "${django-admin} sample_data"}
      echo $(date) > ${cfg.stateDir}/db_setup_done
    fi

    # Remove done indicator if admin password should be updated on every
    # deployment.
    ${lib.optionalString cfg.updateAdminPassword ''
      rm -f ${cfg.stateDir}/admin_password_done
    ''}

    # Set initial admin password.
    if [ ! -e ${cfg.stateDir}/admin_password_done ]; then
      export TAIGA_DJANGO_USERNAME="${cfg.adminUsername}"
      export TAIGA_DJANGO_PASSWORD="$(cat ${config.deployment.keys.taigaAdminPassword.path})"
      ${django-admin} shell -c "$(cat ${djangoSetUserPassword})"
      echo $(date) > ${cfg.stateDir}/admin_password_done
    fi
  '';

in {

  options.services.taigaBack = {
    enable = mkEnableOption "Taiga backend service";

    sampleData = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Load taiga sample data when initializing the database.
      '';
    };

    port = mkOption {
      type = types.int;
      default = 80;
      description = ''
        Port number the taiga backend will listen on.
      '';
    };

    workers = mkOption {
      type = types.int;
      default = 3;
      description = ''
        Number of gunicorn worker processes.
      '';
    };

    package = mkOption {
      type = types.package;
      default = import ../../../../pkgs/taiga/taiga-back { inherit pkgs; };
      description = ''
        The taiga backend package to use.
      '';
    };

    stateDir = mkOption {
      type = types.str;
      default = "/var/lib/taigaback";
      description = ''
        Path that holds the state of taiga back.
      '';
    };

    user = mkOption {
      type = types.str;
      default = "taigaback";
      description = "User account under which taiga-back runs.";
    };

    group = mkOption {
      type = types.str;
      default = "taiga";
      description = "Group under which taiga-back runs.";
    };

    extraConfig = mkOption {
      type = types.lines;
      default = "";
      example = ''
        DEBUG = True
        ADMINS = (
          ("Admin", "example@example.com"),
        )
        SITES = {
          "api": {"domain": "taiga.example.org", "scheme": "https", "name": "api"},
          "front": {"domain": "taiga.example.org", "scheme": "https", "name": "front"},
        }
      '';
      description = ''
        Additional django configuration which will be appended to the default
        configuration of taiga-back. Threfore all defaults can be overridden.
        Django configuration is python code, see the django and taiga docs
        for details and available settings.
      '';
    };

    adminUsername = mkOption {
      type = types.str;
      default = "admin";
      description = "Admin username. Only set during initial deployment.";
    };

    adminFullName = mkOption {
      type = types.str;
      default = "Administrator";
      description = "Admin full name. Only set during initial deployment.";
    };

    adminEmail = mkOption {
      type = types.str;
      default = "admin@example.org";
      description = "Admin email address. Only set during initial deployment.";
    };

    updateAdminPassword = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If set to "true" the admin password will be updated on every deployment.
      '';
    };

    debug = mkOption {
      type = types.bool;
      default = false;
      description = ''
        This controls the django "DEBUG" setting and should be set to "false"
        for production deployments.
      '';
    };

    dbEngine = mkOption {
      type = types.str;
      default = "django.db.backends.postgresql";
      description = "Database engine to use.";
    };

    dbName = mkOption {
      type = types.str;
      default = "taiga";
      description = "Database name.";
    };

    dbUser = mkOption {
      type = types.str;
      default = "taiga";
      description = "Database user.";
    };

    dbHost = mkOption {
      type = types.str;
      default = "database";
      description = "Database hostname or IP address.";
    };

    mediaUrl = mkOption {
      type = types.str;
      default = "/media/";
      description = "Django MEDIA_URL setting.";
    };

    staticUrl = mkOption {
      type = types.str;
      default = "/static/";
      description = "Django STATIC_URL setting.";
    };

  };

  config = mkIf cfg.enable {

    systemd.services.taigaBack = {
      description = "Taiga backend service";
      wantedBy = [ "multi-user.target" ];
      wants = [ "initTaigaBack.service" ] ++ deploymentKeyUnits;
      after = [ "network.target" "initTaigaBack.service" ] ++ deploymentKeyUnits;
      environment = {
        DJANGO_SETTINGS_MODULE = "taiga_back_settings";
        PYTHONPATH = djangoSettings;
      };
      serviceConfig = {
        User = cfg.user;
        Group = cfg.group;
        Restart = "always";
        ExecStart = "${cfg.package}/bin/gunicorn --workers ${toString cfg.workers} --timeout 60 --log-syslog --bind unix:/tmp/taiga-back.socket taiga.wsgi";
        ExecStop = "${pkgs.coreutils}/bin/kill -s TERM $MAINPID";
        ExecReload = "${pkgs.coreutils}/bin/kill -s HUP $MAINPID";
      };
    };

    # TODO: mbld: This unit fails with a timeout on first deployment because the
    # database server is not running.
    systemd.services.initTaigaBack = {
      description = "Initialization for the taiga backend";
      wantedBy = [ "multi-user.target" ];
      wants = deploymentKeyUnits;
      after = [ "network.target" ] ++ deploymentKeyUnits;
      environment = {
        DJANGO_SETTINGS_MODULE = "taiga_back_settings";
        PYTHONPATH = djangoSettings;
      };
      preStart = ''
        mkdir -m 0750 -p ${cfg.stateDir}
        chown -R ${cfg.user}:${cfg.group} ${cfg.stateDir}
      '';
      serviceConfig = {
        PermissionsStartOnly = true;  # preStart must be run as root
        User = cfg.user;
        Group = cfg.group;
        Type = "oneshot";
        ExecStart = "${initTaigaBackScript}";
      };
    };

    services.nginx = {
      enable = true;
      virtualHosts = {
        taigaBack = {
          default = true;
          serverName = "taiga-back";
          listen = [
            { addr = "0.0.0.0"; port = cfg.port; ssl=false; }
            { addr = "[::]"; port = cfg.port; ssl=false; }
          ];
          locations."/api" = {
            proxyPass = "http://unix:/tmp/taiga-back.socket:/api";
          };
          locations."/admin" = {
            proxyPass = "http://unix:/tmp/taiga-back.socket:/admin";
          };
          locations."/static" = {
            alias = "${cfg.stateDir}/static";
          };
          locations."/media" = {
            alias = "${cfg.stateDir}/media";
          };
        };
      };
    };

    users.extraUsers = filterAttrs (n: v: cfg.user == "taigaback" || n != "taigaback") {
      taigaback = {
        group = cfg.group;
        description = "User running the taiga backend.";
        extraGroups = [ "keys" ];
      };
      nginx = {
        extraGroups = [ "keys" cfg.group ];
      };
    };

    users.extraGroups = filterAttrs (n: v: cfg.group == "taiga" || n != "taiga") {
      taiga = { };
    };

  };

}
