{ lib, config, pkgs, ... }:

with lib;

let
  cfg = config.programs.teck-programmer;

in
{
  options.programs.teck-programmer = {
    enable = mkEnableOption "whether to enable programming the firmware of TECK keyboards";
    package = mkOption {
      type = types.package;
      default = pkgs.nur.repos.lourkeur.teck-programmer;
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
    services.udev.packages = [
      (pkgs.runCommand "teck-udev-rules" { } ''
        mkdir -p $out/etc/udev/rules.d
        ln -s -t $out/etc/udev/rules.d ${cfg.package}/lib/node_modules/teck-programmer/40-teck.rules
      '')
    ];
  };
}
