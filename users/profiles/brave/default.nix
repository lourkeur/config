{ pkgs, ... }:

{
  programs.brave = {
    enable = pkgs.system == "x86_64-linux";

    extensions = [
      "hkgfoiooedgoejojocmhlaklaeopbecg"  # Picture-in-picture by Google
    ];
  };
}
