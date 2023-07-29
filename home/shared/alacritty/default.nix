{ pkgs, config, ... }: {

  imports = [
    #  ../../home/shared/theme
  ];


  # terminal
  home.packages = with pkgs; [
    alacritty
  ];

  # config
  home.file = {
    ".config/alacritty/alacritty.yml".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/alacritty/alacritty.yml;
  };

}
