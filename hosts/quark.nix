{ config, modulesPath, ... }: {
  imports = [
    ../users/louis
    ../profiles/graphical
    ../profiles/utils
  ];

  nixpkgs.system = "aarch64-linux";

  boot.loader.grub.enable = false;
  boot.loader.raspberryPi = {
    enable = true;
    version = 4;
  };
  boot.kernelPackages = pkgs.linuxPackages_rpi4;
}
