{ config, lib, pkgs, ... }:

{
  boot.plymouth.enable = true;
  environment.systemPackages = with pkgs; [
    firefox
    gimp
    gnome3.dconf-editor
    gnome3.gnome-tweaks
    gnome3.nautilus
    jetbrains.idea-community
    sakura
    tdesktop
    thunderbird
    yaru-theme
    nixos-artwork.wallpapers.simple-red
  ] ++ lib.optionals (pkgs.system == "x86_64-linux") [
    brave
    obs-studio
    tor-browser-bundle-bin
    vscode-with-extensions
  ];

  services.gnome3.sushi.enable = true;
  programs.evince.enable = true;

  programs.browserpass.enable = true;

  services.gnome3.core-utilities.enable = false;  # strips down gnome of hard-to-compile and seldom used programs
  services.gnome3.gnome-keyring.enable = lib.mkForce false; # conflicts w/ ssh

  services.printing.enable = true;

  services.keybase.enable = true;

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
