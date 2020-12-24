# based on https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/cd-dvd/sd-image-raspberrypi4.nix

{ config, lib, modulesPath, pkgs, ... }: {
  imports = [
    ../users/root
    ../users/louis
    "${modulesPath}/installer/cd-dvd/sd-image.nix"
  ];

  nixpkgs.system = "aarch64-linux";

  boot.loader.grub.enable = false;
  boot.loader.raspberryPi = {
    enable = true;
    version = 4;
  };
  boot.kernelPackages = pkgs.linuxPackages_rpi4;
  boot.consoleLogLevel = lib.mkDefault 7;

  sdImage = {
    firmwareSize = 128;
    firmwarePartitionName = "NIXOS_BOOT";
    # This is a hack to avoid replicating config.txt from boot.loader.raspberryPi
    populateFirmwareCommands =
      "${config.system.build.installBootLoader} ${config.system.build.toplevel} -d ./firmware";
    # As the boot process is done entirely in the firmware partition.
    populateRootCommands = "";
  };

  fileSystems."/boot/firmware" = {
    # This effectively "renames" the attrsOf entry set in sd-image.nix
    mountPoint = "/boot";
    neededForBoot = true;
  };

  services.mingetty.autologinUser = "louis";

  programs.gnupg.agent.pinentryFlavor = "curses";
}
