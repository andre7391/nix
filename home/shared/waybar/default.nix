{ pkgs, config, ... }: {

  imports = [
    #  ../../home/shared/theme
  ];

  # status bar
  home.packages = with pkgs; [
    waybar
  ];

  # config
  home.file = {
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/waybar;
  };

}
