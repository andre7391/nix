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
    ".config/waybar/config".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/waybar/config;
    ".config/waybar/mocha.css".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/waybar/mocha.css;
    ".config/waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/waybar/style.css;
  };

}
