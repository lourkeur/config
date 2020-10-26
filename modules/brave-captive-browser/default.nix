{ lib, pkgs, ... }:

{
  programs.captive-browser = {
    browser = lib.concatStringsSep " " [
      "${pkgs.brave}/bin/brave"
      ''--user-data-dir=''${XDG_DATA_HOME:-$HOME/.local/share}/brave-captive''
      ''--proxy-server="socks5://$PROXY"''
      ''--host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE localhost"''
      "--no-first-run"
      "--new-window"
      "--incognito"
      "http://cache.nixos.org/"
    ];
  };
}
