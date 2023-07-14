{ pkgs, inputs, ... }: {

  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  # impermanence
  environment.persistence."/work/host".directories = [
    "/var/lib/NetworkManager"
    "/etc/NetworkManager/system-connections"
  ];

  # sudo mkdir -p /work/var/lib
  # sudo cp -r /var/lib/NetworkManager /work/var/lib/NetworkManager

}


