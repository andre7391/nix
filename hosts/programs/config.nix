{ pkgs, ... }: {

  # nix configs
  nixpkgs.config = {
    allowUnfree = true;
  };

  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # programs
  environment.systemPackages = with pkgs; [
    vim
    home-manager
  ];

  # udisk2
  services.udisks2 = {
    enable = true;
    mountOnMedia = true;
  };


}
