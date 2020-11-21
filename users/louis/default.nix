# My account.

{
  users.users.louis = {
    isNormalUser = true;

    uid = 1001;
    extraGroups = [
      "wheel"
      "lpadmin"
      "nitrokey"
      "usbblaster"
      "tor"
      "transmission"
      "audio"
      "wireshark"
      "networkmanager"
      "lxd"
      "docker"
      "vboxusers"
    ];

    openssh.authorizedKeys.keyFiles = [
      ./id_gpgcard.pub
    ];
  };
}
