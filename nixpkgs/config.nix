{ lib, ... }:

{
  allowUnfreePredicate = pkg:
    let pname = lib.getName pkg;
    in builtins.elem pname [
      "Oracle_VM_VirtualBox_Extension_Pack"
      "firefox-bin" "firefox-release-bin-unwrapped"
      "thunderbird-bin"
      "android-studio-stable"
  ];

  doCheckByDefault = false;
}
