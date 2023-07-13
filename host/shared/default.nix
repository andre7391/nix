{ pkgs, ... }: {

  imports = [
    ../../host/shared/plex
    ../../host/shared/network-manager
  ];

  # nix configs
  nixpkgs.config = {
    allowUnfree = true;
  };

  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # programs
  environment.systemPackages = with pkgs; [
    vim
  ];

  # udisk2
  services.udisks2 = {
    enable = true;
    mountOnMedia = true;
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
    };
  };

  # screen share on wayland
  xdg.portal.wlr.enable = true;

}
