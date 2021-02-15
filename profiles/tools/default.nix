{ lib, config, pkgs, ... }:

{
  boot.binfmt.emulatedSystems = lib.lists.remove pkgs.system [ "aarch64-linux" ];

  environment.systemPackages = with pkgs; [
    ffmpeg-full
    tup
    youtube-dl
  ];
}
