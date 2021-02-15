{
  services.xserver.displayManager = {
    defaultSession = "gnome";
    autoLogin.enable = true;
    autoLogin.user = "louis";
  };

  services.mingetty.autologinUser = "louis";
}
