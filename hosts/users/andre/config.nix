{ inputs, outputs, ... }: {

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  # home-manager
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  home-manager.users.andre = import ../../../home/users/andre/config.nix;

  # system user
  users.users.andre = {
    isNormalUser = true;
    description = "André Rodrigues";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
