{ pkgs, inputs, ... }: {

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  # impermanence
  home.persistence."/work/andre" = {
    directories = [
      ".config/google-chrome"
    ];
    allowOther = false;
  };

  # mkdir -p /work/andre/.config
  # cp -r /home/andre/.config/google-chrome /work/andre/.config/google-chrome

}
