{ config, lib, ... }:

{
  fileSystems = lib.optionalAttrs (!config.special.roaming) {
    "/home/nfs" = {
      device = "machaut.ici:/home";
      fsType = "nfs";
    };
  };
}
