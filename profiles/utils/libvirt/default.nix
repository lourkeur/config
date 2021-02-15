{ pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemuRunAsRoot = false;
  };
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
  ];
}
