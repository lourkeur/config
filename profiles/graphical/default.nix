{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
  ];

  programs.browserpass.enable = true;
}
