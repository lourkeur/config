{ pkgs, ... }:

{
  programs.java = {
    enable = true;
    package = pkgs.jdk11;
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
