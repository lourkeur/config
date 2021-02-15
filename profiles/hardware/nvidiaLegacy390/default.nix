{
  services.xserver.videoDrivers = [ "nvidiaLegacy390" ];

  # the legacy driver does not support offload mode
  hardware.nvidia.prime.sync.enable = true;
}
