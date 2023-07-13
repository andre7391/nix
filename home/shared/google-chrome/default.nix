{ pkgs, inputs, ... }: {

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];


  # chrome
  home.packages = with pkgs;  [
    google-chrome
  ];


  home.persistence."/work/andre" = {
    directories = [
      ".config/google-chrome"
    ];
    allowOther = true;

  };
}

