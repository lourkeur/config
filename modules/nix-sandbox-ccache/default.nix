{ config, ... }:

{
  nix.sandboxPaths = [ config.programs.ccache.cacheDir ];
}
