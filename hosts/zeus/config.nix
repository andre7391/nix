{ config, lib, pkgs, ... }: {

  imports = [
    ../../hosts/zeus/hardware.nix
    ../../hosts/users/andre/config.nix
    ../../hosts/fonts/config.nix
    ../../hosts/programs/config.nix
    ../../hosts/programs/plex/config.nix
  ];

  # bootloader
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiInstallAsRemovable = true;
    efiSupport = true;
  };

  # gretter
  services.xserver = {
    enable = true;

    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };
  };

  # window manager
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
  };

  # filesystems
  boot.supportedFilesystems = [ "ntfs" ];

  # network
  networking.hostName = "zeus"; # Define your hostname.
  networking.networkmanager.enable = true;

  # locale
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
    xkbVariant = "intl";
  };
  console.keyMap = "us-acentos";

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
