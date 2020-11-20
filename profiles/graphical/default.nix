{ lib, pkgs, ... }:

{
  boot.plymouth.enable = true;
  environment.systemPackages = with pkgs; [
    android-studio
    brave
    firefox-bin
    gimp
    gnome3.dconf-editor
    gnome3.gnome-tweaks
    tor-browser-bundle-bin
    yaru-theme
    nixos-artwork.wallpapers.simple-red
    vscode-with-extensions
  ];

  programs.browserpass.enable = true;

  environment.gnome3.excludePackages = with pkgs; [
    gnome3.epiphany  # I don't use
  ];

  services.gnome3.gnome-keyring.enable = lib.mkForce false; # conflicts w/ ssh

  services.printing.enable = true;

  services.xserver.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  services.xserver.displayManager = {
    defaultSession = "gnome";
    lightdm.autoLogin.enable = true;
    lightdm.autoLogin.user = "louis";
  };
}
