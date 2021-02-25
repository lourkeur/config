final: prev: {
  brave = prev.brave.overrideAttrs (_: rec {
    version = "1.20.108";

    src = final.fetchurl {
      url = "https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser_${version}_amd64.deb";
      sha256 = "v7R6SbgmyosKDIreQE4kYPjMH4NTICCGQobaXUfMAAI=";
    };
  });
}
