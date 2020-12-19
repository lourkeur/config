{ suites, ... }:
{
  imports = suites.core;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.gnupg.agent.pinentryFlavor = "curses";

  networking.networkmanager.enable = true;

  isoImage.contents = [ {
    source = ../secrets/id_niximg;
    target = "id_niximg";
  } ];
  programs.ssh.extraConfig = ''
    IdentityFile /iso/id_niximg
  '';

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };
}
