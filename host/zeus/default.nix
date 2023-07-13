{ config, lib, pkgs, ... }: {

  imports = [

    ./hardware.nix

    ../../host/users/andre
    ../../host/shared
  ];

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

  # network
  networking.hostName = "zeus";

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
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # install version
  system.stateVersion = "23.05";
}