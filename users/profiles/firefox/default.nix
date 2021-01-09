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

	# go through privoxy
	"network.proxy.http" = "localhost";
	"network.proxy.http_port" = 8118;
	"network.proxy.ssl" = "localhost";
	"network.proxy.ssl_port" = 8118;
	"network.proxy.type" = 1;
      };
    };
  };
}
