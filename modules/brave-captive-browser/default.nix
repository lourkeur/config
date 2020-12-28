{ lib, pkgs, ... }:

{
  programs.captive-browser = {
    browser = lib.concatStringsSep " " [
      (if pkgs.system == "x86_64-linux" then "${pkgs.brave}/bin/brave" else "${pkgs.ungoogled-chromium}/bin/chromium")
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
