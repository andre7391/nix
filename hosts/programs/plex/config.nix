{ pkgs, ... }: {

  # plex
  services.plex = {
    enable = true;
    openFirewall = true;
  };

}
