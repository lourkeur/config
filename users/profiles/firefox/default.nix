{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      settings = {
        # disable FF pocket
        "extensions.pocket.enabled" = false;
	# disable FF accounts
	"identity.fxaccounts.enabled" = false;
      };
    };
  };
}
