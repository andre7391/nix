{ pkgs, config, ... }: {

  imports = [
    #  ../../home/shared/theme
  ];

  # config
  home.file = {
    ".config/polybar/".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/polybar;
  };

  # programs
  home.packages = with pkgs; [
    polybar
  ];


}
