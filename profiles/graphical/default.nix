{ config, lib, pkgs, ... }:

{
  boot.plymouth.enable = true;
  environment.systemPackages = with pkgs; [
    brave
    firefox-bin
    gimp
    gnome3.dconf-editor
    gnome3.gnome-tweaks
    obs-studio
    gnome3.nautilus
    sakura
    thunderbird-bin
    tor-browser-bundle-bin
    yaru-theme
    nixos-artwork.wallpapers.simple-red
    vscode-with-extensions
  ];

  services.gnome3.sushi.enable = true;
  programs.evince.enable = true;

  programs.browserpass.enable = true;

  services.gnome3.core-utilities.enable = false;  # strips down gnome of hard-to-compile and seldom used programs
  services.gnome3.gnome-keyring.enable = lib.mkForce false; # conflicts w/ ssh

  services.printing.enable = true;

  services.xserver.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  services.xserver.displayManager = {
    defaultSession = "gnome";
    lightdm.autoLogin.enable = true;
    lightdm.autoLogin.user = "louis";
  };

  fileSystems = lib.optionalAttrs (!config.special.roaming) {
    "/home/nfs" = {
      device = "machaut.ici:/home";
      fsType = "nfs";
    };
  };

  services.mingetty.autologinUser = "louis";
}
