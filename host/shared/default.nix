{ pkgs, ... }: {

  imports = [
    ../../host/shared/plex
    ../../host/shared/users/andre
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


  # window manager
  programs.sway = {
    enable = true;
  };

  security.polkit.enable = true;

}
