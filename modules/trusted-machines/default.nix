# Public keys of trustworthy machines that I control.

{
  programs.ssh.knownHosts = {
    hadron = {
      hostNames = [ "hadron" ];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/2mQVukHogdz14D0PGdjlew5YQTOFKZV7G08EqU5Vo";
    };
    hadronsson = {
      hostNames = [ "hadronsson" "hadronsson-fil" ];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHdhemK8JsrQLCZgKwF/9XYoeHKxFZP9KwOLP76cuuFJ";
    };
  };

  nix.binaryCachePublicKeys = [
    "hadron:mXJ78W2bkR8Dw+AaN/5LpVLsmIjHu25FvNcY4fqx0ok"
    "hadronsson:C7u1DgUTIl5eDf4O2RGuXGJ3VNUd4Fq2Yta2g1iRVOA="
  ];
}
