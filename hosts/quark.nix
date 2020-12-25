{ config, pkgs, ... }: {
  imports = [
    ../users/louis
    ../profiles/utils
    quark/hardware-configuration.nix
  ];

  nixpkgs.system = "aarch64-linux";

  boot.loader.grub.enable = false;
  boot.loader.raspberryPi = {
    enable = true;
    version = 4;
  };
  boot.kernelPackages = pkgs.linuxPackages_rpi4;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
