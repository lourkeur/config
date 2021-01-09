{ pkgs, ... }:

# My account.

{
  home-manager.users.louis = {
    imports = [
      ../profiles/direnv
      ../profiles/firefox
      ../profiles/git
      ../profiles/ssh
    ];

    home.stateVersion = "20.09";
  };

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

    hashedPassword = "$6$nZVlYP4/z34a$abhkQIZS6udFg6H/w2q4P37SsWDhaL0tEeDMfWqO2BbBs4NOI0lbIDXjhvs1l058YSSYOAyecRiaAByNywDO91";

    shell = pkgs.fish;
  };
}
