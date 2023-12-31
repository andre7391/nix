{ inputs, pkgs, ... }: {
  imports = [
    ./impermanence.nix

    ../../home/shared
  ];

  # home manager
  programs = {
    home-manager.enable = true;
  };

  # user and home
  home = {
    username = "andre";
    homeDirectory = "/home/andre";
  };

  # git
  programs.git = {
    enable = true;
    userName = "andre";
    userEmail = "andre7391@gmail.com";
  };

  # Nicely reload system units when changing configs
  # systemd.user.startServices = "sd-switch";
  #wayland.windowManager.hyprland.enable = true;


  # state version
  home.stateVersion = "23.05";
}
