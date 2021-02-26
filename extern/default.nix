{ inputs }: with inputs;
{
  modules = [
    home.nixosModules.home-manager
    impermanence.nixosModules.impermanence
  ];

  overlays = [
    nur.overlay
    devshell.overlay
  ];

  # passed to all nixos modules
  specialArgs = {
    overrideModulesPath = "${override}/nixos/modules";
    hardware = nixos-hardware.nixosModules;
  };
}
