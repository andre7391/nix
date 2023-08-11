{ config, pkgs, ... }: {

  # hyprland
  home.file = {
    ".config/eww".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/eww;
  };

  home.packages = with pkgs; [
    eww
  ];

}
