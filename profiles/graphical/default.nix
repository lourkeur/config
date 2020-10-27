{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    gimp
    gnome3.dconf-editor
    gnome3.gnome-tweaks
  ];

  programs.browserpass.enable = true;

  environment.gnome3.excludePackages = with pkgs; [
    gnome3.epiphany  # I don't use
  ];

  services.xserver.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  services.xserver.displayManager = {
    defaultSession = "gnome";
    lightdm.autoLogin.enable = true;
    lightdm.autoLogin.user = "louis";
  };
}
