{ pkgs, lib, ... }: {

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
    # utilities
    vim
    gparted
    dconf
    seatd
  ];

  # udisk2
  services.udisks2 = {
    enable = true;
    mountOnMedia = true;
  };

  # display manager
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
  };

  # numlock
  systemd.services.numLockOnTty = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      # /run/current-system/sw/bin/setleds -D +num < "$tty";
      ExecStart = lib.mkForce (pkgs.writeShellScript "numLockOnTty" ''
        for tty in /dev/tty{1..6}; do
            ${pkgs.kbd}/bin/setleds -D +num < "$tty";
        done
      '');
    };
  };

}
