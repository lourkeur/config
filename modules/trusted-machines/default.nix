# Public keys of trustworthy machines that I control.

{
  programs.ssh.knownHosts = {
    hadron = {
      hostNames = [ "hadron" ];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/2mQVukHogdz14D0PGdjlew5YQTOFKZV7G08EqU5Vo";
    };
    hadronsson = {
      hostNames = [ "hadronsson" "hadronsson-wl" ];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMEScN2GFNcJzDh9GxO4fYa3h8vBx3lGQUbEcwa+vwlC";
    };
  };

  nix.binaryCachePublicKeys = [
    "hadron:AnrNKR4/s1dFKkLd/A2FjDrdbFK7Y9sozpttCTPIEaI="
    "hadronsson:C7u1DgUTIl5eDf4O2RGuXGJ3VNUd4Fq2Yta2g1iRVOA="
    "hadronsson:5zjUd9ucGEVW4vdNRiaxknvgQUFOD3oG4LRozx72NCg="
  ];
}
