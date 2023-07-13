{ pkgs, inputs, ... }: {

  imports = [
    inputs.impermanence.nixosModules.impermanence

  ];

  # plex
  services.plex = {
    enable = true;
    openFirewall = true;
    dataDir = "/work/host/plex";
  };

  # impermanence
  #environment.persistence."/work/host".directories = [
  #  "/var/lib/plex"
  #];

}
