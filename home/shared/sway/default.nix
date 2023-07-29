{ pkgs, config, ... }: {

  imports = [
    #  ../../home/shared/theme
  ];

  # config
  home.file = {
    ".config/sway/config".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/sway/config;
    ".wallpapers/".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/theme/wallpapers;
  };

  # programs
  home.packages = with pkgs; [

    # window manager
    sway

    # launcher
    wofi

    # status bar
    waybar

    # terminal
    alacritty
  ];

}
