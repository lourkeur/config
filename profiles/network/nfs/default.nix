{ config, lib, ... }:

{
  fileSystems."/home/nfs" = {
    device = "machaut.ici:/home";
    fsType = "nfs";
  };
}
