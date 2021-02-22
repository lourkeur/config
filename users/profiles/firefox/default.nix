{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
    ];

    profiles.default = {
      id = 0;
      settings = {
        # disable FF pocket
        "extensions.pocket.enabled" = false;
	# disable FF accounts
	"identity.fxaccounts.enabled" = false;

	# junk blocking
	"browser.contentblocking.category" = "strict";

	# Search Engine
	"browser.search.extra.1" = "DuckDuckGo";

	# go through privoxy
	"network.proxy.http" = "localhost";
	"network.proxy.http_port" = 8118;
	"network.proxy.ssl" = "localhost";
	"network.proxy.ssl_port" = 8118;
	"network.proxy.type" = 1;

	# disable built-in password management
	"signon.rememberSignons" = false;
      };
    };
  };
}
