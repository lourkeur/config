{ pkgs, ... }:

let spacevim = pkgs.spacevim.override { spacevim_config = import ./init.nix; };
in
{
  home.packages = [
    spacevim
  ] ++ (with pkgs.python3Packages; [
    pylint
    yapf
  ]);
}
