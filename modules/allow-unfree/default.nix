# Fine-grained control for tolerating unfree packages

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    let pname = if pkg ? pname then pkg.pname else (builtins.parseDrvName pkg.name).name;
    in builtins.elem pname [
      "Oracle_VM_VirtualBox_Extension_Pack"
  ];
}
