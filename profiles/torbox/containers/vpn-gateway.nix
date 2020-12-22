# Alternative gateway using Mullvad.
# Configuration must be done manually by login into the gateway container.
# Interface is substitutable to that of tor-gateway.
# TODO: wireguard?

let
  hostAddress = "10.0.2.1";
  localAddress = "10.0.2.2";
  nameserverAddress = "193.138.218.74";  # Mullvad's DNS
  mullvadProxyAddress = "10.8.0.1:1080";  # mullvad's enclave proxy
  forwardPorts = [
    8118  # privoxy
  ];
in
{
  containers.vpn-gateway = {
    privateNetwork = true;
    inherit hostAddress localAddress;
    forwardPorts = map (p: { hostPort = p; }) forwardPorts;

    enableTun = true;  # needed for OpenVPN

    config = { pkgs, ...}: {
      networking.nameservers = [ nameserverAddress ];  # needed for OpenVPN bootstrapping

      services.mullvad-vpn.enable = true;
      environment.systemPackages = with pkgs; [ mullvad-vpn ];

      services.privoxy = {
        enable = true;
        listenAddress = "0.0.0.0:8118";
        extraConfig = ''
          forward-socks5 / ${mullvadProxyAddress} .
        '';
      };

      networking.firewall.allowedTCPPorts = forwardPorts;

      # VPN routes mess with privoxy's ability to respond to torbox and the like.
      networking.interfaces.eth0.ipv4.routes = [{
        address = "10.0.0.0";
        prefixLength = 16;
        via = hostAddress;
      }];
    };
  };

  # OpenVPN itself needs outside access.
  networking.nat = {
    enable = true;
    internalIPs = [ localAddress ];
  };
}
