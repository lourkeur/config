{ lib, pkgs, ... }:

{
  boot.plymouth.enable = true;
  environment.systemPackages = with pkgs; [
    brave
    gimp
    gnome3.dconf-editor
    gnome3.gnome-tweaks
    yaru-theme
  ];

  programs.browserpass.enable = true;

  environment.gnome3.excludePackages = with pkgs; [
    gnome3.epiphany  # I don't use
  ];

  services.gnome3.gnome-keyring.enable = lib.mkForce false; # conflicts w/ ssh

  services.xserver.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  services.xserver.displayManager = {
    defaultSession = "gnome";
    lightdm.autoLogin.enable = true;
    lightdm.autoLogin.user = "louis";
  };
}
