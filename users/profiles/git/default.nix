{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = "Louis Bettens";
    aliases = {
      a = "add";
      b = "!tig blame";
      c = "commit";
      l = "!tig log";
      rl = "!tig reflog";
      s = "!tig show";
      st = "!tig status";
      sw = "switch";
      z = "stash";
    };

    extraConfig = {
      log.date = "relative";
      pull.ff = "only";
      rerere.enable = true;
    };
  };
  home.packages = with pkgs.gitAndTools; [
    git-subrepo
    git-crypt
    tig
  ];
}
