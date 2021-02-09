{ config, lib, pkgs, ... }:

# sign every built derivation with a machine-local key.
# generate with
# sudo nix-store --generate-binary-cache-key $(hostname) /etc/nix/key.{private,public}
# and add public key in the trusted-machines segment
let
  postBuildHook = pkgs.writers.writePython3 "sign-paths.py" { } ./sign-paths.py;
in
with lib;
{
  options.nix.signStorePaths = mkOption {
    type = types.bool;
    default = false;
    description = ''
      Automatically sign built derivations with /etc/nix/key.private.

      You should generate a key with
      nix-store --generate-binary-cache-key $(hostname) /etc/nix/key.{private,public}
      on every machine,
      and add the public key to the trusted-machines module.
    '';
  };

  config = mkIf config.nix.signStorePaths {
    nix.extraOptions = "post-build-hook = ${postBuildHook}";
  };
}
