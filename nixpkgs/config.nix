{ lib, ... }:

{
  allowUnfreePredicate = pkg:
    let pname = lib.getName pkg;
    in builtins.elem pname [
      "Oracle_VM_VirtualBox_Extension_Pack"
      "android-studio-stable"
  ];

  doCheckByDefault = false;
}
