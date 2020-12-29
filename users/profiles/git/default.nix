{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = "Louis Bettens";
    aliases = {
      b  = "!tig blame";
      l  = "!tig log";
      rl = "!tig reflog";
      s  = "!tig show";
      st = "!tig status";
      sw = "switch";
    };
  };
  home.packages = with pkgs.gitAndTools; [
    git-subrepo
    git-crypt
    tig
  ];
}
