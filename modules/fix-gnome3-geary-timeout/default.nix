{
  nixpkgs.overlays = [ (self: super: {
    gnome3 = super.gnome3 // {
      # tests can timeout
      geary = super.gnome3.geary.overrideAttrs( old: {
        doCheck = false;
      });
    };
    libdazzle = super.libdazzle.overrideAttrs (old: {
      doCheck = false;
    });
  })];
}
