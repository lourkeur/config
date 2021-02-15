{ config, lib, pkgs, ... }:

{
  services.xserver.desktopManager.gnome3.enable = true;

  environment.systemPackages = with pkgs; [
    gnome3.dconf-editor
    gnome3.gnome-tweaks
    gnome3.nautilus
    sakura
    yaru-theme
  ];

  services.gnome3.sushi.enable = true;
  programs.evince.enable = true;

  services.gnome3.core-utilities.enable = false;  # strips down gnome of hard-to-compile and seldom used programs
  services.gnome3.gnome-keyring.enable = lib.mkForce false; # conflicts w/ ssh
}

