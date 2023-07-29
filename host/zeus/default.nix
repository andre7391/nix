{ config, lib, pkgs, ... }: {

  imports = [
    ./hardware.nix
    ./impermanence.nix

    ../../host/shared
  ];

  # users config
  users.mutableUsers = false;

  # bootloader
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    # useOSProber = true; to generate windows boot entry
    efiInstallAsRemovable = true;
    efiSupport = true;
    extraEntries = ''
      menuentry 'Windows - Default' --class windows --class os {
      	insmod part_gpt
      	insmod fat
      	search --no-floppy --fs-uuid --set=root 944B-F384
      	chainloader /efi/Microsoft/Boot/bootmgfw.efi
      }
    '';
  };

  # filesystems
  boot.supportedFilesystems = [ "ntfs" ];

  #kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # network
  networking.hostName = "zeus";
  networking.networkmanager.enable = true;

  # locale
  time.hardwareClockInLocalTime = true;
  time.timeZone = "America/Campo_Grande";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # keyboard
  services.xserver = {
    layout = "us";
    xkbVariant = "altgr-intl";
  };

  # printer
  services.printing.enable = true;

  # sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # video
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  # install version
  system.stateVersion = "23.05";

}
