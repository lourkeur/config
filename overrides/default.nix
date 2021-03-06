# override defaults to nixpkgs/master
{
  # modules to pull from override, stable version is automatically disabled
  modules = [
    "programs/neovim.nix"
  ];

  # if a modules name changed in override, add the old name here
  disabledModules = [ ];

  # packages pulled from override
  packages = pkgs: final: prev: {
    inherit (pkgs)
      android-studio
      brave
      dhall
      discord
      element-desktop
      gotop
      manix
      nixpkgs-fmt
      nixFlakes
      obs-studio
      prs
      qutebrowser
      signal-desktop
      spacevim
      starship
      tipp10
      tor-browser-bundle-bin;

    haskellPackages = prev.haskellPackages.override {
      overrides = hfinal: hprev:
        let version = prev.lib.replaceChars [ "." ] [ "" ] prev.ghc.version;
        in
        {
          # same for haskell packages, matching ghc versions
          inherit (pkgs.haskell.packages."ghc${version}")
            haskell-language-server;
        };
    };
  };
}
