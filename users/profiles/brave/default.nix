{ pkgs, ... }:

{
  programs.brave = {
    enable = pkgs.system == "x86_64-linux";
  };
}
