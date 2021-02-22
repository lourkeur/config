{ lib }:
let
  inherit (builtins) mapAttrs isFunction;
  inherit (lib.flk) importDefaults;

  profiles = importDefaults (toString ../profiles);
  users = importDefaults (toString ../users);

  allProfiles =
    let
      sansCore = lib.filterAttrs (n: _: n != "core") profiles;
    in
    lib.collect isFunction sansCore;

  allUsers = lib.collect isFunction users;


  suites = with profiles; rec {
    gnome3 = [ graphical graphical.gnome3 ];
    allTools = with tools; [
      tools  # the root
      jdk
      podman
      wireshark
    ];

    workstation = allTools ++ [
      users.louis
      users.louis.singleUser
      misc.sign-store-paths
      network.nfs
      network.printers
      network.keybase
    ];

    laptop = workstation ++ [
      profiles.laptop
    ];

    buildServer = [
      misc.sign-store-paths
      network.nix-build-server
      network.nix-serve
    ];
  };
in
mapAttrs (_: v: lib.flk.profileMap v) suites // {
  inherit allProfiles allUsers;
}
