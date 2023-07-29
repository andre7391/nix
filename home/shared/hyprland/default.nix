{ config, pkgs, ... }: {

  # hyprland
  home.file = {
    ".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/hyprland/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/hyprland/hyprpaper.conf;
    ".wallpapers/".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/theme/wallpapers;
  };

  home.packages = with pkgs; [
    hyprland
    hyprpaper

    # launcher
    wofi
  ];

}
