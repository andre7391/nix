{ inputs, pkgs, ... }: {
  imports = [
    #   inputs.hyprland.homeManagerModules.default

    ../../../home/programs/config.nix
    ../../../home/programs/hyprland/config.nix
    ../../../home/theme/config.nix

  ];

  # home manager
  programs = {
    home-manager.enable = true;
  };

  services.udiskie.enable = true;


  # user and home
  home = {
    username = "andre";
    homeDirectory = "/home/andre";
  };


  # Nicely reload system units when changing configs
  #systemd.user.startServices = "sd-switch";
  #wayland.windowManager.hyprland.enable = true;


  # state version
  home.stateVersion = "23.05";
}