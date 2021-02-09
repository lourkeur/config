{ lib, ... }:

with lib;
{
  options.special = {
    roaming = mkOption {
      type = types.bool;
      default = false;
      description = "global toggle indicating that the systems expects to be out of town and lack access to the home network.";
    };
  };
}
