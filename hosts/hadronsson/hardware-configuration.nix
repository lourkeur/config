# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/f2cab446-4585-4762-8187-6ab930e4f523";
      fsType = "btrfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/d5101aaf-1628-4639-ae86-d962e3446904";
      fsType = "ext4";
    };

  fileSystems."/home/louis" =
    { device = "/dev/disk/by-uuid/4d49a408-1391-4528-bebe-f6d58c2401f9";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/af24e0c6-d7bc-44b3-93e1-90c92a5e143e"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
