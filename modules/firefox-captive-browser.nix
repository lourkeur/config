{ lib, pkgs, ... }:

{
  programs.captive-browser.browser = lib.concatStringsSep " " [
    ''${pkgs.firefox}/bin/firefox''
    ''-P captive-browser''
    ''--private-window''
    ''http://cache.nixos.org/''
  ];
}
