{ inputs, outputs, ... }: {

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  # home-manager
  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  home-manager.users.andre = import ../../../../home/andre;

  # system user
  users.users.andre = {
    isNormalUser = true;
    description = "André Rodrigues";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    # use 'mkpasswd -m sha-512' for a new password (default 123456)
    hashedPassword = "$6$kjDryCK3G97da19D$jd.8MgBZnPVYf5HSK0ijjF3obViV9y7wuwvuDYnxLlvZoSQYxpNXPlF74dRN7pocbh8OARy6r40wk3cE93mMU.";
  };


}
