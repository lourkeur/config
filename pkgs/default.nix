final: prev: {
  gnome3 = prev.gnome3 // {
    # tests can timeout
    geary = prev.gnome3.geary.overrideAttrs( old: {
      doCheck = false;
    });
  };
  libdazzle = prev.libdazzle.overrideAttrs (old: {
    doCheck = false;
  });
}
