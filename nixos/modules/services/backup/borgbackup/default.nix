{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.borgbackup;

createJobOptions = {
  options = with types; {

    paths = mkOption {
      type = listOf str;
      default = [ ];
      example = [ "/home/jane/Documents" "/home/jane/db.dump" ];
      description = ''
        The list of filesystem paths to backup during this create job. Shell
        expansion can be used in these paths, see the borg manual for more
        details.
      '';
    };

    repo = mkOption {
      type = str;
      default = null;
      example = "/path/to/borg/repository";
      description = ''
        Path to the borg backup repository to use as target for this create job.
        See borg manual for possible choices like local file system path or
        remote paths via ssh.
      '';
    };

    archive = mkOption {
      type = str;
      default = null;
      example = "{hostname}-{user}-{now:%Y-%m-%dT%H:%M:%S.%f}";
      description = ''
        Name of the archive to create. See borg manual for further options.
      '';
    };

    systemdTimer = mkOption {
      type = str;
      default = null;
      example = "borg-backup.timer";
      description = ''
        Name of the systemd timer unit to use for triggering execution of this
        job.
      '';
    };

  };
};

in {

  options.services.borgbackup = with types; {

    enable = mkEnableOption "Borg backup";

    createJobs = mkOption {
      type = listOf (submodule createJobOptions);
      default = [ ];
      description = ''
        List of borg create jobs.
      '';
    };

  };

  config = mkIf (cfg.enable && cfg.createJobs != [ ]) {

    systemd.services.borg-backup = {
      description = "Exceute a borg backup create job";
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        Group = "root";
      };
      script = ''
        borg create ${job.repo}::${job.archive} ${lib.concatStringsSep " " job.paths}
      '';
    };

    systemd.timers.borg-timer = {
      description = "Trigger borg backup unit";
      wantedBy = [ "timers.target" ];
      partOf = [ "borg-backup.service" ];
    };

  };

}
