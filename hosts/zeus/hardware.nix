{ config, lib, pkgs, modulesPath, ... }: {

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd = {
    availableKernelModules =
      [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
    kernelModules = [ "kvm-amd" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5104f24c-93c4-4240-8331-9af6de0c8c07";
    fsType = "ext4";
  };

  #fileSystems."/media" = {
  #  device = "/dev/sdb";
  #  fsType = "ntfs";
  #};


  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/27C3-D576";
    fsType = "vfat";
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform.system = "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = true;
}
