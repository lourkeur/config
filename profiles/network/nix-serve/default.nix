{
  nix.sshServe = {
    enable = true;
    protocol = "ssh-ng";
    keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJW+XKP9JADl1RnL9BcJdKiSvDFnggRcY7gqP3vp5Gsb root@hadronsson"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINp3VzaG3ki6kz3/dKmUwMeel4fGWhwkpFD5NW6p5AEG root@niximg"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICqMrTHmukwoqZ+O+/H5mwQUoSZ8Jpv1oaJv8yCRMzGk root@quark"
    ];
  };
}
