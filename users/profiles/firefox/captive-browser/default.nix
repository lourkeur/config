{
  programs.firefox.profiles.captive-browser = {
    id = 1;
    settings = {
      # assuming captive-browser proxy is socks5://localhost:1666
      "network.proxy.socks" = "localhost";
      "network.proxy.socks_port" = 1666;
      "network.proxy.socks_remote_dns" = true;
      "network.proxy.type" = 1;

      # disable https-only in case it interferes
      "dom.security.https_only_mode" = false;
    };
  };
}
