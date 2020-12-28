{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      trusted-machines = {
        host = "hadron hadronsson hadronsson-wl quark";
        forwardAgent = true;
        extraOptions = {
          StrictHostKeyChecking = "yes";
        };
      };

      # surprisingly good heuristic
      git-catchall = {
        host = "*git*";
        user = "git";
      };
    };
  };
}
