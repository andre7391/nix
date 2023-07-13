{ pkgs, inputs, ... }: {

  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  # network-manager
  networking.networkmanager.enable = true;

  # impermanence
  environment.persistence."/work/host".directories = [
    "/var/lib/NetworkManager"
  ];

}


