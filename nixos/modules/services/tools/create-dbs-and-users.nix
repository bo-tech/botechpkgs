# This is a simple helper service which creates missing databases and database
# users for the postgresql service.

{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.services.createDbsAndUsers;

  # List of systemd units representing the deployment keys.
  deploymentKeyUnits = concatMap (u: [ "${u.pwKey}-key.service" ]) cfg.users;

  # Create an entry suitable for the pg_hba.conf file from an authentication
  # attribute set from the "auths" option.
  mkPgAuth = (auth: ''
    ${auth.type} ${auth.database} ${auth.user} ${auth.address} ${auth.method}
  '');

  # Script that creates missing databases and users.
  createMissingUsersAndDbs = let
    pgCfg = config.services.postgresql;
    psql = ''
      ${pkgs.sudo}/bin/sudo -u ${pgCfg.superUser} -- \
      ${pgCfg.package}/bin/psql --port=${toString pgCfg.port} -d postgres \
    '';
    psql_run = script: "${psql} -c \"${script}\"";
    psql_get = script: "${psql_run script} -q -t -A";
  in pkgs.writeScript "createMissingUsersAndDbs.sh" ''
    #! ${pkgs.bash}/bin/bash -e

    # Create missing users.
    users=( ${concatMapStringsSep " " (u: u.name) cfg.users} )
    pw_paths=( ${concatMapStringsSep " " (u: (builtins.getAttr u.pwKey config.deployment.keys).path) cfg.users} )
    for index in ''${!users[*]}; do
      user=''${users[$index]}
      pw_path=''${pw_paths[$index]}

      user_exists=$(${psql_get "SELECT 1 AS exists FROM pg_user WHERE usename='$user';"})
      if [ -z $user_exists ]; then
        password=$(cat $pw_path)
        ${psql_run "CREATE USER $user WITH PASSWORD '$password';"}
      fi
    done

    # Create missing databases.
    databases=( ${concatMapStringsSep " " (f: f.name) cfg.databases} )
    owners=( ${concatMapStringsSep " " (f: f.owner) cfg.databases} )
    for index in ''${!databases[*]}; do
      database=''${databases[$index]}
      owner=''${owners[$index]}

      db_exists=$(${psql_get "SELECT 1 AS exists FROM pg_database WHERE datname='$database';"})
      if [ -z $db_exists ]; then
        ${psql_run "CREATE DATABASE $database WITH OWNER '$owner';"}
      fi
    done
  '';

in {

  options.services.createDbsAndUsers = {

    enable = mkEnableOption "Create databases and database users.";

    users = mkOption {
      type = types.listOf types.attrs;
      default = [ ];
      example = [ { name="myuser"; pwKey="myUserPassword"; } ];
      description = ''
        List of database users that shall exist.
      '';
    };

    databases = mkOption {
      type = types.listOf types.attrs;
      default = [ ];
      example = [ { name="mydb"; owner="myuser"; } ];
      description = ''
        List of databases that shall exist.
      '';
    };

    authentications = mkOption {
      type = types.listOf types.attrs;
      default = [ ];
      example = [ { user="myuser"; database="mydb"; type="host"; address="127.0.0.1/24"; method="md5"; } ];
      description = ''
        List of authentications.
      '';
    };

  };

  config = mkIf cfg.enable {

    services.postgresql.authentication = (
      lib.concatMapStringsSep "\n" mkPgAuth cfg.authentications);

    systemd.services.createMissingUsersAndDbs = {
      description = "Create missing databases and database users";
      wantedBy = [ "multi-user.target" ];
      wants = deploymentKeyUnits;
      after = [ "network.target" "postgresql.service" ] ++ deploymentKeyUnits;
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${createMissingUsersAndDbs}";
      };
    };

  };

}
