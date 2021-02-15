{
  users.users.nix-build-control = {
    isSystemUser = true;
    useDefaultShell = true;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJW+XKP9JADl1RnL9BcJdKiSvDFnggRcY7gqP3vp5Gsb root@hadronsson"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICqMrTHmukwoqZ+O+/H5mwQUoSZ8Jpv1oaJv8yCRMzGk root@quark"
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
