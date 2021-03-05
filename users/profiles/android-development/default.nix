{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    gradle
  ]
  ++ lib.optional (pkgs.system == "x86_64-linux") android-studio;
}
