{ pkgs, inputs, ... }: {

  # plex
  services.plex = {
    enable = true;
    openFirewall = true;
    dataDir = "/work/host/plex";
  };



}
