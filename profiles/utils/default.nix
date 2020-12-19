{ config, pkgs, ... }:

{
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  nix.signStorePaths = true;
  nix.sshServe = {
    enable = true;
    protocol = "ssh-ng";
    keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJW+XKP9JADl1RnL9BcJdKiSvDFnggRcY7gqP3vp5Gsb root@hadronsson"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINp3VzaG3ki6kz3/dKmUwMeel4fGWhwkpFD5NW6p5AEG root@niximg"
    ];
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk11;
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  users.users.nix-build-control = {
    isSystemUser = true;
    useDefaultShell = true;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJW+XKP9JADl1RnL9BcJdKiSvDFnggRcY7gqP3vp5Gsb root@hadronsson"
    ];
  };
  nix.allowedUsers = [ "nix-build-control" ];

  services.openssh.extraConfig = ''
      Match User nix-build-control
        AllowAgentForwarding no
        AllowTcpForwarding no
        PermitTTY no
        PermitTunnel no
        X11Forwarding no
      Match All
    '';
}
