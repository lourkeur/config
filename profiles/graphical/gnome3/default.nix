{ config, lib, pkgs, ... }:

{
  services.xserver.desktopManager.gnome3.enable = true;

  environment.systemPackages = with pkgs; [
    gnome3.dconf-editor
    gnome3.gnome-tweaks
    yaru-theme
  ];

  services.gnome3.gnome-keyring.enable = lib.mkForce false; # conflicts w/ ssh
}

